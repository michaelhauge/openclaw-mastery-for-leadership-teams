# Contabo VPS Installation Guide

**Best value paid VPS for OpenClaw**

**Time required**: 15-20 minutes
**Monthly cost**: $5.50 + LLM costs ($5-20) = **$10-25/month total**

---

## Overview

Contabo offers exceptional specs for the price - the best value among paid VPS providers. Choose Contabo if you:
- Want powerful specs at low cost
- Prefer x86 architecture over ARM
- Need unlimited bandwidth
- Are comfortable with standard VPS setup

**Why Contabo**:
- 4 CPU cores + 8GB RAM for $5.50/month
- Unlimited bandwidth included
- Singapore datacenter available
- x86 standard architecture

**Compared to**:
- DigitalOcean: $6/month for 1 CPU, 1GB RAM (Contabo is 4x more powerful)
- Oracle Free: $0 but ARM architecture and capacity constraints

---

## Prerequisites

- [x] Credit card or PayPal
- [x] Email address
- [x] LLM provider account ([Setup guide](02-llm-providers.md))
- [x] SSH client (Terminal on Mac)

---

## Step 1: Order Contabo VPS

### Create Account

1. Visit: https://contabo.com
2. Click: "VPS" → "VPS S SSD"
3. **Location**: Singapore
4. Click: "Order Now"

---

### Configure VPS

**VPS S SSD Specs**:
- **CPU**: 4 vCores
- **RAM**: 8GB
- **Storage**: 100GB NVMe SSD
- **Traffic**: Unlimited
- **Price**: ~$5.50/month (varies by exchange rate)

**Operating System**:
- Select: **Ubuntu 22.04 LTS** (x64)

**Additional Options**:
- **Control Panel**: None (save money)
- **Backup**: No (optional - adds $1.50/month)
- **DDoS Protection**: Included free
- **IPv4**: 1 included

**Contract Period**:
- **1 month**: $6.99/month
- **3 months**: $5.99/month
- **6 months**: $5.69/month
- **12 months**: $5.50/month ← Best value

**Choose** based on commitment level.

---

### Checkout

1. **Create Contabo Account**:
   - Email
   - Password
   - Complete registration

2. **Choose Payment Method**:
   - Credit card (Visa, Mastercard)
   - PayPal
   - Others (regional options)

3. **Complete Order**

**Wait**: 1-5 minutes for VPS provisioning

---

### Receive Credentials

**You'll receive 2 emails**:

**Email 1: VPS Setup**
- Subject: "Your VPS has been deployed"
- Contains: Server IP address, datacenter location

**Email 2: Access Credentials**
- Subject: "Your VPS access data"
- Contains:
  - **IP Address**: 185.XXX.XXX.XXX
  - **Username**: root
  - **Password**: [random password]
  - **SSH Port**: 22

**Save these credentials securely!**

---

## Step 2: First Login

### SSH into Server

```bash
ssh root@185.XXX.XXX.XXX
```

**Enter password** from email (copy-paste recommended - long random password)

**First connection**:
```
The authenticity of host '185.XXX.XXX.XXX' can't be established.
Are you sure you want to continue connecting (yes/no)?
```

Type: `yes`

**You're connected!**

---

### Change Root Password

**Immediately change to a password you know**:

```bash
passwd
```

**Enter new password** (twice)

**Use a strong password** - this is your server!

---

## Step 3: Update System

### Apply Updates

```bash
apt update && apt upgrade -y
```

**Wait**: 2-5 minutes for updates

**If prompted** about service restarts:
- Press `Tab` to select `<Ok>`
- Press `Enter`

---

### Install Essential Tools

```bash
apt install -y curl git build-essential ufw
```

---

## Step 4: Secure Server

### Set Up Firewall

```bash
# Allow SSH (IMPORTANT - don't lock yourself out!)
ufw allow 22/tcp

# Allow OpenClaw dashboard (optional)
ufw allow 18789/tcp

# Enable firewall
ufw enable
```

**Type**: `y` when prompted

**Verify**:
```bash
ufw status
```

Should show SSH and 18789 allowed.

---

### Disable Root Login (After Creating User)

**Create regular user**:
```bash
adduser openclaw
```

**Set password** when prompted

**Add to sudo group**:
```bash
usermod -aG sudo openclaw
```

**Switch to new user**:
```bash
su - openclaw
```

**Test sudo**:
```bash
sudo ls
```

Enter your password - should work.

**Exit back to root** (for now):
```bash
exit
```

We'll disable root login later.

---

## Step 5: Install Node.js 22

### Add Node.js Repository

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
```

---

### Install Node.js

```bash
apt install -y nodejs
```

**Verify**:
```bash
node --version
```

Should show: `v22.x.x`

```bash
npm --version
```

Should show version number.

---

## Step 6: Install OpenClaw

### Install Globally

```bash
npm install -g openclaw@latest
```

**Wait**: 2-3 minutes

**Verify**:
```bash
openclaw --version
```

---

## Step 7: Configure OpenClaw

### Set Environment Variables

**As root** (or openclaw user with sudo):

```bash
nano /root/.bashrc
```

**Add at bottom**:
```bash
# OpenClaw Environment
export KIMI_API_KEY="k-your-actual-key-here"
# Or for DeepSeek:
# export DEEPSEEK_API_KEY="sk-your-actual-key"
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

**Load**:
```bash
source /root/.bashrc
```

**Verify**:
```bash
echo $KIMI_API_KEY
```

---

### Create Configuration

```bash
mkdir -p /root/.openclaw
nano /root/.openclaw/openclaw.json
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
  },
  "channels": {
    "whatsapp": {
      "enabled": false
    },
    "telegram": {
      "enabled": false
    }
  }
}
```

**Save** and exit.

---

## Step 8: Run OpenClaw Setup

### Onboarding Wizard

```bash
openclaw onboard --install-daemon
```

**Follow prompts**:
1. Gateway binding: **Press Enter** (0.0.0.0:18789)
2. LLM provider: Select "Custom" or your provider
3. Messaging channels: Select what you want
4. Install daemon: **Yes**

---

## Step 9: Start OpenClaw

### Start Service

```bash
openclaw start
```

**Expected**:
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

Now OpenClaw starts automatically on server reboot.

---

## Step 10: Access Dashboard

### Method 1: SSH Tunnel (Secure)

**From your Mac**:
```bash
ssh -L 18789:localhost:18789 root@185.XXX.XXX.XXX
```

**Then open browser**:
http://localhost:18789

---

### Method 2: Direct Access (Temporary)

**If you allowed port 18789** in firewall:

http://185.XXX.XXX.XXX:18789

⚠️ **Security**: This exposes dashboard to internet. Use SSH tunnel instead for production.

---

## Step 11: Connect Messaging Apps

### WhatsApp

```bash
openclaw channel install whatsapp
openclaw channel start whatsapp
```

**Scan QR code** with your phone.

[Full WhatsApp guide →](07-whatsapp-setup.md)

---

### Telegram

Setup bot with @BotFather, get token, configure.

[Full Telegram guide →](08-telegram-setup.md)

---

## Step 12: Final Security Hardening

### Create SSH Key (Optional but Recommended)

**On your Mac**:
```bash
ssh-keygen -t ed25519 -C "openclaw@contabo"
```

**Copy public key to server**:
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub root@185.XXX.XXX.XXX
```

**Test key login**:
```bash
ssh root@185.XXX.XXX.XXX
```

Should connect without password.

---

### Disable Password Login

**Edit SSH config**:
```bash
nano /etc/ssh/sshd_config
```

**Find and change**:
```
PasswordAuthentication no
PermitRootLogin prohibit-password
```

**Save** and **restart SSH**:
```bash
systemctl restart sshd
```

**Now only SSH keys work** - more secure!

---

### Install Fail2Ban

Prevents brute-force attacks:

```bash
apt install -y fail2ban
systemctl enable fail2ban
systemctl start fail2ban
```

**Check status**:
```bash
fail2ban-client status sshd
```

---

## Monitoring

### Check Resource Usage

**CPU and RAM**:
```bash
htop
```

**Disk space**:
```bash
df -h
```

**Network**:
```bash
vnstat
```

(Install: `apt install vnstat`)

---

### Monitor Logs

**OpenClaw logs**:
```bash
openclaw logs

# Last 50 lines
openclaw logs --tail 50

# Specific channel
openclaw logs --channel whatsapp
```

**System logs**:
```bash
journalctl -xe
```

---

## Performance Optimization

### Enable Swap (If Needed)

**Check if swap exists**:
```bash
free -h
```

**If no swap, create**:
```bash
# Create 4GB swap
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# Make permanent
echo '/swapfile none swap sw 0 0' >> /etc/fstab
```

---

### Optimize for OpenClaw

**Increase file limits**:
```bash
nano /etc/security/limits.conf
```

**Add**:
```
* soft nofile 65536
* hard nofile 65536
```

**Reboot** for changes to take effect:
```bash
reboot
```

---

## Backup Strategy

### Manual Backup

**Backup OpenClaw config**:
```bash
# Create backup
tar -czf openclaw-backup-$(date +%Y%m%d).tar.gz /root/.openclaw

# Download to your Mac
scp root@185.XXX.XXX.XXX:openclaw-backup-*.tar.gz ~/Desktop/
```

---

### Automated Backup (Cron)

**Create backup script**:
```bash
nano /root/backup-openclaw.sh
```

**Add**:
```bash
#!/bin/bash
tar -czf /root/openclaw-backup-$(date +%Y%m%d).tar.gz /root/.openclaw
# Keep only last 7 backups
ls -t /root/openclaw-backup-*.tar.gz | tail -n +8 | xargs rm -f
```

**Make executable**:
```bash
chmod +x /root/backup-openclaw.sh
```

**Schedule daily backup**:
```bash
crontab -e
```

**Add**:
```
0 3 * * * /root/backup-openclaw.sh
```

Runs daily at 3 AM.

---

## Troubleshooting

### Cannot connect to server

**Check**:
- Server is running (Contabo console)
- Firewall allows SSH (port 22)
- Correct IP address
- Network connectivity

**Contabo Console Access**:
1. Log into Contabo.com
2. Go to: My Services → VPS
3. Click: Actions → VNC Console
4. Access server via browser

---

### High costs

**Monitor Contabo billing**:
- Log into account
- Check: Billing → Invoices
- Should be consistent $5.50-6.99/month

**Monitor LLM costs**:
- Check provider dashboard weekly
- Adjust usage if needed

---

### Performance issues

**Check resources**:
```bash
htop
```

**If high CPU/RAM**:
- Restart OpenClaw: `openclaw restart`
- Check for runaway processes
- Consider upgrading to VPS M ($9.50/month for 6CPU, 16GB)

---

### OpenClaw won't start

**Check logs**:
```bash
openclaw logs
```

**Common issues**:
- Missing API key
- Port in use
- Insufficient permissions

**Reset**:
```bash
openclaw stop
rm -rf /root/.openclaw/logs/*
openclaw start
```

---

## Upgrading Contabo VPS

### Need More Power?

**Upgrade to VPS M**:
- 6 CPU cores
- 16GB RAM
- 200GB SSD
- ~$9.50/month

**Or VPS L**:
- 8 CPU cores
- 30GB RAM
- 400GB SSD
- ~$16.50/month

**How to upgrade**:
1. Contact Contabo support
2. Request upgrade
3. They'll handle migration

---

## Cost Breakdown

### Monthly Costs

| Item | Cost |
|------|------|
| **Contabo VPS S** | $5.50/month (annual) |
| **LLM (Kimi K2)** | $10-20/month |
| **Backup (optional)** | $1.50/month |
| **Total** | **$17-27/month** |

**Compared to**:
- DigitalOcean ($6) + Kimi ($10-20) = $16-26/month
  - But Contabo has 4x more power
- Oracle ($0) + Kimi ($10-20) = $10-20/month
  - But Contabo is x86 and easier setup

---

## Quick Reference

### SSH Commands

```bash
# Connect
ssh root@185.XXX.XXX.XXX

# With tunnel
ssh -L 18789:localhost:18789 root@185.XXX.XXX.XXX

# With key
ssh -i ~/.ssh/id_ed25519 root@185.XXX.XXX.XXX
```

### OpenClaw Commands

```bash
openclaw start
openclaw stop
openclaw restart
openclaw status
openclaw logs
openclaw dashboard  # Opens in browser
```

### System Commands

```bash
# Check resources
htop

# Check disk
df -h

# Restart server
reboot

# Check firewall
ufw status
```

---

## Next Steps

Contabo VPS deployed! Now:

1. **Connect Messaging**:
   - [WhatsApp Guide](07-whatsapp-setup.md)
   - [Telegram Guide](08-telegram-setup.md)

2. **Start Using**:
   - [Use Cases](../USE-CASES.md)
   - Test automation

3. **Monitor**:
   - Check Contabo billing monthly
   - Review LLM usage weekly
   - Monitor server resources

---

**Powerful VPS deployed at great value! → Connect messaging next**
