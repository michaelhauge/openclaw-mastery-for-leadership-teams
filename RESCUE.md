# OpenClaw Rescue Guide

## Issue: OpenClaw Shows "Unhealthy"

**Cause:** OpenClaw's WhatsApp pairing session has expired or disconnected. The health check fails until WhatsApp is re-paired.

This can happen after a server restart, a period of inactivity, or if WhatsApp was logged out on your phone.

---

## Fix: Step 0 — Open OpenClaw for Pairing (Admin, in Terminal)

Before the user texts, the admin must run this command to put OpenClaw into pairing mode:

```bash
cd /opt/pertama && docker compose exec openclaw node openclaw.mjs pairing approve whatsapp
```

---

## Fix: Step 1 — Trigger the Pairing Request (User's Phone)

The user texts anything to the bot on WhatsApp. The bot will reply automatically with a message like this:

> OpenClaw: access not configured.
>
> Your WhatsApp phone number: +60XXXXXXXXX
> Pairing code: EN5G83SK
>
> Ask the bot owner to approve with:
> `openclaw pairing approve whatsapp EN5G83SK`

The user sends you (the admin) the **pairing code** from that message.

---

## Fix: Step 2 — Approve the Pairing (Admin, in Terminal)

> ⚠️ This command is run in the **terminal on the server** — NOT on WhatsApp.

```bash
cd /opt/pertama && docker compose exec openclaw node openclaw.mjs pairing approve whatsapp XXXXXXXX
```

Replace `XXXXXXXX` with the pairing code the user sent you (e.g. `EN5G83SK`).

Once approved, the user will be able to use the bot and OpenClaw will return to **healthy** status.

---

## Issue: Paired but Bot Not Replying

If the user is paired but OpenClaw is not responding to messages, run this to check status and logs:

```bash
cd /opt/pertama && docker compose ps && docker compose logs openclaw --tail 50
```

**What to look for in the logs:**

- `unhealthy` in `docker compose ps` — pairing approved but health check hasn't passed yet, wait 30 seconds and retry
- `auth` or `unauthorized` errors — missing or invalid API key, see fix below
- `sandbox` or `Docker not found` errors — sandbox misconfiguration, contact your administrator
- `agent model` line — confirms the agent is running correctly

Share the output with your administrator if you cannot resolve it.

---

## Issue: WebSocket Timeout / Bot Receives Message but Doesn't Reply

**Symptoms in logs:**
- `[whatsapp] [default] channel exited` with `statusCode: 408` and `"Request Time-out, Connection was lost"`
- `[diagnostic] stuck session: state=processing` with age over 60 seconds and `queueDepth=1`
- `401 Incorrect API key provided`

**Cause:** The agent received a message but got stuck trying to process it — usually due to an invalid or corrupted API key.

**To inspect the current config:**

```bash
cd /opt/pertama && docker compose exec openclaw cat /home/node/.openclaw/openclaw.json
```

**Self-healing:** OpenClaw's health monitor detects stuck sessions and restarts the container automatically. After a restart, try texting the bot again — if it replies, the issue was temporary. If it gets stuck again on every message, the API key needs to be fixed.

---

## Fix: Invalid Model Name (e.g. openai/gpt-5.5 doesn't exist)

If the config shows an invalid model, update it to `openai/gpt-4o`:

```bash
cd /opt/pertama && docker compose exec openclaw node -e "const fs = require('fs'); const config = JSON.parse(fs.readFileSync('/home/node/.openclaw/openclaw.json')); config.agents.defaults.models = {'openai/gpt-4o': {alias: 'GPT'}}; config.agents.defaults.model.primary = 'openai/gpt-4o'; fs.writeFileSync('/home/node/.openclaw/openclaw.json', JSON.stringify(config, null, 2)); console.log('Done');"
```

Then restart:

```bash
docker compose restart openclaw
```

---

## Fix: Invalid or Corrupted API Key (401 error in logs)

If logs show `401 Incorrect API key provided`, the `auth-profiles.json` file needs to be rewritten with a valid key.

**Why this happens:** Long commands pasted into a terminal can get line-wrapped, silently corrupting the JSON (e.g. inserting a space into `"type"` → `"t ype"`, or garbling the API key). OpenClaw will log `ignored invalid auth profile entries during store load` when this happens.

**The safe fix — use an environment variable to avoid paste corruption:**

Step 1 — set your API key as a shell variable (paste just the key, no JSON around it):

```bash
OAIKEY='YOUR_OPENAI_API_KEY_HERE'
```

Step 2 — write the correctly-formatted auth-profiles.json using the variable (key travels as env var, not embedded in a long JSON string):

```bash
docker run --rm -e K="$OAIKEY" -v pertama_openclaw-config:/data alpine sh -c 'printf "{\"version\":1,\"profiles\":{\"openai:default\":{\"type\":\"token\",\"provider\":\"openai\",\"token\":\"%s\"}},\"lastGood\":{\"openai\":\"openai:default\"}}" "$K" > /data/agents/main/agent/auth-profiles.json && chown 1000:1000 /data/agents/main/agent/auth-profiles.json && cat /data/agents/main/agent/auth-profiles.json'
```

The `cat` at the end prints what was written — verify the key looks correct (check the last 4 characters match your key) before restarting.

Step 3 — restart OpenClaw:

```bash
docker compose restart openclaw
```

Then text the bot to confirm it replies.

---

## Fix: "Missing API key for provider 'openai'" error

**Cause:** The auth-profiles.json exists but uses incorrect field names. OpenClaw expects `"type": "token"` and `"token": "..."` — not `"type": "api_key"` and `"key": "..."`.

**Fix:** Use the env-var write method above (Step 1 and Step 2) to rewrite the file in the correct format, then restart.

---

## How to Check Status

```bash
cd /opt/pertama && docker compose ps
```

OpenClaw should show `Up (healthy)` when working correctly.

---

## If You Cannot SSH Into Your Server

If your server is completely unreachable (all ports blocked), this is likely caused by a firewall misconfiguration. Contact your administrator — they will need to access the server via the Hetzner VNC console to restore access.
