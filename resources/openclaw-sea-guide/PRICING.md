# Pricing Guide: Complete Cost Breakdown

**Transparent pricing for running OpenClaw in Southeast Asia**

---

## Executive Summary

**Total Monthly Cost: $5-25 (depending on choices)**

You can run a powerful AI assistant for less than:
- 2 movie tickets in Singapore
- 1 meal at a nice restaurant in KL
- 1 month of Netflix Premium

---

## Cost Components

There are only 2 costs to run OpenClaw:

1. **Hosting** - Where OpenClaw runs ($0-6/month)
2. **LLM API** - The AI brain ($5-20/month)

**Total: $5-26/month** for full automation capabilities

---

## LLM Provider Pricing (The AI Brain)

### Option 1: Kimi K2 (RECOMMENDED)

**Best balance of cost, quality, and context size.**

| Detail | Value |
|--------|-------|
| **Provider** | Moonshot AI (China) |
| **Cost** | $0.60 per 1M input tokens, $2.50 per 1M output tokens |
| **Context Window** | 256K tokens (huge - can read entire codebases) |
| **Activation** | $1 minimum to start |
| **Bonus** | $5 voucher when you reach $5 cumulative spend |
| **Cache Savings** | 75% off for repeated queries ($0.15/M cached) |
| **Free Tier** | No free tier |

**Monthly Cost Estimate:**
- Light use (5M tokens): ~$10/month
- Medium use (10M tokens): ~$15/month
- Heavy use (20M tokens): ~$20-25/month

**Why Recommended:**
- 256K context = can understand very large documents
- Strong coding capabilities
- Affordable pricing
- Good balance for business use

**Setup**: [Kimi K2 Setup Guide](guides/02-llm-providers.md#kimi-k2)

---

### Option 2: DeepSeek V3 (CHEAPEST)

**Best for absolute minimum cost.**

| Detail | Value |
|--------|-------|
| **Provider** | DeepSeek (China) |
| **Cost** | $0.28 per 1M input, $0.42 per 1M output |
| **Context Window** | 128K tokens |
| **Activation** | Sign up required |
| **Free Tier** | 5M free tokens for new users |

**Monthly Cost Estimate:**
- Light use (5M tokens): ~$3-5/month
- Medium use (10M tokens): ~$5-8/month
- Heavy use (20M tokens): ~$8-12/month

**Why Choose:**
- Cheapest option available
- 90%+ cheaper than Claude/GPT-4
- Excellent for coding tasks
- Free 5M tokens to start

**Setup**: [DeepSeek Setup Guide](guides/02-llm-providers.md#deepseek)

---

### Option 3: Qwen 2.5 Coder (BEST FOR CODE)

**Specialized for coding assistance.**

| Detail | Value |
|--------|-------|
| **Provider** | Alibaba Cloud (strong SEA presence) |
| **Cost** | $0.03 per 1M input (yes, 3 cents!) |
| **Context Window** | 128K tokens |
| **Specialty** | Code generation and analysis |

**Monthly Cost Estimate:**
- Light use: ~$1-2/month
- Medium use: ~$3-5/month
- Heavy use: ~$5-8/month

**Why Choose:**
- Unbeatable value for coding
- Alibaba has strong presence in SEA
- Batch and off-peak discounts available

**Setup**: [Qwen Setup Guide](guides/02-llm-providers.md#qwen)

---

### Option 4: Claude via OAuth (PREMIUM)

**Best quality, highest cost.**

| Detail | Value |
|--------|-------|
| **Provider** | Anthropic (US) |
| **Cost** | Use existing Claude Pro/Max subscription |
| **Context Window** | 200K tokens |
| **Quality** | Highest reasoning quality |
| **Subscription** | $20/month (Pro) or $200/month (Max) |

**Monthly Cost Estimate:**
- If you already have Claude Pro: $20/month (no additional API costs)
- If buying specifically for OpenClaw: $20-200/month

**Why Choose:**
- You already have Claude Pro subscription
- Need absolute best quality
- Compliance requirements (SOC 2 Type II certified)
- Data privacy (US-based)

**Setup**: [Claude Setup Guide](guides/02-llm-providers.md#claude)

---

## Hosting Options (Where OpenClaw Runs)

### Option 1: Local Mac (Maximum Privacy)

**Run OpenClaw on your own computer.**

| Component | Cost |
|-----------|------|
| Your existing Mac | $0 |
| Electricity (~5W continuous) | ~$3-5/month |
| **Total Hosting Cost** | **$3-5/month** |

**Total with LLM:**
- With Kimi K2: $13-25/month
- With DeepSeek: $8-13/month
- With Qwen Coder: $4-10/month

**Pros:**
- Maximum privacy (data never leaves your machine)
- No additional hosting costs
- Fastest response time
- Full control

**Cons:**
- Mac must stay running 24/7
- No access when Mac is off/traveling
- Uses Mac resources

**Best For:** Home office users, privacy-focused businesses

**Setup**: [Local Mac Guide](guides/03-local-mac.md)

---

### Option 2: Oracle Cloud Free Tier (BEST VALUE)

**Free forever hosting in Singapore region.**

| Component | Cost |
|-----------|------|
| ARM VM (4 CPU, 24GB RAM) | **$0/month (Always Free)** |
| 200GB storage | **$0/month** |
| 10TB bandwidth | **$0/month** |
| **Total Hosting Cost** | **$0/month** |

**Total with LLM:**
- With DeepSeek: $3-8/month
- With Qwen Coder: $1-5/month
- With Kimi K2: $10-20/month

**Pros:**
- Free forever (not a trial)
- Powerful specs (4 CPU, 24GB RAM)
- Singapore region available
- Always accessible

**Cons:**
- More technical setup required
- ARM architecture (Node.js compatible, but different)
- Popular free tier = sometimes waitlist

**Best For:** Cost-conscious users comfortable with cloud setup

**Setup**: [Oracle Cloud Guide](guides/04-oracle-cloud-free.md)

---

### Option 3: DigitalOcean 1-Click (EASIEST)

**Easiest VPS option with one-click security-hardened deployment.**

| Component | Cost |
|-----------|------|
| Basic Droplet (1GB RAM) | $6/month |
| Bandwidth (1TB included) | $0 |
| **Total Hosting Cost** | **$6/month** |

**Total with LLM:**
- With Kimi K2: $16-26/month
- With DeepSeek: $9-14/month
- With Qwen Coder: $7-11/month

**Pros:**
- One-click deployment
- Security-hardened by default
- Excellent documentation
- Singapore datacenter
- Free $200 credit for new users (60 days)

**Cons:**
- Monthly hosting fee
- Slightly lower specs than Oracle Free

**Best For:** Non-technical users wanting easiest setup

**Setup**: [DigitalOcean Guide](guides/05-digitalocean.md)

---

### Option 4: Contabo VPS (BEST PAID VALUE)

**Most powerful specs for the price.**

| Component | Cost |
|-----------|------|
| VPS S (4 CPU, 8GB RAM) | $5.50/month |
| 100GB NVMe storage | Included |
| Unlimited bandwidth | Included |
| **Total Hosting Cost** | **$5.50/month** |

**Total with LLM:**
- With Kimi K2: $15-25/month
- With DeepSeek: $8-13/month
- With Qwen Coder: $6-10/month

**Pros:**
- Best specs-to-price ratio
- Unlimited bandwidth
- Singapore datacenter
- x86 architecture (standard)

**Cons:**
- Monthly fee
- Slightly more complex setup than DO
- Less beginner-friendly UI

**Best For:** Users wanting reliable paid hosting with great value

**Setup**: [Contabo Guide](guides/06-contabo-vps.md)

---

## Total Monthly Cost Comparison

### Budget Setup (Under $10/month)

**Best for cost-conscious users:**
- **Hosting**: Oracle Cloud Free ($0)
- **LLM**: DeepSeek ($3-8/month) or Qwen Coder ($1-5/month)
- **Total**: $1-8/month

### Recommended Setup ($15-25/month)

**Best balance of ease and cost:**
- **Hosting**: Local Mac ($3-5/month) or DigitalOcean ($6/month)
- **LLM**: Kimi K2 ($10-20/month)
- **Total**: $13-26/month

### Premium Setup ($25-35/month)

**Best quality and convenience:**
- **Hosting**: DigitalOcean ($6/month)
- **LLM**: Claude Pro ($20/month)
- **Total**: $26/month

---

## Cost Comparison with Alternatives

| Service | Monthly Cost | What You Get |
|---------|--------------|--------------|
| **OpenClaw (Budget)** | $1-8/month | Full automation, your choice of AI, privacy control |
| **OpenClaw (Recommended)** | $13-26/month | Balanced performance, good quality, affordable |
| **ChatGPT Plus** | $20/month | ChatGPT only, no automation, web-only |
| **Claude Pro** | $20/month | Claude only, no automation, web-only |
| **GitHub Copilot** | $10/month | Code only, no general automation |
| **Zapier** | $30-75/month | Limited automation, no AI reasoning |

**OpenClaw's advantage**: More features for less cost.

---

## Usage-Based Cost Calculator

### Typical Token Usage Estimates

**Email Summary** (100 emails/day):
- Input: ~500K tokens/month
- Output: ~100K tokens/month
- **Total**: ~600K tokens/month

**Document Processing** (10 docs/week):
- Input: ~200K tokens/month
- Output: ~50K tokens/month
- **Total**: ~250K tokens/month

**General Assistance** (50 queries/day):
- Input: ~1M tokens/month
- Output: ~500K tokens/month
- **Total**: ~1.5M tokens/month

**Heavy Use** (All of the above):
- **Total**: ~2.5M tokens/month

### Calculate Your Cost

```
Total Tokens per Month = ________________

With Kimi K2:
(Input tokens × 0.60) + (Output tokens × 2.50) = $_____/month

With DeepSeek:
(Input tokens × 0.28) + (Output tokens × 0.42) = $_____/month

With Qwen Coder:
(Input tokens × 0.03) = $_____/month
```

**Rule of thumb**: Most business users consume 1-3M tokens/month.

---

## How to Minimize Costs

### 1. Start with Free Tier

- DeepSeek: 5M free tokens to start
- Oracle Cloud: Forever free hosting

**Month 1 Cost: $0-1** (just activation fee)

### 2. Enable Caching

Kimi K2 has 75% cache discount:
- First query: $0.60/M
- Repeated query: $0.15/M

**Example**: Daily email summaries benefit hugely from caching.

### 3. Set Spending Limits

All LLM providers allow monthly caps:
- Kimi: Dashboard → Settings → Spending Limit
- DeepSeek: API Settings → Rate Limits
- Set to $20/month max

### 4. Use Batch Processing

Qwen and Alibaba Cloud offer:
- 50% discount for batch API
- 50% discount during off-peak hours

**Combine both**: 75% total savings

### 5. Choose Right LLM for Task

| Task Type | Best LLM | Reasoning |
|-----------|----------|-----------|
| Code generation | Qwen Coder | Specialized + cheapest |
| Document summarization | DeepSeek | Cheap + capable |
| Complex reasoning | Kimi K2 | Large context |
| Sensitive data | Claude | Compliance certified |

---

## Payment Methods Accepted

### LLM Providers

| Provider | Payment Methods |
|----------|----------------|
| **Kimi** | Credit card, Alipay, WeChat Pay |
| **DeepSeek** | Credit card, Alipay |
| **Qwen/Alibaba** | Credit card, regional payment methods |
| **Claude** | Credit card (Visa, Mastercard, Amex) |

### VPS Providers

| Provider | Payment Methods |
|----------|----------------|
| **Oracle Cloud** | Credit card (free tier needs CC on file) |
| **DigitalOcean** | Credit card, PayPal |
| **Contabo** | Credit card, PayPal, SEPA |

**Recommendation**: Use a virtual credit card (Wise, Revolut) with monthly spending limit for added security.

---

## Hidden Costs? (None!)

**We hate hidden fees. Here's what you DON'T pay for:**

- ❌ Setup fees
- ❌ License fees (OpenClaw is free)
- ❌ Support contracts
- ❌ Minimum commitments
- ❌ Per-user fees
- ❌ Data transfer fees (within reasonable limits)

**What you see is what you pay.**

---

## Free Trial Strategy

**How to test OpenClaw for $0-1:**

1. **Week 1**: Install locally on Mac (free)
2. **Week 2**: Try DeepSeek free tier (5M tokens)
3. **Week 3**: Oracle Cloud free tier + Qwen Coder ($1-3)
4. **Week 4**: Decide if you want to continue

**After 1 month**: You'll know exactly which setup works for you.

---

## ROI Analysis for Businesses

**Time Saved per Month:**
- Email management: 5 hours × $50/hr = $250
- Document processing: 3 hours × $50/hr = $150
- Research: 4 hours × $50/hr = $200
- **Total Value**: $600/month

**Cost**: $13-26/month
**ROI**: 2,300-4,600%

**Payback period**: Less than 1 day

---

## Questions?

See our [FAQ](FAQ.md) or [Contact Us](mailto:hello@myeo.ai).

---

**Ready to get started? → [Prerequisites Guide](guides/01-prerequisites.md)**
