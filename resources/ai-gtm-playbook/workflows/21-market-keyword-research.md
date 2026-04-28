# Workflow 21: Market & Keyword Research

**Funnel Stage:** Intelligence Layer (Level 2)
**Time Saved:** 4–6 hours per research cycle
**Tools:** Claude, Perplexity, Google Keyword Planner, Ahrefs/Semrush
**Difficulty:** Beginner

---

## What This Workflow Does

Turns a single question about your market into a comprehensive research brief in under 10 minutes. Instead of spending a week reading industry reports, AI synthesises market size, customer language, keyword opportunities, and content gaps into an actionable brief you can actually use — for SEO, for sales messaging, and for identifying underserved segments.

---

## The Prompt Template

### Part 1 — Market Research Brief

```
Act as a senior market research analyst specialising in [YOUR INDUSTRY] in Southeast Asia.

I need a market research brief on: [SPECIFIC MARKET QUESTION — e.g. "AI training for SMEs in Malaysia", "corporate wellness programmes for financial services", "B2B SaaS adoption in Malaysian mid-market companies"]

Produce:
1. MARKET SIZE ESTIMATE — What is the addressable market in Malaysia/SEA? Include any available data points (government stats, industry reports, analyst estimates). Flag confidence level (high/medium/low).

2. CUSTOMER SEGMENTS — Who buys this? List 3–5 distinct buyer segments with: job title, company size, primary pain point, buying trigger, and where they spend time online.

3. CUSTOMER LANGUAGE — What words and phrases do buyers actually use to describe their problem? List 15–20 terms they would type into Google or say in a meeting. Avoid industry jargon.

4. MARKET GAPS — What does the current market underserve? Where do buyers complain about existing solutions?

5. CONTENT OPPORTUNITIES — What questions do buyers have that existing content doesn't answer well? List 10 specific blog/video topics.

6. KEY DATA SOURCES — Cite any specific reports, studies, or data sources I should read.

Format as a brief I can share with my team.
```

### Part 2 — Keyword Research (after market brief)

```
Based on the customer language and segments above, generate a keyword research strategy.

Produce:
1. PRIMARY KEYWORDS (5–10): High-intent terms buyers use when they're ready to purchase. Include estimated search volume if known.

2. SECONDARY KEYWORDS (15–20): Informational terms buyers use during research phase.

3. LONG-TAIL OPPORTUNITIES (10–15): Specific, low-competition phrases that indicate high purchase intent. These are often questions (e.g. "best AI training for HR teams Malaysia").

4. CONTENT CLUSTER MAP: Group these keywords into 3–5 content clusters that could each support a pillar page + supporting articles.

5. COMPETITOR KEYWORD GAPS: What keywords are my competitors ranking for that I am not? (Requires: list competitor domains)

For context, my website is: [YOUR DOMAIN]
My top 3 competitors are: [COMPETITOR 1, 2, 3]
```

---

## How to Use It

1. Start with Part 1 — paste the market research prompt into Claude or Perplexity (Perplexity is better for real-time market data)
2. Read the output and highlight the customer language section — this is gold for your website copy, email subject lines, and LinkedIn posts
3. Run Part 2 with the keyword prompt, adding the customer language from Part 1 as additional context
4. Plug shortlisted keywords into Google Keyword Planner (free) or Ahrefs to validate actual search volumes
5. Build your content calendar around the Content Cluster Map

---

## Example Input/Output

**Input:** "AI training for HR teams in Malaysia"

**Customer Language Output (excerpt):**
> Buyers say: "upskilling our people on AI tools", "we don't know where to start with AI", "need something practical not theoretical", "HRD Corp claimable", "half-day or full-day format", "our teams use Microsoft tools mostly"

**Long-tail Keywords Output (excerpt):**
> - "AI training for HR managers Malaysia"
> - "HRD Corp approved AI course Kuala Lumpur"
> - "ChatGPT training for corporate teams"
> - "how to use AI in HR Malaysia"
> - "AI upskilling programme for employees Malaysia"

---

## Malaysia-Specific Tips

- Always include "Malaysia", "Kuala Lumpur", or "Southeast Asia" in your keyword variants — search behaviour is highly localised
- "HRD Corp" and "SBL-Khas" are high-intent keyword modifiers in the training market — any buyer searching these is a purchase-ready prospect
- Bahasa Malaysia variants of keywords have much lower competition — consider bilingual content for government and GLC audiences
- Government economic data: DOSM (Department of Statistics Malaysia) and MDEC publish free market reports that are highly citable

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Perplexity Pro | Real-time market research with citations | ~USD 20/month |
| Claude | Brief writing + synthesis | ~USD 20/month |
| Google Keyword Planner | Free keyword volume data | Free (needs Google Ads account) |
| Ahrefs / Semrush | Competitor keyword gaps + SERP analysis | USD 99–129/month |
| DOSM website | Malaysian market statistics | Free |

---

## Expected Results

- 10-minute market brief instead of 1-week research sprint
- Keyword list that reflects how buyers actually talk (not how you talk)
- Content calendar built around real search demand
- Sales messaging that uses buyer language (higher resonance, higher conversion)
