# 05. Cold Email Outreach Sequence

**Funnel Stage**: Interest
**Time Saved**: 3–5 hours per 50-lead campaign
**Tools**: Claude + Instantly.ai / Apollo.io
**Difficulty**: Beginner–Intermediate

---

## What This Workflow Does

Generates a 4-email personalised cold outreach sequence for a target prospect. AI handles the research angle, hooks, and follow-up copy — you paste it into Instantly.ai and launch. Designed specifically for Malaysian B2B culture: formal, relationship-first, no aggressive CTAs.

---

## The Prompt Template

```
You are a B2B cold email copywriter specialising in the Malaysian corporate market.

Write a 4-email cold outreach sequence for the following:

Sender:
- Name: [YOUR NAME]
- Company: [YOUR COMPANY]
- Role: [YOUR TITLE]
- Offer: [WHAT YOU'RE SELLING — be specific]
- Social proof: [2–3 company names you've worked with]
- WhatsApp: [YOUR NUMBER]

Target prospect:
- Industry: [INDUSTRY]
- Job title: [TITLE]
- Company size: [SIZE]
- Pain point: [SPECIFIC CHALLENGE THIS PERSON HAS]
- Funding angle: [e.g. SBL-Khas eligible / HRD Corp levy]

Sequence rules (follow strictly):
- Email 1 (Day 1): Hook from industry pressure + offer + social proof + CTA offering a white paper (not a meeting). End with P.S. offering the resource free regardless of outcome.
- Email 2 (Day 5): Under 60 words. One new data point or insight. Lowest-friction CTA: "Still happy to send it over."
- Email 3 (Day 14): "Last one from me for a while." Offer a 20-min conversation specific to their sector — no slides, no pitch. Empathetic close.
- Email 4 (Day 21): Under 50 words. "I will not follow up after this one." No CTA. WhatsApp number in body. Warm close: "Wishing you a good quarter ahead."

Format rules:
- Subject lines: Title Case (Malaysian corporate audience is more formal than Western)
- Greeting: First name only — e.g. "Hi Aminah," NOT "Hi Aminah Binti Yusof,"
- No emojis, no exclamation marks
- No hyperlinks in body (spam filter trigger)
- Replace "free" with "yours to keep" (spam trigger word)
- Plain text only — no bullet points or bold in email body
- Do NOT use: "Quick follow-up", "Hope this finds you well", "as I'm sure you know"
- Tone: Professional but human. Relationship before transaction.
```

---

## How to Use It

1. Fill in all variables above — be specific about the pain point
2. Run in Claude — review each email carefully
3. Check: First name only in greeting? No hyperlinks? No "free"? Subject in Title Case?
4. Paste into Instantly.ai as a 4-step sequence (Day 1, 5, 14, 21)
5. Set `{{industry}}` fallback to "your sector" in case data is missing
6. Run inbox placement test before launching — target 80%+ inbox

---

## Example Input

```
Sender: [YOUR NAME], [YOUR COMPANY NAME], [YOUR TITLE]
Offer: AI training workshops for leadership teams — practical, role-specific, SBL-Khas eligible under HRD Corp
Social proof: SAP, Honeywell, Unilever, Zoom
WhatsApp: +1 XXX-XXX-XXXX

Target prospect:
Industry: Financial services (insurance/takaful)
Job title: Head of HR / HR Manager
Company size: 200–500 employees
Pain point: Leadership team hasn't had structured AI training despite having AI tools
Funding angle: SBL-Khas eligible under HRD Corp — company is already paying the levy
```

---

## Example Output (Email 1)

**Subject**: AI Training for Takaful Leadership Teams

Hi {{firstName}},

{{industry}} companies in Malaysia are under pressure to move faster with AI. Regulators, competitors, and customers are all pushing at once.

We run workshops for leadership teams that are practical, role-specific, and eligible for SBL-Khas funding. Our trainers have worked with executives at SAP, Honeywell, Unilever, and Zoom — companies that decided not to wait.

Could I send you a short white paper (recent data through March 2026) on how other companies in Malaysia are using AI? It might help you size up where {{companyName}} is positioned compared to peers.

[Signature]

P.S. The white paper is yours to keep regardless of whether we work together.

---

## Malaysia-Specific Tips

- **WhatsApp number in signature**: Malaysian professionals prefer WhatsApp over phone calls — a US number signals international credibility
- **SBL-Khas angle**: HRD Corp-eligible training removes a procurement objection before it's raised
- **Title Case subjects**: Unlike US cold email best practice (lowercase = personal), Malaysian corporate email culture reads Title Case as professional, not spammy
- **1–2 follow-ups max**: Aggressive sequences conflict with Malaysian relationship culture — 4 emails is the absolute ceiling

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Instantly.ai | From USD 37/mo | Sending + sequence management |
| Apollo.io | Free tier / USD 49/mo | Lead sourcing + sending |
| Claude (claude.ai) | Free / RM 85/mo | Writing the copy |
| mxtoolbox.com | Free | Verify DMARC before launch |

---

## Expected Results

- Reply rate benchmark: 2–5% is good, 10%+ is elite (2025 data)
- At 200 contacts: expect 4–20 replies from a well-written sequence
- The breakup email (Email 4) consistently generates the highest reply rate of the sequence
