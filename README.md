# OpenClaw Mastery for Leadership Teams

A hands-on workshop that gives every participant a personal AI assistant — running on their own server, talking to them on WhatsApp — by the end of the day.

*Workshop hosted by Ray Chou, [Michael Hauge](https://github.com/michaelhauge), and CT Ong · 29 April 2026 · Kuala Lumpur*

> **Live at the workshop?** Open **[https://claimopenclaw.pertamapartners.com](https://claimopenclaw.pertamapartners.com)**, click **Claim my OpenClaw**, and follow the on-screen prompts. The first 15 minutes are guided — this repo is for everything that comes after.

---

## What you'll have by the end of the day

By the end of the day you'll have:

- Your own VPS in Singapore running OpenClaw, paired to your WhatsApp
- An LLM provider connected (your choice — Moonshot, OpenAI, Anthropic, etc.)
- A browser-based terminal you can use from any device, any wifi
- A bot that can search the web, write code, draft emails, summarise URLs, and a hundred other things
- The know-how to extend it — install plugins, connect Google Workspace, customise the persona

The server stays up for **7 days post-workshop** so you can keep experimenting. After that you can either spin up your own (this repo shows you how) or move to a managed host.

---

## Start here — choose your path

Three types of people use this repo. Find yours:

| I am... | Start here |
|---|---|
| **A workshop participant** setting up my bot today | [SETUP-GUIDE.md Part 3 — workshop-day flow](SETUP-GUIDE.md#part-3-the-workshop-day-flow) |
| **Post-workshop** — bot is running, want to go deeper | [FIRST-WEEK.md — your first 7 days](FIRST-WEEK.md) |
| **Curious about self-hosted AI** for my business | [WHY-SELF-HOSTED.md — why own your AI assistant?](WHY-SELF-HOSTED.md) |

---

## All materials

| File / Folder | Audience | What it is | Time to read |
|---|---|---|---|
| **[SETUP-GUIDE.md](SETUP-GUIDE.md)** | Participants | Full setup guide — workshop day + setting up your own from scratch | ~25 min |
| **[FIRST-WEEK.md](FIRST-WEEK.md)** | Participants | Day 1–30 progression guide: from running to relying on it daily | ~7 min |
| **[GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md)** | Participants | Connecting Gmail, Calendar, and Drive — no SSH, done via WhatsApp | ~5 min |
| **[WORKFLOWS.md](WORKFLOWS.md)** | Participants | 12 copy-paste workflows: daily briefing, meeting prep, proposal tracker, and more | ~8 min |
| **[SKILLS-GUIDE.md](SKILLS-GUIDE.md)** | Participants | Plugin and skills review — what to install, how, and example prompts | ~6 min |
| **[WHY-SELF-HOSTED.md](WHY-SELF-HOSTED.md)** | Everyone | Why own your AI assistant vs. renting ChatGPT / Claude Pro — comparison and cost | ~6 min |
| **[FAQ.md](FAQ.md)** | Everyone | Privacy, costs, team usage, and technical questions answered | ~5 min |
| **[GLOSSARY.md](GLOSSARY.md)** | Participants | Plain-English definitions for every technical term in the workshop | Reference |
| **[WINDOWS-VS-MAC.md](WINDOWS-VS-MAC.md)** | Participants | Terminal differences between Windows and Mac — and why it mostly doesn't matter | ~4 min |
| **[resources/](resources/)** | Participants | Four resource packs: OpenClaw SEA Guide, 25 GTM workflows, 40 templates, AI playbook | Browse |
| **[CAPTAIN.md](CAPTAIN.md)** | Table captains | Triage lanes, troubleshooting flowchart, recovery commands | ~10 min |
| `docs/operator/OPERATOR.md` | Workshop operator | Workshop-day runbook: pre-flight, bulk deploy, monitoring, tear-down | — |

---

## Quick links

### During the workshop
- [Workshop-day flow (5 minutes)](SETUP-GUIDE.md#part-3-the-workshop-day-flow)
- ["My bot isn't replying" troubleshooting](SETUP-GUIDE.md#part-7-troubleshooting)

### After the workshop
- [Connecting Google Workspace (Gmail, Calendar, Drive)](GOOGLE-OAUTH-SETUP.md) — no SSH, done via WhatsApp
- [12 ready-to-run workflows — daily briefing, meeting prep, proposal tracker, and more](WORKFLOWS.md)
- [Installing plugins and customising your bot](SKILLS-GUIDE.md)
- [Your first 7 days — building the habit](FIRST-WEEK.md)
- [Taking it home — running your OWN OpenClaw](SETUP-GUIDE.md#part-8-taking-it-home)
- [Frequently asked questions](FAQ.md)

### Why self-hosted AI?
- [Why own your AI assistant vs. ChatGPT / Claude Pro](WHY-SELF-HOSTED.md) — comparison table, cost breakdown, honest tradeoffs

### Frequently asked questions
- [FAQ — privacy, costs, team usage, technical questions](FAQ.md)

### Advanced / technical
- [Google OAuth — own Google Cloud project + SSH tunnel](docs/advanced/GOOGLE-OAUTH-SETUP-ADVANCED.md) — for technical users who want full credential ownership

### Theory and deep-dives (also available locally in `resources/openclaw-sea-guide/`)
- [Mental Model](resources/openclaw-sea-guide/MENTAL-MODEL.md) — understand the tech through business metaphors
- [Keys & Connectors](resources/openclaw-sea-guide/KEYS-AND-CONNECTORS.md) — SSH, API keys, OAuth tokens explained
- [How AI Thinks](resources/openclaw-sea-guide/HOW-AI-THINKS.md) — what an LLM actually does
- [Prompting Guide](resources/openclaw-sea-guide/PROMPTING-GUIDE.md) — get more out of your bot
- [Pricing](resources/openclaw-sea-guide/PRICING.md) — what does this actually cost monthly?
- [Use Cases](resources/openclaw-sea-guide/USE-CASES.md) — real examples from SEA business leaders

### Setting up your own (alternatives to the workshop's Hetzner setup)
- [Local Mac](resources/openclaw-sea-guide/guides/03-local-mac.md) — run on your laptop, $0 hosting
- [Oracle Cloud Free](resources/openclaw-sea-guide/guides/04-oracle-cloud-free.md) — free VPS forever, advanced setup
- [DigitalOcean](resources/openclaw-sea-guide/guides/05-digitalocean.md) — easiest paid VPS
- [Contabo VPS](resources/openclaw-sea-guide/guides/06-contabo-vps.md) — best value
- [Managed hosting](resources/openclaw-sea-guide/guides/09-managed-hosting-providers.md) — no installation needed

---

## Resources

Four additional packs to help you get more out of your bot — and AI tools in general. All in the [`resources/`](resources/) folder.

| Pack | What's inside |
|---|---|
| **[OpenClaw SEA Guide](resources/openclaw-sea-guide/)** | Comprehensive reference: mental models, prompting, security, pricing, VPS options |
| **[AI GTM Playbook](resources/ai-gtm-playbook/)** | 25 copy-paste AI prompt workflows — SEO, cold email, proposals, competitor intel, and more |
| **[Quick-Win Templates](resources/quick-win-templates/)** | 40 templates: one-pagers, comparison guides, 30-day checklists, spreadsheet calculators |
| **[AI Implementation Playbook](resources/ai-implementation-playbook/)** | 10 AI use cases with ROI tracking + 50+ business prompts in `PROMPT-LIBRARY.md` |

---

## About this workshop

This workshop is designed and facilitated by [Ray Chou](https://raymondchou.me/), [Michael Hauge](https://www.pertamapartners.com/about/team), and [CT Ong](https://my.linkedin.com/in/ong-chong-te). If you'd like to bring their AI expertise, training, consulting, or engineering to your company, contact any one of the facilitators and they can provide you with more information.

---

## Licence

Workshop materials are free to use within your organisation. MIT-licensed — see [LICENSE](LICENSE).

OpenClaw itself is open-source software with its own licence — see [openclaw.ai](https://openclaw.ai).
