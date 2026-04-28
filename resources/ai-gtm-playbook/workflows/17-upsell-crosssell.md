# 17. Upsell & Cross-Sell Identifier

**Funnel Stage**: RETENTION
**Time Saved**: 4-6 hours per week
**Tools**: Claude + CRM data / Google Sheets
**Difficulty**: Intermediate

---

## What This Workflow Does

This workflow takes your existing customer data — purchase history, engagement signals, contract renewal dates, and support interactions — and outputs a prioritised list of expansion opportunities per account. Instead of guessing which customers are ready to upgrade, AI analyses behavioural and firmographic patterns to surface the right accounts at the right time with the right offer.

## The Prompt Template

```
You are a senior customer success strategist. I'm going to give you data about one of my existing customers. Your job is to identify the best upsell and cross-sell opportunities and give me a prioritised action plan.

MY BUSINESS CONTEXT:
- Company name: [YOUR COMPANY NAME]
- What we sell: [YOUR PRODUCT/SERVICE DESCRIPTION]
- Our product/service tiers or add-ons:
  [LIST YOUR TIERS, PACKAGES, OR ADD-ONS - e.g., Basic/Pro/Enterprise, or Module A/B/C]
- Average contract value: RM [AMOUNT]
- Typical upsell trigger signals: [e.g., hitting usage limits, asking for features they don't have, expanding headcount]

CUSTOMER DATA:
- Company name: [CUSTOMER NAME]
- Industry: [INDUSTRY]
- Current plan/package: [WHAT THEY'RE CURRENTLY BUYING]
- Monthly spend: RM [AMOUNT]
- Contract renewal date: [DATE]
- Number of users/seats: [NUMBER]
- Usage patterns (if known): [e.g., "uses 80% of their storage limit every month", "logs in daily", "only uses 2 of 5 features"]
- Recent support tickets or complaints: [SUMMARY OR "None"]
- Recent positive feedback or wins: [SUMMARY OR "None"]
- Company growth signals: [e.g., "recently hired 3 new staff", "expanded to Penang", "launched new product line"]
- Last engagement date: [DATE]
- Relationship health (1-10): [SCORE]

TASK:
1. Identify the TOP 3 upsell or cross-sell opportunities for this account, ranked by likelihood of conversion.
2. For each opportunity:
   a. Name the specific product/tier/add-on to pitch
   b. Explain WHY this customer is a good fit RIGHT NOW (use their specific data)
   c. Write a 2-3 sentence conversational pitch I can use in a call or WhatsApp message
   d. Flag any risks or objections I should prepare for
3. Recommend the best timing and channel (call, email, WhatsApp) for each approach.
4. Give me one "early warning" signal to watch for that would indicate this account is at churn risk instead.

Format your response with clear headers for each opportunity.
```

## How to Use It

1. Export your customer data from your CRM (HubSpot, Salesforce, or even a Google Sheet). You need at minimum: current package, spend, usage data, and any recent interactions.
2. Run the prompt once per account you want to evaluate. For bulk analysis, paste data for 3-5 customers in one session and ask Claude to compare them and rank which account has the highest expansion potential.
3. Take the output pitch language and load it into your CRM as a task/note, or send directly via WhatsApp or email.

## Example Input

```
MY BUSINESS CONTEXT:
- Company name: DataSync Solutions Sdn Bhd
- What we sell: HR software for SMEs — payroll, leave management, and performance tracking
- Our product tiers: Starter (up to 30 staff, RM 299/mo), Growth (up to 100 staff, RM 699/mo), Enterprise (unlimited, RM 1,499/mo)
- Add-ons: Custom reporting module (RM 150/mo), Recruitment module (RM 250/mo), API access (RM 200/mo)
- Average contract value: RM 600/month
- Typical upsell trigger signals: approaching staff limit, requesting custom reports, asking about integrations

CUSTOMER DATA:
- Company name: Berjaya Tekstil Sdn Bhd
- Industry: Apparel manufacturing
- Current plan: Starter (RM 299/mo)
- Monthly spend: RM 299
- Contract renewal: 3 months away
- Number of users: 27 staff on system (limit is 30)
- Usage: Logs in daily, uses payroll and leave heavily, has never used performance tracking
- Support tickets: One ticket last month asking "can we add more employees without upgrading?"
- Positive feedback: "Payroll used to take us 2 days, now it's 2 hours"
- Growth signals: Owner mentioned they're hiring 5 factory workers next quarter for a new export contract
- Last engagement: 2 weeks ago (renewal reminder call)
- Relationship health: 8/10
```

## Example Output

Claude will produce something like this:

**OPPORTUNITY 1 (Highest Priority): Upgrade to Growth Plan**
- Why now: At 27/30 staff with 5 hires incoming, they will hit the wall in 6-8 weeks. This isn't upsell pressure — it's operational necessity.
- Pitch: "You mentioned hiring 5 more people for the new export contract — that's fantastic growth. You're currently at 27 seats and your Starter plan caps at 30. Rather than hitting a wall right when you're busy onboarding, let's move you to Growth now for RM 700/month. It also unlocks full performance tracking, which becomes really valuable when you're managing a bigger team."
- Objection to prepare for: "RM 400 more per month feels steep." Counter: the export contract is worth how much? Payroll savings alone cover the upgrade.

**OPPORTUNITY 2: Custom Reporting Module**
- Why now: They're complaining about not seeing data in the right format. Manufacturing companies often need department-level cost breakdowns.
- Pitch for follow-up after Growth upgrade

**OPPORTUNITY 3: Performance Tracking Activation**
- Why now: They have the feature but have never used it. Growing teams need this.

**Churn warning signal**: If their next support ticket is about exporting data or "how to cancel", act immediately.

## Malaysia-Specific Tips

- **WhatsApp is your best upsell channel in Malaysia.** Formal email upsell sequences get ignored. A personal WhatsApp voice note or text message from the account owner or founder converts far better, especially with Bumiputera-owned SMEs where relationships drive decisions.
- **Frame upgrades around Hari Raya/CNY hiring cycles.** Many Malaysian SMEs hire seasonally. Time your upsell pitches 6-8 weeks before these periods when headcount is about to grow.
- **Use Ringgit anchoring carefully.** Saying "only RM 400 more per month" feels different to a 30-person factory than to a KL tech company. Always frame cost increases relative to the business outcome — "less than one employee's daily wage."
- **SST-inclusive pricing.** Always quote prices SST-inclusive for SME customers in Malaysia — they don't have tax teams to do the math.

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Claude (claude.ai) | Free / USD 20/mo | Analysing customer data and generating pitches |
| Google Sheets | Free | Storing customer data if no CRM |
| HubSpot CRM | Free tier available | Tracking customer health scores and renewal dates |
| Zoho CRM | Free for 3 users | Budget-friendly CRM popular with Malaysian SMEs |
| Notion | Free / USD 8/mo | Building a lightweight customer success tracker |

## Expected Results

- Time saved: 4-6 hours per week (vs manually reviewing accounts and writing pitches)
- Quality vs manual: AI surfaces non-obvious signals (e.g., usage patterns + hiring news = upsell moment) that humans miss under workload
- ROI estimate: If you manage 50 accounts and this workflow identifies 2 additional expansions per month at RM 500 incremental MRR each, that's RM 12,000 additional ARR from a workflow that takes 30 minutes to run
