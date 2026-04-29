# OpenClaw Rescue Guide

## Issue: OpenClaw Shows "Unhealthy"

**Cause:** OpenClaw's WhatsApp pairing session has expired or disconnected. The health check fails until WhatsApp is re-paired.

This can happen after a server restart, a period of inactivity, or if WhatsApp was logged out on your phone.

---

## Fix: Step 1 — Trigger the Pairing Request (User's Phone)

The user texts anything to the bot on WhatsApp. If access is not configured, the bot will reply automatically with a message like this:

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

## How to Check Status

```bash
cd /opt/pertama && docker compose ps
```

OpenClaw should show `Up (healthy)` when working correctly.

---

## If You Cannot SSH Into Your Server

If your server is completely unreachable (all ports blocked), this is likely caused by a firewall misconfiguration. Contact your administrator — they will need to access the server via the Hetzner VNC console to restore access.
