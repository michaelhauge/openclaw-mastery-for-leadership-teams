# Workflow 22: CRM Data Enrichment

**Funnel Stage:** Intelligence Layer (Level 2)
**Time Saved:** 2–4 hours per enrichment run
**Tools:** Clay, Apollo, LinkedIn Sales Navigator, Claude, n8n
**Difficulty:** Intermediate

---

## What This Workflow Does

Takes a list of sparse lead records (name, company, email) and automatically enriches them with firmographic data, LinkedIn profiles, technology stack, funding status, headcount, decision-maker titles, and personalisation hooks — so your sales team arrives at every conversation prepared, and your cold email sequences can be genuinely personalised at scale.

---

## The Prompt Template

### Prompt 1 — Single Lead Enrichment (manual, any tool)

```
You are a B2B sales researcher. Enrich the following lead record for outbound sales use.

LEAD:
Name: [FULL NAME]
Company: [COMPANY NAME]
Title: [JOB TITLE IF KNOWN]
Email: [EMAIL]
Website: [COMPANY WEBSITE]

Research this person and company and provide:

1. COMPANY OVERVIEW (3–5 sentences): What does this company do, how big are they, and what's their current strategic focus?

2. DECISION-MAKER PROFILE: Based on their title and company, what are their likely top 3 priorities this year? What keeps them up at night?

3. PERSONALISATION HOOK: Find one specific, recent, public thing about this person or company (LinkedIn post, award, news article, new product launch, recent hire) that I can reference in a cold email to show I've done my research.

4. PAIN POINT HYPOTHESIS: Based on their industry, size, and title, what problem would our [YOUR PRODUCT/SERVICE] most likely solve for them?

5. BEST OUTREACH ANGLE: Given all of the above, what is the single most compelling reason this person should take a call with us?

Format as a 1-page sales brief.
```

### Prompt 2 — Batch Enrichment via n8n + Claude API

```
Enrich the following lead record for B2B sales outreach. Return JSON only.

Lead:
- name: {{name}}
- company: {{company}}
- title: {{title}}
- website: {{website}}

Return this JSON structure:
{
  "company_summary": "2-sentence description of what the company does",
  "company_size_estimate": "e.g. 200-500 employees",
  "industry": "primary industry",
  "likely_pain_points": ["pain point 1", "pain point 2", "pain point 3"],
  "personalisation_hook": "one specific, recent, citable fact about this person or company",
  "recommended_subject_line": "suggested cold email subject line",
  "fit_score": 1-10,
  "fit_rationale": "why this lead is or isn't a good fit"
}
```

---

## How to Use It

**Manual (for high-value accounts):**
1. Paste Prompt 1 into Claude with the lead details
2. Save the brief to your CRM as a note before the call
3. Use the personalisation hook in your email subject line or opening line

**Automated via Clay (recommended for lists of 50–500 leads):**
1. Import your lead list into Clay
2. Use Clay's built-in enrichment (LinkedIn, Apollo, Clearbit) to fill firmographic gaps
3. Add a "Claude" column in Clay using their AI enrichment feature
4. Use Prompt 2 as the Clay formula — it runs per row automatically
5. Export enriched CSV back to your CRM or directly into Instantly

**Automated via n8n (for ongoing pipeline):**
1. Trigger: New lead added to CRM
2. Step 1: Apollo lookup → fills company size, industry, LinkedIn URL
3. Step 2: LinkedIn profile scrape (via PhantomBuster or similar) → fills recent activity
4. Step 3: Claude API call with Prompt 2 → generates personalisation hook + fit score
5. Step 4: Write enriched data back to CRM record
6. Result: Every new lead arrives pre-researched in under 2 minutes

---

## Example Input/Output

**Input:** `Name: Khairudin Affendi | Company: Hong Leong Bank | Title: Head of HR | Website: hlb.com.my`

**Output:**
```json
{
  "company_summary": "Hong Leong Bank is a Malaysian retail and commercial bank with 300+ branches nationwide, currently investing heavily in digital transformation and AI capabilities.",
  "company_size_estimate": "5,000–10,000 employees",
  "industry": "Financial Services / Banking",
  "likely_pain_points": [
    "Upskilling large workforce on AI tools at scale",
    "Demonstrating ROI on L&D spend to CFO",
    "HRD Corp levy utilisation before year-end"
  ],
  "personalisation_hook": "Hong Leong Bank announced a new digital academy initiative in Q4 2024 — this is a strong signal that Khairudin's team is actively looking for structured AI training partners.",
  "recommended_subject_line": "AI Training for Hong Leong Bank's Leadership Team",
  "fit_score": 9,
  "fit_rationale": "Large financial services employer, active L&D investment, HRD Corp registered, exact profile of our highest-converting accounts."
}
```

---

## Malaysia-Specific Tips

- HRD Corp registration is public — use it as a qualification signal. If a company is registered, they have levy balance to spend on training.
- For GLC and government-linked companies, check Bursa filings for annual report highlights — L&D spend and strategic priorities are often disclosed
- Malaysian executives' LinkedIn activity tends to be lower than Western counterparts — check company announcements and press releases instead
- MDEC, MIDA, and TalentCorp publish lists of companies receiving digital grants — these are warm leads for AI training

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Clay | Automated lead enrichment + AI columns | USD 149–800/month (usage-based) |
| Apollo.io | Firmographic data + email finding | USD 49–99/month |
| PhantomBuster | LinkedIn scraping for enrichment | USD 56–128/month |
| Claude | AI analysis + personalisation | USD 20/month |
| n8n | Workflow automation | Free (self-hosted) |

---

## Expected Results

- 90% reduction in manual research time per lead
- Personalisation hooks for every email (vs. generic templates)
- Fit scoring helps prioritise your highest-value prospects
- Sales team arrives at every call knowing the company's strategic context
