# Taking Your OpenClaw Server Home

After the workshop, your OpenClaw server can be transferred into your own Hetzner account so you own and control it fully. This guide walks you through that process and how to log in going forward.

---

## Step 1 — Create a Hetzner Account

If you don't already have one, sign up at [hetzner.com](https://www.hetzner.com/). The free tier is enough to receive a transferred server.

---

## Step 2 — Add Your SSH Key to the Server (Before Transfer)

Before the server is transferred, you need to add your own SSH key so you can log in after the handover. Do this while you still have access to the workshop terminal.

**On your own computer (Mac/Linux), generate an SSH key if you don't have one:**

```bash
ssh-keygen -t ed25519 -C "your@email.com"
```

Press Enter to accept defaults. Then copy your public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the output (starts with `ssh-ed25519 ...`).

**In your workshop terminal**, paste and run this command (replace the key with yours):

```bash
echo "ssh-ed25519 AAAA... your@email.com" >> ~/.ssh/authorized_keys
```

Verify it was added:

```bash
cat ~/.ssh/authorized_keys
```

Your key should appear in the list.

---

## Step 3 — Note Your Server IP

In your workshop terminal, run:

```bash
curl -s ifconfig.me
```

Save this IP address — you will use it to SSH in after the transfer.

---

## Step 4 — Request the Server Transfer

Contact your workshop administrator and give them:
- Your Hetzner account email address
- Your server number (e.g. workshop-05)

The administrator will initiate the transfer from the Hetzner Cloud Console. You will receive an **email from Hetzner** with a link to accept the transfer. Click it to complete the handover.

> The server stays running during the transfer — your bot will not go offline.

---

## Step 5 — Log In After Transfer

Once the server is in your Hetzner account, SSH in directly from your computer:

```bash
ssh root@YOUR_SERVER_IP
```

Replace `YOUR_SERVER_IP` with the IP you noted in Step 3.

You should see a prompt like:

```
root@workshop-05:~#
```

---

## Everyday Server Management

Once logged in, navigate to the OpenClaw directory:

```bash
cd /opt/pertama
```

**Check if the bot is running:**

```bash
docker compose ps
```

OpenClaw should show `Up (healthy)`.

**View recent logs:**

```bash
docker compose logs openclaw --tail 30
```

**Restart the bot:**

```bash
docker compose restart openclaw
```

**Stop everything:**

```bash
docker compose down
```

**Start everything:**

```bash
docker compose up -d
```

---

## If the Bot Stops Responding After Transfer

The most common cause is the WhatsApp pairing session expiring. Follow the steps in [RESCUE.md](RESCUE.md) to re-pair.

---

## Hetzner Console (Emergency Access)

If you ever lose SSH access, log into [console.hetzner.com](https://console.hetzner.com), find your server, and click **Console** to get browser-based terminal access. From there you can reset your SSH key or troubleshoot firewall issues.
