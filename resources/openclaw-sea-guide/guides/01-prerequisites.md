# Prerequisites: Getting Ready to Install OpenClaw

**Time required: 15 minutes**

---

## Overview

Before installing OpenClaw, you need to prepare:
1. Install Node.js 22 or newer
2. Create accounts with LLM providers
3. (Optional) Set up a VPS account

---

## Step 1: Install Node.js

Node.js is required to run OpenClaw.

### Check if you already have Node.js

Open Terminal and run:
```bash
node --version
```

**If you see**: `v22.x.x` or higher → You're good! Skip to Step 2.

**If you see**: Error or version below 22 → Continue below.

### Install Node.js on Mac

**Method 1: Direct Download (Easiest)**

1. Visit: https://nodejs.org
2. Download: "22.x.x LTS" version
3. Run the installer
4. Accept default settings
5. Verify installation:
   ```bash
   node --version
   ```
   Should show: `v22.x.x` or higher

**Method 2: Using Homebrew (If you have it)**

```bash
brew install node@22
```

Verify:
```bash
node --version
```

---

## Step 2: Choose Your LLM Provider

You'll need an account with at least one LLM provider. We recommend starting with one and adding others later.

### Option 1: Kimi K2 (Recommended)

**Why**: Best balance of cost, quality, and context size

1. Visit: https://platform.moonshot.ai
2. Click "Sign Up"
3. Complete registration
4. Go to: Dashboard → API Keys
5. Click "Create API Key"
6. **Important**: Copy and save your API key immediately (you won't see it again)

**Initial cost**: $1 minimum deposit
**Monthly cost**: ~$10-20

[Full Kimi K2 setup guide →](02-llm-providers.md#kimi-k2)

---

### Option 2: DeepSeek (Cheapest)

**Why**: Lowest cost option

1. Visit: https://platform.deepseek.com
2. Click "Sign Up"
3. Complete registration
4. Go to: API Keys section
5. Create new API key
6. Save your API key

**Initial cost**: $0 (5M free tokens)
**Monthly cost**: ~$3-8 after free tier

[Full DeepSeek setup guide →](02-llm-providers.md#deepseek)

---

### Option 3: Claude (Premium)

**Why**: Best quality, already have subscription

1. Visit: https://console.anthropic.com
2. Sign in with your Claude account
3. Go to: API Keys
4. Create new key
5. Save your API key

**Or** use OAuth (recommended):
- No API key needed
- Uses your Claude Pro/Max subscription
- More secure

**Monthly cost**: $20 (if you have Claude Pro)

[Full Claude setup guide →](02-llm-providers.md#claude)

---

## Step 3: (Optional) Set Up VPS Account

Only needed if you want to run OpenClaw on a server instead of your Mac.

### For Beginners: DigitalOcean

1. Visit: https://www.digitalocean.com
2. Sign up for account
3. Verify email
4. Add payment method
5. **Benefit**: $200 free credit for 60 days

**Monthly cost after trial**: $6/month

[Full DigitalOcean setup guide →](05-digitalocean.md)

---

### For Cost-Conscious: Oracle Cloud Free

1. Visit: https://www.oracle.com/cloud/free
2. Sign up for account
3. Verify identity (credit card required but not charged)
4. Complete registration

**Monthly cost**: $0 (Always Free tier)

[Full Oracle setup guide →](04-oracle-cloud-free.md)

---

### For Best Value: Contabo

1. Visit: https://contabo.com
2. Select "VPS" → "VPS S"
3. Choose Singapore location
4. Complete order

**Monthly cost**: $5.50/month

[Full Contabo setup guide →](06-contabo-vps.md)

---

## Step 4: Verify Prerequisites

Before proceeding, verify you have:

- [ ] Node.js 22+ installed (`node --version`)
- [ ] At least one LLM provider account created
- [ ] API key from your LLM provider saved securely
- [ ] (Optional) VPS account created if using cloud hosting

---

## Quick Checklist

### For Local Mac Installation:
- [x] Node.js 22+
- [x] LLM provider account
- [x] API key saved
- [ ] Ready for next step!

### For VPS Installation:
- [x] Node.js 22+ (on VPS or local for testing)
- [x] LLM provider account
- [x] API key saved
- [x] VPS account created
- [ ] Ready for next step!

---

## Storing Your API Keys Securely

**DO NOT**:
- ❌ Store in plain text files on your Desktop
- ❌ Email them to yourself
- ❌ Paste in public GitHub repos
- ❌ Share in Slack/Teams

**DO**:
- ✅ Use password manager (1Password, Bitwarden)
- ✅ Store in encrypted notes (Apple Notes with password)
- ✅ Write on paper and store securely
- ✅ Use environment variables (we'll set up later)

---

## Common Issues

### "Command not found: node"

**Problem**: Node.js not installed or not in PATH

**Solution**:
1. Reinstall Node.js from nodejs.org
2. Restart Terminal
3. Try again

---

### "node version is too old"

**Problem**: You have Node.js, but version is below 22

**Solution**:
```bash
# If using Homebrew:
brew upgrade node

# Otherwise, download latest from nodejs.org
```

---

### "Cannot create account - country not supported"

**Problem**: Some LLM providers have geographic restrictions

**Solutions**:
- Try a different LLM provider
- For DeepSeek/Kimi: Should work in Singapore/Malaysia
- For Claude: Definitely works in Singapore/Malaysia

---

## Next Steps

Choose your installation path:

**Easiest (Local Mac)**:
→ [Install OpenClaw on Mac](03-local-mac.md)

**Cloud Hosting**:
→ [Set up LLM Provider first](02-llm-providers.md)
→ Then choose: [DigitalOcean](05-digitalocean.md) | [Oracle Free](04-oracle-cloud-free.md) | [Contabo](06-contabo-vps.md)

---

## Estimated Time to Complete

- Prerequisites (this guide): ✅ 15 minutes
- LLM Provider setup: 10 minutes
- OpenClaw installation: 10-20 minutes
- Messaging integration: 5-10 minutes

**Total**: 40-55 minutes from zero to working OpenClaw

---

**Ready for LLM setup? → [LLM Providers Guide](02-llm-providers.md)**
