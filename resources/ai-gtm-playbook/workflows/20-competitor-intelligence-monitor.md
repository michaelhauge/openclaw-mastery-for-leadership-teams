# Workflow 20: Competitor Intelligence Monitor

**Funnel Stage:** Intelligence Layer (Level 2)
**Time Saved:** 3–5 hours/week
**Tools:** Claude, Perplexity, n8n (automation), Google Alerts
**Difficulty:** Intermediate

---

## What This Workflow Does

Automatically monitors your competitors' moves — pricing changes, new features, new hires, press releases, social posts — and delivers a weekly summary with strategic implications for your business. Instead of manually checking 5 competitor websites every week, AI does it for you and frames each change in terms of what it means for your pipeline and messaging.

---

## The Prompt Template

```
You are a competitive intelligence analyst for [YOUR COMPANY NAME], a [YOUR INDUSTRY] company serving [YOUR TARGET MARKET].

Our top 3 competitors are:
1. [COMPETITOR 1] — [their website/positioning]
2. [COMPETITOR 2] — [their website/positioning]
3. [COMPETITOR 3] — [their website/positioning]

Based on the following recent information gathered about these competitors this week, produce a Competitor Intelligence Brief.

RAW INTELLIGENCE:
[Paste news articles, LinkedIn posts, job postings, pricing page changes, social media posts, press releases, product updates — anything you've collected]

Produce:
1. HEADLINE MOVES — What changed this week for each competitor (max 3 bullets per competitor)
2. STRATEGIC IMPLICATIONS — What does each move mean for us? Should we respond? How?
3. MESSAGING ALERT — Are any of our current claims being challenged or undermined by competitor moves?
4. SALES TALKING POINTS — 2–3 new talking points our reps can use this week based on competitor weaknesses
5. ONE THING TO WATCH — The single most important competitive development to track next week

Keep the brief to 1 page. Write for a sales leader who has 5 minutes, not 50.
```

---

## How to Use It

**Manual version (30 minutes/week):**
1. Set up Google Alerts for each competitor name + "[competitor] pricing", "[competitor] new feature", "[competitor] funding"
2. Every Monday, collect all alerts from the past week
3. Check competitor LinkedIn pages and job boards (new hires signal strategic direction)
4. Paste everything into the prompt above
5. Send brief to your sales team on Monday morning

**Automated version (n8n workflow):**
1. n8n triggers every Monday at 7am
2. Scrapes competitor websites for changes (homepage, pricing page, features page)
3. Pulls Google Alerts RSS feeds for each competitor
4. Queries LinkedIn for competitor job postings (signals where they're investing)
5. Sends all raw data to Claude via API
6. Delivers formatted brief to Slack or email by 8am

---

## Example Input/Output

**Input:** "Competitor A just posted 3 new job listings for 'Enterprise Sales Rep — Financial Services'. Their LinkedIn page now mentions 'HRD Corp approved training provider'. They dropped pricing by 15% on their starter plan last week."

**Output:**
> **HEADLINE MOVE:** Competitor A is making a deliberate push into enterprise financial services (3 new hires) and has become HRD Corp approved — directly entering our core market.
>
> **STRATEGIC IMPLICATION:** This is urgent. They are 3–6 months behind us in the enterprise FS segment but closing fast. We need to accelerate our reference case publishing for FS clients.
>
> **MESSAGING ALERT:** Our "HRD Corp approved" claim is no longer a differentiator vs Competitor A. Shift emphasis to our delivery track record and named client outcomes.
>
> **SALES TALKING POINT:** "Unlike newer entrants, we've delivered HRD Corp programmes for [X] financial services firms in Malaysia — ask us for references."

---

## Malaysia-Specific Tips

- Monitor HRD Corp's public registry for new approved training providers — this is often the first signal a competitor is entering your space
- LinkedIn is the best signal in Malaysia for corporate moves — executives post more freely than in Western markets
- Track competitor presence at industry events (MIHRM, PSMB forums, EY/KPMG co-hosted events)
- If a competitor wins a government-linked company (GLC) contract, it will usually appear in a press release or Bursa filing

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Google Alerts | Free monitoring for news mentions | Free |
| Perplexity Pro | Real-time web research per competitor | ~USD 20/month |
| Claude | Brief writing + strategic framing | ~USD 20/month |
| n8n | Automation (self-hosted) | Free or ~USD 20/month cloud |
| Feedly | Aggregate competitor blog/press RSS | Free tier available |

---

## Expected Results

- Save 3–5 hours/week of manual research
- Never be caught off-guard by a competitor pricing change again
- Sales team arrives at calls with fresh competitive intelligence
- Identify threats 4–8 weeks earlier than your current approach
