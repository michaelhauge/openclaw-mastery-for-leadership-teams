# Telegram Setup Guide

**Connect OpenClaw to Telegram**

**Time required**: 5-10 minutes

---

## Overview

Telegram is a popular messaging app with excellent bot support. Benefits of using Telegram with OpenClaw:
- **More stable** than WhatsApp (no QR code rescanning)
- **Better API** for bot interactions
- **Cloud-based** (works on any device)
- **No phone dependency** after initial setup

**Good as backup** or primary channel if you prefer Telegram.

---

## Prerequisites

Before starting:
- [x] OpenClaw installed and running ([Mac Guide](03-local-mac.md))
- [x] Telegram installed (phone or desktop)
- [x] Active Telegram account
- [x] OpenClaw gateway running (`openclaw status`)

---

## Step 1: Create Telegram Bot

### Talk to BotFather

Telegram uses "BotFather" to create bots.

1. **Open Telegram** (phone or desktop)
2. **Search** for: `@BotFather`
3. **Start chat** with BotFather
4. **Send**: `/newbot`

**BotFather will ask**:
```
Alright, a new bot. How are we going to call it?
Please choose a name for your bot.
```

5. **Type bot name**: `My OpenClaw` (or any name you like)

**BotFather responds**:
```
Good. Now let's choose a username for your bot.
It must end in 'bot'. Like this, for example: TetrisBot or tetris_bot.
```

6. **Type username**: `myopenclaw_bot` (must end in `_bot`)

**Important**: Username must be unique. If taken, try:
- `myopenclaw2024_bot`
- `myopenclaw_sea_bot`
- `yourname_openclaw_bot`

---

### Get Bot Token

**BotFather responds with**:
```
Done! Congratulations on your new bot.
You will find it at t.me/myopenclaw_bot
You can now add a description...

Use this token to access the HTTP API:
1234567890:ABCdefGHIjklMNOpqrsTUVwxyz1234567

For a description of the Bot API, see this page:
https://core.telegram.org/bots/api
```

**Copy the token** (long string after "Use this token"):
```
1234567890:ABCdefGHIjklMNOpqrsTUVwxyz1234567
```

**Save it securely** - you'll need it in the next step.

---

## Step 2: Configure OpenClaw

### Add Bot Token to Environment

```bash
echo 'export TELEGRAM_BOT_TOKEN="1234567890:ABCdefGHIjklMNOpqrsTUVwxyz1234567"' >> ~/.zshrc
source ~/.zshrc
```

**Replace** with your actual bot token from BotFather.

**Verify**:
```bash
echo $TELEGRAM_BOT_TOKEN
```

Should display your token.

---

### Update OpenClaw Config

Edit config file:
```bash
nano ~/.openclaw/openclaw.json
```

**Add Telegram section**:
```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "botToken": "${TELEGRAM_BOT_TOKEN}",
      "allowedUsers": []
    }
  }
}
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

---

## Step 3: Start Telegram Channel

### Install Telegram Dependencies

```bash
openclaw channel install telegram
```

**Expected output**:
```
✓ Installing Telegram dependencies...
✓ Setting up Telegram bot API...
✓ Telegram channel ready!
```

---

### Start the Channel

```bash
openclaw channel start telegram
```

**Expected output**:
```
✓ Starting Telegram channel...
✓ Connecting to Telegram API...
✓ Bot online: @myopenclaw_bot
✓ Ready to receive messages!
```

---

## Step 4: Connect Your Telegram

### Find Your Bot

1. **Open Telegram**
2. **Search** for your bot username: `@myopenclaw_bot`
3. **Start chat** with the bot
4. **Send**: `/start`

**Bot responds**:
```
Welcome! I'm your OpenClaw assistant.

To get started, I need to verify your identity.
Please send me the pairing code.

You can find it in the OpenClaw dashboard:
http://127.0.0.1:18789
→ Channels → Telegram → Pairing Codes
```

---

### Get Pairing Code

1. **Open dashboard**: http://127.0.0.1:18789
2. **Navigate**: Channels → Telegram
3. **Find**: Your Telegram username in "Pending Approvals"
4. **Copy** the pairing code (6-digit number)

**Or use command**:
```bash
openclaw channel pairing-code telegram
```

Shows: `Pairing code: 123456`

---

### Send Pairing Code

**In Telegram chat with your bot**:
```
123456
```

**Bot responds**:
```
✓ Pairing successful!

You are now connected to OpenClaw.
What can I help you with today?
```

**You're connected!**

---

## Step 5: Test the Connection

### Send Test Message

**In Telegram, send**:
```
Hello OpenClaw, are you working?
```

**Expected response** (2-5 seconds):
```
Hello! Yes, I'm working and ready to help.
I'm connected to your OpenClaw instance.

You can ask me to:
- Summarize emails
- Process documents
- Research topics
- Translate text
- And much more!

What would you like me to do?
```

**If you get this response**: Success! ✓

---

## Using OpenClaw via Telegram

### Basic Commands

**Email Management**:
```
/email summarize today
```

Or natural language:
```
Summarize my emails from the last 4 hours
```

---

**Document Processing**:
1. Send document file to bot
2. Bot replies: "I received your document. What would you like me to do with it?"
3. You reply: "Summarize key points"

---

**Translation**:
```
Translate to Malay:
"We are pleased to announce our partnership"
```

---

**Research**:
```
Research top 3 F&B trends in Singapore 2026
```

---

**Daily Briefing**:
```
/briefing
```

Or:
```
Give me my morning briefing
```

---

### Telegram Commands

Telegram supports slash commands for quick access:

| Command | Description |
|---------|-------------|
| `/start` | Start conversation |
| `/help` | Show help message |
| `/status` | Check OpenClaw status |
| `/briefing` | Get daily briefing |
| `/email` | Email-related commands |
| `/translate` | Translation commands |

**Configure custom commands** in config file.

---

## Advanced Features

### Allow Multiple Users

Want family members or team to use your OpenClaw?

**Get their Telegram User ID**:

Ask them to message your bot, then check dashboard:
```
Dashboard → Channels → Telegram → Pending Approvals
```

**Add to allowed users** in config:
```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "botToken": "${TELEGRAM_BOT_TOKEN}",
      "allowedUsers": [
        123456789,  // Your user ID
        987654321   // Another user's ID
      ]
    }
  }
}
```

**Restart**:
```bash
openclaw restart
```

**Now both users can use the bot!**

---

### Schedule Automated Messages

**Daily briefings at 7 AM**:

```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "automation": {
        "dailyBriefing": {
          "enabled": true,
          "time": "07:00",
          "timezone": "Asia/Singapore",
          "message": "/briefing"
        }
      }
    }
  }
}
```

---

### Custom Commands

**Add shortcuts** for common tasks:

```json
{
  "channels": {
    "telegram": {
      "commands": {
        "/morning": "Give me daily briefing with calendar, emails, and weather",
        "/weekly": "Summarize this week's accomplishments and next week's priorities",
        "/translate_bm": "Translate the following to Bahasa Malaysia:"
      }
    }
  }
}
```

**Now you can type**:
```
/morning
```

Instead of:
```
Give me daily briefing with calendar, emails, and weather
```

---

### File Processing

**Supported file types**:
- Documents: PDF, DOCX, TXT, MD
- Spreadsheets: XLSX, CSV
- Images: JPG, PNG (with OCR)
- Archives: ZIP (extracts and processes)

**How to use**:
1. Send file to bot
2. Add caption: "Summarize this report"
3. Or send file first, then send message: "Extract key data points"

---

## Telegram vs WhatsApp

| Feature | Telegram | WhatsApp |
|---------|----------|----------|
| **Setup** | Easier (bot token) | Requires QR scan |
| **Stability** | More stable | Can disconnect |
| **Multi-device** | Yes, cloud-based | Limited |
| **File size limit** | 2GB | 100MB |
| **Commands** | Rich /commands | Basic |
| **Popularity in SEA** | Growing | Dominant |

**Recommendation**: Use both!
- **WhatsApp** for daily business communication
- **Telegram** as stable backup

---

## Troubleshooting

### "Bot token invalid"

**Check token format**:
```bash
echo $TELEGRAM_BOT_TOKEN
```

Should be: `1234567890:ABCdefGHI...`

**If wrong**, get new token:
1. Message @BotFather
2. Send: `/mybots`
3. Select your bot
4. Select: "API Token"
5. Copy new token
6. Update environment variable

---

### "Cannot find bot"

**Check bot username**:
- Must end in `bot`
- Must be unique
- Case-insensitive

**Search again**:
- Try exact username: `@myopenclaw_bot`
- Click on bot in search results
- Send `/start`

---

### Pairing code not working

**Generate new code**:
```bash
openclaw channel generate-pairing telegram
```

**Or via dashboard**:
1. Go to: Channels → Telegram
2. Find your pending approval
3. Click: "Generate New Code"
4. Send new code to bot

---

### Messages delayed or not responding

**Check OpenClaw status**:
```bash
openclaw status
```

**If stopped**:
```bash
openclaw start
```

**Check Telegram channel status**:
```bash
openclaw channel status telegram
```

**If disconnected**:
```bash
openclaw channel restart telegram
```

---

### "This bot can't be added to groups"

**Enable group mode** with BotFather:
1. Message @BotFather
2. Send: `/mybots`
3. Select your bot
4. Select: "Bot Settings"
5. Select: "Allow Groups?"
6. Select: "Turn groups on"

**Update OpenClaw config**:
```json
{
  "channels": {
    "telegram": {
      "allowGroups": true
    }
  }
}
```

---

## Security Best Practices

### 1. Limit Allowed Users

**Don't leave `allowedUsers` empty** - anyone could message your bot!

**Always specify**:
```json
{
  "allowedUsers": [123456789]
}
```

---

### 2. Disable Group Access

Unless you need it:
```json
{
  "allowGroups": false
}
```

---

### 3. Set Rate Limits

```json
{
  "channels": {
    "telegram": {
      "limits": {
        "maxMessagesPerHour": 100,
        "maxTokensPerMessage": 50000
      }
    }
  }
}
```

---

### 4. Monitor Usage

**Weekly check**:
```bash
openclaw logs --channel telegram --last 7d
```

**Review**:
- Who's sending messages
- Message frequency
- LLM token usage

---

## Example Workflows

### Morning Routine

**7:00 AM** (automated Telegram message):
```
🌅 Good Morning!

📅 Today's Schedule:
- 9:00 AM: Team standup
- 2:00 PM: Client presentation
- 4:00 PM: Weekly review

📧 Overnight Emails: 5
- 2 urgent, 3 normal

☀️ Weather: 31°C, Partly cloudy

Would you like detailed email summaries?
```

---

### Quick Translation

**You**:
```
/translate_bm
Thank you for your proposal. We will review and respond by Friday.
```

**OpenClaw**:
```
Terima kasih atas cadangan anda. Kami akan mengkaji dan membalas pada hari Jumaat.
```

---

### Document Summary

**You**:
1. Send 50-page PDF contract
2. Caption: "Urgent review needed"

**OpenClaw** (30 seconds later):
```
📄 Document Analysis Complete

Type: Legal Contract (Software License)
Pages: 50
Key Sections:
1. License terms - Annual subscription model
2. Payment - $50K/year, Net 30
3. Support - 24/7 for critical issues
4. Liability - Capped at contract value

🚩 Red Flags:
- Auto-renewal (60 days notice)
- Source code escrow required
- 18-month non-compete

Recommendation: Review sections 7.3 and 12.1 with legal counsel.

Would you like me to extract specific clauses?
```

---

## Next Steps

Telegram connected! You can now:

1. **Start Automating**:
   → [Business Use Cases](../USE-CASES.md)

2. **Add WhatsApp** (if not done):
   → [WhatsApp Setup Guide](07-whatsapp-setup.md)

3. **Optimize Workflows**:
   - Set up custom commands
   - Schedule automated briefings
   - Configure file processing

4. **Monitor Costs**:
   - Check LLM usage weekly
   - Review Telegram logs

---

## Quick Reference

### Commands

```bash
# Start Telegram
openclaw channel start telegram

# Stop Telegram
openclaw channel stop telegram

# Restart Telegram
openclaw channel restart telegram

# Check status
openclaw channel status telegram

# Generate pairing code
openclaw channel pairing-code telegram

# View logs
openclaw logs --channel telegram
```

### Config Location

```
~/.openclaw/openclaw.json
```

### Dashboard

```
http://127.0.0.1:18789
→ Channels → Telegram
```

### BotFather Commands

- `/newbot` - Create new bot
- `/mybots` - Manage your bots
- `/setcommands` - Set bot commands
- `/setdescription` - Set bot description
- `/deletebot` - Delete bot

---

**Telegram connected! Start using → [Use Cases](../USE-CASES.md)**
