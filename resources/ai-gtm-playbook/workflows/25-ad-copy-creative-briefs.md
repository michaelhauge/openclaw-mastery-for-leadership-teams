# 24. Ad Copy & Creative Briefs

**Funnel Stage**: Awareness / Conversion
**Time Saved**: 2–4 hours per campaign
**Tools**: Claude + Meta Ads Manager / Google Ads
**Difficulty**: Beginner–Intermediate

---

## What This Workflow Does

Generates Meta (Facebook/Instagram) and Google ad copy — including headlines, body copy, CTAs, and A/B test variants — plus a creative brief your designer or Canva can execute without a briefing call. Replaces expensive agency copywriting for most mid-market campaigns. Malaysian-specific: bilingual variants, cultural sensitivities, platform behaviour.

---

## The Prompt Template (Ad Copy)

```
You are a performance marketing copywriter specialising in Malaysian B2B and B2C digital advertising.

Campaign brief:
- My company: [YOUR COMPANY]
- Product/service: [WHAT YOU'RE ADVERTISING]
- Target audience: [WHO SEES THIS AD — demographics, job title, interests]
- Platform: [META (Facebook/Instagram) / GOOGLE / BOTH]
- Campaign objective: [AWARENESS / LEAD GEN / WEBSITE TRAFFIC / CONVERSION]
- Offer or hook: [WHAT'S THE COMPELLING REASON TO CLICK — discount, lead magnet, limited time, etc.]
- Budget indication: [DAILY BUDGET — helps calibrate number of variants needed]
- Language: [ENGLISH ONLY / ENGLISH + BAHASA MALAYSIA / BM ONLY]

For META ads, write:
- 3 headline variants (max 40 characters each — tested A/B/C)
- 3 primary text variants (max 125 characters for feed — lead with the pain point or offer)
- 3 description variants (max 30 characters)
- 2 CTA button options (from: Learn More / Sign Up / Get Quote / Download / Book Now / Contact Us)

For GOOGLE ads, write:
- 5 headline options (max 30 characters each — Google uses up to 3 per ad)
- 4 description options (max 90 characters each — Google uses up to 2 per ad)
- Note which combinations work best together

For ALL ads:
- No claims that can't be proven (no "best in Malaysia" without evidence)
- No misleading urgency unless there is a real deadline
- Comply with Malaysia's Consumer Protection Act — no false impressions
- Flag any line that could be considered culturally insensitive for the Malaysian market

Then write:
- One "power hook" — a single sentence that could work as an organic post, a WhatsApp broadcast, or a banner headline
```

---

## The Prompt Template (Creative Brief)

```
You are a creative director writing a design brief for a Malaysian digital ad campaign.

Campaign: [DESCRIBE THE CAMPAIGN IN 2–3 SENTENCES]
Platform: [META / GOOGLE / LINKEDIN / ALL]
Ad formats needed: [FEED IMAGE / STORY / BANNER / VIDEO THUMBNAIL]
Brand guidelines:
- Colours: [PRIMARY / SECONDARY]
- Font: [IF KNOWN]
- Logo placement: [CORNER / BOTTOM BAR / NONE]

For each ad format, write a creative brief with:
1. **Visual concept** — What should the image or video show? Be specific (not "something professional" — describe the scene, people, or graphic)
2. **Text on creative** — What copy appears on the image itself (not in the ad caption)? Keep to 20% of image area for Meta compliance.
3. **Mood/tone** — 3 adjectives. What does this feel like to the viewer?
4. **Do not include** — Specific things to avoid (clichéd stock photos, certain colours, etc.)
5. **Reference images** — Describe 1–2 existing ads or images the designer can use as reference style

Format: One brief per ad format. Written so a Canva-level designer can execute without a call.
```

---

## How to Use It

### Ad Copy Workflow:
1. Fill in the campaign brief
2. Run in Claude — get all variants in one output
3. Review for: accuracy, cultural fit, character count compliance
4. A/B test in Meta: create 2–3 ad sets each testing one variable (headline or primary text)
5. After 7 days, kill underperformers and scale the winner

### Creative Brief Workflow:
1. Run the creative brief prompt after finalising your copy
2. Share the brief with your designer or paste directly into Canva with your brand kit
3. For video: use the brief as a storyboard prompt for tools like Runway, CapCut, or a freelancer

### Character Count Checker (Quick Reference):
- Meta headline: 40 characters
- Meta primary text: 125 characters (feed) — longer text gets truncated but still works
- Meta description: 30 characters
- Google headline: 30 characters
- Google description: 90 characters

---

## Example Input

```
My company: [YOUR COMPANY NAME]
Service: AI Readiness Workshop for leadership teams
Audience: HR Directors and COOs, 35–55, at Malaysian companies 200–5,000 staff, interested in "leadership development" and "AI"
Platform: Meta (Facebook + Instagram)
Objective: Lead generation — drive downloads of a free "AI Readiness Checklist for Malaysian Leaders"
Offer: Free AI Readiness Checklist — instant download, no pitch call
Budget: RM 50/day
Language: English (primary), one BM variant
```

---

## Example Output

**Headline A**: Is Your Leadership Team AI-Ready?
**Headline B**: 5 Signs Your Leaders Aren't Ready
**Headline C**: Download: AI Readiness Checklist

**Primary Text A**: Most Malaysian leadership teams have AI tools but no framework for using them. This free checklist shows exactly where the gaps are — in 10 minutes.

**Primary Text B**: Your competitors are already running AI workshops. Are your leaders keeping up? Free download — built for Malaysian mid-market companies.

**Primary Text C (BM)**: Adakah pasukan pemimpin anda bersedia untuk AI? Muat turun senarai semak percuma kami — khas untuk syarikat Malaysia.

**CTA**: Download Now / Get Yours Free

**Power Hook**: "The companies winning with AI in Malaysia aren't spending more — they started earlier. Here's a 10-minute checklist to see where you stand."

---

## Malaysia-Specific Tips

- **Facebook over Instagram for B2B Malaysia**: Malaysian professionals aged 35–55 are more active on Facebook — don't default to Instagram for B2B campaigns targeting this demographic
- **WhatsApp CTA**: For Malaysian lead gen, a "Chat on WhatsApp" CTA often outperforms "Fill in a form" — test both
- **Festive periods**: Hari Raya, Chinese New Year, Deepavali — ad costs spike but so does reach. Have seasonal copy variants ready. Avoid running heavy sales messaging during these periods — brand warmth outperforms hard sell.
- **BM copy**: Even if your audience is English-dominant, a Bahasa Malaysia variant in the creative (not the caption) signals local authenticity. Simple BM phrases on the image — not in the body copy.
- **PDPA compliance**: Lead gen forms must include a PDPA consent checkbox. In your ad lead form, add: "By submitting, you consent to [YOUR COMPANY NAME] contacting you in accordance with Malaysia's Personal Data Protection Act 2010."

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Claude (claude.ai) | Free / RM 85/mo | Copy and creative brief generation |
| Canva | Free / RM 55/mo | Ad creative design |
| Meta Ads Manager | Free (pay per click) | Running and A/B testing campaigns |
| Google Ads | Free (pay per click) | Search intent campaigns |
| AdEspresso | USD 49/mo | A/B testing automation for Meta |

---

## Expected Results

- Full campaign copy (all variants) produced in 20 minutes vs 2–4 hours
- 3-variant A/B testing from day 1 — most campaigns launch with only 1 creative
- Creative briefs cut designer briefing time from 45-minute calls to 5-minute reviews
- Malaysian-specific cultural flags prevent costly campaign missteps (wrong tone during festive period, PDPA violations)
