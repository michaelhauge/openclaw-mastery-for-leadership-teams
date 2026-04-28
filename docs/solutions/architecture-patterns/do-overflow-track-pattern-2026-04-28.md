---
title: "Workshop overflow track: same Hono codebase serving two cloud providers from one domain via Caddy handle_path"
date: 2026-04-28
category: architecture-patterns
module: workshop-fleet-deploy
problem_type: architecture_pattern
component: tooling
severity: medium
applies_when:
  - Primary fleet provider (Hetzner) has quota or availability gaps and you need overflow capacity from a second provider (DigitalOcean)
  - Both tracks must be reachable from the same domain without a separate subdomain or DNS change
  - The same Hono dispenser codebase must serve both tracks with zero code duplication
  - Cross-track routing decisions must be operator-visible from Caddy config, not buried in app logic
  - Workshop runs in <24 hours and there is no time to deploy a second full environment
related_components:
  - authentication
  - tooling
  - documentation
tags:
  - workshop
  - openclaw
  - digitalocean
  - hetzner
  - caddy
  - handle-path
  - base-path
  - two-track
  - overflow
  - hono
  - bun
  - subpath
  - dispenser
  - bulk-deploy
---

# Workshop overflow track: same Hono codebase serving two cloud providers from one domain via Caddy handle_path

## Context

Primary Hetzner fleet is provisioned and live. DigitalOcean droplets are added as overflow capacity when Hetzner quota is exhausted or to pre-assign specific participants. Both tracks must be reachable from `claimopenclaw.pertamapartners.com` — no time or motivation to configure a second DNS name, manage a second TLS cert, or update printed materials that already have the URL. The participant experience (claim → ttyd browser terminal → setup.sh → OpenClaw) must be identical on both tracks.

## Guidance

### Caddy routing — `handle_path`, not `handle`

```
claimopenclaw.pertamapartners.com {
  encode gzip

  # DO terminal routing — strip /do/terminal/pNN prefix, proxy to wdo-NN:7681
  @doterminal { path_regexp dot ^/do/terminal/p(\d{2})(/.*)?$ }
  handle @doterminal { uri strip_prefix /do/terminal/p{re.dot.1}; reverse_proxy wdo-{re.dot.1}:7681 }

  # DO dispenser — strip /do/ prefix, send to port 3001
  handle_path /do/* { reverse_proxy localhost:3001 }

  # Hetzner terminal routing (unchanged)
  handle_path /terminal/p46* { reverse_proxy workshop-smoke-final:7681 }
  @wsterminal { path_regexp wt ^/terminal/p(\d{2})(/.*)?$ }
  handle @wsterminal { reverse_proxy workshop-{re.wt.1}:7681 }

  # Hetzner dispenser — everything else → port 3000
  reverse_proxy localhost:3000
}
```

Use `handle_path /do/*` (not `handle`). `handle_path` strips `/do` before the upstream sees the request — the app registers routes as `/`, `/api/claim`, etc., identical to the root instance. Using `handle` instead would forward `/do/api/claim` intact; the app would need to register `/do/api/claim` and every other route with the prefix, which defeats the purpose.

### Two systemd services, same source directory

```ini
# /etc/systemd/system/dispenser.service (Hetzner, port 3000)
[Service]
EnvironmentFile=/opt/dispenser/.env
ExecStart=/root/.bun/bin/bun run src/server.ts

# /etc/systemd/system/dispenser-do.service (DO, port 3001)
[Service]
EnvironmentFile=/opt/dispenser/.env.do
ExecStart=/root/.bun/bin/bun run src/server.ts
```

`/opt/dispenser/.env.do` contains at minimum:

```
PORT=3001
MANIFEST_PATH=./data-do/manifest.csv
STATE_PATH=./data-do/state.json
BASE_PATH=/do
TTYD_BASE_URL=https://claimopenclaw.pertamapartners.com/do/terminal
```

Both services run from `/opt/dispenser/src/server.ts`. No code is duplicated; separation is entirely by env file.

### BASE_PATH threading in the Hono app

`handle_path` strips the prefix before the request reaches the app. Without threading, `c.redirect("/")` sends participants to the Hetzner instance, and `action="/api/claim"` POSTs to the Hetzner dispenser. Every redirect and HTML form action must be prefixed.

In `server.ts`:

```typescript
const BASE_PATH = (process.env.BASE_PATH ?? "").replace(/\/$/, "");

// Bare-hostname auto-redirect
return c.redirect(`${BASE_PATH}/?t=${WORKSHOP_TOKEN}`, 302);

// GET /api/claim fallback
app.get("/api/claim", (c) => c.redirect(`${BASE_PATH}/`, 302));

// POST success → admin
return c.redirect(`${BASE_PATH}/admin?role=${role}&t=${...}`);
```

In `views.ts`, add `basePath = ""` as a default parameter and prefix all routes:

```typescript
export function claimLanding(token: string, basePath = ""): string {
  return pageShell("Claim your OpenClaw", `
    <form method="POST" action="${basePath}/api/claim">...
    <a href="${basePath}/recover?t=${escapeHtml(token)}">Recover</a>
  `);
}
```

The root instance sets `BASE_PATH=""` (or leaves it unset) — all paths resolve to `/`, unchanged.

### Cross-track secondary button

The claim landing page needs a "Reserved — [Other Track]" button so captains can direct mis-assigned participants without giving them a raw URL. In `views.ts`:

```typescript
export function claimLanding(token: string, basePath = ""): string {
  const isDoTrack = basePath === "/do";
  const altTrackUrl = isDoTrack ? "/" : "/do/";
  const altTrackLabel = isDoTrack ? "Reserved — Hetzner Servers" : "Reserved — DigitalOcean Servers";
  return pageShell("Claim your OpenClaw", `
    <div class="card">
      ...primary claim form...
    </div>
    <div class="card" style="border-style:dashed;border-color:var(--border)">
      <p class="small muted" style="margin-top:0">${altTrackLabel}</p>
      <a class="button secondary" href="${altTrackUrl}">${altTrackLabel} &rarr;</a>
      <p class="small muted" style="margin-top:12px">Only use this if directed by your table captain.</p>
    </div>
  `);
}
```

The `altTrackUrl` (`/` or `/do/`) is an absolute path from the browser's perspective — Caddy routes it regardless of which dispenser is currently serving the page. No app-to-app knowledge needed.

## Why This Matters

Without this pattern, overflow capacity requires either a second subdomain (DNS change, new TLS cert, updated printed materials) or a full second deployment with a separate codebase fork. The `handle_path` + `BASE_PATH` approach adds a second cloud provider to an existing live deployment in under an hour with zero config drift between tracks.

The failure mode if `BASE_PATH` is not threaded is silent: POST requests and redirects land on the wrong dispenser, the wrong cloud provider hands out a server, and the participant gets the right UX but the wrong machine. No error is thrown.

## When to Apply

- Adding a second cloud provider to a live workshop with <6 hours of runway
- Participants at different "tables" need to be routed to different server pools
- You want operator-visible routing in Caddy config rather than app-level multi-tenancy logic

## Examples

### Smoke-test a claim end-to-end on the DO track

```bash
# Landing page
curl -sI "https://claimopenclaw.pertamapartners.com/do/?t=$WORKSHOP_TOKEN" | head -5

# Check state is clean before testing
ssh root@5.223.42.30 "cat /opt/dispenser/data-do/state.json"
# expect: {}

# Claim via form POST
curl -s -X POST "https://claimopenclaw.pertamapartners.com/do/api/claim" \
  -d "t=$WORKSHOP_TOKEN" -c /tmp/cookies-do.txt | grep -o "Server [0-9]*"

# Reset state after smoke test
ssh root@5.223.42.30 "echo '{}' > /opt/dispenser/data-do/state.json && systemctl restart dispenser-do"
```

### Verify BASE_PATH is threaded (audit checklist)

After adding `BASE_PATH`, search these patterns and confirm each is prefixed:

```bash
grep -n 'c\.redirect("/' src/server.ts      # should be: c.redirect(`${BASE_PATH}/
grep -n 'action="/'     src/views.ts        # should be: action="${basePath}/
grep -n 'href="/'       src/views.ts        # should be: href="${basePath}/
```

## DO-Specific Gotchas Encountered During Build

Three separate issues hit during the DO fleet build. Each has its own skill — brief summary here for operational context:

1. **DO 10-droplet default account limit** — HTTP 422 on exactly one server mid-batch while all others succeed. Canary + N fleet = over the cap. Fix: delete canary after template is validated, or request a limit increase. See skill `digitalocean-droplet-account-limit`.

2. **DO cloud-init v25.3 strict PyYAML rejects non-ASCII** — Any non-ASCII character in the `user_data` YAML template silently skips all `runcmd` modules. Servers provision but never run setup. Fix: strip all non-ASCII from the template before deploy. See skill `do-cloud-init-yaml-non-ascii`.

3. **Caddy handle_path strips prefix — requires BASE_PATH threading** — Described in full above. See skill `hono-caddy-subpath-base-path`.

## See also

- `docs/solutions/architecture-patterns/workshop-fleet-deploy-pattern-2026-04-28.md` — full Hetzner fleet architecture (this doc adds the DO overflow layer on top of that foundation)
- Skill `digitalocean-droplet-account-limit` — DO 10-droplet default cap detection and resolution
- Skill `do-cloud-init-yaml-non-ascii` — PyYAML non-ASCII rejection in DO cloud-init
- Skill `hono-caddy-subpath-base-path` — full BASE_PATH threading pattern with code examples
- Skill `caddy-v2-path-regexp-braced-matcher-syntax` — Caddy regex matcher syntax for per-server terminal routing
