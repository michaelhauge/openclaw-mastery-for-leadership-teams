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
- `auth` or `unauthorized` errors — missing Anthropic API key, contact your administrator
- `sandbox` or `Docker not found` errors — sandbox misconfiguration, contact your administrator
- `agent model` line — confirms the agent is running correctly

Share the output with your administrator if you cannot resolve it.

---

## Issue: WebSocket Timeout / Bot Receives Message but Doesn't Reply

**Symptoms in logs:**
- `[whatsapp] [default] channel exited` with `statusCode: 408` and `"Request Time-out, Connection was lost"`
- `[diagnostic] stuck session: state=processing` with age over 60 seconds and `queueDepth=1`

**Cause:** The agent received a message but got stuck trying to process it. This causes the WhatsApp WebSocket connection to time out and drop. The most common reason is an **invalid AI model name** configured on the server.

**Check the model:**

Look for the `agent model:` line near the top of the logs (e.g. `agent model: openai/gpt-5.5`). If the model name is incorrect or doesn't exist, the agent will hang on every message.

**To inspect the current config:**

```bash
cd /opt/pertama && docker compose exec openclaw cat /home/node/.openclaw/openclaw.json
```

**Self-healing:** OpenClaw's health monitor detects stuck sessions and restarts the container automatically. After a restart, try texting the bot again — if it replies, the issue was temporary. If it gets stuck again on every message, the model configuration needs to be fixed.

---

## Fix: Invalid Model Name (e.g. openai/gpt-5.5 doesn't exist)

If the config shows an invalid model (e.g. `openai/gpt-5.5`), update it to `openai/gpt-4o`:

```bash
cd /opt/pertama && docker compose exec openclaw node -e "
const fs = require('fs');
const config = JSON.parse(fs.readFileSync('/home/node/.openclaw/openclaw.json'));
config.agents.defaults.models = {'openai/gpt-4o': {alias: 'GPT'}};
config.agents.defaults.model.primary = 'openai/gpt-4o';
fs.writeFileSync('/home/node/.openclaw/openclaw.json', JSON.stringify(config, null, 2));
console.log('Done');
"
```

Then restart OpenClaw:

```bash
docker compose restart openclaw
```

Then have the user text the bot again to confirm it's responding.

---

## How to Check Status

```bash
cd /opt/pertama && docker compose ps
```

OpenClaw should show `Up (healthy)` when working correctly.

---

## If You Cannot SSH Into Your Server

If your server is completely unreachable (all ports blocked), this is likely caused by a firewall misconfiguration. Contact your administrator — they will need to access the server via the Hetzner VNC console to restore access.
