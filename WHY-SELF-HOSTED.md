# Why Run Your Own AI Assistant?

A clear-eyed comparison of self-hosted vs. subscription AI tools for business leaders.

**Reading time:** ~6 minutes

---

## The question worth asking

AI assistants are no longer expensive or hard to access. For $20 a month you can get ChatGPT Plus or Claude Pro, and both are genuinely capable tools. This document is not an argument against them — they work well for millions of people.

The question is a different one: when you use a subscription AI tool, you are renting access to someone else's infrastructure, on their terms, with their constraints. That is often the right call. But for a business leader who wants an assistant that connects to their actual tools, follows their actual workflows, and does not change behavior every time a vendor pushes an update, there is a meaningful alternative. Running your own AI assistant — on a server you control, with a model you choose — is now practical and affordable. This document explains what that looks like and who it makes sense for.

---

## The case for self-hosted

**Your data stays yours.** When you send a message to a commercial AI product, that conversation may be stored, reviewed, and in some configurations used to improve future models. With a self-hosted setup, conversations are processed by the LLM provider's API (which has its own data handling terms) but the conversation history, your files, your contacts, and your configured behaviors live on your server. No third-party product database holds a record of everything your assistant has seen.

**You choose the model — and you can change your mind.** The self-hosted approach used in this workshop (OpenClaw) is model-agnostic. You can run it today on Moonshot Kimi K2.5 and switch to a different model next month without reconfiguring anything else. Your scheduled tasks, your custom skills, your connected tools — all of it carries over. Subscription products lock your workflow to one vendor's model roadmap.

**You build on a foundation you control.** Self-hosted AI lets you do things subscription products do not: run automated tasks on a schedule (cron jobs), install custom skills that connect to your specific business tools, wire up integrations with Gmail, Google Calendar, Notion, or internal systems. When a vendor discontinues a feature or changes how their API works, your setup does not break overnight.

**The cost is lower than most people expect.** A VPS (virtual private server) running OpenClaw costs roughly $4–6 per month in hosting. LLM API calls for typical business use add another $2–10. Total: $6–16 per month — well below what most subscription AI tools cost. Details are in the cost breakdown below.

---

## Side-by-side comparison

| Feature | ChatGPT Plus | Claude Pro | Microsoft 365 Copilot | Google Gemini Advanced | OpenClaw (self-hosted) |
|---|---|---|---|---|---|
| **Where it runs** | OpenAI servers | Anthropic servers | Microsoft cloud | Google cloud | Your own VPS |
| **Where your data lives** | OpenAI's database | Anthropic's database | Microsoft's database | Google's database | Your server only |
| **Which AI model** | GPT-4o (OpenAI sets this) | Claude Sonnet/Opus (Anthropic sets this) | GPT-4 family (Microsoft sets this) | Gemini Advanced (Google sets this) | Your choice — swap anytime |
| **Automation / scheduling** | No native cron | No native cron | Limited (Power Automate integration) | No native cron | Full cron scheduling built in |
| **Connects to YOUR tools** | Plugins (limited, curated) | Limited integrations | Strong Microsoft 365 integration only | Strong Google Workspace integration only | Any tool you configure |
| **Available via** | Web, iOS, Android app | Web, iOS, Android app | Microsoft 365 apps | Web, iOS, Android app | WhatsApp (any device you already use) |
| **Monthly cost** | $20/month | $20/month | $30/user/month (requires M365 Business subscription) | $20/month (part of Google One AI Premium) | $6–16/month (see breakdown below) |
| **Vendor lock-in** | High — workflows tied to OpenAI | High — workflows tied to Anthropic | Very high — Microsoft ecosystem dependency | High — Google ecosystem dependency | None — you own the setup |

A note on fairness: ChatGPT Plus and Claude Pro are both excellent products. If you want a polished, zero-maintenance experience and do not need deep automation or tool integration, either is a reasonable choice. The comparison above reflects real differences, not an attempt to make them look worse than they are.

---

## The cost breakdown

Here is what a self-hosted setup actually costs, in concrete numbers:

**Hosting (Hetzner CX22 VPS):** ~$4–6/month
This is a small cloud server in Europe with 2 vCPUs and 4 GB RAM — more than enough to run OpenClaw and a few background tasks. Hetzner is a well-regarded German provider with data centers in Europe and the US.

**LLM API usage:** ~$2–10/month for typical use
At 50–200 messages per day, each averaging around 500 tokens of input and 300 tokens of output, you are looking at roughly 25,000–100,000 tokens per day. At current pricing for Moonshot Kimi K2.5 (the recommended model for this workshop), that works out to approximately $2–10 per month depending on volume and message length.

**Total: $6–16/month** for a full-featured, automated AI assistant with WhatsApp integration, scheduled tasks, and custom skills — versus $20–30/month for a subscription product with none of the automation capabilities.

At heavy usage — 500+ messages per day — costs rise to approximately $20–40 per month. At that level, you still get a more capable and more connected setup than any flat-rate subscription provides, though the cost advantage narrows.

For the full pricing breakdown including model comparisons and example usage scenarios, see [resources/openclaw-sea-guide/PRICING.md](resources/openclaw-sea-guide/PRICING.md).

---

## What you give up

This section deserves as much space as the benefits section, because the tradeoffs are real.

**Setup takes time upfront.** Getting OpenClaw running, connecting it to WhatsApp, and configuring your first skills takes roughly two hours for someone following a clear guide. This workshop and the [setup guide](SETUP-GUIDE.md) are designed to make that as straightforward as possible — but it is not zero effort.

**You are responsible for keeping it running.** A self-hosted server does not have a support team you can call. In practice, a well-configured OpenClaw instance is very stable — most setups run for months without requiring attention. But if something breaks, you will need to diagnose it or find help. The [troubleshooting resources](SETUP-GUIDE.md) in this workshop cover the most common issues.

**There is no polished mobile app.** The interface is WhatsApp, which is how most users in Southeast Asia already communicate. For many people this is a feature, not a limitation — the assistant lives inside an app you already open dozens of times a day. For people who strongly prefer a dedicated AI app with conversation history, document uploads, and a clean interface, ChatGPT or Claude's native apps do this better.

**Technical issues require some troubleshooting.** Self-hosted software is not always plug-and-play. API keys, server configurations, and plugin setups occasionally require reading error messages and following a checklist. If that kind of troubleshooting feels out of reach, this workshop walks through the most common scenarios — but it is honest to say that the subscription products require less technical tolerance.

---

## Who this is for

The self-hosted AI assistant makes the most sense for a specific kind of business leader: someone who values knowing where their data goes, who is willing to invest two hours upfront in exchange for long-term control and lower costs, and who already uses WhatsApp as a primary communication channel. It is particularly well-suited to people who want their AI assistant to actually connect to their calendar, email, and project tools — not a generic assistant that knows about the world, but a configured one that knows about their business. If that description fits, the setup investment pays for itself quickly. If you want something that works out of the box with no configuration and do not mind the vendor relationship, the subscription products are genuinely good.

---

## What's next

- Ready to set it up: [SETUP-GUIDE.md](SETUP-GUIDE.md)
- Already set up and want to get more from it: [FIRST-WEEK.md](FIRST-WEEK.md)
- Questions about privacy or costs: [FAQ.md](FAQ.md)
- Full pricing breakdown with model comparisons: [resources/openclaw-sea-guide/PRICING.md](resources/openclaw-sea-guide/PRICING.md)
