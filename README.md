# OpenClaw Mastery for Leadership Teams

Workshop materials and post-workshop reference for a hands-on programme that gives every participant a personal AI assistant they own and control by the end of the day.

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

| File / Folder | Audience | What it is |
|---|---|---|
| **[SETUP-GUIDE.md](SETUP-GUIDE.md)** | Participants | The full setup guide — theory + step-by-step for the workshop AND for setting up your own from scratch later |
| **[GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md)** | Participants | Connecting Gmail, Calendar, and Drive — no SSH needed, done entirely through WhatsApp messages |
| **[WORKFLOWS.md](WORKFLOWS.md)** | Participants | 12 copy-paste workflows: daily briefing, meeting prep, proposal tracker, LinkedIn posts, and more |
| **[SKILLS-GUIDE.md](SKILLS-GUIDE.md)** | Participants | Plugin and skills review — what to install, how to install it, example prompts for each |
| **[resources/](resources/)** | Participants | Four resource packs: OpenClaw SEA Guide, 25 GTM workflows, 40 quick-win templates, AI implementation playbook |
| **[CAPTAIN.md](CAPTAIN.md)** | Table captains | Pre-brief: triage lanes, troubleshooting flowchart, recovery commands, escalation protocol |
| `docs/operator/OPERATOR.md` | Workshop operator | Workshop-day runbook: pre-flight, bulk deploy, monitoring, recovery, tear-down |
| `README.md` | Everyone | This file |

---

## Quick links

### During the workshop
- [Workshop-day flow (5 minutes)](SETUP-GUIDE.md#part-3-the-workshop-day-flow)
- ["My bot isn't replying" troubleshooting](SETUP-GUIDE.md#part-7-troubleshooting)

### After the workshop
- [Connecting Google Workspace (Gmail, Calendar, Drive)](GOOGLE-OAUTH-SETUP.md) — no SSH, done via WhatsApp
- [12 ready-to-run workflows — daily briefing, meeting prep, proposal tracker, and more](WORKFLOWS.md)
- [Installing plugins and customising your bot](SKILLS-GUIDE.md)
- [Taking it home — running your OWN OpenClaw](SETUP-GUIDE.md#part-8-taking-it-home)

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

## Licence

Workshop materials are free to use within your organisation. MIT-licensed — see [LICENSE](LICENSE).

OpenClaw itself is open-source software with its own licence — see [openclaw.ai](https://openclaw.ai).
