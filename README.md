# OpenClaw Mastery for Leadership Teams

Workshop materials and post-workshop reference for **Pertama Partners' OpenClaw Mastery** — a hands-on programme that gives every participant a personal AI assistant they own and control by the end of the day.

> **Live at the workshop?** Open the dispenser URL your captain shared, click **Claim my OpenClaw**, and follow the on-screen prompts. The first 15 minutes are guided — this repo is for everything that comes after.

---

## What you'll have after the workshop

By the end of the day you'll have:

- ✅ Your own VPS in Singapore running OpenClaw, paired to your WhatsApp
- ✅ An LLM provider connected (your choice — Moonshot, OpenAI, Anthropic, etc.)
- ✅ A browser-based terminal you can use from any device, any wifi
- ✅ A bot that can search the web, write code, draft emails, summarise URLs, and a hundred other things
- ✅ The know-how to extend it — install plugins, connect Google Workspace, customise the persona

The server stays up for **7 days post-workshop** so you can keep experimenting. After that you can either spin up your own (this repo shows you how) or move to a managed host.

---

## Repo contents

| File | Audience | What it is |
|---|---|---|
| **[SETUP-GUIDE.md](SETUP-GUIDE.md)** | Participants | The full setup guide — theory + step-by-step for the workshop AND for setting up your own from scratch later |
| **[CAPTAIN.md](CAPTAIN.md)** | Table captains (Ray, CT, etc.) | Pre-brief: triage lanes, troubleshooting flowchart, recovery commands, escalation protocol |
| **[OPERATOR.md](OPERATOR.md)** | Workshop operator (Michael) | Workshop-day runbook: pre-flight, bulk deploy, monitoring, recovery, tear-down |
| `README.md` | Everyone | This file |

More content (printable name-tag template, video quickstart, take-home migration playbook) will be added as the workshop programme expands.

---

## Quick links

### During the workshop
- [Workshop-day flow (5 minutes)](SETUP-GUIDE.md#part-3-the-workshop-day-flow)
- ["My bot isn't replying" troubleshooting](SETUP-GUIDE.md#part-7-troubleshooting)

### After the workshop
- [Connecting Google Workspace (Gmail, Calendar, Drive)](SETUP-GUIDE.md#part-5-connecting-google-workspace)
- [Installing plugins from ClawHub](SETUP-GUIDE.md#installing-openclaw-plugins-clawhub)
- [Taking it home — running your OWN OpenClaw](SETUP-GUIDE.md#part-8-taking-it-home)

### Theory and deep-dives
For comprehensive theory on OpenClaw, VPS choice, security, pricing, and use cases, see Michael's broader **[OpenClaw SEA Guide](https://github.com/michaelhauge/myeo-ai-resources/tree/main/openclaw-sea-guide)** — particularly:

- [Mental Model](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/MENTAL-MODEL.md) — understand the tech through business metaphors
- [Keys & Connectors](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/KEYS-AND-CONNECTORS.md) — SSH, API keys, OAuth tokens explained
- [How AI Thinks](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/HOW-AI-THINKS.md) — what an LLM actually does
- [Prompting Guide](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/PROMPTING-GUIDE.md) — get more out of your bot
- [Pricing](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/PRICING.md) — what does this actually cost monthly?
- [Use Cases](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/USE-CASES.md) — real examples from SEA business leaders

### Setting up your own (alternatives to the workshop's Hetzner setup)
The SEA guide covers many alternatives to the Hetzner cpx22 setup we use in the workshop:

- [Local Mac](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/03-local-mac.md) — run on your laptop, $0 hosting
- [Oracle Cloud Free](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/04-oracle-cloud-free.md) — free VPS forever, advanced setup
- [DigitalOcean 1-Click](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/05-digitalocean.md) — easiest paid VPS
- [Contabo VPS](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/06-contabo-vps.md) — best value
- [Managed hosting (xCloud, OpenClawd.ai)](https://github.com/michaelhauge/myeo-ai-resources/blob/main/openclaw-sea-guide/guides/09-managed-hosting-providers.md) — no installation needed

---

## About Pertama Partners

Pertama Partners is a private investment and advisory firm focused on Southeast Asia. We run hands-on AI workshops for leadership teams who want to move from "AI is something happening over there" to "AI is helping me with my actual work today." See **[pertamapartners.com](https://pertamapartners.com)**.

---

## Licence

Workshop materials © 2026 Pertama Partners. Free to use within your organisation. For commercial redistribution please contact the team.

OpenClaw itself is open-source software with its own licence — see [openclaw.ai](https://openclaw.ai).
