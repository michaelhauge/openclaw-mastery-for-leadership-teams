# DigitalOcean 1-Click Installation Guide

**Easiest VPS deployment for OpenClaw**

**Time required**: 15-20 minutes
**Monthly cost**: $6 + LLM costs ($5-20) = **$11-26/month**

---

## Overview

DigitalOcean offers a **1-click, security-hardened OpenClaw deployment** perfect for beginners. This guide is recommended if you:
- Want 24/7 access to OpenClaw
- Need to access from multiple devices
- Travel frequently
- Prefer cloud hosting over local Mac

**Benefits**:
- Pre-configured security
- Singapore datacenter available
- Excellent documentation
- $200 free credit for new users (60 days)

---

## Prerequisites

- [x] DigitalOcean account ([Create here](https://www.digitalocean.com))
- [x] Payment method (credit card or PayPal)
- [x] LLM provider account ([Setup guide](02-llm-providers.md))
- [x] SSH client (Terminal on Mac)

---

## Step 1: Create DigitalOcean Account

### Sign Up

1. Visit: https://www.digitalocean.com
2. Click: "Sign Up"
3. Choose sign-up method:
   - Email
   - Google
   - GitHub
4. Verify email

### Add Payment Method

1. Go to: Account → Billing
2. Click: "Add Payment Method"
3. Enter credit card details
   - **Note**: Card will be charged $5-6 for first droplet
   - New users get $200 credit (60 days)
4. Verify card

---

## Step 2: Create OpenClaw Droplet

### Method 1: 1-Click App (Recommended)

**NOTE**: As of February 2026, DigitalOcean may or may not have an official OpenClaw 1-click app. If available, use it. Otherwise, use Method 2 below.

**If 1-click app exists**:
1. Go to: Marketplace → Search "OpenClaw"
2. Click: "Create OpenClaw Droplet"
3. Skip to "Configure Droplet" below

---

### Method 2: Manual Ubuntu Setup

**We'll create an Ubuntu droplet and install OpenClaw manually.**

1. **Go to**: Create → Droplets
2. **Choose Region**: Singapore (SGP1)
3. **Choose Image**: Ubuntu 22.04 (LTS) x64
4. **Choose Size**:
   - **Basic Plan**: $6/month
   - **CPU**: Regular (1 vCPU)
   - **RAM**: 1GB
   - **Storage**: 25GB SSD
   - **Transfer**: 1TB

**This spec is sufficient for OpenClaw.**

---

### Configure Droplet

#### Authentication

**Choose SSH Key** (recommended) or **Password**

**For SSH Key** (more secure):
1. On your Mac, generate key:
   ```bash
   ssh-keygen -t ed25519 -C "openclaw@digitalocean"
   ```
2. Press Enter 3 times (default location, no passphrase)
3. Copy public key:
   ```bash
   cat ~/.ssh/id_ed25519.pub | pbcopy
   ```
4. In DigitalOcean: Click "New SSH Key"
5. Paste key
6. Name it: "OpenClaw Mac"
7. Click "Add SSH Key"

**For Password**:
- DigitalOcean will email you a one-time password
- You'll change it on first login

---

#### Droplet Settings

- **Hostname**: `openclaw-singapore`
- **Tags**: `openclaw`, `production`
- **Monitoring**: Enable (free)
- **IPv6**: Enable (optional)
- **Backups**: Disable (save $1.20/month - optional)

---

#### Create!

Click: **Create Droplet**

**Wait**: 55 seconds for droplet to be created

**You'll see**:
```
✓ Droplet created!
IP Address: 128.199.XXX.XXX
```

**Save this IP address** - you'll need it!

---

## Step 3: Connect to Your Droplet

### SSH into Server

**Using SSH key**:
```bash
ssh root@128.199.XXX.XXX
```

**Using password**:
```bash
ssh root@128.199.XXX.XXX
# Enter one-time password from email
# Set new password when prompted
```

**First connection**:
```
The authenticity of host '128.199.XXX.XXX' can't be established.
Are you sure you want to continue connecting (yes/no)?
```

Type: `yes` and press Enter

**You're now connected to your server!**

---

## Step 4: Install OpenClaw

### Update System

```bash
apt update && apt upgrade -y
```

**Wait**: 1-2 minutes for updates

---

### Install Node.js 22

```bash
# Install Node.js repository
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -

# Install Node.js
apt install -y nodejs

# Verify
node --version
```

Should show: `v22.x.x`

---

### Install OpenClaw

```bash
npm install -g openclaw@latest
```

**Wait**: 2-3 minutes for installation

**Verify**:
```bash
openclaw --version
```

Should show version number.

---

## Step 5: Configure OpenClaw

### Set Up Environment Variables

```bash
# Create environment file
nano ~/.bashrc
```

**Add at bottom**:
```bash
# OpenClaw Environment
export KIMI_API_KEY="k-your-actual-key-here"
# Or for DeepSeek:
# export DEEPSEEK_API_KEY="sk-your-actual-key"
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

**Load variables**:
```bash
source ~/.bashrc
```

**Verify**:
```bash
echo $KIMI_API_KEY
```

Should show your key.

---

### Run Setup Wizard

```bash
openclaw onboard --install-daemon
```

**Follow prompts**:
1. Gateway binding: **Press Enter** (default: 0.0.0.0:18789)
   - **Note**: 0.0.0.0 allows remote access
2. LLM provider: Select "Custom" (for Kimi) or your provider
3. Messaging channels: Select what you want
4. Install daemon: **Yes**

---

### Create Configuration File

```bash
mkdir -p ~/.openclaw
nano ~/.openclaw/openclaw.json
```

**Add**:
```json
{
  "agent": {
    "model": "kimi/kimi-k2"
  },
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}",
      "baseURL": "https://api.moonshot.ai/v1"
    }
  },
  "gateway": {
    "host": "0.0.0.0",
    "port": 18789
  },
  "security": {
    "dmPairing": {
      "enabled": true
    }
  }
}
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

---

## Step 6: Set Up Firewall

### Install UFW (Uncomplicated Firewall)

```bash
# Install
apt install -y ufw

# Allow SSH (important!)
ufw allow ssh
ufw allow 22/tcp

# Allow OpenClaw dashboard (optional, for remote access)
ufw allow 18789/tcp

# Enable firewall
ufw enable
```

**Type**: `y` when asked to proceed

**Verify**:
```bash
ufw status
```

Should show SSH and 18789 allowed.

---

## Step 7: Start OpenClaw

### Start Service

```bash
openclaw start
```

**Expected output**:
```
✓ Starting OpenClaw gateway...
✓ Loading configuration...
✓ Connecting to LLM provider...
✓ Gateway running at http://0.0.0.0:18789
```

**Check status**:
```bash
openclaw status
```

Should show: `Gateway: Running`

---

### Enable Auto-Start

```bash
openclaw daemon install
```

Now OpenClaw starts automatically if server reboots.

---

## Step 8: Access Dashboard Remotely

### Set Up SSH Tunnel (Secure Method)

**From your Mac**:
```bash
ssh -L 18789:localhost:18789 root@128.199.XXX.XXX
```

**Then open browser**:
http://localhost:18789

**You'll see the OpenClaw dashboard!**

---

### Alternative: Direct Access (Less Secure)

**If you enabled port 18789** in firewall:

http://128.199.XXX.XXX:18789

⚠️ **Security Warning**: Anyone with IP can access dashboard. Only use temporarily for testing!

**Better approach**: Use SSH tunnel or set up authentication.

---

## Step 9: Connect Messaging Apps

### WhatsApp Setup

On the VPS:
```bash
openclaw channel install whatsapp
openclaw channel start whatsapp
```

**QR code will appear** in terminal.

**Scan with WhatsApp** on your phone:
- WhatsApp → Linked Devices → Link a Device

[Full WhatsApp guide →](07-whatsapp-setup.md)

---

### Telegram Setup

1. Create bot with @BotFather (on phone)
2. Get bot token
3. On VPS:
   ```bash
   echo 'export TELEGRAM_BOT_TOKEN="your-token"' >> ~/.bashrc
   source ~/.bashrc
   ```
4. Update config and start channel

[Full Telegram guide →](08-telegram-setup.md)

---

## Step 10: Test Everything

### Test from Messaging App

**Send to your WhatsApp or Telegram bot**:
```
Hello OpenClaw
```

**Expected response**:
```
Hello! I'm working from your DigitalOcean server.
What can I help you with?
```

**If working**: Success! ✓

---

## Security Hardening

### Change SSH Port (Optional)

**Edit SSH config**:
```bash
nano /etc/ssh/sshd_config
```

**Find line**:
```
#Port 22
```

**Change to**:
```
Port 2222
```

**Save** and **restart SSH**:
```bash
systemctl restart sshd
```

**Update firewall**:
```bash
ufw allow 2222/tcp
ufw delete allow 22/tcp
```

**Next SSH connection**:
```bash
ssh -p 2222 root@128.199.XXX.XXX
```

---

### Disable Root Login

**Create regular user**:
```bash
adduser openclaw
usermod -aG sudo openclaw
```

**Set password** when prompted.

**Copy SSH keys**:
```bash
cp -r ~/.ssh /home/openclaw/
chown -R openclaw:openclaw /home/openclaw/.ssh
```

**Edit SSH config**:
```bash
nano /etc/ssh/sshd_config
```

**Change**:
```
PermitRootLogin no
```

**Restart SSH**:
```bash
systemctl restart sshd
```

**Next connection**:
```bash
ssh openclaw@128.199.XXX.XXX
```

---

### Install Fail2Ban

Prevents brute-force attacks:

```bash
apt install -y fail2ban
systemctl enable fail2ban
systemctl start fail2ban
```

---

## Monitoring & Maintenance

### Check Logs

```bash
# OpenClaw logs
openclaw logs

# Last 50 lines
openclaw logs --tail 50

# Specific channel
openclaw logs --channel whatsapp
```

---

### Check Resource Usage

```bash
# CPU and RAM
htop

# Disk space
df -h

# Network
iftop
```

---

### Update OpenClaw

```bash
npm update -g openclaw
openclaw restart
```

---

## Troubleshooting

### Cannot SSH into server

**Check**:
- Correct IP address
- Firewall allows SSH (port 22 or 2222)
- SSH key permissions: `chmod 600 ~/.ssh/id_ed25519`

**Reset password** via DigitalOcean console:
1. Go to Droplet → Access
2. Click "Reset Root Password"
3. Check email for new password

---

### OpenClaw won't start

**Check Node.js**:
```bash
node --version
```

Must be v22+.

**Check logs**:
```bash
openclaw logs
```

**Common issues**:
- Missing API key
- Port already in use
- Insufficient RAM

---

### High costs

**Monitor usage**:
```bash
# DigitalOcean billing
# Go to: Account → Billing

# LLM usage
# Check provider dashboard
```

**Downsize if needed**:
- Can't downsize live droplet
- Create new smaller droplet
- Migrate OpenClaw config

---

## Cost Optimization

### Use Free $200 Credit

New DigitalOcean accounts get $200 for 60 days.

**Check credit**:
Account → Billing → Promotional Credits

---

### Snapshot Before Breaking Changes

**Create snapshot** (backup):
```bash
# In DigitalOcean console:
Droplet → Snapshots → Take Snapshot
```

**Cost**: $0.06/GB/month (pause droplet during snapshot)

**Use case**: Test major changes safely

---

### Resize Droplet

**Need more power?**
1. Go to: Droplet → Resize
2. Choose larger plan
3. Click "Resize Droplet"

**Need less power?**
- Must create new droplet (can't downsize)

---

## Quick Reference

### SSH Commands

```bash
# Connect
ssh root@128.199.XXX.XXX

# With tunnel
ssh -L 18789:localhost:18789 root@128.199.XXX.XXX

# With specific port
ssh -p 2222 root@128.199.XXX.XXX
```

### OpenClaw Commands

```bash
# Start
openclaw start

# Stop
openclaw stop

# Restart
openclaw restart

# Status
openclaw status

# Logs
openclaw logs

# Dashboard
# SSH tunnel first, then:
# http://localhost:18789
```

### Firewall Commands

```bash
# Status
ufw status

# Allow port
ufw allow 22/tcp

# Delete rule
ufw delete allow 22/tcp
```

---

## Next Steps

DigitalOcean deployment complete! Now:

1. **Connect Messaging**:
   - [WhatsApp Guide](07-whatsapp-setup.md)
   - [Telegram Guide](08-telegram-setup.md)

2. **Start Using**:
   - [Use Cases](../USE-CASES.md)
   - Test automation workflows

3. **Monitor**:
   - Check costs weekly
   - Review logs for errors

---

**VPS deployed! Connect messaging → [WhatsApp](07-whatsapp-setup.md) | [Telegram](08-telegram-setup.md)**
