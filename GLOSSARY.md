# Glossary — OpenClaw Workshop Terms

**Reading time:** Reference — scan the Quick Reference table at the bottom, or search for the term you need.

A plain-English reference for every technical term used in the workshop. No prior technical knowledge needed.

---

## A

### Agent
The AI "worker" running inside your OpenClaw instance. When you send your bot a WhatsApp message, the agent reads it, decides what to do, calls tools or plugins if needed, and writes the reply. Your bot IS an agent — the word is just the technical name for it.

### API (Application Programming Interface)
A standardised way for two pieces of software to talk to each other. When your bot needs to send an email, it calls Gmail's API. When it needs to think, it calls the LLM provider's API. You don't see any of this — it happens automatically in the background.

### API Key
A secret password that proves to an external service (like OpenAI, Moonshot, or Gmail) that your requests are authorised. API keys look like long random strings: `sk-abc123...`. Treat them like passwords — don't share them.

**Example:** When you connected your LLM provider during setup, you pasted an API key. That's how your bot is allowed to use that provider's AI model.

---

## B

### Bot
What we informally call your OpenClaw assistant. "Bot" and "agent" are used interchangeably in conversation — technically, the bot is the WhatsApp interface, and the agent is the AI brain behind it.

### Browser Terminal
A terminal (command-line interface) that runs inside your web browser, connected directly to your VPS. You accessed this during setup by clicking the link on your workshop name tag. It looks like a black screen with a cursor — it's the same as if you were typing commands directly on the server.

**Why it matters:** Participants don't have SSH access to their servers (that's a security feature), but the browser terminal gives you full control without needing any extra software.

---

## C

### Cron Job
A scheduled task — an instruction to your bot to do something automatically at a set time or interval. The name comes from Unix's `cron` scheduler, but you don't need to know that. Think of it like setting a recurring alarm, except instead of just beeping, it runs a full workflow.

**Example:** "Send me a morning briefing at 8am every weekday" is a cron job.

**Managing cron jobs:**
- View all: *"List my cron jobs"*
- Cancel one: *"Cancel the daily briefing cron"*
- Change time: *"Change my meeting prep cron to 7am"*

### Cron Expression
The shorthand code that describes WHEN a cron job runs. You don't need to write these — your bot does it for you when you describe a schedule in plain English.

**Examples:**
- `0 8 * * 1-5` = 8am, Monday to Friday
- `*/15 * * * *` = every 15 minutes
- `0 9 * * 1` = 9am every Monday

### Container
A lightweight, isolated environment that runs a piece of software — in this case, OpenClaw. Containers are like small virtual computers running inside your VPS. Your OpenClaw instance runs inside a Docker container, which keeps it separate from the rest of the server and easy to restart or update.

---

## D

### Device Flow (OAuth Device Flow)
A way to authorise a remote server (your VPS) to access your Google account — without needing to type your password into the server or open a browser on it.

**How it works:**
1. Your bot gives you a URL and a short code (e.g., `google.com/device`, code: `ABC-1234`)
2. You open that URL on your phone or laptop
3. You enter the code and approve the access
4. Your bot receives a token and can now access your Google account

This is the recommended method for connecting Google Workspace to OpenClaw.

### Docker
Software that runs and manages containers. Your VPS uses Docker to run OpenClaw. When you see commands like `docker compose restart openclaw`, you're restarting the container that runs your bot. You don't need to interact with Docker directly — OpenClaw handles it.

### Docker Compose
A tool that defines and manages multi-container setups. Your OpenClaw server uses a `docker-compose.yml` file to describe how to run all the pieces together. Again — you don't need to touch this directly.

---

## E

### Environment Variable
A setting or secret stored on the server under a name, rather than hardcoded into the code. Like a Post-it note on the server that says "MODEL_API_KEY = abc123".

**Why it matters:** Instead of writing your API key directly into a file (risky — it could be accidentally shared), the key is stored as an environment variable and the code just says "use MODEL_API_KEY".

---

## G

### Gateway / Model Gateway
The component inside OpenClaw that routes requests to your LLM provider (e.g., Moonshot, OpenAI, Anthropic). When you send a message to your bot, the gateway forwards it to the AI model, gets the response back, and passes it to the agent.

### `gog` Plugin
The official OpenClaw plugin for Google Workspace (Gmail, Google Calendar, Google Drive, Google Contacts, Google Sheets, Google Docs). Once installed and authorised, your bot can read and send emails, check your calendar, create events, and access your Drive — all triggered by natural language messages.

**Install via WhatsApp:** *"Install the gog plugin"*

### GPU
Graphics Processing Unit — specialised hardware used to run AI models faster. When you pay an LLM provider, you're renting time on their GPUs to process your messages. Your VPS doesn't have a GPU — it just sends requests to the provider's servers, which do.

---

## H

### Hetzner
The cloud infrastructure provider used for the workshop VPS servers. Based in Germany, known for good value European hosting. Your server is a Hetzner Cloud VPS.

---

## L

### LLM (Large Language Model)
The AI model that powers your bot's ability to read, write, reason, and respond. Examples: GPT-4 (OpenAI), Claude (Anthropic), Kimi (Moonshot), Qwen (Alibaba). Your bot is the interface; the LLM is the intelligence behind it.

**Analogy:** Your bot is the employee. The LLM is the brain they were trained with.

### LLM Provider
The company that hosts and serves the LLM you're using. You pay the provider (usually per token/word) and they give you an API key to use their model. Common providers: OpenAI, Anthropic, Moonshot (Kimi), DeepSeek.

---

## M

### Model
Short for "AI model" or "language model" — the specific AI your bot uses to think and respond. Different models have different strengths, pricing, and context window sizes.

**Examples:**
- `gpt-4o` — OpenAI's flagship model
- `claude-3-5-sonnet` — Anthropic's fast, capable model
- `kimi-k2` — Moonshot's model, good value for Asian languages

---

## O

### OAuth (Open Authorisation)
A secure way to give one app access to another without sharing your password. When you connect Google to your OpenClaw bot, you go through OAuth — you log in to Google's own page and grant permission, rather than giving your password to your bot.

**Think of it like:** A hotel key card. You don't hand over your home keys — the hotel makes a temporary card that only works for specific doors.

### OAuth Token
The "key card" created after OAuth authorisation succeeds. Your bot stores this token and uses it to access Google on your behalf. Tokens can expire (usually after a few months) and need to be refreshed.

### OpenClaw
The open-source, self-hosted AI assistant framework at the centre of this workshop. It runs on your VPS, connects to WhatsApp, and acts as your personal AI bot. You own the installation — unlike hosted services, your data doesn't pass through a third party's servers.

**Website:** [openclaw.ai](https://openclaw.ai)

---

## P

### Persona
The name, tone, and personality you give your bot. During setup you gave your bot a name (e.g., "Alex") and a brief description of how it should behave. This is the persona. You can update it any time:
> *"Update your persona: your name is Max, you are direct and concise, you never use bullet points"*

### Plugin
An add-on that gives your bot new capabilities. Plugins connect your bot to external services (Google, Notion, LinkedIn) or add new tools (web search, code execution, memory). Plugins are installed once; after that, your bot uses them automatically when relevant.

**Examples:**
- `gog` — Google Workspace (Gmail, Calendar, Drive)
- `firecrawl-search` — web search and URL reading
- `memory-lancedb` — long-term memory for your bot

### Prompt
The text you send to your bot (or the instructions that tell it how to behave). In the context of skills and workflows, a "setup prompt" is the exact message you paste into WhatsApp to configure a new behaviour.

### Prompting
The practice of writing instructions to an AI model to get useful outputs. Good prompting is specific, provides context, and sets clear expectations. The [Prompting Guide](resources/openclaw-sea-guide/PROMPTING-GUIDE.md) has more detail.

---

## S

### Sandbox Mode
A security setting that controls whether your bot can run shell commands on the VPS itself. In the workshop, `sandbox.mode` is set to `off` — meaning your bot CAN run commands on your server (useful for installing plugins automatically). On a production personal server, you might set this to `on` for safety.

### Skill (OpenClaw Skill)
Standing instructions loaded into your bot's memory that tell it how to handle a specific type of task. Unlike a one-off message, a skill persists — it's the difference between telling your bot "send me a briefing now" vs "always send me a briefing at 8am."

Skills are installed by pasting the skill content into WhatsApp with an install message. The files in `resources/sample-skills/` are ready-to-install skills.

### SSH (Secure Shell)
A protocol for connecting to a remote server securely from the command line. `ssh user@server-ip` opens an encrypted terminal session on that server.

**In the workshop context:** Participants use the browser terminal instead of SSH. Table captains use SSH (via Tailscale) to access participants' servers for troubleshooting.

### SSH Key
A pair of cryptographic files (public + private) used instead of a password to authenticate SSH connections. More secure than passwords because the private key never leaves your machine.

---

## T

### Tailscale
A VPN (Virtual Private Network) tool that creates a private, encrypted network between devices. Workshop captains have Tailscale installed, which lets them SSH into any workshop server from their laptop without exposing those servers to the public internet.

### Token (LLM token)
The unit that LLM providers use to measure and charge for usage. Roughly 1 token ≈ 0.75 words in English. A short message might be 50 tokens; a long document might be 10,000 tokens.

**Why it matters for cost:** You pay per token sent to and received from the model. Longer conversations and longer documents cost more.

### Token (auth token / access token)
Confusingly, "token" also means an OAuth access credential (see OAuth Token above) or an API key in some contexts. The word is overloaded — context usually makes clear which type is meant.

### ttyd
The software that powers the browser terminal on your VPS. It takes a terminal session on the server and streams it to your browser over HTTPS. The name stands for "tty daemon" — `tty` is the Unix term for a terminal session.

---

## V

### VPS (Virtual Private Server)
A virtual computer rented from a cloud provider (Hetzner, DigitalOcean, etc.), accessible over the internet. Your OpenClaw bot runs on a VPS — a server in a data centre, always on, with its own IP address, CPU, RAM, and storage.

**Analogy:** Instead of buying a physical computer and plugging it into the internet yourself, you rent a "slice" of a powerful server in a data centre. It behaves exactly like a real computer but runs in software.

**Your workshop VPS specs:** 2 vCPU, 4GB RAM, 40GB SSD — enough to run OpenClaw plus a few plugins comfortably.

### Volume (Docker Volume)
A persistent storage area attached to a Docker container. Your OpenClaw configuration, skills, and conversation history are stored in a Docker volume — so even if you restart or update the container, your data stays intact.

---

## W

### Webhook
A way for one service to notify another when something happens, by sending an HTTP request to a URL. Less relevant for workshop participants, but mentioned in some advanced integrations (e.g., triggering your bot when you receive a form submission).

### WhatsApp (as a channel)
OpenClaw uses WhatsApp as its interface — the "channel" through which you talk to your bot. The bot is linked to a phone number via a QR code scan (like setting up WhatsApp Web). Once linked, your WhatsApp messages go to the bot instead of a person.

---

## Quick Reference

| Term | One-line definition |
|---|---|
| VPS | Your rented server in the cloud — always on, always connected |
| OpenClaw | The open-source AI assistant running on your VPS |
| Bot / Agent | Your AI assistant — the two words mean the same thing here |
| Plugin | Add-on that gives your bot a new capability (e.g., Google, web search) |
| Skill | Standing instructions that define how your bot handles a recurring task |
| Cron job | A scheduled task — your bot doing something automatically at a set time |
| LLM | The AI model that makes your bot intelligent (GPT-4, Claude, Kimi, etc.) |
| API key | A secret password used to access an external service |
| OAuth | Secure authorisation flow — lets your bot access Google without your password |
| OAuth token | The credential created after OAuth — how your bot proves it's authorised |
| SSH | Encrypted command-line access to a remote server |
| Docker | Software that runs your OpenClaw in an isolated container |
| Prompt | The message or instruction you send to your bot |
| Sandbox mode | Controls whether your bot can run commands on the server itself |
| Browser terminal | A terminal inside your browser, connected to your VPS |
| Token (LLM) | The unit of measure for AI usage — roughly 0.75 words per token |
| Tailscale | Private VPN used by captains to SSH into workshop servers |
| ttyd | The software powering the browser terminal |
| `gog` | The Google Workspace plugin (Gmail, Calendar, Drive) |

---

## Now that you know the terms

- **Ready to build your first workflows?** → [FIRST-WEEK.md](FIRST-WEEK.md) — a day-by-day guide for your first 30 days
- **Explore what your bot can do** → [WORKFLOWS.md](WORKFLOWS.md) — 12 ready-to-run automations
- **Add capabilities** → [SKILLS-GUIDE.md](SKILLS-GUIDE.md) — plugins for Google, web search, Notion, and more
- **Common questions** → [FAQ.md](FAQ.md) — privacy, cost, and usage
