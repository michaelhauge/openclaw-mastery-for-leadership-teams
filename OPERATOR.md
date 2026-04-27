# Operator Runbook — Workshop Day

For Michael (and anyone covering for Michael). This is the executable script for workshop morning, during, and after. Print it, keep a tab open, follow it.

> **The night before:** read the bottom section ("D-1 evening checklist") so morning starts with no surprises.

---

## Workshop schedule (template)

Adjust per workshop. The runbook below assumes this rough timing.

| Time | What |
|---|---|
| **D-1 evening** | Pre-flight, confirm Hetzner quota, message Ray + CT |
| **D-day, 06:30** | Coffee. Open laptop. Check `claim.workshop.pertamapartners.com` is up. |
| **D-day, 07:00** | Pre-flight checks (Section 1) |
| **D-day, 07:30** | Bulk-provision 45 servers (Section 2) — runs ~60 min |
| **D-day, 08:30** | Verify all 45 servers healthy, sync manifest to dispenser (Section 3) |
| **D-day, 08:45** | Print name tags, lay out captain materials (Section 4) |
| **D-day, 09:00** | Doors open. Captains brief participants. Watch the operator dashboard (Section 5) |
| **D-day, 09:30–12:30** | Workshop runs. Triage from operator dashboard (Section 6) |
| **D-day, 12:30** | Workshop wraps. Capture take-home requests (Section 7) |
| **D+7** | Tear down servers (Section 8) |

---

## D-1 evening checklist

Run this the night before. Each item is ~1 minute.

- [ ] **Hetzner project quota** — confirm we have 50+ slot capacity (45 servers + dispenser + spares + buffer). Login to Hetzner console → Settings → Limits.
- [ ] **API token alive** — `export HCLOUD_TOKEN=$HETZNER_API_TOKEN && hcloud server list` returns existing servers, no auth error.
- [ ] **Tailscale auth key valid** — `cat ~/development/pertama-daemon/deploy/config.env | grep TAILSCALE_AUTH_KEY` is not empty; verify in Tailscale admin → Settings → Keys that the key isn't expired.
- [ ] **GHCR login still works** — `docker pull ghcr.io/michaelhauge/pertama-daemon:latest` succeeds. (If 401: re-create GHCR token, update config.env.)
- [ ] **Dispenser VPS is up** — `curl -sS http://5.223.42.30/healthz || echo DOWN` (replace IP with current dispenser IP if it's moved). Should return `200 OK`.
- [ ] **Workshop branch is committed** — `cd ~/development/pertama-daemon && git status` shows clean working tree on `workshop-mode`. Tag the SHA you'll deploy from: `git tag workshop-2026-04-28 && git push origin workshop-2026-04-28`.
- [ ] **Captains have Tailscale + key** — message Ray and CT: *"Confirm: you can `ssh pertama@workshop-smoke-final` (or any tailnet host) right now?"* If they can't, fix tonight, not tomorrow morning.
- [ ] **Smoke server still running** — `ssh pertama@workshop-smoke-final 'docker compose -f /opt/pertama/docker-compose.yml ps'` shows both containers healthy. This is the regression baseline.
- [ ] **Print name tags ready** — `ts-node ~/development/openclaw-workshop-dispenser/scripts/generate-tags.ts <participant-list.csv>` produces a printable PDF; print on paper or cardstock.
- [ ] **Captain pre-brief sent** — Ray and CT have the link to [CAPTAIN.md](CAPTAIN.md) and confirmed they've read it.

If any item fails: **fix it tonight**. Workshop morning has no slack for surprises.

---

## Section 1 — Pre-flight (D-day, 07:00)

15 minutes. Catches the easy-to-fix things before the bulk deploy commits 90 minutes.

```bash
cd ~/development/pertama-daemon

# 1. Branch + clean tree
git checkout workshop-mode && git pull && git status   # → "nothing to commit"

# 2. Config file present and valid
cat deploy/config.env | grep -E "HETZNER_API_TOKEN|TAILSCALE_AUTH_KEY|GHCR_TOKEN" | wc -l   # → 3

# 3. Render template successfully (catches YAML / placeholder bugs)
./deploy/pertama-deploy.sh --name preflight-test --dry-run   # → "Cloud-init template rendered (...)"

# 4. Hetzner reachable + has slots
export HCLOUD_TOKEN=$(grep HETZNER_API_TOKEN deploy/config.env | cut -d= -f2)
hcloud server list | wc -l   # current count, should be < 50
hcloud server-type describe cpx22 | head -3   # verify cpx22 is still available in sin

# 5. OpenClaw image latest version
docker pull ghcr.io/openclaw/openclaw:latest 2>&1 | grep -i "digest\|already up to date"
# Note the digest. If it's different from the smoke-test server's digest, decide:
# pin to old digest (safer) or accept new (faster).

# 6. Dispenser is alive and serving
curl -sS -o /dev/null -w "Dispenser: HTTP %{http_code}\n" --max-time 5 http://5.223.42.30/?t=$WORKSHOP_TOKEN

# 7. Smoke server still healthy (regression baseline)
ssh -i ~/.ssh/pertama-fleet pertama@workshop-smoke-final 'docker compose -f /opt/pertama/docker-compose.yml ps'
# Both containers should be "healthy"
```

If all 7 pass, proceed to Section 2.

---

## Section 2 — Bulk provision (D-day, 07:30)

This is the long step. ~60 min wall-clock for 45 servers in batches of 10.

```bash
cd ~/development/pertama-daemon/deploy

# Confirm config.env is the workshop config (not a single-customer config)
head -20 config.env

# Kick off bulk deploy
./pertama-workshop-deploy.sh --count 45 --prefix workshop --manifest-out customers/workshop-manifest.csv

# This runs in the foreground; you'll see progress per batch.
# If you need to walk away, prepend nohup or run in tmux.
```

While it runs, watch for failures:

```bash
# In another terminal:
watch -n 30 'wc -l customers/workshop-manifest.csv customers/workshop-failures.txt 2>/dev/null'
```

Expected: manifest grows to 46 lines (header + 45), failures.txt stays empty or has a small number.

**If the deploy stalls or fails partway:**

```bash
# Retry only the failed servers
./pertama-workshop-deploy.sh --retry workshop
```

**If a batch fails because of Hetzner rate-limit:**

Wait 60 minutes (Hetzner caps at 3,600 req/hr; we use ~2,400/hr in batches), then retry.

**Red-flag failure modes:**

| Symptom | Diagnosis | Fix |
|---|---|---|
| `cpx22 is unavailable in sin` | Hetzner deprecated the type since last test | Switch to `cpx32` or `cax21` in config.env, retry |
| `quota exceeded` | Project limit too low | Open the Hetzner ticket NOW; fall back to <45 servers |
| `tailscale: authkey expired` | Tailscale key rotated | Generate new key, update config.env, retry |
| All servers stuck "joining tailscale" | Cloud-init couldn't reach apt mirror | Already fixed via `archive.ubuntu.com` override; verify the template |

---

## Section 3 — Verify and sync (D-day, 08:30)

Once `pertama-workshop-deploy.sh` exits:

```bash
cd ~/development/pertama-daemon/deploy

# Sanity counts
wc -l customers/workshop-manifest.csv         # 46 (header + 45)
cat customers/workshop-failures.txt 2>/dev/null    # empty or contains failed names

# Spot-check 3 random servers are healthy
for host in workshop-01 workshop-23 workshop-45; do
  echo "=== $host ==="
  ssh -i ~/.ssh/pertama-fleet -o ConnectTimeout=5 pertama@$host 'docker compose ps --format "{{.Name}}: {{.Status}}"' 2>&1 | head -3
done

# All three should show "openclaw" container created (not running yet — that's expected;
# setup.sh starts it after the participant onboards).
```

Sync the manifest to the dispenser:

```bash
DISPENSER_IP=5.223.42.30   # update if dispenser moved

scp -i ~/.ssh/pertama-fleet \
  customers/workshop-manifest.csv \
  root@$DISPENSER_IP:/opt/dispenser/data/manifest.csv

ssh -i ~/.ssh/pertama-fleet root@$DISPENSER_IP "
  rm -f /opt/dispenser/data/state.json    # fresh slate, no claims
  systemctl restart dispenser
  sleep 2
  systemctl is-active dispenser
  journalctl -u dispenser -n 5 --no-pager | tail -3
"
```

Expected output: `active` + a log line saying *"Loaded 45 servers; 45 available."*

Update the dispenser's Caddyfile to route `/p01`–`/p45` to each workshop-NN:

> **Note:** the current Caddyfile for the smoke test only routes `/p01`. For 45 servers, the cloud-init template's [bundled Caddyfile](https://github.com/michaelhauge/openclaw-workshop-dispenser/blob/main/Caddyfile) has all 45 routes pre-baked. Verify it's installed:

```bash
ssh -i ~/.ssh/pertama-fleet root@$DISPENSER_IP "
  grep -c '/p[0-9]' /etc/caddy/Caddyfile
  # Should return 45 if all routes are present
"
```

If only 1 route is present (smoke-test config), reinstall the full Caddyfile:

```bash
scp -i ~/.ssh/pertama-fleet \
  ~/development/openclaw-workshop-dispenser/Caddyfile \
  root@$DISPENSER_IP:/etc/caddy/Caddyfile

ssh -i ~/.ssh/pertama-fleet root@$DISPENSER_IP "
  caddy validate --config /etc/caddy/Caddyfile && systemctl restart caddy
"
```

---

## Section 4 — Print name tags + captain materials (D-day, 08:45)

```bash
cd ~/development/openclaw-workshop-dispenser

# Generate name tags (one PDF, 45 tags)
ts-node scripts/generate-tags.ts ../pertama-daemon/deploy/customers/workshop-manifest.csv > /tmp/name-tags.pdf
open /tmp/name-tags.pdf
# Send to printer. Cardstock if you have it; regular paper works.

# Captain materials (already done by D-1 if you sent the link, but if not):
echo "Captain pre-brief: https://github.com/michaelhauge/openclaw-mastery-for-leadership-teams/blob/main/CAPTAIN.md"
echo "Captain dashboard URL: http://$DISPENSER_IP/admin?role=captain&t=$CAPTAIN_TOKEN"
echo "Operator dashboard URL: http://$DISPENSER_IP/admin?role=operator&t=$OPERATOR_TOKEN"
# Send these to Ray and CT via WhatsApp NOW so they have them ready.
```

---

## Section 5 — Doors open (D-day, 09:00)

Sit in the back. Open the operator dashboard. **Don't touch anything unless something goes red.**

```
http://5.223.42.30/admin?role=operator&t=<OPERATOR_TOKEN>
```

The dashboard shows all 45 servers as colored tiles:

- 🟢 **green** — healthy, paired, replying
- 🟡 **yellow** — server up, OpenClaw config volume populated, no WhatsApp pairing yet (participant in setup wizard)
- 🔵 **blue** — claimed by a participant but no setup activity yet
- ⚪ **white** — unclaimed
- 🔴 **red** — unreachable / crash-looping / something broken

Watch the colors flow as participants claim and onboard. Goal: most go from white → blue → yellow → green within 15 minutes.

---

## Section 6 — During the workshop

### Your job

- Watch the dashboard for red tiles
- Field captain escalations via WhatsApp (Ray and CT escalate per [CAPTAIN.md](CAPTAIN.md))
- Mark broken servers as `quarantined` so participants atomically swap to a spare

### Server goes red — recovery procedure

```bash
# 1. Identify which server
# (operator dashboard shows hostname on hover)

# 2. SSH in
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN

# 3. Quick triage
docker compose ps                                          # what's the state?
docker compose logs --tail=80 openclaw | tail -40         # what's the error?

# 4. Most common fixes:

# a. Bonjour crash loop:
docker run --rm -v pertama_openclaw-config:/data alpine sh -c '
  apk add -q jq && jq ". * {plugins:{entries:{bonjour:{enabled:false}}}}" /data/openclaw.json > /tmp/n && mv /tmp/n /data/openclaw.json && chown 1000:1000 /data/openclaw.json
'
docker compose down && docker compose up -d

# b. Sandbox crept back to "all":
docker run --rm -v pertama_openclaw-config:/data alpine sh -c '
  apk add -q jq && jq ". * {agents:{defaults:{sandbox:{mode:\"off\"}}}}" /data/openclaw.json > /tmp/n && mv /tmp/n /data/openclaw.json && chown 1000:1000 /data/openclaw.json
'
docker compose restart openclaw

# c. Config wipe (openclaw.json is 0 bytes):
docker run --rm -v pertama_openclaw-config:/data alpine cp /data/openclaw.json.bak /data/openclaw.json
docker compose restart openclaw

# 5. If none of the above work, swap participant to a spare
# (Operator dashboard → click red tile → "Quarantine" → next page refresh on participant's
# browser auto-claims a fresh spare)
```

### Participant can't pair WhatsApp — recovery procedure

```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs channels logout --channel whatsapp
docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp
# Have the participant scan the QR fresh
```

### Bot received message but not replying — recovery procedure

Almost always an LLM API key issue. See [CAPTAIN.md Section 5](CAPTAIN.md#-5-bot-received-the-message-but-isnt-replying).

### Wipe a participant's server and start over

Use sparingly — they lose any installed plugins / chat history.

```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
/opt/pertama/setup.sh
# Pick [R]eset
```

---

## Section 7 — Workshop wrap (D-day, 12:30)

Tell the room:

> *"Your server stays up for the next 7 days. Keep playing with it. If you want to keep your bot long-term, see Part 8 of the SETUP-GUIDE — three options: spin up your own VPS, use a managed host like xCloud, or we can transfer this exact server to your Hetzner account. Talk to me before you leave if you want option C."*

Capture take-home requests:

```bash
# Open a quick Google Sheet / Notion DB:
# Columns: Name | Email | Take-home choice (own VPS / managed / transfer this server) | Server NN
```

Anyone wanting "transfer this server" → note their server number and follow up via email within 24 hours with the Hetzner transfer steps.

---

## Section 8 — Tear-down (D+7)

7 days post-workshop, destroy the fleet. Skip any servers transferred to participants.

```bash
cd ~/development/pertama-daemon/deploy

# List workshop servers
ls customers/ | grep workshop-

# Optional: backup operator dashboard state for archive
ssh -i ~/.ssh/pertama-fleet root@5.223.42.30 'cat /opt/dispenser/data/state.json' > customers/workshop-final-state.json

# Destroy each
for name in $(ls customers/ | grep '^workshop-' | sed 's/.env$//'); do
  echo "=== Destroying $name ==="
  ./pertama-manage.sh destroy "$name"
done

# Verify
hcloud server list | grep workshop   # should be empty (or only show transferred ones)
```

Decide on the dispenser VPS:

- Keep it for the next workshop (cpx12 ≈ €4/month)
- OR destroy it: `hcloud server delete workshop-dispenser`

---

## Common workshop-day "I forgot the URL/token" lookups

```bash
# Workshop participant URL:
echo "http://5.223.42.30/?t=$WORKSHOP_TOKEN"

# Operator dashboard:
echo "http://5.223.42.30/admin?role=operator&t=$OPERATOR_TOKEN"

# Captain dashboard:
echo "http://5.223.42.30/admin?role=captain&t=$CAPTAIN_TOKEN"

# All tokens are in the dispenser's .env:
ssh -i ~/.ssh/pertama-fleet root@5.223.42.30 'cat /opt/dispenser/.env'
```

---

## Emergency contacts

| Who | What | When |
|---|---|---|
| Hetzner support | Server provisioning issues, quota | Within 4 hours via Hetzner console ticket |
| Tailscale support | Network issues across the fleet | Slow — better to switch to direct SSH if Tailscale dies |
| OpenClaw Discord | OpenClaw-specific bugs you can't work around | Discord — variable response time |
| Ray and CT (captains) | On-the-floor participant help | WhatsApp during workshop |
| Domain registrar | If `claim.workshop.pertamapartners.com` stops resolving | DNS provider dashboard |

---

## Post-workshop reflection

Within 48 hours of the workshop:

- [ ] Note what broke / what worked in `~/.claude/plans/YYYYMMDD-workshop-retrospective.md`
- [ ] Update [CAPTAIN.md](CAPTAIN.md) with any new failure modes Ray/CT encountered
- [ ] Update [SETUP-GUIDE.md](SETUP-GUIDE.md) with anything that confused participants
- [ ] If the OAuth/Google-Workspace path actually worked end-to-end for some participants, document the verified steps in SETUP-GUIDE.md Part 5
- [ ] If any cloud-init or setup.sh changes are needed, commit to `workshop-mode` and tag for the next workshop
