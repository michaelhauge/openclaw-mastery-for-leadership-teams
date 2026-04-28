# Oracle Cloud Free Tier Installation Guide

**Free forever VPS hosting for OpenClaw**

**Time required**: 20-30 minutes (more complex than other options)
**Monthly cost**: $0 hosting + LLM costs ($5-20) = **$5-20/month total**

---

## Overview

Oracle Cloud offers an "Always Free" tier with **genuinely free forever** hosting in Singapore. This is the best value option if you:
- Want to minimize costs
- Are comfortable with more technical setup
- Don't mind ARM architecture
- Want powerful specs (4 CPU, 24GB RAM)

**Challenges**:
- More complex setup than DigitalOcean
- ARM architecture (Node.js compatible, but different)
- Occasional capacity constraints

**This guide is for intermediate users.** Beginners should consider [DigitalOcean](05-digitalocean.md) first.

---

## Prerequisites

- [x] Credit card (required for verification, not charged)
- [x] Email address
- [x] LLM provider account ([Setup guide](02-llm-providers.md))
- [x] SSH client (Terminal on Mac)
- [x] Patience (Oracle signup can be slow)

---

## Step 1: Create Oracle Cloud Account

### Sign Up

1. Visit: https://www.oracle.com/cloud/free/
2. Click: "Start for free"
3. Enter:
   - Email address
   - Country/Territory: **Singapore**
4. Click: "Verify my email"
5. Check email and click verification link

### Account Details

1. **Account Type**: Individual
2. **Cloud Account Name**: Choose unique name (lowercase, no spaces)
   - Example: `myopenclaw2026`
3. **Home Region**: **Singapore West (XSP)** or **Singapore (SIN)**
   - ⚠️ Choose carefully - cannot change later
   - Singapore region required for SEA

### Personal Information

1. Enter personal details
2. Add mobile phone (will receive SMS verification)
3. Enter verification code

### Payment Verification

**Important**: Oracle requires credit card but won't charge for Free Tier.

1. Enter credit card details
2. Authorize $1 verification hold
   - Will be refunded immediately
3. Complete verification

### Wait for Account Activation

**Expected**: 5-30 minutes
**Can take**: Up to 24 hours in rare cases

**You'll receive email** when account is active.

---

## Step 2: Create Compute Instance

### Navigate to Compute

1. **Sign in**: https://cloud.oracle.com
2. **Open menu**: ☰ (top left)
3. **Go to**: Compute → Instances
4. **Click**: "Create Instance"

---

### Instance Configuration

#### Name

**Name**: `openclaw-singapore`

---

#### Placement

- **Availability Domain**: AD-1 (or any available)
- **Fault Domain**: Leave default

---

#### Image and Shape

**Click**: "Edit" next to "Image and shape"

**1. Change Image**:
- Click: "Change Image"
- Select: **Ubuntu** (Canonical Ubuntu 22.04)
- Click: "Select Image"

**2. Change Shape**:
- Click: "Change Shape"
- Select: **Ampere** (VM.Standard.A1.Flex)
- **OCPUs**: 4 (maximum for free tier)
- **Memory (GB)**: 24 (maximum for free tier)
- Click: "Select Shape"

**Note**: If you see "Out of capacity" error, try:
- Different Availability Domain
- Different time (try early morning SGT)
- Different region (if acceptable)

---

#### Networking

**Virtual Cloud Network (VCN)**:
- Click: "Create new virtual cloud network"
- **Name**: `openclaw-vcn`
- Leave other defaults

**Subnet**:
- Click: "Create new public subnet"
- **Name**: `openclaw-subnet`
- Leave defaults

**Public IPv4 address**: **Assign a public IPv4 address** (checked)

---

#### SSH Keys

**How to access your instance**:

**Option 1: Generate new key pair** (easier):
1. Select: "Generate a key pair for me"
2. Click: "Save Private Key" → Save as `openclaw_key.pem`
3. Click: "Save Public Key" → Save as `openclaw_key_pub.pem`
4. **Important**: Store these files safely!

**Option 2: Upload existing key**:
1. Select: "Upload public key files (.pub)"
2. Upload your existing `~/.ssh/id_ed25519.pub`

---

#### Boot Volume

- **Size (GB)**: 100 (free tier allows up to 200GB total)
- Leave other settings as default

---

### Create Instance

**Click**: "Create"

**Wait**: 2-3 minutes for provisioning

**Status changes**:
- Provisioning (orange)
- Running (green) ← When ready

**Copy the Public IP address** shown (e.g., 129.159.XXX.XXX)

---

## Step 3: Configure Security List

### Allow OpenClaw Port

By default, Oracle blocks most ports. We need to allow SSH and OpenClaw.

1. **Go to**: VCN Details
   - Click your VCN name: `openclaw-vcn`
2. **Click**: Subnets → `openclaw-subnet`
3. **Click**: Security Lists → Default Security List
4. **Click**: "Add Ingress Rules"

**Rule 1: SSH** (if not already there):
- **Source CIDR**: 0.0.0.0/0
- **IP Protocol**: TCP
- **Destination Port Range**: 22
- Click: "Add Ingress Rules"

**Rule 2: OpenClaw Dashboard** (optional, for testing):
- **Source CIDR**: 0.0.0.0/0
- **IP Protocol**: TCP
- **Destination Port Range**: 18789
- Click: "Add Ingress Rules"

---

## Step 4: Connect to Instance

### Set SSH Key Permissions

**If you downloaded key from Oracle**:
```bash
chmod 400 ~/Downloads/openclaw_key.pem
```

---

### SSH into Instance

**With Oracle-generated key**:
```bash
ssh -i ~/Downloads/openclaw_key.pem ubuntu@129.159.XXX.XXX
```

**With your own key**:
```bash
ssh ubuntu@129.159.XXX.XXX
```

**Note**: Default user is `ubuntu` (not `root`)

**First connection**:
```
The authenticity of host '129.159.XXX.XXX' can't be established.
Are you sure you want to continue connecting (yes/no)?
```

Type: `yes`

**You're now connected!**

---

## Step 5: Update System

### Update Packages

```bash
sudo apt update && sudo apt upgrade -y
```

**Wait**: 2-5 minutes

---

### Install Required Tools

```bash
sudo apt install -y curl git build-essential
```

---

## Step 6: Install Node.js 22 (ARM64)

### Install Node.js for ARM

Oracle Free Tier uses ARM architecture. Node.js fully supports ARM.

```bash
# Add Node.js 22 repository
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs

# Verify
node --version
```

**Expected**: `v22.x.x`

**Verify architecture**:
```bash
uname -m
```

Should show: `aarch64` (ARM64)

---

## Step 7: Install OpenClaw

### Install Globally

```bash
sudo npm install -g openclaw@latest
```

**Wait**: 3-5 minutes (ARM compilation takes longer)

**Verify**:
```bash
openclaw --version
```

---

## Step 8: Configure OpenClaw

### Set Environment Variables

```bash
nano ~/.bashrc
```

**Add at bottom**:
```bash
# OpenClaw Configuration
export KIMI_API_KEY="k-your-actual-key-here"
# or
# export DEEPSEEK_API_KEY="sk-your-actual-key"
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

**Load**:
```bash
source ~/.bashrc
```

**Verify**:
```bash
echo $KIMI_API_KEY
```

---

### Create Configuration

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

**Save** and exit.

---

## Step 9: Set Up Firewall (UFW)

```bash
# Install UFW
sudo apt install -y ufw

# Allow SSH
sudo ufw allow 22/tcp

# Allow OpenClaw dashboard (optional)
sudo ufw allow 18789/tcp

# Enable firewall
sudo ufw enable
```

**Type**: `y` when prompted

---

## Step 10: Start OpenClaw

### Run Onboarding

```bash
openclaw onboard --install-daemon
```

**Follow prompts** (similar to other guides)

---

### Start Service

```bash
openclaw start
```

**Expected**:
```
✓ Starting OpenClaw gateway...
✓ Gateway running at http://0.0.0.0:18789
```

**Check status**:
```bash
openclaw status
```

---

### Enable Auto-Start

```bash
openclaw daemon install
```

---

## Step 11: Access Dashboard

### SSH Tunnel (Secure)

**From your Mac**:
```bash
ssh -i ~/Downloads/openclaw_key.pem -L 18789:localhost:18789 ubuntu@129.159.XXX.XXX
```

**Open browser**:
http://localhost:18789

**You'll see the OpenClaw dashboard!**

---

## Step 12: Connect Messaging Apps

Same process as other installations:

- [WhatsApp Guide](07-whatsapp-setup.md)
- [Telegram Guide](08-telegram-setup.md)

---

## ARM Compatibility Notes

### What Works on ARM

✅ **Fully compatible**:
- Node.js and npm
- OpenClaw core
- All LLM providers (API-based)
- WhatsApp integration
- Telegram integration
- Most npm packages

❌ **May have issues**:
- Some native binary packages
- Docker images not built for ARM
- Very old npm packages

**In practice**: OpenClaw works perfectly on ARM. You won't notice any difference.

---

## Oracle Free Tier Limits

### Always Free Resources

**Compute**:
- **ARM VM**: 4 OCPUs, 24GB RAM (what we're using)
- **AMD VM**: 2 instances, 1/8 OCPU each, 1GB RAM each
- **Storage**: Up to 200GB total

**Additional Free Resources**:
- **Load Balancer**: 1 instance
- **Public IPv4**: 2 addresses
- **Outbound Data Transfer**: 10TB/month
- **Object Storage**: 20GB
- **Block Storage**: 200GB total

**Our usage**: Well within limits!

---

### Avoiding Charges

**Free Tier is TRULY free** but:

❌ **Don't**:
- Add paid resources
- Upgrade to paid account
- Exceed free tier limits

✅ **Do**:
- Stay within free tier specs
- Monitor usage dashboard
- Set up billing alerts

**Monitor usage**:
1. Go to: ☰ → Billing & Cost Management
2. Click: "Cost Analysis"
3. Verify: $0.00

---

## Troubleshooting

### "Out of capacity" When Creating Instance

**Oracle Free Tier is popular** - sometimes no capacity.

**Solutions**:
1. **Try different time**: Early morning Singapore time
2. **Try different AD**: AD-1, AD-2, AD-3
3. **Try different region**: Japan, South Korea (if acceptable)
4. **Wait and retry**: Capacity changes frequently

**Alternative**: Use [DigitalOcean](05-digitalocean.md) or [Contabo](06-contabo-vps.md)

---

### Cannot SSH into Instance

**Check**:
1. Security List has SSH rule (port 22)
2. Public IP is correct
3. SSH key permissions: `chmod 400 openclaw_key.pem`
4. Using `ubuntu` user (not `root`)

**Use Oracle Console** (backup method):
1. Go to: Instance Details
2. Click: "Console Connection"
3. Create connection
4. Access via browser

---

### Node.js npm errors on ARM

**Some packages need compilation**.

**Install build tools**:
```bash
sudo apt install -y python3 make g++
```

**Then retry**:
```bash
sudo npm install -g openclaw@latest
```

---

### High memory usage

**24GB RAM is generous**, but if issues:

**Check memory**:
```bash
free -h
```

**Check processes**:
```bash
htop
```

**Restart OpenClaw**:
```bash
openclaw restart
```

---

## Cost Monitoring

### Set Up Billing Alerts

**Even though Free Tier is free**, set alerts as safety:

1. Go to: ☰ → Billing & Cost Management → Cost Management
2. Click: "Budgets"
3. Click: "Create Budget"
4. **Name**: "Free Tier Alert"
5. **Amount**: $5
6. **Alert at**: 80% ($4)
7. **Email**: Your email
8. Save

**You'll be notified** if you somehow exceed free tier.

---

## Performance on ARM

### Benchmarks

**ARM (Oracle Free)**:
- 4 CPU cores (ARM Ampere)
- 24GB RAM
- Fast NVMe storage

**vs x86 DigitalOcean**:
- 1 CPU core (x86 Intel)
- 1GB RAM
- SSD storage

**Oracle ARM is 3-4x more powerful!**

**For OpenClaw**:
- Handles 100+ requests/day easily
- Fast response times
- Can run multiple channels
- Plenty of headroom

---

## Backup Strategy

### Create Boot Volume Backup

**Free backup** (within 200GB total):

1. Go to: Instance Details
2. Click: Boot Volume → View Details
3. Click: "Create Backup"
4. **Name**: `openclaw-backup-YYYYMMDD`
5. **Type**: Full
6. Create

**Restore if needed**:
1. Go to: Boot Volume Backups
2. Select backup
3. Click: "Create Boot Volume"
4. Attach to instance

---

## Quick Reference

### SSH Commands

```bash
# Connect with Oracle key
ssh -i ~/Downloads/openclaw_key.pem ubuntu@129.159.XXX.XXX

# Connect with tunnel
ssh -i ~/Downloads/openclaw_key.pem -L 18789:localhost:18789 ubuntu@129.159.XXX.XXX

# Connect with your key
ssh ubuntu@129.159.XXX.XXX
```

### Instance Management

```bash
# Start instance (if stopped)
# Go to: Instances → Select instance → Start

# Stop instance
# Go to: Instances → Select instance → Stop

# Restart instance
# Go to: Instances → Select instance → Reboot
```

### OpenClaw Commands

```bash
openclaw start
openclaw stop
openclaw restart
openclaw status
openclaw logs
```

---

## Next Steps

Oracle Cloud setup complete! Now:

1. **Connect Messaging**:
   - [WhatsApp Guide](07-whatsapp-setup.md)
   - [Telegram Guide](08-telegram-setup.md)

2. **Start Using**:
   - [Use Cases](../USE-CASES.md)
   - Test automation

3. **Monitor**:
   - Check billing dashboard monthly
   - Verify $0.00 costs

---

**Free VPS deployed! Total monthly cost: $5-20 (just LLM) → Connect messaging next**
