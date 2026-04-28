# WhatsApp Setup Guide

**Connect OpenClaw to WhatsApp**

**Time required**: 5-10 minutes

---

## Overview

WhatsApp is the most popular messaging app in Southeast Asia. By connecting OpenClaw to WhatsApp, you can:
- Send requests via WhatsApp messages
- Get responses directly in WhatsApp
- Use OpenClaw from your phone anywhere
- Access automation on the go

**No WhatsApp Business account needed** - use your regular WhatsApp!

---

## Prerequisites

Before starting:
- [x] OpenClaw installed and running ([Mac Guide](03-local-mac.md) or VPS Guide)
- [x] WhatsApp installed on your phone
- [x] Active WhatsApp account
- [x] OpenClaw gateway running (`openclaw status` shows "Running")

---

## Step 1: Install WhatsApp Channel

OpenClaw uses WhatsApp Web to connect.

### Install Dependencies

```bash
openclaw channel install whatsapp
```

**What this does**:
- Installs WhatsApp Web client
- Sets up necessary libraries
- Configures channel in OpenClaw

**Expected output**:
```
✓ Downloading WhatsApp dependencies...
✓ Installing puppeteer...
✓ Setting up WhatsApp channel...
✓ WhatsApp channel installed!
```

**Time**: 2-3 minutes

---

## Step 2: Configure WhatsApp Channel

### Update Configuration

Edit OpenClaw config:
```bash
nano ~/.openclaw/openclaw.json
```

**Add WhatsApp section**:
```json
{
  "channels": {
    "whatsapp": {
      "enabled": true,
      "autoReconnect": true,
      "qrTimeout": 60000
    }
  }
}
```

**Save**: `Ctrl+O`, `Enter`, `Ctrl+X`

---

## Step 3: Start WhatsApp Connection

### Generate QR Code

```bash
openclaw channel start whatsapp
```

**What happens**:
1. OpenClaw launches WhatsApp Web client
2. Generates a QR code
3. Displays it in terminal

**You'll see**:
```
WhatsApp Channel Starting...
Scan this QR code with your WhatsApp:

█████████████████████████████
█████████████████████████████
████ ▄▄▄▄▄ █▀▄ ▄█ ▄▄▄▄▄ ████
████ █   █ █▀▀▄█  █   █ ████
████ █▄▄▄█ █ █▀█▀ █▄▄▄█ ████
█████████████████████████████

Waiting for scan... (60 seconds)
```

---

## Step 4: Scan QR Code

### On Your Phone

1. **Open WhatsApp** on your phone
2. **Tap** the three dots (⋮) menu (top right)
3. **Select** "Linked Devices"
4. **Tap** "Link a Device"
5. **Scan** the QR code displayed in terminal

**Screenshot reference**:
- Menu → Linked Devices → Link a Device → Scan QR

### Wait for Connection

After scanning:
```
✓ QR Code scanned!
✓ Connecting to WhatsApp...
✓ Syncing messages...
✓ WhatsApp channel connected!
```

**Your WhatsApp is now connected to OpenClaw!**

---

## Step 5: Test the Connection

### Send Test Message

1. **Open WhatsApp** on your phone
2. **Send yourself a message** or use the OpenClaw dashboard
3. **Type**: "Hello OpenClaw"
4. **Send**

**Expected response** (within 2-5 seconds):
```
Hello! I'm OpenClaw, your AI assistant.
I'm ready to help. What can I do for you?
```

**If you get this response**: Success! ✓

---

## Step 6: Enable DM Pairing (Security)

### What is DM Pairing?

DM Pairing prevents random people from using your OpenClaw if they get your number.

**How it works**:
1. Unknown number messages your OpenClaw
2. OpenClaw asks for pairing code
3. You must approve them via dashboard

### Enable DM Pairing

Already enabled if you followed the installation guide! Verify:

```bash
openclaw dashboard
```

Go to: Settings → Security → DM Pairing

Should show: **Enabled ✓**

### Approve Your Own Number

**Important**: Approve your own WhatsApp number first!

1. Send: "Hello" to yourself (to OpenClaw)
2. Open dashboard: http://127.0.0.1:18789
3. Go to: Channels → WhatsApp → Pending Approvals
4. Click: "Approve" next to your number

**Now you can message freely!**

---

## Using OpenClaw via WhatsApp

### Basic Commands

**Email Management**:
```
Summarize my emails from today
```

**Document Processing**:
```
Read the attached PDF and summarize key points
```
(Attach PDF to WhatsApp message)

**Translation**:
```
Translate this to Bahasa Malaysia:
"We are pleased to announce our new product launch"
```

**Research**:
```
Research top 5 competitors in Singapore fintech
```

**Daily Briefing**:
```
Give me my daily briefing:
- Today's calendar
- Urgent emails
- Weather in Singapore
```

### Sending Files

**To send documents**:
1. Tap attachment icon in WhatsApp
2. Select: Document
3. Choose file
4. Add message: "Summarize this contract"
5. Send

**Supported file types**:
- PDF (.pdf)
- Word (.docx, .doc)
- Text (.txt, .md)
- Images (.jpg, .png) - OCR supported
- Spreadsheets (.xlsx, .csv)

---

## Advanced Features

### Schedule Daily Messages

You can set up automated WhatsApp messages.

**Add to config**:
```json
{
  "channels": {
    "whatsapp": {
      "enabled": true,
      "automation": {
        "dailyBriefing": {
          "enabled": true,
          "time": "07:00",
          "timezone": "Asia/Singapore",
          "message": "Good morning! Here's your daily briefing"
        }
      }
    }
  }
}
```

**Restart OpenClaw**:
```bash
openclaw restart
```

Now you'll receive daily briefings at 7 AM SGT!

---

### Group Chat Support

**Can OpenClaw join WhatsApp groups?** Yes, but with caution.

**How to add**:
1. Create WhatsApp group
2. Add OpenClaw as contact (save your own number that's linked)
3. OpenClaw will respond when mentioned

**Mention syntax**:
```
@OpenClaw summarize this discussion
```

**Privacy note**: OpenClaw sees all group messages. Only use in trusted groups.

---

### Voice Messages

OpenClaw can process WhatsApp voice notes!

**How to use**:
1. Send voice message in WhatsApp
2. OpenClaw transcribes it
3. Processes as text request
4. Responds

**Example**:
- You (voice): "Please summarize my emails from today"
- OpenClaw (text): [Email summary]

---

## Troubleshooting

### QR Code Not Appearing

**Check OpenClaw is running**:
```bash
openclaw status
```

**If stopped**:
```bash
openclaw start
openclaw channel start whatsapp
```

---

### "QR Code Expired"

**Timeout**: QR codes expire after 60 seconds.

**Solution**:
```bash
openclaw channel restart whatsapp
```

New QR code will appear - scan quickly!

---

### WhatsApp Disconnects Frequently

**Causes**:
- Mac going to sleep
- Internet connection issues
- WhatsApp Web session timeout

**Solutions**:

**1. Keep Mac awake**:
```bash
# Prevent sleep
caffeinate -i
```

**2. Enable auto-reconnect** (already in config):
```json
{
  "channels": {
    "whatsapp": {
      "autoReconnect": true
    }
  }
}
```

**3. Check connection**:
```bash
openclaw channel status whatsapp
```

---

### Messages Delayed

**Check**:
- OpenClaw gateway status: `openclaw status`
- Internet connection speed
- LLM provider status

**Optimize**:
- Use faster LLM (DeepSeek < Kimi < Claude)
- Check for rate limiting
- Restart OpenClaw: `openclaw restart`

---

### "Not Authorized" Error

**Cause**: WhatsApp Web session expired.

**Solution**:
1. Open WhatsApp → Linked Devices
2. Remove old OpenClaw session
3. Re-link: `openclaw channel start whatsapp`
4. Scan new QR code

---

## Security Best Practices

### 1. Approve Senders Carefully

**Don't approve**:
- Unknown numbers
- Spam accounts
- Anyone you don't trust

**Why**: They could send expensive requests (long documents, etc.) and increase your LLM costs.

---

### 2. Monitor Usage

**Weekly check**:
```bash
openclaw logs --channel whatsapp --last 7d
```

**Review**:
- Who's sending messages
- Request types
- LLM costs

---

### 3. Set Message Limits

**Add to config**:
```json
{
  "channels": {
    "whatsapp": {
      "limits": {
        "maxMessagesPerHour": 50,
        "maxTokensPerMessage": 50000
      }
    }
  }
}
```

**This prevents**:
- Spam abuse
- Runaway costs
- Accidental overuse

---

### 4. Disable When Not Needed

**Going on vacation?**
```bash
openclaw channel stop whatsapp
```

**Re-enable later**:
```bash
openclaw channel start whatsapp
```

---

## WhatsApp vs Telegram

### When to Use WhatsApp

- **Best for**: Business communication in SEA
- **Pros**:
  - Most popular in Malaysia/Singapore
  - Everyone already has it
  - Voice notes support
  - File sharing
- **Cons**:
  - Requires phone connection
  - QR code re-scanning sometimes needed

### When to Use Telegram

- **Best for**: Tech-savvy users
- **Pros**:
  - More stable connection
  - Better bot API
  - No phone dependency
- **Cons**:
  - Less popular in SEA
  - Might need separate app install

**Recommendation**: Use WhatsApp for business, add Telegram as backup.

→ [Telegram Setup Guide](08-telegram-setup.md)

---

## Example Workflows

### Morning Routine

**7:00 AM** (automated):
```
WhatsApp from OpenClaw:
"Good morning! Here's your daily briefing:

📅 Today's Calendar:
- 9am: Team standup
- 2pm: Client call with Acme Corp
- 4pm: Investor pitch review

📧 Urgent Emails: 3
- Proposal approval needed from Sarah
- Invoice payment confirmation
- Partnership inquiry from XYZ Ltd

☀️ Weather: 32°C, Sunny
🚗 Traffic: Light, 15 min to office

Have a great day!"
```

---

### Email Processing

**You** (10 AM):
```
Summarize emails from last 2 hours.
Flag anything urgent.
```

**OpenClaw** (10:00:05):
```
Email Summary (Last 2 Hours):

🔴 URGENT (1):
- Sarah needs proposal approval by noon

📬 Normal (5):
- Team updates (3)
- Newsletter (2)

Would you like me to draft a response to Sarah?
```

---

### Document Review

**You** (2 PM):
```
[Attach 40-page contract PDF]
Review this contract. Highlight:
1. Payment terms
2. Liability clauses
3. Red flags
```

**OpenClaw** (2:00:30):
```
Contract Review Summary:

💰 Payment Terms:
- Net 30 from invoice date
- Late fees: 2% per month
- Payment via bank transfer only

⚠️ Liability:
- Limited to contract value ($50K)
- Excludes indirect damages
- 12-month liability period

🚩 Red Flags:
- Auto-renewal clause (90 days notice required)
- Exclusive partnership requirement
- Non-compete for 24 months

Recommend: Negotiate auto-renewal and non-compete terms.
```

---

## Next Steps

WhatsApp connected! You can now:

1. **Start Using**:
   - Try example queries
   - Send test documents
   - Experiment with automation

2. **Add Telegram** (optional):
   → [Telegram Setup Guide](08-telegram-setup.md)

3. **Explore Use Cases**:
   → [Business Automation Examples](../USE-CASES.md)

4. **Monitor Costs**:
   - Check LLM provider dashboard weekly
   - Review WhatsApp usage logs

---

## Quick Reference

### Commands

```bash
# Start WhatsApp
openclaw channel start whatsapp

# Stop WhatsApp
openclaw channel stop whatsapp

# Restart WhatsApp
openclaw channel restart whatsapp

# Check status
openclaw channel status whatsapp

# View logs
openclaw logs --channel whatsapp
```

### Config Location

```
~/.openclaw/openclaw.json
```

### Dashboard

```
http://127.0.0.1:18789
→ Channels → WhatsApp
```

---

**WhatsApp connected! Start automating → [Use Cases](../USE-CASES.md)**
