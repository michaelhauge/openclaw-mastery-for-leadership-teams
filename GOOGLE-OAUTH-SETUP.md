# Connecting Google Workspace (Gmail, Calendar, Drive)

**Reading time:** ~5 minutes

Here's where OpenClaw goes from "neat chat bot" to "actually useful for my work."

Once your Google account is connected, you can do things like:

- *"What's on my calendar tomorrow? Draft a prep doc for the 10am meeting based on the most recent emails from those attendees."*
- *"Find the last 5 emails from [client], summarise the deal status, and draft a follow-up."*
- *"Read the doc at [Drive URL] and pull out the action items, then add them to my calendar as 30-minute blocks."*
- *"Every Monday at 8am, summarise unread emails from the past weekend and send me a WhatsApp digest."*

---

## Prerequisites

Before you start:

- ✅ Your OpenClaw bot is set up and replying to WhatsApp messages (see [SETUP-GUIDE.md](SETUP-GUIDE.md))
- ✅ You have a Google account (Gmail, Google Workspace, or a personal account) whose email and calendar you want to connect
- ✅ You're on your phone or have a browser open on another device (you'll need this to approve the Google permission screen)

> Worried about connecting your Google account? Read the [privacy section in FAQ.md](FAQ.md#privacy-and-security) first.

---

## Step 1 — Install the `gog` plugin

The Google integration is handled by the **`gog`** plugin (short for Google). Your bot can install it directly.

**From WhatsApp, message your bot:**

> *"Search ClawHub for a plugin called gog"*

The bot will describe it. Then:

> *"Install gog"*

The bot installs the plugin and will tell you it's ready. If it doesn't confirm within a minute, try:

> *"Is the gog plugin installed and enabled?"*

---

## Step 2 — Connect your Google account (device-flow OAuth)

Google integrations need OAuth — the standard "sign in with Google" flow. On a headless VPS (no browser, no `localhost` you can reach from outside), we use **device flow**, which works from any phone or browser without any SSH or technical setup.

**From WhatsApp, message your bot:**

> *"I want to connect my Gmail. I'm on a VPS — please use device-flow OAuth. Walk me through it step by step."*

**What the bot will do:**

1. Run the gog auth command for Gmail
2. Print a short URL and a code — something like:
   ```
   Visit: https://www.google.com/device
   Code:  ABCD-EFGH
   ```
3. Wait for you to complete the auth on your device

**On your phone or laptop (any browser):**

1. Open the URL the bot gave you (`https://www.google.com/device` or similar)
2. Enter the code exactly as shown
3. Sign in to the Google account you want to connect
4. Review the permissions Google shows — these let the bot read and send email, see your calendar events, and access Drive files on your behalf
5. Click **"Allow"**

**Back on WhatsApp:**

The bot detects that auth completed and confirms:

> *"✓ Gmail connected. You can now ask me things like: 'Summarise my last 5 unread emails' or 'What meetings do I have today?'"*

---

## Step 3 — Connect Calendar and Drive

The same device-flow pattern works for Calendar and Drive — just ask the bot to connect each one:

> *"Now connect my Google Calendar — same device-flow approach."*

Then:

> *"And Google Drive."*

Each connection is a separate OAuth scope, so Google will show a new permission screen for each. The bot handles them one at a time.

---

## Step 4 — Verify the connection

Try these test prompts to confirm each service is working:

| Test prompt | What to expect |
|---|---|
| *"Summarise my last 5 unread emails."* | Short summary of recent emails |
| *"What's on my calendar today?"* | Today's event list |
| *"Search my Drive for files about [topic]."* | File names and links |
| *"Who sent me the most emails this week?"* | Name + count |

If any of these don't work, see the troubleshooting section below.

---

## Troubleshooting

### The bot suggests SSH or a local browser flow

Tell it:

> *"No SSH. No local browser. Use device-flow auth. The URL must be something I can open on my phone."*

The bot has access to multiple OAuth strategies and will switch.

### The code expired before I could enter it

Device-flow codes expire in about 5 minutes. Just ask the bot to start over:

> *"The code expired. Let's try again — start the Google device-flow from the beginning."*

### I accidentally connected the wrong Google account

No problem. Tell the bot:

> *"Forget my Google connection and let's start fresh."*

The bot will clear the stored tokens and walk you through connecting again. When you get to the Google sign-in screen, make sure you choose the right account from the account picker.

### Auth completed but bot says "no Gmail tools" or similar

> *"Reload your config and verify the gog plugin is enabled."*

If that doesn't fix it, try:

> *"Restart your gateway, then confirm the gog plugin is active."*

### It's been stuck for more than 5 minutes

During the workshop, raise your hand — your captain can SSH into your server directly to diagnose. After the workshop, open an issue on this repo.

---

## Privacy and security

Your Google data stays entirely between your bot and your Google account. Here's what that means in practice:

- **Your emails and calendar are never stored on an AI company's servers.** The bot reads data directly from Google via the API and processes it in memory using your LLM provider (Moonshot, OpenAI, etc.).
- **Your LLM provider sees the content of messages you ask the bot to process** — this is the same as any AI assistant. Choose a provider whose privacy policy you're comfortable with.
- **Revoke access any time** from your Google account's security settings: [myaccount.google.com/permissions](https://myaccount.google.com/permissions) — find "OpenClaw" or "gog" in the list and remove it.
- **The OAuth token lives on your VPS** in the OpenClaw config volume. If you destroy your server, the token is gone — you'll need to reconnect if you set up a new server.

---

## What's next

- **Want full ownership of your Google credentials?** → see [Advanced Google OAuth Setup](docs/advanced/GOOGLE-OAUTH-SETUP-ADVANCED.md) for the hard path: your own Google Cloud project, OAuth client, and SSH tunnel (requires SSH access and technical comfort)
- **Install more plugins** → see [SKILLS-GUIDE.md](SKILLS-GUIDE.md) for a full review of the most useful ones
- **Try AI-powered workflows** → see [resources/ai-gtm-playbook/](resources/ai-gtm-playbook/) for 25 copy-paste workflows you can use with your bot today
- **Take the bot home** → see [SETUP-GUIDE.md Part 8](SETUP-GUIDE.md#part-8-taking-it-home) for migration options
