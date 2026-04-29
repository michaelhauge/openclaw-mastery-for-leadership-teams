# OpenClaw Rescue Guide

Use this guide when your OpenClaw bot stops working or doesn't reply on WhatsApp.

All commands in this guide are run in your **server terminal**. See below if you need help opening it.

---

## How to Open Your Server Terminal

### Option A: Web Browser (Easiest — Workshop Period)

Go to: `https://claimopenclaw.pertamapartners.com/terminal/p[YOUR NUMBER]`

Replace `[YOUR NUMBER]` with your workshop server number (e.g. `p01`, `p02`, `p05`).

You will see a black screen with a prompt like:
```
pertama@workshop-05:~$
```

### Option B: SSH from Your Computer (Mac / Windows)

**Mac** — open Terminal (Cmd + Space → type "Terminal") and run:
```bash
ssh root@YOUR_SERVER_IP
```

**Windows** — open PowerShell (Windows + R → type `powershell`) and run:
```
ssh root@YOUR_SERVER_IP
```

Don't know your server IP? In the web terminal, run: `curl -s ifconfig.me`

---

## Before Running Any Commands

Always navigate to the OpenClaw folder first:

```bash
cd /opt/pertama
```

Your prompt should show `/opt/pertama` before you run anything below.

---

## Issue 1: Bot Shows "Unhealthy" — WhatsApp Not Paired

**Cause:** The WhatsApp pairing session expired. This happens after a server restart or period of inactivity.

**This is a 3-step process between the admin (server terminal) and the user (their phone).**

### Step 0 — Admin Opens Pairing Mode

The admin runs this in the server terminal to put OpenClaw into pairing mode:

```bash
cd /opt/pertama && docker compose exec openclaw node openclaw.mjs pairing approve whatsapp
```

Leave this running — do not close the terminal.

### Step 1 — User Sends a WhatsApp Message

The user texts anything to the bot on WhatsApp. The bot replies automatically with a message like:

> OpenClaw: access not configured.
>
> Your WhatsApp phone number: +60XXXXXXXXX
> Pairing code: **EN5G83SK**

The user sends the **pairing code** (e.g. `EN5G83SK`) to the admin.

### Step 2 — Admin Approves the Pairing

In the server terminal, the admin runs:

```bash
cd /opt/pertama && docker compose exec openclaw node openclaw.mjs pairing approve whatsapp XXXXXXXX
```

Replace `XXXXXXXX` with the pairing code from the user (e.g. `EN5G83SK`).

> ⚠️ This command is typed into the **server terminal** — NOT into WhatsApp.

Once approved, the user can send messages and the bot will reply. OpenClaw will return to **healthy** status within 30 seconds.

---

## Issue 2: Bot Is Paired but Not Replying

Check status and logs:

```bash
cd /opt/pertama && docker compose ps && docker compose logs openclaw --tail 50
```

**What to look for:**

| Log message | What it means | What to do |
|---|---|---|
| `Up (healthy)` in ps output | Bot is running correctly | Check if WhatsApp is paired (Issue 1) |
| `Up (unhealthy)` | Health check failing | Wait 30s and check again; if persistent, see Issue 1 |
| `401 Incorrect API key` | OpenAI key is wrong or expired | See Issue 3 below |
| `ignored invalid auth profile entries` | API key file is corrupted | See Issue 3 below |
| `Missing API key for provider 'openai'` | API key file has wrong format | See Issue 3 below |
| `openai/gpt-5.5` or similar in model line | Invalid model name | See Issue 4 below |
| `sandbox` or `Docker not found` | Sandbox misconfiguration | Contact your administrator |

---

## Issue 3: 401 Error / Invalid or Corrupted API Key

**Symptoms:** Logs show `401 Incorrect API key provided` or `ignored invalid auth profile entries during store load`. Bot receives messages but never replies.

**Cause:** The OpenAI API key in the config file is wrong, expired, or was corrupted when it was written (a common issue when pasting long commands into a terminal — characters get garbled by line-wrapping).

**Fix:**

Step 1 — In your terminal, set your API key as a variable (paste just the key by itself):

```bash
OAIKEY='YOUR_OPENAI_API_KEY_HERE'
```

Step 2 — Write it to the config file safely (the key is passed as an environment variable, not embedded in the command):

```bash
docker run --rm -e K="$OAIKEY" -v pertama_openclaw-config:/data alpine sh -c 'printf "{\"version\":1,\"profiles\":{\"openai:default\":{\"type\":\"token\",\"provider\":\"openai\",\"token\":\"%s\"}},\"lastGood\":{\"openai\":\"openai:default\"}}" "$K" > /data/agents/main/agent/auth-profiles.json && chown 1000:1000 /data/agents/main/agent/auth-profiles.json && cat /data/agents/main/agent/auth-profiles.json'
```

The last part (`cat`) prints the file that was written. Check that the key looks correct — the last 4 characters should match the end of your API key.

Step 3 — Restart OpenClaw:

```bash
docker compose restart openclaw
```

Then have someone text the bot to confirm it replies.

---

## Issue 4: Invalid Model Name

**Symptoms:** Logs show a model name like `openai/gpt-5.5` that doesn't exist. Bot fails on every message.

**Fix:**

```bash
cd /opt/pertama && docker compose exec openclaw node -e "const fs = require('fs'); const config = JSON.parse(fs.readFileSync('/home/node/.openclaw/openclaw.json')); config.agents.defaults.models = {'openai/gpt-4o': {alias: 'GPT'}}; config.agents.defaults.model.primary = 'openai/gpt-4o'; fs.writeFileSync('/home/node/.openclaw/openclaw.json', JSON.stringify(config, null, 2)); console.log('Done');"
```

Then restart:

```bash
docker compose restart openclaw
```

---

## Issue 5: WebSocket Timeout (Bot Gets Stuck Processing)

**Symptoms in logs:**
- `[whatsapp] [default] channel exited` with `statusCode: 408`
- `[diagnostic] stuck session: state=processing` with age over 60 seconds

**Cause:** The bot received a message but got stuck. This is usually caused by a bad API key (see Issue 3).

**Self-healing:** OpenClaw detects stuck sessions and restarts automatically. After a restart, try texting again. If it gets stuck on every message, fix the API key.

---

## How to Check Status

Quick health check:

```bash
cd /opt/pertama && docker compose ps
```

OpenClaw should show `Up (healthy)`.

Full log view (last 50 lines):

```bash
docker compose logs openclaw --tail 50
```

---

## If You Cannot Access Your Server at All

If the web terminal is unavailable and SSH is not working, your server's firewall may be blocking all connections. Contact your administrator — they will need to access the server via the Hetzner VNC rescue console to restore connectivity.
