# Skill: Competitor & Industry Digest

**What it does:** Every Monday morning, your bot searches the web for news about your competitors and industry from the past week, then sends you a summary of anything worth knowing. Stay ahead without spending an hour reading industry news.

**Requires:** Web search — no Google Workspace plugin needed

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Competitor Digest. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Competitor & Industry Digest

Every Monday at 8:30am, search the web for news from the past 7 days about my industry and competitors.

Search for:
- [YOUR INDUSTRY — e.g., "B2B SaaS Southeast Asia" or "F&B Malaysia"]
- [COMPETITOR 1 NAME]
- [COMPETITOR 2 NAME]
- [COMPETITOR 3 NAME — optional]

For each relevant item found:
1. Give me the headline or topic
2. One sentence on what happened
3. One sentence on why it matters to me or my business

Rules:
- Maximum 5 items total — prioritise the most significant
- Skip press releases and sponsored content where possible
- If nothing significant happened, say so in one line — don't invent importance
- Include a URL for any item I might want to read in full

Format it as a scannable WhatsApp message I can read in 2 minutes.
```

> **Before activating:** Replace the bracketed placeholders with your actual industry and competitor names.

---

## Set up the schedule

First, customise the skill with your industry and competitors:

> *"Update my Competitor Digest skill: my industry is [your industry] and my competitors are [name 1], [name 2], [name 3]."*

Then activate:

> *"Set up a cron job at 8:30am every Monday to run the Competitor Digest skill."*

---

## On-demand trigger

Run a check any time:

> *"Search for news about [competitor name] in the last week"*

> *"What's happening in [your industry] right now?"*

> *"Any new announcements from [competitor] recently?"*

---

## Example output

```
🔍 COMPETITOR DIGEST — Monday 28 April

1. Grab — Super app expansion into B2B logistics
   Grab announced a new fleet management module targeting SMEs in Malaysia and Singapore.
   → Directly competes with our logistics clients segment. Worth watching their pricing.
   https://...

2. Notion — AI features now in all free plans
   Notion rolled out AI writing and summarisation to free-tier users.
   → Raises the baseline expectation for productivity tools. Our clients may ask about similar features.
   https://...

3. B2B SaaS SEA — Funding activity up 18% Q1 2025
   CBInsights report shows Southeast Asian B2B SaaS funding up 18% YoY in Q1.
   → Positive signal for our fundraising conversations. Reference this in investor decks.
   https://...

Nothing significant from [Competitor 2] or [Competitor 3] this week.
```

---

## Tips

- Add keywords beyond competitor names for broader industry scanning:
  > *"Also search for news about 'AI adoption Malaysia', 'SME digital transformation', and 'HR tech Southeast Asia'"*

- Get deeper research on a specific competitor:
  > *"Research everything you can find about [competitor] in the last 30 days — funding, product changes, hires, press"*

- This skill works without Google Workspace — useful as a first skill before you set up OAuth.
