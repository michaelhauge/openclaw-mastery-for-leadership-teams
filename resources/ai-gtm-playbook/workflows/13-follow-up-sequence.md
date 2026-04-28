# Workflow 13: Follow-Up Sequence Automation

**Funnel Stage:** Conversion
**Time Saved:** 2–4 hours/week
**Tools:** Claude, Instantly.ai / HubSpot / Gmail
**Difficulty:** Beginner

---

## What This Workflow Does

Generates a personalised multi-touch follow-up sequence after every meeting, demo, or proposal — so no lead ever goes cold because you forgot to follow up. AI writes the messages based on what was discussed, what the prospect cared about, and where they are in your pipeline. You review and send. The whole thing takes 3 minutes per deal.

---

## The Prompt Template

```
Write a 4-email follow-up sequence for the following sales situation.

PROSPECT:
Name: [FIRST NAME]
Company: [COMPANY]
Role: [JOB TITLE]

MEETING CONTEXT:
What we discussed: [2–4 sentences — what problem they raised, what interested them, any objections]
What I promised to send: [e.g. a proposal, a case study, pricing breakdown]
Next step agreed: [e.g. "They'll review the proposal and get back to me", "Waiting on budget approval"]
Their decision timeline: [e.g. "Q3", "by end of month", "no specific timeline"]

MY COMPANY:
Company: [YOUR COMPANY NAME]
What we sell: [BRIEF DESCRIPTION]
Key differentiators: [2–3 bullet points]

Write 4 emails:

EMAIL 1 (same day or next morning): Thank them, recap what was discussed, deliver what was promised, restate next step. Warm but professional. Under 150 words.

EMAIL 2 (Day 5): New piece of value related to their specific situation (a relevant article, insight, or question that moves the conversation forward). Under 80 words. No hard sell.

EMAIL 3 (Day 14): "Just checking in" — but lead with something new. A relevant client result or a question that re-opens the conversation. Under 100 words. Acknowledge that timing may not be right.

EMAIL 4 (Day 28): Breakup email. Under 60 words. Close the loop, leave the door open, no pressure.

Tone: Professional, warm, confident — not pushy. Write as if from [YOUR NAME].
```

---

## How to Use It

1. Within 30 minutes of finishing a meeting, paste your meeting notes into the prompt
2. Claude generates all 4 emails in under 30 seconds
3. Review, personalise any specific details, and schedule
4. Load into your email tool of choice (Gmail, Instantly, HubSpot) with send dates pre-set

**Automation option:** Connect your meeting notes (from Otter.ai or Fireflies.ai) to n8n → triggers the Claude prompt automatically → drafts land in your Gmail drafts folder for review

---

## Example Output

**Email 1 (Same day)**
> Hi Radhika,
>
> Thanks for the time this afternoon — really enjoyed the conversation about Axiata's L&D priorities for H2.
>
> As promised, I've attached a brief overview of how we structured a similar programme for [Client] last year. The relevant case study starts on page 3.
>
> Next step: I'll have a full proposal to you by Thursday. Let me know if anything changes on your end.
>
> Best,
> Michael

**Email 4 (Day 28 — Breakup)**
> Hi Radhika, I've tried to reach you a couple of times since our conversation in March. I completely understand if the timing isn't right — these things move at their own pace.
>
> I'll leave the door open. If AI training becomes a priority again, I'd love to pick up where we left off.
>
> Wishing you a strong Q2.

---

## Malaysia-Specific Tips

- For senior Malaysian executives, Email 1 should always acknowledge their time explicitly — "Thank you for making time in your schedule" lands better than a casual opener
- WhatsApp follow-up after Email 1 is standard in Malaysia — a brief "Hi [Name], just sent you a follow-up email" on WhatsApp often drives higher open rates
- If a prospect goes quiet, a WhatsApp message on Day 7 can serve as Email 2 (shorter, more conversational)
- For GLC contacts, longer decision timelines are normal — extend the Email 3 to Day 21 and Email 4 to Day 45

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Claude | Sequence generation | USD 20/month |
| Instantly.ai | Automated send scheduling + tracking | USD 37/month |
| Fireflies.ai | Auto-transcribe meetings → feed to prompt | Free tier / USD 10/month |
| HubSpot CRM | Sequences + CRM integration | Free tier available |

---

## Expected Results

- Zero deals go cold from lack of follow-up
- Follow-up quality is higher than manually written emails (AI captures meeting nuance)
- 3 minutes per deal vs 20–30 minutes manually
- Response rate increases 15–25% when follow-ups reference specific meeting details
