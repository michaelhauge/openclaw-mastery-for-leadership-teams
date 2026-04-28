# Local Mac Installation Guide

**Install OpenClaw on your Mac for maximum privacy**

**Time required**: 10-15 minutes

---

## Overview

This guide shows you how to install OpenClaw directly on your Mac. This is the recommended option for:
- Beginners (easiest setup)
- Privacy-focused users (data never leaves your machine)
- Home/office workers (Mac can stay on)

**Total cost**: $3-5/month electricity + $5-20/month LLM = **$8-25/month**

---

## Prerequisites

Before starting, ensure you have:
- [x] Node.js 22+ installed ([Prerequisites Guide](01-prerequisites.md))
- [x] LLM provider account created ([LLM Providers Guide](02-llm-providers.md))
- [x] API key saved
- [x] macOS (any recent version)

---

## Step 1: Install OpenClaw

### Method 1: One-Line Installer (Recommended)

Open Terminal (`Applications → Utilities → Terminal`) and run:

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

**What this does**:
1. Downloads OpenClaw
2. Installs it globally on your Mac
3. Sets up necessary directories
4. Adds OpenClaw to your PATH

**Expected output**:
```
✓ Downloading OpenClaw...
✓ Installing dependencies...
✓ Setting up configuration...
✓ OpenClaw installed successfully!
```

**Time**: 2-3 minutes

---

### Method 2: NPM Install (Alternative)

If the one-line installer fails:

```bash
npm install -g openclaw@latest
```

**Verify installation**:
```bash
openclaw --version
```

Should show: `openclaw x.x.x`

---

## Step 2: Run Setup Wizard

OpenClaw has a built-in wizard to configure everything:

```bash
openclaw onboard --install-daemon
```

**What happens**:
1. Gateway setup (where OpenClaw runs)
2. LLM provider configuration
3. Messaging channel connections
4. Daemon installation (runs automatically on startup)

### Wizard Walkthrough

#### Question 1: Gateway Configuration

```
? Where should the gateway bind? (127.0.0.1:18789)
```

**Answer**: Press `Enter` (accept default)

This means OpenClaw will run locally on your Mac only.

---

#### Question 2: LLM Provider

```
? Which LLM provider do you want to use?
  > Anthropic (Claude)
    OpenAI (ChatGPT)
    Custom
```

**Answer**: Select your provider (use arrow keys, press Enter)

If you chose **Kimi K2** in the LLM guide:
- Select "Custom"
- You'll configure this in the config file (next step)

---

#### Question 3: Authentication

**If you selected Anthropic or OpenAI**:

```
? How do you want to authenticate?
  > OAuth (Recommended)
    API Key
```

**Answer**: Select "OAuth" (easier, more secure)

This will open your browser to authorize OpenClaw.

**If you're using Kimi/DeepSeek**:
- Select "API Key"
- You'll add this in the config file

---

#### Question 4: Messaging Channels

```
? Which messaging channels do you want to enable?
  [ ] WhatsApp
  [ ] Telegram
  [ ] Slack
  [ ] Discord
```

**Answer**:
- Use `Space` to select WhatsApp and/or Telegram
- Press `Enter` when done

**Note**: We'll configure these in detail in separate guides:
- [WhatsApp Setup](07-whatsapp-setup.md)
- [Telegram Setup](08-telegram-setup.md)

---

#### Question 5: Install Daemon

```
? Install as a system daemon (starts automatically)?
  > Yes
    No
```

**Answer**: Select "Yes"

This makes OpenClaw start automatically when your Mac boots.

---

### Wizard Complete!

You should see:
```
✓ Configuration saved
✓ Daemon installed
✓ OpenClaw is ready to use!

Next steps:
1. Configure your LLM provider (if not done)
2. Connect messaging channels
3. Start the gateway: openclaw start
```

---

## Step 3: Configure LLM Provider

### If Using Kimi K2 (or other custom provider)

OpenClaw created a config file at `~/.openclaw/openclaw.json`

Open it:
```bash
nano ~/.openclaw/openclaw.json
```

**Replace contents with**:

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
    "host": "127.0.0.1",
    "port": 18789
  },
  "channels": {
    "whatsapp": {
      "enabled": true
    },
    "telegram": {
      "enabled": true
    }
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

### Set Environment Variable

Add your API key to your shell profile:

```bash
echo 'export KIMI_API_KEY="k-your-actual-key-here"' >> ~/.zshrc
source ~/.zshrc
```

**Replace** `k-your-actual-key-here` with your actual Kimi API key.

**Verify**:
```bash
echo $KIMI_API_KEY
```

Should display your API key.

---

### If Using DeepSeek

Config file:
```json
{
  "agent": {
    "model": "deepseek/deepseek-chat"
  },
  "llm": {
    "deepseek": {
      "apiKey": "${DEEPSEEK_API_KEY}",
      "baseURL": "https://api.deepseek.com/v1"
    }
  },
  "gateway": {
    "host": "127.0.0.1",
    "port": 18789
  }
}
```

Environment variable:
```bash
echo 'export DEEPSEEK_API_KEY="sk-your-actual-key"' >> ~/.zshrc
source ~/.zshrc
```

---

### If Using Claude (OAuth)

The wizard already configured this! No changes needed.

---

## Step 4: Start OpenClaw

```bash
openclaw start
```

**Expected output**:
```
✓ Starting OpenClaw gateway...
✓ Loading configuration...
✓ Connecting to LLM provider...
✓ Initializing messaging channels...
✓ Gateway running at http://127.0.0.1:18789

OpenClaw is ready! 🦞
```

**Check status**:
```bash
openclaw status
```

Should show: `Gateway: Running`

---

## Step 5: Open Dashboard

OpenClaw has a web dashboard for monitoring:

```bash
openclaw dashboard
```

This opens: http://127.0.0.1:18789 in your browser

**Dashboard shows**:
- Gateway status
- Connected channels
- Recent activity
- Configuration

**Keep this open** for the next steps.

---

## Step 6: Test OpenClaw

### Test via Dashboard

In the dashboard:
1. Find: "Test Chat" section
2. Type: "Hello, are you working?"
3. Press `Enter`

**Expected response**:
```
Hello! Yes, I'm working and ready to help.
What can I do for you today?
```

**If it works**: Success! OpenClaw is operational.

**If error**: See [Troubleshooting](#troubleshooting) below.

---

## Step 7: Connect Messaging Apps

Now that OpenClaw is running, connect your messaging apps:

**WhatsApp**:
→ [WhatsApp Setup Guide](07-whatsapp-setup.md)

**Telegram**:
→ [Telegram Setup Guide](08-telegram-setup.md)

**Choose one or both** - you can always add more later.

---

## Managing OpenClaw

### Common Commands

```bash
# Start OpenClaw
openclaw start

# Stop OpenClaw
openclaw stop

# Restart OpenClaw
openclaw restart

# Check status
openclaw status

# Open dashboard
openclaw dashboard

# View logs
openclaw logs

# Run security check
openclaw doctor
```

---

### Auto-Start on Boot

If you selected "Yes" during wizard, OpenClaw starts automatically.

**To disable auto-start**:
```bash
openclaw daemon uninstall
```

**To re-enable**:
```bash
openclaw daemon install
```

---

### Updating OpenClaw

When new versions are released:

```bash
npm update -g openclaw
openclaw restart
```

---

## Security Configuration

### Enable DM Pairing

DM Pairing prevents strangers from using your bot.

**Already enabled** if you used the wizard! Verify:

```bash
cat ~/.openclaw/openclaw.json | grep dmPairing
```

Should show:
```json
"dmPairing": {
  "enabled": true
}
```

**How it works**:
1. Unknown sender messages your OpenClaw
2. OpenClaw asks for pairing code
3. You must approve them via dashboard

---

### Set Spending Limits

**At LLM provider level** (recommended):
- Kimi: Dashboard → Settings → Spending Limit → $20/month
- DeepSeek: API Settings → Rate Limits

**In OpenClaw config** (optional):
```json
{
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}",
      "maxTokensPerRequest": 100000,
      "maxRequestsPerHour": 100
    }
  }
}
```

---

### Run Security Audit

```bash
openclaw doctor
```

**Checks for**:
- Exposed API keys in config files
- Insecure file permissions
- Missing security features
- Outdated dependencies

**Fix any issues** it identifies.

---

## Troubleshooting

### OpenClaw won't start

**Check Node.js version**:
```bash
node --version
```

Must be v22+. If not:
```bash
brew upgrade node
# or download from nodejs.org
```

---

### "Cannot connect to LLM provider"

**Check API key**:
```bash
echo $KIMI_API_KEY
```

**Empty?** Set it:
```bash
export KIMI_API_KEY="k-your-key"
```

**Test API key manually**:
```bash
curl -X POST "https://api.moonshot.ai/v1/chat/completions" \
  -H "Authorization: Bearer $KIMI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"kimi-k2","messages":[{"role":"user","content":"Test"}]}'
```

Should return JSON response (not error).

---

### "Port 18789 already in use"

Another process is using that port.

**Find process**:
```bash
lsof -i :18789
```

**Kill it**:
```bash
kill -9 <PID>
```

**Or change OpenClaw port** in config:
```json
{
  "gateway": {
    "port": 18790
  }
}
```

---

### Dashboard won't open

**Check gateway is running**:
```bash
openclaw status
```

**If stopped**, start it:
```bash
openclaw start
```

**Manually open**:
```bash
open http://127.0.0.1:18789
```

---

### LLM responses are slow

**Check**:
- Your internet connection
- LLM provider status page
- Try different model (smaller = faster)

**For Kimi**: Consider using cache for repeated queries (75% faster)

---

## Next Steps

OpenClaw is installed and running on your Mac! Now:

1. **Connect Messaging**:
   - [WhatsApp Setup](07-whatsapp-setup.md)
   - [Telegram Setup](08-telegram-setup.md)

2. **Start Using**:
   - Try example queries
   - Review [Use Cases](../USE-CASES.md)
   - Experiment with automation

3. **Monitor Costs**:
   - Check LLM provider dashboard weekly
   - Adjust usage as needed

---

## Maintenance

### Weekly Tasks
- [ ] Check `openclaw status`
- [ ] Review LLM usage/costs
- [ ] Run `openclaw doctor`

### Monthly Tasks
- [ ] Check for OpenClaw updates
- [ ] Review and adjust spending limits
- [ ] Clean old logs: `rm ~/.openclaw/logs/*.old`

### Every 3 Months
- [ ] Rotate API keys
- [ ] Review security settings
- [ ] Update Node.js if needed

---

## Uninstalling

If you ever want to remove OpenClaw:

```bash
# Stop daemon
openclaw daemon uninstall

# Uninstall package
npm uninstall -g openclaw

# Remove config (optional)
rm -rf ~/.openclaw
```

---

**Installation complete! Ready to connect messaging → [WhatsApp Guide](07-whatsapp-setup.md)**
