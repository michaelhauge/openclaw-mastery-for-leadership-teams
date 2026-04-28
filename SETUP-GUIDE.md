# OpenClaw Mastery — Full Setup Guide

A complete walkthrough for the workshop AND for setting up your own OpenClaw from scratch later. Written for business leaders, not engineers — assumes you've used a terminal once or twice and know how to copy-paste.

**Reading time:** ~25 minutes for the full guide. The workshop-day section (Part 3) is ~5 minutes if that's all you need today.

> 💡 If you only have 5 minutes, skip to **[Part 3: The workshop-day flow](#part-3-the-workshop-day-flow)** and come back to the theory later. Everything else in this guide is for understanding what just happened and extending your bot afterward.

---

## Table of contents

1. [What is OpenClaw and why should I care?](#part-1-what-is-openclaw-and-why-should-i-care)
2. [The stack: VPS, OpenClaw, LLM, channel](#part-2-the-stack-vps-openclaw-llm-channel)
3. [The workshop-day flow](#part-3-the-workshop-day-flow)
4. [What just happened? A walkthrough of the install](#part-4-what-just-happened-a-walkthrough-of-the-install)
5. [Connecting Google Workspace (Gmail, Calendar, Drive)](#part-5-connecting-google-workspace)
6. [Extending your bot — plugins, skills, persona](#part-6-extending-your-bot--plugins-skills-persona)
7. [Troubleshooting](#part-7-troubleshooting)
8. [Taking it home — running your OWN OpenClaw](#part-8-taking-it-home)
9. [Glossary](#part-9-glossary)

---

## Part 1: What is OpenClaw and why should I care?

OpenClaw is a **free, open-source AI assistant** (150,000+ GitHub stars) that you run yourself rather than rent from a SaaS company. Think of it as the difference between owning a car and using Uber: more setup up front, no recurring lock-in, full control over where your data lives.

### What makes it different from ChatGPT?

| | ChatGPT (consumer) | OpenClaw |
|---|---|---|
| Where it runs | OpenAI's servers | YOUR server (or laptop) |
| Where your data lives | OpenAI's database | Files on YOUR disk you can `cat` |
| Which LLM model | OpenAI's only | Any: Moonshot, Anthropic, OpenAI, DeepSeek, Google, local Llama, etc. |
| Available via | Web + iOS + Android app | WhatsApp, Telegram, Signal, Discord, Slack, web, terminal |
| Can run on a schedule | No | Yes (cron jobs — "every Monday 8am, send me X") |
| Connects to YOUR tools | Limited (plugins) | Yes — Gmail, Calendar, Drive, Sheets, Notion, Linear, Slack, your own scripts |
| Cost | $20/mo subscription | $5–25/mo (server + LLM API), or $0 if you run locally |
| Vendor lock-in | High | None — you can swap LLM providers, hosts, even fork the software |

### The pitch in one sentence

> *Your own AI agent, on your own server, talking to you on WhatsApp, with full access to YOUR Gmail / Calendar / Drive / Notion / whatever — and YOU decide what it can and cannot touch.*

For a deeper "why this matters for SEA business leaders" treatment, read the SEA guide's [USE-CASES.md](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/USE-CASES.md) and [MENTAL-MODEL.md](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/MENTAL-MODEL.md).

---

## Part 2: The stack: VPS, OpenClaw, LLM, channel

OpenClaw isn't one thing — it's a small stack of services that work together. Understanding the parts makes everything else easier.

### The four layers

```
┌────────────────────────────────────────────────┐
│  YOU                                           │
│  Talking via WhatsApp / Telegram / browser     │  ← "channel"
└──────────────────┬─────────────────────────────┘
                   │
┌──────────────────▼─────────────────────────────┐
│  OpenClaw gateway                              │
│  Receives messages, routes them, runs tools    │  ← the brain
└──────────────────┬─────────────────────────────┘
                   │
┌──────────────────▼─────────────────────────────┐
│  LLM provider (the language model)             │
│  Moonshot Kimi, OpenAI GPT-5, Anthropic Claude │  ← the words
└──────────────────┬─────────────────────────────┘
                   │
┌──────────────────▼─────────────────────────────┐
│  VPS / Mac / cloud (where it lives)            │
│  Hetzner, DigitalOcean, your laptop, etc.      │  ← the home
└────────────────────────────────────────────────┘
```

### The four choices

When you set up OpenClaw, you make four decisions:

**1. Where does it live?** (the host)
- *Workshop choice:* **Hetzner cpx22** in Singapore (~€10/month, 2 vCPU, 4 GB RAM, 80 GB disk)
- *Alternatives:* your Mac (free, but only on when laptop is on), Oracle Cloud Free (free forever, complex setup), DigitalOcean ($6/mo, easy 1-click install), Contabo (~$4/mo, best value), managed hosting via xCloud or OpenClawd.ai ($24–29/mo, no installation needed)

**2. Which LLM provider?** (the brain)
- *Workshop default:* **Moonshot Kimi K2** (cheap, works globally, generous free tier)
- *Alternatives:* OpenAI GPT-5.5, Anthropic Claude, DeepSeek (cheapest), Google Gemini, local Llama (your own GPU)
- *Cost:* roughly $5–25/month depending on usage; managed providers like Anthropic cost more, frontier-model open weights like Kimi K2 cost a fraction

**3. Which channel?** (how you talk to it)
- *Workshop default:* **WhatsApp** (because everyone in SEA already has it)
- *Alternatives:* Telegram, Signal, Discord, Slack, web browser, terminal-only

**4. What can it do?** (skills + plugins)
- *Workshop default:* basic chat + web search + code execution (sandbox.mode=off so the bot can run shell commands for you)
- *Add later:* Gmail, Calendar, Drive, Notion, Linear, Stripe, GitHub, custom scripts you write

### Why we picked what we picked for the workshop

**Hetzner cpx22 in Singapore** — closest to participants (low latency for WhatsApp), cheapest VPS that runs OpenClaw + LLM client comfortably. Hetzner's API limits let us bulk-provision 45 servers in under 90 minutes. €10/month is a credible cost participants can keep paying themselves.

**Moonshot Kimi K2 as default** — works without VPN in SEA (some providers require workarounds), generous free tier means participants can play for hours before paying anything, K2 is genuinely good at the kinds of tasks workshop participants actually try (research, drafting, summarisation).

**WhatsApp as default channel** — every workshop participant already has it on their phone. Pairing takes 30 seconds. Telegram works just as well and you can switch later.

**Sandbox off** — for the workshop we let the bot execute shell commands so it can install plugins, read your files, etc. on demand. This is fine because the server is YOUR server with no shared data. If you redeploy at home with sensitive workloads, consider turning sandbox back on (per-tool allowlist).

For deep theory and pricing comparisons across all options, see:
- [SEA guide: LLM providers](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/02-llm-providers.md)
- [SEA guide: managed hosting providers](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/09-managed-hosting-providers.md)
- [SEA guide: pricing breakdown](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/PRICING.md)

---

## Part 3: The workshop-day flow

Five steps. ~10 minutes. You'll need:
- **Your phone**, with WhatsApp installed and signed in
- **An LLM API key** (we'll show you how to get a free Moonshot key in step 2, or bring your own)
- **A laptop or tablet** with a modern browser (Chrome, Safari, Firefox, Edge — anything from the last few years)
- **The dispenser URL** your captain shared (looks like `https://<YOUR-WORKSHOP-CLAIM-URL>/?t=...`)

### Step 1 — Claim your server (~30 seconds)

1. Open the dispenser URL in your browser
2. Click **"Claim my OpenClaw"** — this assigns one of the pre-provisioned workshop servers to you
3. Save the bundle that appears: a server name, ttyd password, and a "browser terminal" link. Bookmark this page — it's your only way back to the server if you lose track.

### Step 2 — Get an LLM API key (if you don't have one) (~3 minutes)

If you already have an OpenAI / Anthropic / DeepSeek / Google API key, skip this step.

Otherwise, the fastest workshop-friendly option is **Moonshot Kimi K2**:

1. Go to [platform.moonshot.ai](https://platform.moonshot.ai) on your phone or laptop
2. Sign up with your email (no credit card required)
3. Verify the email
4. Click **API Keys** → **Create New Key**
5. Copy the key (starts with `sk-`). Keep this tab open — you'll paste it in step 4.

> 💸 Moonshot's free tier covers normal workshop use. You'd need to be hammering it with code generation for hours to see a bill.

### Step 3 — Open your browser terminal (~30 seconds)

In the dispenser bundle, click **"Open browser terminal"**. A new tab opens with a password prompt.

- **Username:** `workshop`
- **Password:** the password from your bundle (16 hex characters)

You should land on a black terminal with a prompt like:

```
pertama@workshop-st4-12:/$
```

That's a real Linux shell on YOUR Hetzner server in Singapore. **Bookmark this tab.** It is your only persistent access to the server — losing it means having to re-claim or ask a captain for help.

### Step 4 — Run the installer (~3 minutes interactive)

In the terminal, type:

```bash
/opt/pertama/setup.sh
```

The installer will:
1. Show a banner explaining what's about to happen → press **Enter** to continue
2. Run OpenClaw's official `configure` wizard, which will:
   - Ask which LLM provider you want — pick Moonshot (or your provider of choice)
   - Ask for your API key — paste it (input is hidden)
   - Ask which channel — pick **WhatsApp**
3. Apply a workshop-specific config patch (sandbox mode + disable bonjour)
4. Start the OpenClaw gateway as a background service
5. Run the WhatsApp pairing wizard — this displays a **QR code** in your terminal
6. Wait for the gateway to be healthy (~30 seconds)

### Step 5 — Pair WhatsApp and send your first message (~1 minute)

When the QR code appears in the terminal:

1. Open **WhatsApp on your phone**
2. Settings → **Linked Devices** → **Link a Device**
3. Point your phone's camera at the QR code in the terminal
4. Wait for "Linked successfully"
5. The terminal will print "✓ Setup complete!"
6. Open WhatsApp and **send a message to your own number** — anything, e.g. *"Hello, who are you?"*
7. Within 5–10 seconds, your bot should reply

🎉 **Congratulations — your AI assistant is live.**

---

## Part 4: What just happened? A walkthrough of the install

This section is optional — if your bot is replying and you're happy, skip ahead. But understanding what `setup.sh` did makes everything else easier.

### The cloud-init that ran before you arrived

Hours before the workshop, your server was provisioned. A "cloud-init" script (a one-shot setup file Hetzner runs on first boot) installed:

- **Docker** — containerisation runtime; OpenClaw runs inside Docker containers
- **Tailscale** — a private mesh network so your captain can SSH into your server safely
- **ttyd** — the browser terminal you're using right now
- **Caddy** (running on a separate dispenser server) — routes the public-internet URL to your tailnet-only ttyd
- **OpenClaw + Pertama Daemon Docker images** — pulled but not started (waiting for setup.sh to configure them first)

Your server's filesystem layout:

| Path | What's there |
|---|---|
| `/opt/pertama/` | Setup scripts, docker-compose.yml, your help reference |
| `/opt/pertama/setup.sh` | The interactive installer you ran |
| `/opt/pertama/help.sh` | Quick reference — runnable anytime to remind you of commands |
| `/opt/pertama/.onboard-complete` | Sentinel file — its presence tells `setup.sh` you've already onboarded |
| `/opt/pertama-skills/` | Curated skills (auto-syncs every 5 min from a private repo) |
| `/var/lib/pertama/` | Pertama Daemon state (logs, runtime data) |
| Docker volume `pertama_openclaw-config` | Your OpenClaw config + auth tokens (stays on the server) |

### What `setup.sh` actually did

```
┌─ 1. Idempotency check ─────────────────────────┐
│ Looked for /opt/pertama/.onboard-complete.     │
│ If present → asks [c]ontinue / [R]eset / [q]uit│
│ If absent  → proceeds to wizard                │
└────────────────────────────────────────────────┘
                  ▼
┌─ 2. OpenClaw `configure` wizard ───────────────┐
│ docker compose run --rm openclaw \             │
│   node openclaw.mjs configure \                │
│   --section model --section channels           │
│ This wrote your openclaw.json + auth-profiles  │
│ to the Docker volume — using OpenClaw's OWN    │
│ schema (we don't hand-write it; it changes per │
│ release).                                      │
└────────────────────────────────────────────────┘
                  ▼
┌─ 3. Workshop config patch (jq deep-merge) ─────┐
│ • agents.defaults.sandbox.mode = "off"         │
│   (so the bot can run shell commands for you)  │
│ • plugins.entries.bonjour.enabled = false      │
│   (bonjour mDNS crashes in datacenter networks)│
└────────────────────────────────────────────────┘
                  ▼
┌─ 4. Start the long-running gateway ────────────┐
│ docker compose up -d                           │
│ Starts both: openclaw + pertama-daemon         │
└────────────────────────────────────────────────┘
                  ▼
┌─ 5. Pair WhatsApp ─────────────────────────────┐
│ docker compose exec openclaw \                 │
│   node openclaw.mjs channels add \             │
│   --channel whatsapp                           │
│ docker compose exec openclaw \                 │
│   node openclaw.mjs channels login \           │
│   --channel whatsapp                           │
│ → shows QR code → you scan → token saved       │
└────────────────────────────────────────────────┘
                  ▼
┌─ 6. Sentinel + MOTD swap + health check ───────┐
│ • touch /opt/pertama/.onboard-complete         │
│ • Replace /etc/motd with the post-setup banner │
│ • Wait up to 90s for both containers healthy   │
└────────────────────────────────────────────────┘
```

### Why pre-baking didn't work (the philosophy)

An earlier version of this installer pre-baked `openclaw.json` and `auth-profiles.json` directly into the cloud-init — the idea being "no wizard, just paste a key and go." That broke twice in the days before the workshop:

1. OpenClaw 2026.4.24 changed the `auth-profiles.json` schema; our hand-written version was silently rejected, and the bot received WhatsApp messages but never replied.
2. Pre-baking the channel section made `channels login` think pairing was already done, so the QR step skipped — leading to a "looks set up but doesn't work" state.

The current approach — let OpenClaw's own `configure` wizard write the schema, then patch only the workshop-specific bits afterward — is resilient to OpenClaw releases. When OpenClaw 2026.5 ships next month, this installer keeps working without changes.

---

## Part 5: Connecting Google Workspace

Here's where OpenClaw goes from "neat chat bot" to "actually useful for my work."

### What you can do once Google is connected

- *"What's on my calendar tomorrow? Draft a prep doc for the 10am meeting based on the most recent emails from those attendees."*
- *"Find the last 5 emails from [client], summarise the deal status, and draft a follow-up."*
- *"Read the doc at [Drive URL] and pull out the action items, then add them to my calendar as 30-minute blocks for tomorrow."*
- *"Every Monday at 8am, summarise unread emails from the past weekend and send me a WhatsApp digest."*

### The OAuth challenge (in plain English)

Google integrations need OAuth — the standard "sign in with Google" flow. On a normal computer that flow goes:

1. App opens a browser tab pointing at Google
2. You sign in
3. Google redirects back to a local URL (typically `localhost:8080`) with a token
4. App captures the token and stores it

On a **headless VPS** (no browser, no `localhost` you can reach), step 3 doesn't work directly. Three real solutions:

| Approach | Difficulty | Recommended for |
|---|---|---|
| **Device flow** — server prints a URL + code; you visit URL on any device, enter code, sign in | Easiest | Workshop participants |
| **SSH tunnel** — you forward `localhost:8080` from server to your laptop, then run the OAuth flow on your laptop browser | Medium | Power users, post-workshop |
| **Public OAuth callback proxy** — set up a public HTTPS endpoint that catches the callback and forwards to your server | Hardest | Production multi-user setups |

We use **device flow** for the workshop because it works from any phone, no SSH, no laptop OAuth setup.

### Step-by-step: connect Gmail (then Calendar, then Drive)

> **Workshop transparency note:** the gog plugin's auth flow was not fully verified end-to-end during workshop prep (limited time). The conversation script below is the recommended approach because the bot can adapt to whatever clawhub + gog actually do today. If the bot's first suggestion involves SSH or local-browser flows, push back per the "if it suggests SSH" instructions below. If you get stuck, raise your hand for a captain — they have direct server access to debug.

The bot can install the Google Workspace plugin (`gog`) and walk you through device-flow auth itself. Here's the conversation script:

**1. From WhatsApp, message your bot:**

> *"I want to connect my Gmail. I'm on a workshop VPS — please use device-flow OAuth (no SSH, no local browser). Walk me through it step by step."*

**2. The bot should:**
- Install the `gog` plugin via clawhub: `npx clawhub install jx76-gog`
- Run the gog auth command for Gmail
- Print a URL and a short code (something like `https://www.google.com/device` and `XXXX-YYYY`)
- Tell you to visit that URL and enter the code

**3. On your phone or laptop:**
- Open the URL in any browser
- Enter the code
- Sign in to Google with the account whose Gmail you want connected
- Grant the requested permissions (read email, etc.)
- Click "Allow"

**4. Back to WhatsApp:**
- The bot detects the auth completed
- Confirms: *"✓ Gmail connected"*
- Try it: *"Summarise my last 5 emails."*

**5. Repeat for Calendar and Drive:**

> *"Now connect my Google Calendar — same device-flow approach."*
>
> *"And Google Drive."*

Same pattern, different OAuth scope each time.

### What if the bot suggests SSH or a local browser flow?

Tell it: *"No SSH. No local browser. Use device-flow auth. The URL must work on any device."* The bot has access to multiple OAuth strategies and will switch.

### What if it gets stuck?

- **Stuck for >5 minutes:** raise your hand for a captain
- **Auth completes but bot says "no Gmail tools":** tell the bot *"reload your config and verify the gog plugin is enabled"*
- **Want to start over:** message *"forget my Google connection, let's start fresh"* — bot will clear tokens and restart

> 🛟 Captain access: captains have SSH-via-Tailscale access to your server and can run any command directly. They're your "support engineer" for the workshop. After the workshop they don't have access anymore (their Tailscale entry is removed).

---

## Part 6: Extending your bot — plugins, skills, persona

### Installing OpenClaw plugins (ClawHub)

OpenClaw's plugin marketplace is called **ClawHub**. Anyone can publish a plugin; thousands exist. Browse them at [clawhub.openclaw.ai](https://clawhub.openclaw.ai).

In your browser terminal:

```bash
cd /opt/pertama

# Search:
docker compose exec openclaw npx clawhub search <topic>
# Example: docker compose exec openclaw npx clawhub search calendar

# Inspect (without installing):
docker compose exec openclaw npx clawhub inspect <slug>

# Install:
docker compose exec openclaw npx clawhub install <slug>

# List installed:
docker compose exec openclaw npx clawhub list
```

After installing a plugin, restart OpenClaw so it picks up the new capabilities:

```bash
docker compose restart openclaw
```

### Useful plugins to try

| Plugin | What it does |
|---|---|
| `jx76-gog` | Google Workspace (Gmail, Calendar, Drive, Sheets, Docs, Contacts) |
| `firecrawl-search` | Web search + URL scraping (better than naive web search) |
| `notion` | Read/write your Notion workspace |
| `linear` | Read/write Linear issues |
| `web-search-plus` | Multi-source web search with summarisation |

### Customising the bot's persona (advanced)

OpenClaw doesn't have a single "system prompt" knob — its persona comes from a combination of:
- The skill files in `/opt/pertama-skills/` (auto-synced from a private repo, so you can fork and customise once you take this home)
- Per-channel instructions (you can give the bot different personas per WhatsApp peer)

For per-conversation instructions, the bot itself has an `agents.defaults` section it can edit. Try:

> *"From now on, when responding to me, be more concise — bullet points only, max 3 bullets, no preamble."*

The bot will write that into its config and persist it across restarts.

---

## Part 7: Troubleshooting

### "My bot received the message but didn't reply"

Most common cause: invalid LLM API key.

```bash
cd /opt/pertama
docker compose logs --tail=80 openclaw | tail -40
```

Look for: `No API key found for provider`, `401`, `403`, `Invalid API key`.

**Fix:** re-run the model section of the wizard:

```bash
docker compose run --rm openclaw node openclaw.mjs configure --section model
```

Paste a fresh key from your provider's dashboard.

### "QR code didn't render properly / WhatsApp won't pair"

Some terminals struggle with the QR character set. Try:

```bash
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp
```

If that still fails, ask a captain — they can run the pairing in a different terminal session.

### "I scanned the wrong WhatsApp account"

In WhatsApp on the wrong phone: Settings → Linked Devices → tap the linked device → **Log Out**.

Then re-pair on the correct phone:

```bash
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs channels logout --channel whatsapp
docker compose exec openclaw node openclaw.mjs channels login --channel whatsapp
```

### "Container is restarting / unhealthy"

```bash
docker compose ps                                # check status
docker compose logs --tail=80 openclaw | tail -40   # see why
docker compose restart openclaw                  # try a clean restart
```

If it keeps crash-looping, the most common workshop-day cause is an upstream issue (e.g., bonjour). Check the logs for repeated errors and ask a captain.

### "I want to start over from scratch"

```bash
/opt/pertama/setup.sh
# Pick [R]eset when prompted — wipes config volume and re-runs the wizard
```

### "I lost my browser terminal tab"

1. Open the workshop URL the captain shared
2. The dispenser remembers your claim (via a signed cookie, valid for the workshop day)
3. Click **"My OpenClaw"** to get back into your bundle
4. Click **"Open browser terminal"** again
5. Re-enter your ttyd password from the bundle (or your printed name tag)

If even that fails, your captain can recover you via the operator dashboard.

### Quick-reference diagnostic

```bash
/opt/pertama/help.sh    # the on-server help reference
```

---

## Part 8: Taking it home

The workshop server stays running for **7 days post-workshop**, after which it's destroyed. You have three options for keeping your OpenClaw alive long-term:

### Option A — Spin up your own VPS (~30 minutes)

Pick a host from the SEA guide:

- **[DigitalOcean 1-Click](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/05-digitalocean.md)** — easiest, $6/month
- **[Contabo](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/06-contabo-vps.md)** — best value, ~$4/month
- **[Hetzner](https://www.hetzner.com)** — what we used in the workshop, ~€10/month, best in EU/SG
- **[Oracle Cloud Free](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/04-oracle-cloud-free.md)** — free forever, advanced setup
- **[Local Mac](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/03-local-mac.md)** — $0, but only works when laptop is on

The SEA guide's setup steps mirror what `setup.sh` did for you — install Docker, run `npx openclaw`, walk through the configure wizard.

### Option B — Managed hosting (~5 minutes)

If you don't want to touch a VPS at all:

- **[xCloud](https://xcloud.io)** — $24/month managed OpenClaw hosting
- **[OpenClawd.ai](https://openclawd.ai)** — $29/month, security-focused

Either lets you skip Parts 4–7 of this guide entirely. You bring an LLM key; they handle everything else.

See the [SEA guide on managed hosting](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/09-managed-hosting-providers.md) for a comparison.

### Option C — Migrate this workshop server to your own Hetzner account (~15 minutes, advanced)

If you liked the Hetzner setup and want to keep THIS exact server (with your config, paired WhatsApp, installed plugins):

1. Sign up at [hetzner.com](https://hetzner.com) (you need your own account)
2. Create a Hetzner Cloud project; generate an API token
3. Ask a captain to transfer the server to your project — there's a one-line `hcloud server transfer` command
4. You take ownership of billing from that point forward

This is the lowest-friction path if you want to keep the bot running with zero re-setup.

### Backing up before the 7-day window expires

Whichever path you pick, take a backup of your `/opt/pertama` and the OpenClaw config volume:

```bash
# In your browser terminal:
cd /opt/pertama
docker compose exec openclaw node openclaw.mjs backup create --output /tmp/openclaw-backup.tar.gz
# Then on YOUR laptop:
scp pertama@<your-tailscale-name>:/tmp/openclaw-backup.tar.gz ~/Desktop/
# (You'll need Tailscale on your laptop and an invite from your captain)
```

This backup contains your openclaw.json, auth tokens, paired channel sessions, and any custom config — restorable on any other OpenClaw install.

---

## Part 9: Glossary

**VPS (Virtual Private Server)** — a slice of a physical server that behaves like its own computer. Hetzner / DigitalOcean / Oracle / Contabo all sell these.

**LLM (Large Language Model)** — the AI that produces the actual words. Examples: Moonshot Kimi K2, OpenAI GPT-5.5, Anthropic Claude 4.7. OpenClaw is "model-agnostic" — you swap providers without changing your bot.

**API key** — a long secret string you get from an LLM provider that proves you're allowed to use their model. Treat it like a password.

**OAuth** — the "sign in with Google / GitHub / Microsoft" standard. Your bot doesn't store your password; it stores a *token* that grants specific permissions you approved.

**Device flow OAuth** — OAuth variant designed for headless devices (no browser). Server prints a URL + code; you visit URL on any device, enter code, sign in.

**Docker** — a way to run software in isolated containers. Lets you run OpenClaw without it conflicting with everything else on your server.

**Cloud-init** — a one-shot script that runs on a fresh VPS the very first time it boots. Used to install Docker, set up the firewall, etc.

**Tailscale** — a private mesh network. Lets your captain SSH into your server safely without opening port 22 to the internet.

**ttyd** — the software that gives you a terminal in your browser. The reason you can use a Linux shell on your phone if you want to.

**Caddy** — a web server / reverse proxy. The dispenser uses Caddy to give each participant's browser-terminal a public HTTPS URL.

**ClawHub** — OpenClaw's plugin marketplace. `npx clawhub search <topic>` to browse.

**Skill** — a markdown file the bot reads as additional context for how to behave or which tools to prefer. OpenClaw skills live in `/opt/pertama-skills/`.

**Channel** — the way you talk to your bot. WhatsApp, Telegram, Signal, Discord, Slack, web, terminal — pick whichever you actually use.

**Sentinel file** — a marker file (`/opt/pertama/.onboard-complete`) whose presence tells `setup.sh` "this server is already set up." Lets you safely re-run setup.sh without it asking the wizard questions again.

**MOTD (Message of the Day)** — the banner you see when you open a terminal. Updated by `setup.sh` after onboarding to point at help.sh.

---

## Need help?

- **During the workshop:** raise your hand, your captain has full access to your server and can fix anything in seconds
- **After the workshop:** open an issue on this repo
- **For deep theory:** [OpenClaw SEA Guide](https://github.com/michaelhauge/myeo-ai-resources/tree/main/openclaw-sea-guide)
- **OpenClaw itself:** [openclaw.ai](https://openclaw.ai), [GitHub](https://github.com/openclaw/openclaw), [Discord community](https://discord.gg/openclaw)

---

*Last updated: 2026-04-27 for the inaugural OpenClaw Mastery workshop in Kuala Lumpur.*
