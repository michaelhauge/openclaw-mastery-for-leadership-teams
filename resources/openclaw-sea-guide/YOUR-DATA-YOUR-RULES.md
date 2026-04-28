# Your Data, Your Rules: Data Privacy for AI-Powered Businesses

**Understanding data privacy, PDPA compliance, and provider policies - no legal jargon**

---

## The Problem This Guide Solves

You're thinking about using OpenClaw for your business, but you have legitimate concerns:

- "If I send client emails to Claude, does Anthropic own that data?"
- "Will my company's financial data be used to train someone else's AI?"
- "Is this PDPA-compliant in Singapore/Malaysia?"
- "What happens if there's a data breach at the LLM provider?"
- "Can I use AI for healthcare/legal/financial data?"

**This guide answers all of these questions in plain English.**

If [HOW-AI-THINKS.md](HOW-AI-THINKS.md) explains "how AI works," this guide explains "what happens to your data when you use AI."

---

## Table of Contents

1. [The Consultant Confidentiality Framework](#1-the-consultant-confidentiality-framework---the-core-metaphor)
2. [What Each Provider Does With Your Data](#2-what-each-provider-does-with-your-data)
3. [PDPA Compliance for Singapore & Malaysia](#3-pdpa-compliance-for-singapore--malaysia)
4. [Open Source Explained](#4-open-source-explained---what-it-actually-means)
5. [Your Data Decision Tree](#5-your-data-decision-tree)

---

## 1. The Consultant Confidentiality Framework - The Core Metaphor

### The Question Everyone Asks

**"If I hire a consultant and tell them confidential business information, do they own my secrets?"**

**Answer**: No. But the consultant DOES remember what you told them (for a while), and different consulting firms have different confidentiality policies.

**That's exactly how LLM providers work.**

---

### The Three Key Questions

When you send data to an LLM (via OpenClaw), ask:

| Question | Why It Matters | Business Equivalent |
|----------|----------------|---------------------|
| **1. Is my data used for training?** | If yes, your secrets could leak to other customers | Does the consultant use my case as a teaching example for other clients? |
| **2. How long is my data retained?** | Shorter = less risk | How long does the consultant keep meeting notes? |
| **3. Who can access my data?** | Fewer people = more secure | Can junior staff read my confidential files? |

---

### The Inference vs. Training Distinction (Again)

**This is THE most important concept for understanding data privacy.**

| What You're Doing | Technical Term | Is Your Data Used for Training? | Analogy |
|-------------------|----------------|--------------------------------|---------|
| Using OpenClaw with an API key | **Inference** | **NO** (for most providers) | Hiring a consultant for a one-time project |
| Uploading company docs to create a custom model | **Fine-tuning** | **YES** (intentionally) | Sending a consultant back to school using YOUR company as the curriculum |

**Critical insight**: 99% of OpenClaw users are doing INFERENCE, not training. Your conversations are NOT automatically used to train future models.

---

### What "Not Used for Training" Actually Means

**What it DOES mean**:
- Your prompts and responses won't improve future versions of Claude/GPT/Kimi
- Other customers won't benefit from knowledge gleaned from YOUR data
- The provider won't use your data to create new AI products

**What it DOES NOT mean**:
- Your data is never stored (it's stored temporarily - see retention periods)
- The provider can't read your data (they technically CAN, but have policies against it)
- Your data is unhackable (all systems have risk)

**Analogy**: When you hire a lawyer under attorney-client privilege:
- They CAN read your documents (they have to, to help you)
- They promise NOT to share with others (professional ethics)
- They keep records for a period (legal requirement)
- But there's still SOME risk (office break-in, rogue employee)

---

## 2. What Each Provider Does With Your Data

### The Provider Comparison Table

**As of February 2025** (check provider terms for updates)

| Provider | Training on Your Data? | Retention Period | Who Can Access? | Data Location | Zero-Retention Option? |
|----------|------------------------|------------------|-----------------|---------------|------------------------|
| **Anthropic (Claude)** | NO | 30 days, then deleted | Only with legal warrant | US (AWS) | YES ($30/month min) |
| **OpenAI (GPT)** | NO (for API usage) | 30 days | Only if abuse detected | US (Azure) | YES (Enterprise only) |
| **Moonshot (Kimi)** | NO | 30 days (encrypted) | Zero-access encryption | China (Alibaba Cloud) | NO |
| **DeepSeek** | NO (stated policy) | 90 days | Not disclosed | China | NO |
| **Alibaba (Qwen)** | NO (for commercial API) | 30 days | Not disclosed | China (Alibaba Cloud) | NO |
| **Google (Gemini)** | NO (for API) | 18 months (anonymized) | Google admins (limited) | US/EU (Google Cloud) | NO (as of Feb 2025) |

---

### Anthropic (Claude) - The Gold Standard for Privacy

**Policy summary**:
- **Training**: NO. "We do not train on business or API usage data."
- **Retention**: 30 days (to support debugging/abuse detection), then permanently deleted
- **Access**: Only if legally compelled (court order, warrant)
- **Zero-retention option**: YES. Enterprise customers can opt for immediate deletion after each API call (no 30-day retention)

**PDPA compliance**: ✅ YES. US-based, but GDPR-compliant (which is stricter than PDPA).

**Best for**:
- Law firms, accounting firms, healthcare providers
- Any business handling sensitive client data
- Companies with strict compliance requirements

**Cost**: Standard API ($3/million tokens). Zero-retention requires Enterprise plan ($30/month minimum).

**Source**: https://www.anthropic.com/legal/privacy

---

### OpenAI (GPT-4o, GPT-4) - Strong Privacy with Caveats

**Policy summary**:
- **Training**: NO for API usage. YES for ChatGPT free tier.
- **Retention**: 30 days (for abuse monitoring)
- **Access**: Only if abuse/safety issues detected
- **Zero-retention option**: YES (Enterprise customers)

**Important caveat**: If you use ChatGPT web interface (chat.openai.com), different rules apply. For privacy, use API only (how OpenClaw connects).

**PDPA compliance**: ✅ YES. US-based, GDPR-compliant.

**Best for**:
- General business use
- Vision/multimodal tasks (GPT-4o handles images well)

**Cost**: Standard API ($2.50/million tokens for GPT-4o).

**Source**: https://openai.com/policies/privacy-policy

---

### Moonshot (Kimi) - China-Based, but Privacy-Focused

**Policy summary**:
- **Training**: NO. "We do not use customer data for model training."
- **Retention**: 30 days (encrypted at rest)
- **Access**: Claims "zero-access encryption" (provider can't read your data)
- **Zero-retention option**: NO

**PDPA compliance**: ⚠️ PARTIAL. China-based company, subject to Chinese data laws. However, complies with Singapore's PDPA for SG-based customers.

**Best for**:
- Cost-conscious businesses (very cheap)
- SEA language support (strong Bahasa Malaysia/Indonesia support)
- Non-regulated industries (marketing, operations, general admin)

**Avoid for**:
- Highly sensitive client data (finance, healthcare, legal)
- US/EU clients (may have data residency restrictions)

**Cost**: $0.30/million tokens (cheapest quality option).

**Source**: https://www.moonshot.cn/legal/privacy

---

### DeepSeek - Cheapest, but Least Transparent

**Policy summary**:
- **Training**: NO (stated in ToS)
- **Retention**: 90 days (longer than others)
- **Access**: Not clearly disclosed
- **Zero-retention option**: NO

**PDPA compliance**: ⚠️ UNCLEAR. China-based, ToS is less detailed than Western providers.

**Best for**:
- Experimentation, high-volume low-stakes tasks
- Internal tools (not client-facing)

**Avoid for**:
- Anything client-facing
- Regulated industries
- When PDPA compliance must be documented

**Cost**: $0.14-0.27/million tokens (cheapest option).

**Source**: https://www.deepseek.com/terms

---

### The Privacy Hierarchy

**Most private** → **Least private**:

1. **Self-hosted open-source models** (Llama, Qwen - data never leaves your server)
2. **Anthropic (Claude) with zero-retention** (data deleted immediately)
3. **Anthropic (Claude) standard** (30-day retention)
4. **OpenAI (GPT) API** (30-day retention)
5. **Moonshot (Kimi)** (China-based, but privacy-focused)
6. **DeepSeek** (China-based, less transparent)
7. **ChatGPT free tier** (data used for training)

---

## 3. PDPA Compliance for Singapore & Malaysia

### What is PDPA?

**Singapore PDPA** (Personal Data Protection Act):
- Regulates collection, use, and disclosure of personal data
- Requires consent, purpose limitation, data security
- Fines up to S$1 million for breaches

**Malaysia PDPA**:
- Similar to Singapore's PDPA
- Regulates processing of personal data
- Fines up to RM500,000 for breaches

---

### Is Using OpenClaw PDPA-Compliant?

**Short answer**: It depends on:
1. What LLM provider you use
2. What data you send in prompts
3. Your company's data handling policy

---

### The PDPA Compliance Checklist

| Requirement | How to Comply | Example |
|-------------|---------------|---------|
| **1. Consent** | Get client consent before processing their data with AI | Add clause to service agreements: "We may use AI tools to process your information" |
| **2. Purpose Limitation** | Only use AI for stated purposes | If you said "AI for email management," don't suddenly use it for marketing research on client data |
| **3. Data Minimization** | Don't send unnecessary personal data | Remove client names, NRIC, phone numbers before prompting AI |
| **4. Security** | Use reputable providers with encryption | Choose Claude/GPT (strong security) over unknown startups |
| **5. Retention** | Don't keep data longer than needed | Use providers with 30-day retention, not 90+ days |
| **6. Cross-Border Transfer** | Ensure overseas providers have adequate protection | US/EU providers (GDPR) are generally acceptable; China-based requires more scrutiny |

---

### Singapore-Specific Guidance

**From PDPC (Personal Data Protection Commission)**:

**Can I use AI tools that send data overseas?**
- ✅ YES, if the overseas provider has "comparable data protection standards"
- ✅ US providers with GDPR compliance (Claude, GPT) are generally acceptable
- ⚠️ China-based providers (Kimi, DeepSeek) require additional assessment

**Do I need to tell clients I'm using AI?**
- ✅ YES, if the AI processes their personal data
- Can be included in privacy policy or service agreements
- Should explain: what data, what AI tool, what purpose

**What counts as "personal data"?**
- Name, NRIC, phone, email, address
- Financial data, health data
- IP addresses, device IDs
- **Even if anonymized, if it can be re-identified, it's personal data**

**Source**: https://www.pdpc.gov.sg/

---

### Malaysia-Specific Guidance

**From PDPA Malaysia**:

**Similar to Singapore, with additions**:
- **MyKad numbers** = sensitive personal data (extra protection required)
- **Financial data** for Islamic banking has additional Sharia compliance requirements
- **Health data** requires explicit consent

**Can I use AI for client data?**
- ✅ YES, if you have consent and the AI provider has adequate safeguards
- ⚠️ Healthcare/medical data has stricter rules (check with legal counsel)

**Source**: https://www.pdp.gov.my/

---

### Industry-Specific Rules

| Industry | Additional Requirements | Recommended Provider |
|----------|------------------------|----------------------|
| **Accounting** | Client financial data = sensitive. Avoid NRIC in prompts. | Claude (zero-retention) or GPT-4o |
| **Legal** | Attorney-client privilege applies. Use zero-retention. | Claude (zero-retention) |
| **Healthcare** | PHI (Protected Health Information) requires HIPAA-equivalent. | Claude Enterprise or self-hosted models |
| **Financial Services** | MAS (Monetary Authority of SG) rules apply. Document AI use. | Claude or GPT-4o (US-based, regulated) |
| **General SMEs** | Standard PDPA compliance. Consent + security. | Kimi or Claude (depending on budget) |

---

### The "Sanitize Your Prompts" Policy

**For PDPA compliance, implement this rule:**

**❌ DON'T** send raw client data:
```
Prompt: "Draft an email to Tan Wei Ming (NRIC: S1234567A) about his overdue
invoice for $5,432. His account number is 98765432."
```

**✅ DO** sanitize first:
```
Prompt: "Draft an email to a client about an overdue invoice of $5,432.
Professional but firm tone. Remind them of late payment penalty (3% per month)."
```

**Why this works**:
- AI doesn't need the client's name/NRIC to draft the email
- You fill in the name later (manually)
- Reduces PDPA risk because no personal data sent to LLM provider

---

## 4. Open Source Explained - What It Actually Means

### The Confusion: "Open Source" ≠ "Your Data is Private"

**Common misconception**:
"If I use an open-source model (Llama, Qwen), my data is automatically private."

**Reality**:
"Open source" means you CAN download and run the model yourself. But if you use it via an API (like Qwen via Alibaba Cloud), your data still goes to the provider's servers.

---

### The Three Scenarios

| Scenario | Privacy Level | Technical Complexity | Cost |
|----------|---------------|---------------------|------|
| **1. Open-source, self-hosted** (Llama on your own server) | ✅ HIGHEST (data never leaves your server) | Very high (requires GPU server, technical expertise) | High ($100-500/month for GPU hosting) |
| **2. Open-source, cloud API** (Qwen via Alibaba Cloud) | ⚠️ MODERATE (data goes to Alibaba's servers) | Low (just use API key) | Low ($0.12/million tokens) |
| **3. Closed-source, cloud API** (Claude via Anthropic) | ⚠️ MODERATE (data goes to Anthropic's servers) | Low (just use API key) | Moderate ($3/million tokens) |

---

### Self-Hosting: When It's Worth It

**✅ Worth it if**:
- You're a hospital, law firm, or defense contractor (extreme privacy requirements)
- You have >50 employees using AI daily (volume justifies cost)
- You have a technical team (DevOps/MLOps expertise)

**❌ NOT worth it if**:
- You're a typical SME (< 50 employees)
- You don't have in-house AI/DevOps talent
- Budget-conscious (self-hosting costs more than API for low volume)

**Real cost comparison** (for 1 million tokens/month):

| Option | Setup Cost | Monthly Cost | Technical Expertise Required |
|--------|------------|--------------|------------------------------|
| **Self-hosted Llama** | $2,000-5,000 (server setup) | $200-500 (GPU instance) | High (DevOps, ML engineering) |
| **Claude API** | $0 | $3-4 | None (just API key) |
| **Kimi API** | $0 | $0.30 | None (just API key) |

**For 99% of SEA SMEs**: Use API (Claude or Kimi). Self-hosting isn't worth it.

---

### What "Open Source" Actually Means

**Open source** = You can:
- Download the model weights (the "brain")
- Run it on your own hardware
- Modify it (if you have ML expertise)
- See the training code (sometimes)

**Open source does NOT mean**:
- Free to use (you still pay for compute/hosting)
- Automatically private (depends on WHERE you run it)
- Easy to use (requires technical setup)

**Examples of open-source models**:
- Llama 3 (Meta)
- Qwen (Alibaba)
- DeepSeek
- Mistral

---

## 5. Your Data Decision Tree

### The Ultimate Guide: Which Provider Should You Use?

**Answer 6 questions to find the right fit:**

---

#### Question 1: Are you in a regulated industry?

**Regulated industries**: Healthcare, legal, accounting, financial services

```
YES → Use Claude (zero-retention) or self-hosted
NO → Continue to Question 2
```

---

#### Question 2: Do you handle sensitive client data?

**Sensitive data**: NRIC, MyKad, financial accounts, health records, legal documents

```
YES → Use Claude (standard) or GPT-4o
NO → Continue to Question 3
```

---

#### Question 3: Is your budget very tight?

**Budget threshold**: < $20/month for LLM costs

```
YES → Use Kimi K2 or DeepSeek
NO → Continue to Question 4
```

---

#### Question 4: Do you need vision/multimodal?

**Multimodal**: Analyzing images, PDFs with images, charts

```
YES → Use GPT-4o or Claude Sonnet (with vision)
NO → Continue to Question 5
```

---

#### Question 5: Do you work mostly in Bahasa/Chinese?

**Non-English languages**: Bahasa Malaysia/Indonesia, Chinese

```
YES → Use Kimi K2 (best SEA language support)
NO → Continue to Question 6
```

---

#### Question 6: Default recommendation

```
Use Claude Sonnet 4.5 (best balance of privacy, quality, cost)
```

---

### The Quick Recommendation Matrix

| Your Situation | Recommended Provider | Why |
|----------------|---------------------|-----|
| **Law firm, accounting firm** | Claude (zero-retention) | PDPA compliance, attorney-client privilege |
| **Healthcare provider** | Claude Enterprise or self-hosted | PHI/health data protection |
| **Financial services** | Claude or GPT-4o | MAS compliance, strong security |
| **Marketing agency** | Kimi K2 | Cheap, fast, good quality for non-sensitive work |
| **General SME (< 20 employees)** | Kimi K2 or Claude Sonnet | Balance of cost and quality |
| **Tech company (>50 employees)** | Self-hosted Llama or Claude Enterprise | Volume justifies investment |

---

### The Privacy Workflow

**Regardless of which provider you choose, follow this workflow:**

1. **Classify your data**:
   - Public (website content, marketing materials) → Any provider OK
   - Internal (employee data, financial projections) → Claude or GPT-4o
   - Client data (contracts, client emails) → Claude (zero-retention) or self-hosted
   - Regulated data (NRIC, health records) → Claude Enterprise or self-hosted

2. **Sanitize prompts**:
   - Remove names, NRIC, account numbers BEFORE sending to AI
   - Use placeholders: "Client A," "Account XXX"

3. **Document your policy**:
   - Write a 1-page "AI Usage Policy"
   - Include: What tools, what data, what safeguards, who approved it
   - Share with team, include in staff training

4. **Review outputs**:
   - NEVER send AI-generated content directly to clients without human review
   - Especially for legal, financial, medical advice

---

## Real-World Example: Accounting Firm Policy

**Case study**: Singapore accounting firm (12 staff) implemented this AI policy after the "GST rate error" incident:

---

**XYZ Accounting's AI Usage Policy** (simplified version)

**Tools allowed**:
- OpenClaw with Claude API (standard, 30-day retention)
- For highly sensitive client data: Claude zero-retention (Enterprise plan)

**Permitted uses**:
- Email drafting (after sanitizing client names/NRIC)
- Meeting prep (summarizing client history from internal notes)
- Research (tax law, regulatory changes)

**Prohibited uses**:
- Sending client financial statements directly to AI (must sanitize first)
- Using AI for final tax filings (AI drafts, human verifies and signs)
- Uploading client NRIC or bank account numbers

**Sanitization rules**:
- Replace client names with "Client A," "Client B"
- Replace NRIC with "NRIC: XXX"
- Replace account numbers with "Account: XXX"
- Remove specific dollar amounts if not necessary for the prompt

**Human review required**:
- ALL client-facing communications (emails, reports, tax advice)
- ALL financial calculations (AI can suggest, human must verify)
- Anything involving regulations or compliance

**Training**:
- All staff trained on this policy (1-hour session)
- Monthly reminders on Slack
- Quarterly review of policy

---

**Results**:
- Zero PDPA complaints since implementation
- No further "hallucination" errors in client communications
- AI saves 8-10 hours/week per accountant (but with proper safeguards)

---

## Quick Reference Card

**Print this and keep it at your desk:**

### The 3 Rules for PDPA-Compliant AI Use

1. **Sanitize First**
   - Remove names, NRIC, account numbers BEFORE sending to AI
   - Use placeholders ("Client A," "Account XXX")

2. **Choose the Right Provider**
   - Regulated industries → Claude (zero-retention)
   - General business → Claude or Kimi
   - Budget-conscious → Kimi or DeepSeek (but not for client data)

3. **Human Review Always**
   - NEVER send AI output directly to clients
   - Verify facts, numbers, regulations
   - You're legally responsible, not the AI

---

### The Provider Quick Compare

| Provider | Privacy Level | Cost | Best For |
|----------|---------------|------|----------|
| **Claude** | ⭐⭐⭐⭐⭐ | $$$ | Legal, finance, healthcare |
| **GPT-4o** | ⭐⭐⭐⭐ | $$ | General business, vision tasks |
| **Kimi** | ⭐⭐⭐ | $ | Marketing, operations, SEA languages |
| **DeepSeek** | ⭐⭐ | $ | Experimentation, non-critical tasks |

---

## What to Read Next

- **[How AI Thinks](HOW-AI-THINKS.md)** - Understanding LLMs, hallucination, and models
- **[Prompting Guide](PROMPTING-GUIDE.md)** - Writing better prompts
- **[Security Guide](SECURITY.md)** - Complete security and risk overview

---

**Questions or feedback?** Open an issue on GitHub or join the OpenClaw Discord community.

---

**Legal Disclaimer**: This guide is for educational purposes only and does not constitute legal advice. Consult a lawyer for specific PDPA compliance requirements for your business.
