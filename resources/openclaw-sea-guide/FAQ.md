# Frequently Asked Questions

**Common questions about OpenClaw from Southeast Asian business leaders**

---

## General Questions

### What is OpenClaw?

OpenClaw is a free, open-source AI assistant that runs on your computer and connects to messaging apps like WhatsApp and Telegram. Think of it as having Claude, ChatGPT, or another AI directly accessible through your preferred messaging app, with the ability to automate tasks on your computer.

### Is it really free?

**OpenClaw software**: 100% free (open-source)
**Hosting**: $0-6/month (depending on where you run it)
**LLM API**: $5-20/month (the AI brain)

**Total**: $5-26/month

### Who created OpenClaw?

OpenClaw (formerly Clawdbot/Moltbot) was created by Peter Steinberger, founder of PSPDFKit. It's maintained by a large open-source community and has 150,000+ GitHub stars.

### Do I need to be technical to use this?

**No.** This guide is specifically written for non-technical business leaders. If you can:
- Install apps on your Mac
- Follow step-by-step instructions
- Send messages on WhatsApp

You can install and use OpenClaw.

---

## Security & Privacy

### Is my data safe?

Yes. OpenClaw stores everything locally on your machine as Markdown files. Your data never goes to external servers except when you explicitly ask the AI to process something (and even then, only that specific information goes to your chosen LLM provider).

[Read full Security Guide →](SECURITY.md)

### Will OpenClaw steal my credit card information?

No. OpenClaw has ZERO access to payment systems. You pay your LLM provider (Kimi, DeepSeek, etc.) directly through their website. OpenClaw never sees your payment information.

### Can OpenClaw access my bank accounts?

Only if you explicitly tell it to and give it credentials - which you should NEVER do. By default, OpenClaw can only access:
- Files you explicitly share with it
- Messaging apps you connect
- APIs you configure

### What if someone hacks my OpenClaw?

OpenClaw has security features like DM Pairing (strangers can't message your bot without approval) and Sandbox Mode (limits what OpenClaw can do). Additionally:
- Run `openclaw doctor` regularly to check for security issues
- Set spending limits at your LLM provider
- Use strong passwords and 2FA

### Is it compliant with PDPA (Singapore/Malaysia)?

Yes, when configured properly. Since OpenClaw processes data locally and you control what LLM provider you use, you maintain data controller status under PDPA. For sensitive data, choose Anthropic (Claude) which has SOC 2 Type II certification.

---

## Cost & Pricing

### Why do prices vary so much ($5-26/month)?

Because you have choices:

**Budget**: Oracle Free hosting ($0) + DeepSeek ($3-8) = **$3-8/month**
**Balanced**: Local Mac ($3-5) + Kimi K2 ($10-20) = **$13-25/month**
**Premium**: DigitalOcean ($6) + Claude ($20) = **$26/month**

### Are there any hidden costs?

No. The only costs are:
1. Hosting (where it runs)
2. LLM API (the AI)

No setup fees, no licenses, no per-user fees.

### Can I try it for free first?

Yes:
- Install locally on Mac (free)
- Use DeepSeek's 5M free tokens
- Oracle Cloud has free tier forever

You can test for $0-1 in the first month.

### What happens if I exceed my budget?

Set spending limits at your LLM provider dashboard:
- Kimi: Settings → Spending Limit → $20/month
- DeepSeek: API Settings → Rate Limits

OpenClaw will stop working when you hit the limit (and send you an alert). No surprise bills.

---

## Technical Questions

### What are the system requirements?

**Local Mac**:
- macOS (any recent version)
- Node.js 22 or newer
- 2GB free RAM
- 5GB free disk space

**VPS**:
- Ubuntu 22.04 or newer
- 1GB RAM minimum (2GB recommended)
- 10GB disk space
- Singapore/Southeast Asia region

### Do I need to keep my computer on 24/7?

**Local Mac**: Yes, if you want 24/7 access
**VPS hosting**: No, the VPS runs 24/7 for you

### Can I access OpenClaw from my phone?

Yes! Once set up, you access OpenClaw through:
- WhatsApp (any device)
- Telegram (any device)
- Any messaging app you configure

### What if I travel?

If you're using VPS hosting, you can access OpenClaw from anywhere via WhatsApp/Telegram.

If you're running locally on Mac, OpenClaw only works when your Mac is on and connected to internet.

### Can multiple people use the same OpenClaw?

Yes, but everyone shares the same LLM bill. Better approach:
- Each person sets up their own OpenClaw
- Or use DM Pairing to control who can access

---

## LLM Providers

### Which LLM should I choose?

**Start with Kimi K2** (recommended default):
- Good balance of cost and quality
- 256K context window (very large)
- $10-20/month typical usage

**If absolute cheapest**: DeepSeek ($3-8/month)
**If mostly coding**: Qwen Coder ($1-5/month)
**If premium quality**: Claude ($20/month)

[See full comparison →](PRICING.md)

### Can I switch LLM providers later?

Yes, easily. Just update the configuration file and restart OpenClaw. Takes 2 minutes.

### Can I use multiple LLMs at once?

Yes, OpenClaw supports multiple providers. You could use:
- Kimi K2 for general tasks
- Qwen Coder for code-specific tasks
- Claude for sensitive data

### Is Kimi K2 really free?

No - we initially misunderstood. Kimi K2 costs $0.60/$2.50 per million tokens (~$10-20/month typical usage). There's a $1 minimum to activate and a $5 voucher when you reach $5 spend, but it's not free. Still very affordable.

---

## Messaging Integration

### Does WhatsApp integration require WhatsApp Business?

No, you can use your regular WhatsApp account.

### Will my WhatsApp contacts see the bot?

No. OpenClaw connects to WhatsApp Web (like WhatsApp on your computer). Only you interact with it.

### Can I use both WhatsApp and Telegram?

Yes! You can connect multiple messaging apps to the same OpenClaw instance.

### What about iMessage?

iMessage integration is possible but requires BlueBubbles setup. WhatsApp and Telegram are much easier for beginners.

---

## Hosting Options

### Should I run locally or on VPS?

**Run Locally** if:
- You work from home/office
- Privacy is your #1 priority
- You don't need 24/7 access

**Use VPS** if:
- You travel frequently
- You need 24/7 access
- You want to access from multiple devices

### Which VPS provider should I choose?

**For beginners**: DigitalOcean ($6/month) - easiest setup
**For cost-conscious**: Oracle Cloud Free ($0/month)
**For best value**: Contabo ($5.50/month) - most powerful specs

[See full comparison →](PRICING.md)

### Is Oracle Cloud Free really free forever?

Yes. Oracle has an "Always Free" tier that never expires. It's not a trial - it's genuinely free as long as Oracle continues the program.

### What if Oracle Cloud cancels free tier?

Then switch to Contabo ($5.50/month) or another VPS. Your OpenClaw configuration can be migrated in ~30 minutes.

---

## Usage Questions

### How do I ask OpenClaw to do something?

Just message it like you would message a person:

```
"Summarize my emails from today"
"Translate this to Bahasa Malaysia"
"What's on my calendar tomorrow?"
"Research competitors in Singapore fintech"
```

### Can OpenClaw make mistakes?

Yes, like any AI. Always review:
- Financial data before sending
- Legal advice before acting
- Customer-facing responses before publishing

Think of OpenClaw as a very capable assistant that sometimes needs supervision.

### What can't OpenClaw do?

OpenClaw cannot:
- Access websites that require login (unless you configure it)
- Make phone calls
- Access your banking directly (and shouldn't!)
- Replace human judgment for critical decisions

### How do I stop OpenClaw from doing something?

Message: "Stop" or "Cancel"

Or shut it down completely:
```bash
openclaw stop
```

---

## Troubleshooting

### OpenClaw isn't responding to messages

**Check**:
1. Is OpenClaw running? (`openclaw status`)
2. Is the messaging app connected? (`openclaw dashboard`)
3. Have you approved the sender? (DM Pairing)
4. Is your LLM API working? (check dashboard)

### I'm getting errors about API limits

You've hit your LLM provider's rate limit or spending cap. Check:
- Your LLM provider dashboard
- Increase limits if needed
- Or wait for the limit to reset (usually hourly)

### OpenClaw costs more than expected

Check your LLM provider dashboard for usage. Common causes:
- Sending very long documents repeatedly
- Not utilizing caching (on supported providers)
- Using premium LLM when cheaper would work

**Solution**: Switch to cheaper LLM or optimize usage.

### Installation failed

**Common issues**:
- Node.js version too old (need 22+)
- Missing permissions (run with proper user)
- Firewall blocking ports

**Fix**: See our [Prerequisites Guide](guides/01-prerequisites.md) or run:
```bash
openclaw doctor
```

---

## Business Questions

### Can I use this for my team?

Yes, but consider:
- Each team member could have their own OpenClaw
- Or share one OpenClaw (everyone uses same WhatsApp to access it)
- Costs scale: 5 people = 5× the LLM usage

### Will this replace my employees?

No. OpenClaw is a productivity tool, not a replacement. It handles:
- Routine tasks
- Data processing
- Research
- Draft creation

Your employees still provide:
- Strategic thinking
- Client relationships
- Final decision-making
- Quality control

### Can I bill client work done with OpenClaw?

Yes. OpenClaw is a tool, like Excel or Google Docs. You bill for the value you provide, not the tools you use.

### Is this legal in Singapore/Malaysia?

Yes. OpenClaw is just software. However:
- Follow PDPA regulations for data handling
- Don't use it to violate contracts or IP
- Be transparent with clients if required

### Can I white-label this for clients?

OpenClaw is open-source (Apache 2.0 license), but check the license for commercial redistribution terms. For internal business use, no restrictions.

---

## Comparison Questions

### OpenClaw vs ChatGPT?

| Feature | OpenClaw | ChatGPT Plus |
|---------|----------|--------------|
| **Cost** | $5-26/month | $20/month |
| **Messaging Integration** | WhatsApp, Telegram, Slack | Web only |
| **Automation** | Yes | Limited |
| **Privacy** | Local-first | Cloud-based |
| **Customization** | Full control | Limited |

### OpenClaw vs Zapier?

| Feature | OpenClaw | Zapier |
|---------|----------|--------|
| **Cost** | $5-26/month | $30-75/month |
| **AI Reasoning** | Yes | No |
| **Complexity** | Simple messaging | Complex workflows |
| **Code Execution** | Yes | Limited |

### OpenClaw vs hiring an assistant?

| Feature | OpenClaw | Part-time Assistant |
|---------|----------|-------------------|
| **Cost** | $5-26/month | $1000-2000/month |
| **Availability** | 24/7 | Working hours only |
| **Speed** | Instant | Hours to days |
| **Scalability** | Unlimited | 1 person's capacity |

---

## Getting Started

### What's the quickest way to start?

1. [Install Node.js](guides/01-prerequisites.md) (10 minutes)
2. [Set up DeepSeek](guides/02-llm-providers.md) (10 minutes)
3. [Install locally on Mac](guides/03-local-mac.md) (10 minutes)
4. [Connect WhatsApp](guides/07-whatsapp-setup.md) (5 minutes)

**Total**: 35 minutes from zero to working OpenClaw

### What if I get stuck?

1. Check this FAQ
2. Review the relevant guide
3. Run `openclaw doctor` for diagnostics
4. Join [OpenClaw Discord](https://discord.gg/openclaw)
5. Check [official docs](https://docs.openclaw.ai)

### Can MyEO AI help me set this up?

This is a self-service guide. We don't provide setup support. However, the [OpenClaw community](https://discord.gg/openclaw) is very helpful for troubleshooting.

---

## Still Have Questions?

- Read our [Security Guide](SECURITY.md)
- Review [Pricing Details](PRICING.md)
- Explore [Use Cases](USE-CASES.md)
- Join [OpenClaw Discord](https://discord.gg/openclaw)

---

**Ready to start? → [Prerequisites Guide](guides/01-prerequisites.md)**
