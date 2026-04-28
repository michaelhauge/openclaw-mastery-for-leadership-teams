# Captain Pre-Brief — OpenClaw Mastery Workshop

If you're reading this, you're a **table captain**. Your job: keep your ~10 participants moving, escalate only the things that are actually broken to the operator, and remember that the workshop is about THEM, not you. You've got this.

> **Read this BEFORE workshop morning** (15 min). Skim it again on the morning of (5 min). Keep this tab open during the workshop.

---

## Your assignment

| Field | Fill in on workshop day |
|---|---|
| Captain name | _______________________ |
| Your servers (10 of 40) | `workshop-____` through `workshop-____` |
| Your captain dashboard URL | `<YOUR-WORKSHOP-DASHBOARD-URL>/admin?role=captain&t=<TOKEN>` |
| Operator's WhatsApp | `+_______________` |

---

## Your tools

- **Captain dashboard** — read-only grid showing the status of every server in your range. Click any tile to land in that participant's terminal directly. URL is in the table above; the operator will fill in the token on workshop morning.
- **Tailscale on your laptop** — The operator added you to the workshop tailnet earlier this week. Verify you can `ssh pertama@workshop-01` (or any workshop server) from your laptop BEFORE workshop morning. If not, let the operator know TONIGHT.
- **Shared SSH key** — `~/.ssh/pertama-fleet`. Preloaded on your laptop by the operator.
- **SSH any participant's server**: `ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN`
- **The workshop repo** (this doc lives here): https://github.com/michaelhauge/openclaw-mastery-for-leadership-teams — bookmark it.

---

## Triage lanes

When a participant says "it's not working," figure out which lane this is **before** you start typing:

| Lane | What it means | Who handles it |
|---|---|---|
| 🟢 **GREEN** | Following the SETUP-GUIDE, on track. | Don't interrupt — let them work. |
| 🟡 **YELLOW** | Stuck on something on the flowchart below. | **You handle it.** |
| 🔴 **RED** | Server unreachable, or anything not on the flowchart. | **Escalate to the operator.** |

> Most "it's not working" reports are actually GREEN — the participant just needs reassurance to keep going.

---

## Important workshop architecture context

**Participants do NOT have SSH access to their servers.** This is by design (security). They access their server via the **browser terminal** (ttyd), opened from the dispenser claim flow. The browser terminal is functionally equivalent to SSH — they can `apt install`, `nano`, `docker compose exec`, anything they'd do over SSH.

**You (the captain) DO have SSH access** via Tailscale. You're their "support engineer" — you can SSH into any of your 10 servers and run any command, including ones that would require shell-level intervention.

**The bot's `sandbox.mode` is set to `off`** — it can run shell commands on the participant's server itself (e.g., "install firecrawl-search"). For the workshop this is fine; it's their own throwaway server.

---

## Troubleshooting flowchart

### 🟡 1. "I can't open my browser terminal"

→ Try opening the dispenser URL fresh in a new tab. The participant should be able to re-claim or use the "/recover" path with their cookie.

→ If the dispenser page won't load: **check their wifi** — try phone hotspot. The dispenser is on the public internet at a stable URL; if it doesn't load, it's their network.

→ If the dispenser loads but their server tile is RED on your captain dashboard: **🔴 ESCALATE** — the server may be down.

→ If the dispenser loads and the tile is green/yellow but they still can't get into ttyd: SSH into the server yourself:
```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
sudo systemctl status ttyd                  # is ttyd alive?
sudo systemctl restart ttyd                 # restart it
```

### 🟡 2. "The OpenClaw setup wizard is stuck / asking confusing questions"

The wizard has several sections. Common confusion points:

→ **"Which model provider?"** — recommend Moonshot (option 1) unless they specifically have a different key.

→ **"Hatch in Terminal?"** — they should pick the recommended option. After this they'll be in an agent chat session inside the wizard's transient container.

→ **"How do I exit the chat?"** — Ctrl+C, Ctrl+D, or `/exit`. The setup.sh script will continue automatically once they exit.

→ **"It's asking about channels but I picked WhatsApp already"** — that's fine, the wizard sometimes asks twice. Pick WhatsApp again.

→ If genuinely stuck for >5 min: SSH in, run `/opt/pertama/setup.sh` and pick `[R]eset` to start over.

### 🟡 3. "WhatsApp QR won't appear / keeps expiring"

→ The QR is shown by `docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp` (called automatically inside `setup.sh`). It has a ~60s scan window before it expires.

→ If they missed it, SSH in and re-trigger:
```bash
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp
```

→ If 2 retries fail: **🔴 ESCALATE**.

### 🟡 4. "I scanned with the wrong WhatsApp account"

In WhatsApp on the WRONG phone: Settings → Linked Devices → tap the entry → **Log Out**.

Then on the participant's server (you SSH or have them ttyd):
```bash
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs channels logout --channel whatsapp
docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp
```

Have them scan again with the correct phone.

### 🟡 5. "Bot received the message but isn't replying"

This is almost always an LLM API key problem.

```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
cd /opt/pertama
docker compose logs --tail=80 openclaw | tail -40
```

Look for these signals in the log:

| Log says | Fix |
|---|---|
| `No API key found for provider` | Re-run `docker compose run --rm openclaw node openclaw.mjs configure --section model` and have the participant paste a fresh key |
| `401`, `403`, `Invalid API key` | Same — key is wrong. Get a new one from the provider dashboard |
| `model not found` | Wrong model name for the provider — re-run model configure section |
| `429`, `rate limit` | Free tier exhausted (rare for workshop usage). Switch providers OR upgrade their account |
| `connection refused` / `timeout` | Provider host blocked. Try a different provider |
| `CIAO ANNOUNCEMENT CANCELLED` | Bonjour mDNS plugin crashing. Run the bonjour-disable patch (see appendix below) |

### 🟡 6. "Container is restarting / unhealthy"

```bash
cd /opt/pertama
docker compose ps                                    # see status
docker compose logs --tail=80 openclaw | tail -40    # see why
docker compose restart openclaw                      # try clean restart
```

If it crash-loops with the bonjour error, apply the appendix patch.

If the openclaw.json is empty (0 bytes) — config wipe — restore from backup:
```bash
docker run --rm -v pertama_openclaw-config:/data alpine sh -c '
  ls -la /data/openclaw.json* &&
  cp /data/openclaw.json.bak /data/openclaw.json &&
  chown 1000:1000 /data/openclaw.json
'
docker compose restart openclaw
```

### 🟡 7. "Google Workspace plugin (gog) won't install or auth"

This is the highest-risk participant request. The OAuth flow on a headless VPS is non-trivial. Step-by-step:

→ First, try the bot-mediated approach (instructed in [SETUP-GUIDE.md Part 5](SETUP-GUIDE.md#part-5-connecting-google-workspace)). If the bot tries to suggest SSH or local-browser flows, tell the participant to push back: *"use device-flow auth, no SSH, no local browser."*

→ If the bot keeps suggesting SSH, you (captain) install gog manually:
```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
cd /opt/pertama
docker compose exec openclaw bash -c 'cd /home/node/.openclaw && mkdir -p skills && cd skills && npx -y clawhub install jx76-gog'
```

→ Then look at gog's auth command:
```bash
docker compose exec openclaw bash -c 'cd /home/node/.openclaw/skills/jx76-gog && cat SKILL.md | head -50'
# follow whatever auth instruction gog itself documents
```

→ **If the participant gets impatient:** tell them honestly that Google Workspace integrations are advanced; the workshop server stays up for 7 days post-event so they can come back and finish setup at home. Direct them to [SETUP-GUIDE.md Part 8 (Taking it home)](SETUP-GUIDE.md#part-8-taking-it-home).

### 🟡 8. "I lost my browser tab / wifi dropped / closed everything"

Easiest case in the troubleshooting list:

→ Open the workshop URL again (on the name tag).
→ The dispenser remembers their claim via signed cookie.
→ Click "My OpenClaw" → "Open browser terminal".
→ Re-enter ttyd password from name tag.
→ They're back in their terminal, no data lost.

### 🟡 9. "Setup hung partway / I want to start completely over"

→ Have them run `/opt/pertama/setup.sh` and pick `[R]eset` at the prompt. This wipes the openclaw config volume and restarts the wizard from scratch. Their WhatsApp pairing will need to be redone.

→ If that doesn't work, SSH in and force-reset:
```bash
cd /opt/pertama
docker compose down
docker volume rm pertama_openclaw-config
docker volume create pertama_openclaw-config
docker run --rm -v pertama_openclaw-config:/data alpine sh -c 'mkdir -p /data/workspace && chown -R 1000:1000 /data'
rm -f /opt/pertama/.onboard-complete
# Now have them re-run /opt/pertama/setup.sh
```

### 🟡 10. "I picked Telegram (or Signal) in the wizard, now setup.sh is asking me to scan a WhatsApp QR"

This is a known installer quirk for the workshop default — `setup.sh` hardcodes a WhatsApp pair step after the wizard. If a participant picked a non-WhatsApp channel, **don't let them hit Enter on the WhatsApp prompt.** The recovery is 4 commands:

→ Have them **press Ctrl+C** to abort the WhatsApp pair prompt. They'll be back at the shell.

→ Verify their bot token is valid (Telegram example — replace with the token they pasted in the wizard):
```bash
curl -sS "https://api.telegram.org/botYOUR_TOKEN/getMe"
# Should return {"ok":true, "result":{"username":"YourBot",...}}
# If 401: token was mistyped; have them go to @BotFather, /mybots, copy the real token
```

→ Patch `dmPolicy` to `open` + `allowFrom` to `["*"]` so the bot accepts any sender's DMs (one-line jq deep-merge — preserves `meta` so OpenClaw doesn't auto-restore it):
```bash
docker run --rm -v pertama_openclaw-config:/data alpine sh -c 'apk add -q jq && jq ". * {channels:{telegram:{dmPolicy:\"open\", allowFrom:[\"*\"]}}}" /data/openclaw.json > /data/openclaw.json.new && mv /data/openclaw.json.new /data/openclaw.json && chown 1000:1000 /data/openclaw.json'
```
(Replace `telegram` with `signal` etc. for other channels.)

→ Force-restart openclaw to clear the auto-restart backoff that built up from the bad WhatsApp attempts:
```bash
cd /opt/pertama && docker compose down openclaw && docker compose up -d openclaw
# Wait ~20 seconds, then check logs:
docker logs openclaw --since 30s | grep -iE "telegram|error"
```

→ Have them DM their bot from Telegram. Bot replies within ~5–10s on first message (LLM cold start).

**Why this happens:** `setup.sh` was built for the workshop default (WhatsApp). The configure wizard supports any channel, but the post-configure pair step is wired only for WhatsApp. Fixing the installer requires re-deploying all 45 servers, which we deliberately did not do the night before workshop. Documented for fix after workshop.

**For Signal:** OpenClaw 2026.4.24's Signal channel requires phone-number registration via signal-cli. Significantly more setup; if a participant insists, tell them Signal isn't supported in the workshop and offer Telegram or WhatsApp.

---

## Escalation protocol

Anything **not** in this flowchart, or any **2-strike failure** on a step above, goes to the operator via WhatsApp.

Format:

> *"[Participant name if known] on [server-NN] is stuck at [step]. Tried [what you tried]. Currently seeing [error]."*

Don't escalate without trying the relevant flowchart step first — most issues resolve in <2 minutes if you follow the flow.

---

## Spare pool

If a participant's server is genuinely broken (not their fault, not fixable in <5 min), ask the operator to mark it `quarantined` in the operator dashboard. Their next page refresh will atomically swap them onto a fresh spare server. You don't have to coordinate the swap manually — the dispenser handles it.

---

## End of workshop

When the workshop wraps:

1. Remind your participants: **the server stays up for 7 days post-workshop**. They can keep using it. After 7 days it gets destroyed.
2. Direct them to [SETUP-GUIDE.md Part 8 (Taking it home)](SETUP-GUIDE.md#part-8-taking-it-home) for migration options.
3. Anyone who wants to keep their server long-term: capture their email, the operator will help arrange a transfer.

---

## Appendix: known-good recovery commands

These are the exact commands we tested during workshop prep. Save them; you'll use the bonjour fix often.

### Disable bonjour plugin (fixes "CIAO ANNOUNCEMENT CANCELLED" crash loop)

```bash
ssh -i ~/.ssh/pertama-fleet pertama@workshop-NN
sudo docker run --rm -v pertama_openclaw-config:/data alpine sh -c '
  apk add -q jq
  cp /data/openclaw.json /data/openclaw.json.bak2
  jq ". * {plugins:{entries:{bonjour:{enabled:false}}}}" /data/openclaw.json > /data/openclaw.json.new
  mv /data/openclaw.json.new /data/openclaw.json
  chown 1000:1000 /data/openclaw.json
'
cd /opt/pertama && sudo docker compose down && sudo docker compose up -d
```

### Force sandbox.mode=off

```bash
sudo docker run --rm -v pertama_openclaw-config:/data alpine sh -c '
  apk add -q jq
  jq ". * {agents:{defaults:{sandbox:{mode:\"off\"}}}}" /data/openclaw.json > /data/openclaw.json.new
  mv /data/openclaw.json.new /data/openclaw.json
  chown 1000:1000 /data/openclaw.json
'
cd /opt/pertama && sudo docker compose restart openclaw
```

### View the participant's actual config

```bash
sudo docker run --rm -v pertama_openclaw-config:/data alpine cat /data/openclaw.json | head -50
sudo docker run --rm -v pertama_openclaw-config:/data alpine cat /data/agents/main/agent/auth-profiles.json
```

### Replace participant's MOTD if they cleared it

```bash
sudo install -m 644 -o root -g root /opt/pertama/motd-post-setup.txt /etc/motd
```

### Force-restart ttyd (if the browser terminal stops responding)

```bash
sudo systemctl restart ttyd
sudo systemctl status ttyd | head -5
```

---

## Appendix: DigitalOcean overflow track

Some participants were assigned to the **DigitalOcean overflow pool** (servers `wdo-01` through `wdo-10`) instead of the main Hetzner pool (`workshop-NN`). The participant experience is **identical** — same browser terminal, same `setup.sh`, same bot setup flow. The only differences are the hostnames and URLs below.

### DO participant URLs

| Purpose | URL |
|---|---|
| Claim page (fresh participant) | `https://claimopenclaw.pertamapartners.com/do/?t=<WORKSHOP_TOKEN>` |
| Recovery (lost tab) | Same URL — signed cookie remembers their server |
| Captain dashboard (read-only) | `https://claimopenclaw.pertamapartners.com/do/admin?role=captain&t=<CAPTAIN_TOKEN>` |
| Operator dashboard (quarantine) | `https://claimopenclaw.pertamapartners.com/do/admin?role=operator&t=<OPERATOR_TOKEN>` |

*Tokens are the same tokens the operator gave you for the morning of the workshop.*

### SSH into a DO participant's server

```bash
ssh -i ~/.ssh/pertama-fleet pertama@wdo-NN
# e.g. ssh -i ~/.ssh/pertama-fleet pertama@wdo-03
```

Everything you'd do on a Hetzner server works the same way. The Docker commands, ttyd restart, config patches — all identical.

### DO-specific ttyd restart

```bash
ssh -i ~/.ssh/pertama-fleet pertama@wdo-NN
sudo systemctl restart ttyd
sudo systemctl status ttyd | head -5
```

### Quarantine and spare swap

Same flow as Hetzner. Operator marks the server quarantined in the DO operator dashboard. Participant's next page load at `/do/` automatically swaps them to a fresh DO server. The DO pool has 10 servers total; there are no dedicated spare DO servers — spare capacity comes from unclaimed servers.

### Key differences to remember

| | Hetzner | DigitalOcean |
|---|---|---|
| Hostname format | `workshop-NN` | `wdo-NN` |
| Claim URL | `/` | `/do/` |
| Admin URL | `/admin?role=captain&t=...` | `/do/admin?role=captain&t=...` |
| Pool size | 46 servers | 10 servers |
| Setup experience | Identical | Identical |

---

## Captain mindset

A few things to remember:

- **You're a calm presence, not a debugger.** Most participants want reassurance more than diagnosis. "Yeah, you're on the right track, just hit Enter and it'll continue" beats a 3-paragraph explanation of what setup.sh is doing.
- **Trust the flowchart.** It was built from the actual things that broke during workshop prep. If you find yourself doing something not on the flowchart, you've probably gone past YELLOW into RED — escalate.
- **Don't over-help.** If a participant is reading the SETUP-GUIDE and following it, leave them alone. The discovery is part of the workshop.
- **Sit with frustration when needed.** Some participants will be irritated that their bot isn't working in 3 minutes. Acknowledge it ("yeah, this is the slow part, it'll click in another 90 seconds"), don't take it personally.
- **The workshop server is throwaway.** If something is genuinely broken and not fixable in 5 min, swap them to a spare. We have 5 spares for exactly this reason. Don't burn 30 min on one participant.

Last thing: **thank you for captaining**. This workshop doesn't happen without you.
