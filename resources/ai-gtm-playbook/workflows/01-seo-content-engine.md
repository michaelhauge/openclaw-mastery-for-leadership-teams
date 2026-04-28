# 01. SEO Content Engine

**Funnel Stage**: AWARENESS
**Time Saved**: 6–10 hours per article (research + writing + optimisation)
**Tools**: Claude / ChatGPT + WordPress / Webflow / Sanity CMS
**Difficulty**: Beginner

---

## What This Workflow Does

Generates fully researched, keyword-targeted blog posts and landing pages optimised for Malaysian and SEA search intent. The AI handles keyword clustering, outline creation, full-draft writing, and on-page SEO elements (meta title, meta description, header structure, internal link suggestions) — everything a content writer would produce in a full day, done in under 30 minutes.

---

## The Prompt Template

```
You are an SEO content strategist and writer specialising in Malaysian B2B and B2C markets. Your task is to write a complete, publish-ready blog post optimised for search.

**BUSINESS CONTEXT**
Business name: [YOUR BUSINESS NAME]
Industry: [e.g., industrial packaging manufacturer / HR consulting firm / property developer]
Target customer: [e.g., procurement managers at mid-size manufacturers in Selangor]
Website: [your URL — helps with internal link suggestions]
Primary service/product: [what you sell]

**CONTENT BRIEF**
Primary keyword: [e.g., "industrial packaging supplier Malaysia"]
Secondary keywords (include naturally): [e.g., "bulk packaging Selangor", "OEM packaging manufacturer", "custom corrugated boxes Malaysia"]
Target word count: [1,200–1,800 words recommended for most Malaysian B2B topics]
Content goal: [e.g., rank on page 1 for this keyword / generate demo requests / educate buyers]
Tone: [e.g., expert but approachable / formal / conversational]

**AUDIENCE PAIN POINT**
The reader's main problem or question: [e.g., "I need to find a reliable packaging supplier in Malaysia who can handle custom orders with short lead times"]

**STRUCTURE REQUIREMENTS**
- H1 title: must contain primary keyword naturally
- Include an introduction that opens with a relatable scenario or statistic (do NOT start with "In today's world" or "Are you looking for")
- Use H2 and H3 subheadings throughout
- Include a 3–5 row comparison table where relevant
- Add a FAQ section with 4 questions at the end
- Close with a clear CTA paragraph (soft sell — no hard pressure)
- Write in a way that passes as human-written (avoid repetitive sentence structures, AI clichés)

**LOCAL SEO REQUIREMENTS**
- Reference Malaysian cities, states, or industrial areas where naturally relevant (e.g., Shah Alam, Penang, Johor Bahru, Klang Valley)
- Use RM for pricing examples, not USD
- Mention Malaysian certifications, standards, or regulations where appropriate (e.g., SIRIM, MyCC, HRD Corp, MDEC)
- If referencing stats, prefer data from DOSM (Department of Statistics Malaysia), MIDA, or Bank Negara Malaysia

**DELIVERABLES**
Please produce:
1. SEO meta title (55–60 characters, includes primary keyword)
2. Meta description (150–160 characters, includes primary keyword, has a benefit hook)
3. URL slug suggestion (lowercase, hyphens, no stop words)
4. Full blog post draft (H1 + body + FAQ + CTA)
5. 3 suggested internal link anchor texts (I will fill in the URLs)
6. 1 social media post caption to promote this article (suitable for LinkedIn and Facebook)
```

---

## How to Use It

1. Fill in all the bracketed fields in the prompt — the more specific your inputs, the better the output. Spend 5 minutes on this step.
2. Paste the completed prompt into Claude (claude.ai) or ChatGPT. Use Claude Sonnet or GPT-4o for best results.
3. Review the draft. Focus on: factual accuracy (AI may hallucinate statistics — always verify), CTA alignment with your actual offer, and any pricing or company-specific details.
4. Copy the draft into your CMS (WordPress, Webflow, Sanity). Add your own images or request image prompts from Midjourney/Canva.
5. Publish and submit to Google Search Console for indexing.

---

## Example Input

```
Business name: PackRight Malaysia
Industry: Industrial packaging manufacturer
Target customer: Procurement managers at F&B manufacturers in Klang Valley
Primary keyword: food-grade packaging supplier Malaysia
Secondary keywords: halal packaging Malaysia, food safe corrugated boxes, F&B packaging manufacturer Selangor
Target word count: 1,500 words
Content goal: rank on page 1 / generate RFQ inquiries
Tone: expert but approachable
Audience pain point: Finding a packaging supplier who can meet halal requirements, fast turnaround, and MOQ flexibility for a growing F&B company
```

---

## Example Output

The AI produces:

**Meta title**: Food-Grade Packaging Supplier Malaysia | PackRight (58 chars)

**Meta description**: Need halal-certified food-grade packaging in Malaysia? PackRight delivers custom corrugated boxes with fast turnaround from our Shah Alam facility. (156 chars)

**URL slug**: `/food-grade-packaging-supplier-malaysia`

**Blog post** (1,450 words) including:
- H1: "Finding a Reliable Food-Grade Packaging Supplier in Malaysia: What F&B Brands Need to Know"
- Opening scenario about an F&B company running out of packaging days before a major supermarket delivery
- Sections on: what makes packaging food-grade, halal certification requirements, MOQ flexibility, lead time expectations in Malaysia, how to evaluate suppliers
- Comparison table: Local supplier vs China import vs regional SEA supplier
- FAQ: "Do I need SIRIM certification for food packaging?" / "What is the minimum order quantity?" / "Can you do custom printing?" / "How long does production take?"
- CTA: "Request a free packaging consultation with our team in Shah Alam"

**LinkedIn caption**: "F&B brands growing fast in Malaysia: your packaging partner can make or break your production schedule. Here's what to look for before you sign an agreement. [link]"

---

## Malaysia-Specific Tips

- **Bahasa Malaysia keywords**: Consider creating a Malay-language version of high-traffic posts. Malay search volume on Google Malaysia is significant, especially outside Klang Valley. Use the same prompt but add: "Write the article in Bahasa Malaysia (standard Malay, not colloquial Manglish)."
- **Local search intent**: Malaysians often search with location qualifiers ("near me", "in KL", "Shah Alam"). Include these naturally in your content.
- **Festive content calendar**: Plan SEO content around Hari Raya, Chinese New Year, Deepavali, and Merdeka — these generate predictable seasonal search spikes for gifts, catering, corporate orders.
- **Google Malaysia vs Google Singapore**: If you serve both markets, create separate pages. Search behaviour and language differs.
- **Avoid overly promotional tone**: Malaysian readers (particularly B2B) distrust content that reads like an advertisement. The AI prompt above intentionally uses a soft CTA for this reason.

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Claude.ai (Sonnet) | Free / USD 20/mo (Pro) | Full article drafts, best reasoning |
| ChatGPT (GPT-4o) | Free / USD 20/mo (Plus) | Alternative, strong at structured content |
| WordPress | Free (hosting from RM 30/mo) | Most common Malaysian CMS, huge plugin ecosystem |
| Webflow | USD 14–23/mo | Design-forward sites, no-code |
| Rank Math (WordPress plugin) | Free / USD 59/yr | On-page SEO scoring and keyword tracking |
| Google Search Console | Free | Monitor rankings, submit sitemaps |
| Ubersuggest | USD 12/mo or one-time purchase | Keyword research for Malaysian terms |
| Ahrefs / Semrush | USD 99–120/mo | Professional keyword research (team investment) |

---

## Expected Results

- **Time saved**: 6–10 hours per article → reduced to 30–45 minutes (review + edit)
- **Quality vs manual**: On par with a mid-level content writer for structure and SEO; needs human review for factual accuracy and brand voice
- **Volume uplift**: Most Malaysian SMEs publish 0–1 blog posts per month. With this workflow, 4–8 posts/month becomes realistic without hiring a writer.
- **ROI estimate**: A single well-ranked blog post generating 500 organic visits/month at a 2% conversion rate = 10 leads/month. At RM 3,000 average deal value, that's RM 30,000/month in pipeline from one article. Content compounds — it keeps working for years.
- **SEO timeline**: Expect 3–6 months before new content ranks on page 1 for competitive Malaysian keywords. Start with long-tail, low-competition terms first.
