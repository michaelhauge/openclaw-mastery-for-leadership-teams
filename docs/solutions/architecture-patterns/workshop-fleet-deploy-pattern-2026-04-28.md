---
title: "Workshop fleet deploy: 46-server OpenClaw cluster shipped in one night via dispenser + atomic claim + Caddy regex routing"
date: 2026-04-28
category: architecture-patterns
module: workshop-fleet-deploy
problem_type: architecture_pattern
component: tooling
severity: medium
applies_when:
  - Provisioning a workshop or hands-on training fleet of 30+ identical VPSes that participants will claim individually
  - Each participant needs an isolated server they can SSH into AND access via browser terminal AND keep long-term
  - Servers must be reachable from a public friendly URL (HTTPS) but the per-server backend stays on a private mesh (Tailscale)
  - Need real-time live monitoring of fleet health (claim state + per-server reachability) during the workshop
  - You have ~12-18 hours from "infrastructure plan" to "first participant claims"
related_components:
  - authentication
  - tooling
  - documentation
tags:
  - workshop
  - openclaw
  - hetzner
  - tailscale
  - caddy
  - bun
  - hono
  - ttyd
  - cloud-init
  - dispenser
  - bulk-deploy
  - claim-flow
  - https-letsencrypt
---

# Workshop fleet deploy: 46-server OpenClaw cluster shipped in one night via dispenser + atomic claim + Caddy regex routing

## Context

Goal: deliver a "leadership team learns OpenClaw" workshop where 40 attendees each get their own working AI assistant by the end of the day, paired with WhatsApp (or Telegram), running on a real cloud server they can keep long-term. Constraints: <24 hours from green-light to first participant claim, single operator + 2 captains, Hetzner emergency quota raise to 50 just landed, no managed PaaS allowed (participants must own their VPS).

What had to be built or assembled in one night:
1. Cloud-init template for OpenClaw VPS (Docker + ttyd + Tailscale + OpenClaw image pull + setup.sh wrapper)
2. Bulk-deploy script that fans out N servers in parallel batches, generates per-server passwords, emits a manifest CSV
3. Public dispenser VPS with Caddy + a small Bun/Hono web app that hands each visiting participant exactly one available server (atomic, idempotent re-claim, quarantine-and-swap)
4. Live `/health` dashboard polling each server's ttyd port via Tailscale, auto-refreshing every 30s
5. Friendly HTTPS hostname (`claimopenclaw.pertamapartners.com`) with Let's Encrypt cert and HTTP→HTTPS redirect
6. Captain documentation covering 10+ recovery scenarios + post-workshop ownership-handover SSH key flow

## Guidance

### Architecture pattern (recommended for any 30+ server workshop fleet)

Three layers, separated cleanly:

**Layer 1 — fleet servers (private):**
- Each VPS provisioned via cloud-init from a single 30KB-or-less template (mind the Hetzner 32KB user_data cap — see `hetzner-cloud-init-32kb-user-data-limit` skill)
- Each VPS joins a private Tailscale network at boot using a reusable auth key
- Each VPS exposes ttyd on `0.0.0.0:7681` (NOT 127.0.0.1 default — see `ttyd-default-loopback-binding` skill) with a per-server random password
- UFW restricts SSH + ttyd to the `tailscale0` interface only — no public ingress to fleet servers
- A bulk-deploy script (`pertama-workshop-deploy.sh --count N --prefix workshop --provider hetzner`) fans out N parallel deploys in batches of 10 (under Hetzner's per-customer rate limit), emitting a manifest CSV with `id,name,hostname,ipv4,ssh_user,ttyd_password,status`

**Layer 2 — dispenser VPS (public):**
- Single small VPS (Hetzner cpx12 is plenty) with public IP + DNS A record + Let's Encrypt HTTPS via Caddy
- Joined to the same Tailscale network as the fleet (so it can reverse-proxy to `workshop-NN:7681` via MagicDNS)
- Runs a tiny Bun/Hono web app with these routes:
  - `GET /` — auto-redirect to `/?t=WORKSHOP_TOKEN` (friendly bare-hostname entry)
  - `GET /?t=...` — claim landing page with a single big "Claim my OpenClaw" button
  - `POST /api/claim` — atomic `claimNext()` allocates the lowest-numbered available server, sets a signed cookie binding the participant to that claim, returns the bundle page
  - `GET /` (with cookie) — returns the SAME bundle (idempotent re-claim — refresh-safe, recovery-safe)
  - `GET /admin?role=operator|captain&t=...` — fleet dashboard with per-server tiles + quarantine button
  - `GET /health?role=...&t=...` — live dashboard that probes every workshop server's ttyd port on pageload with 2s timeout, auto-refreshes every 30s
  - `GET /healthz` — simple `ok` for monitoring
- State persists in `data/state.json` (claim status per id) — survives restarts; manifest loaded once at startup from `data/manifest.csv`
- Caddy reverse-proxies `/terminal/p<NN>/*` → `workshop-<NN>:7681/*` using a single regex matcher (no per-server stanza needed; see `caddy-v2-path-regexp-braced-matcher-syntax` skill for the matcher syntax)

**Layer 3 — workshop documentation repo (long-lived):**
- Public/private GitHub repo with `SETUP-GUIDE.md`, `CAPTAIN.md`, `OPERATOR.md`, `docs/solutions/` (this folder)
- MOTD on each fleet server points participants here
- Includes "take it home" section with copy-paste SSH-key-paste recipe so participants can own their server post-workshop without needing the master key

### Critical operational gotchas (each cost 15-90 min to discover tonight)

| Gotcha | Skill |
|---|---|
| Hetzner caps cloud-init `user_data` at 32,768 bytes; growth to 36KB silently crashed all bulk deploys | `hetzner-cloud-init-32kb-user-data-limit` |
| OpenClaw `dmPolicy: "open"` requires `allowFrom: ["*"]` companion or container crash-loops; must be set together in one deep-merge | `openclaw-telegram-dmpolicy-open-allowfrom-companion` |
| Telegram bot tokens with hyphens get garbled by paste/wizard input flows (hyphen → slash); verify with `curl /getMe` | `telegram-bot-token-getme-diagnostic` |
| Caddy v2 inline matcher `@x path_regexp y regex` fails for multi-arg matchers; use braced `@x { path_regexp y regex }` form | `caddy-v2-path-regexp-braced-matcher-syntax` |
| Multi-line bash pasted into ttyd browser terminal can fragment; collapse to single-line `&&` chains for any non-trivial paste | `ttyd-multiline-paste-fragmentation` |
| Wizard chains into hardcoded WhatsApp pair step regardless of which channel was configured; for non-WhatsApp users, Ctrl+C the prompt then run `channels add/login --channel <chosen>` manually | (covered in `CAPTAIN.md` scenario 10 of the workshop repo) |
| Tailscale hostnames can drift from customer-record names (renamed customer `workshop-st4-01` → actual Tailscale hostname is original `workshop-smoke-final`); store both `name` (display) and `hostname` (routing) in the manifest CSV | (operational note) |
| OpenClaw enters auto-restart backoff on bad config — `docker compose restart` does NOT clear it; use `docker compose down + up -d` to fully recreate the container and reset backoff state | (folded into the dmPolicy skill above) |

### Decisions worth preserving (over alternatives we considered and rejected)

- **`claimNext()` atomic lowest-numbered allocation, NOT a pre-assigned URL list.** Pre-assignment would require a new endpoint, per-server URL stickers, and introduces sticker-loss/sticker-mix-up failure modes. Atomic claim with cookie-binding handles 46 simultaneous claims race-free with zero new code paths.
- **Single domain with path-based routing, NOT subdomains per role.** `/admin?role=operator` and `/health?role=operator` instead of `admin.domain` + `health.domain`. One A record, one Let's Encrypt cert, one Caddy block. Wildcard subdomains would require DNS-01 ACME (giving Caddy DNS provider API access) — overkill for a one-day workshop.
- **Browser terminal (ttyd) as the primary participant access path, not SSH.** Participants don't have the master key; password SSH would require opening port 22 publicly + enabling `PasswordAuthentication` (security degradation). Browser terminal is "SSH without a key" delivered over HTTPS, works on any device.
- **Don't auto-start the OpenClaw container in cloud-init.** OpenClaw needs `openclaw.json` to start cleanly; no config = exit 78 crash-loop. setup.sh starts the container AFTER the configure wizard creates the config. The volume is pre-populated with just `workspace/` directory at provisioning time.
- **Don't fix bugs in the verified template the night before.** Once cloud-init.yaml.tpl is verified end-to-end via canary, treat it as immutable. New issues discovered (e.g., the `setup.sh` hardcoded WhatsApp chain for non-WhatsApp channels) get **documented as captain recovery procedures**, not fleet-wide patches. Touching the template means re-deploying 46 servers — bigger risk than a captain-led recovery during the rare edge case.
- **Canary-first deploy.** Always provision ONE server through the same script before the bulk run. Tonight's canary caught the 32KB user_data limit before all 45 deploys would have failed identically.

### When to apply this pattern

- Cohort-style workshops (10-100 attendees), each needing identical isolated infrastructure
- Software demos where attendees keep the artifact (vs ephemeral lab environments that get torn down end-of-day)
- Training programs where participants need both immediate browser access AND long-term ownership transfer
- Any scenario where you want public-friendly URLs serving private-mesh backends without exposing the backends directly

### When NOT to apply

- <10 attendees (overhead of dispenser + manifest + Caddy regex isn't worth it; just hand out per-person SSH keys to pre-named servers)
- Ephemeral labs (no need for cookie-bound long claims, no take-home flow)
- Multi-day events with fluctuating attendance (cookie-binding becomes friction; consider per-attendee URL tokens instead)

## Why This Matters

This pattern compresses ~3 days of typical workshop infrastructure setup into ~12 hours by leveraging:
- Cloud-init's idempotent first-boot scripts (one template, N servers)
- Tailscale MagicDNS (no per-server DNS records or VPN config)
- Caddy v2 regex matchers (one stanza routes 100+ servers)
- Atomic state ops in a small Bun app (race-free claim flow)
- Let's Encrypt auto-issuance via Caddy (zero TLS config)

The cost of NOT having this pattern documented: each new workshop re-discovers the 8 gotchas listed above. The 32KB limit alone cost 90 min tonight; the dmPolicy validation cost 30 min; the Caddy matcher syntax cost 20 min. Total ~3-4 hours of preventable rework per workshop without this doc.

The cost of having it: future workshop operators read this once, link out to the atomic skills for specific gotchas, and ship in 6-8 hours instead of 12-16.

## Examples

**Tonight's actual run** (2026-04-28, 14:00–17:00 SGT, workshop at 09:00 SGT next day):

| Phase | Time | Outcome |
|---|---|---|
| U1 pre-flight (Hetzner quota, DNS, repo state, dispenser ssh) | ~20 min | All 5 checks passed |
| Canary deploy via `pertama-deploy.sh --name workshop-canary` | ~10 min | **Caught 32KB user_data bug** — fixed by removing legacy `setup-openclaw.sh` from cloud-init template (saved 5.6KB) |
| U2 bulk deploy `--count 45 --prefix workshop --provider hetzner` | ~50 min wall (5 batches of 10 in parallel) | **45/45 succeeded, zero failures** |
| U3 manifest combine + dispenser sync + Caddy dynamic routing | ~15 min | Caught Caddy inline matcher syntax bug + workshop-st4-01 hostname mismatch |
| U4 end-to-end smoke test (claim → ttyd → setup.sh → Telegram bot reply) | ~30 min | Full E2E worked; caught dmPolicy + token paste bugs along the way |
| `/health` dashboard + HTTPS swap + bare-hostname auto-redirect + captain brief addendum + SETUP-GUIDE Part 8 SSH handover | ~45 min | All polish landed cleanly |
| 5 atomic skills extracted via `/claudeception` | ~20 min | Future workshops reuse the gotcha knowledge without re-discovering |

**Final state at sleep:** 46 servers (45 new + 1 canary survivor), HTTPS via Let's Encrypt at `claimopenclaw.pertamapartners.com`, dispenser shows 46/46 reachable on `/health`, captain dashboard live, recovery docs committed to GitHub. Workshop ran successfully the next morning.

## Related Solutions

- `docs/solutions/runtime-errors/openclaw-vps-bot-not-replying-2026-04-27.md` — yesterday's compound learning that informed tonight's installer rewrite (configure wizard vs onboard, jq deep-merge for openclaw.json, bonjour disable for datacenter networks)

## Atomic skills extracted from this session

Each of these is a standalone skill in `~/.claude/skills/` for fast future lookup:

- `hetzner-cloud-init-32kb-user-data-limit`
- `openclaw-telegram-dmpolicy-open-allowfrom-companion`
- `telegram-bot-token-getme-diagnostic`
- `caddy-v2-path-regexp-braced-matcher-syntax`
- `ttyd-multiline-paste-fragmentation`

Plus the broader skills from yesterday's session that this build-on:

- `openclaw-configure-vs-onboard-channel-picker`
- `openclaw-config-auto-restore-deep-merge`
- `openclaw-bonjour-disable-datacenter`
- `caddy-reload-silent-failure-log-perms`
- `ttyd-default-loopback-binding`
