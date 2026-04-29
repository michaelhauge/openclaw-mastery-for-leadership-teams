# OpenClaw Rescue Guide

## Issue: OpenClaw Shows "Unhealthy"

**Cause:** OpenClaw's WhatsApp pairing session has expired or disconnected. The health check fails until WhatsApp is re-paired.

This can happen after a server restart, a period of inactivity, or if WhatsApp was logged out on your phone.

---

## Fix: Re-pair WhatsApp

Paste this command directly into your server terminal:

```bash
cd /opt/pertama && docker compose exec openclaw node openclaw.mjs pairing approve whatsapp
```

Then follow the on-screen prompt to scan the QR code or approve the pairing link on your phone.

Once paired, OpenClaw will return to **healthy** status automatically.

---

## How to Check Status

```bash
cd /opt/pertama && docker compose ps
```

OpenClaw should show `Up (healthy)` when working correctly.

---

## If You Cannot SSH Into Your Server

If your server is completely unreachable (all ports blocked), this is likely caused by a firewall misconfiguration. Contact your administrator — they will need to access the server via the Hetzner VNC console to restore access.
