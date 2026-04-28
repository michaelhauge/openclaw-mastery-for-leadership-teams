# 08. WhatsApp Business Outreach (Malaysia Priority)

**Funnel Stage**: Interest
**Time Saved**: 2–3 hours per campaign
**Tools**: Claude + WhatsApp Business App / WhatsApp Business API
**Difficulty**: Beginner

---

## What This Workflow Does

Generates WhatsApp broadcast messages, follow-up templates, and conversation flows for Malaysian B2B outreach. In Malaysia, WhatsApp is the primary business communication channel — this workflow is MORE important than email for many industries. WhatsApp messages have 95%+ open rates vs 20–30% for email.

---

## The Prompt Template — Broadcast Message

```
You are a WhatsApp business messaging specialist for the Malaysian B2B market.

Write a WhatsApp broadcast message for:

Business: [COMPANY NAME]
Offer: [WHAT YOU'RE PROMOTING]
Target: [WHO IS RECEIVING THIS — existing contacts / warm leads / referrals]
Goal: [WHAT ACTION DO YOU WANT THEM TO TAKE]
Tone: [Professional / Warm / Urgent]

Rules for Malaysian WhatsApp business messages:
- Maximum 3 short paragraphs — people read on mobile, not desktop
- Open with their name: "Hi [Name],"
- Be direct about the purpose — Malaysians appreciate directness in WhatsApp (unlike formal email)
- Include ONE clear CTA — reply to this message / click this link / call this number
- Do not use ALL CAPS for emphasis — use bold sparingly (*bold* in WhatsApp)
- Include your name and company at the end
- Optional: Add a relevant emoji (1–2 maximum — WhatsApp culture accepts this unlike formal email)

Also write:
1. A follow-up message (3 days later if no reply) — under 30 words, lowest possible friction
2. An auto-reply template for when people reply "interested" or "tell me more"
```

---

## The Prompt Template — Conversation Flow

```
Write a WhatsApp conversation flow for handling inbound interest from a prospect who replies to my broadcast.

Context:
- My offer: [OFFER]
- Common questions they ask: [LIST 2–3]
- Goal of the conversation: [Book a call / Send a proposal / Arrange a meeting]

Write the conversation as a script:
Message from prospect → My response → Next message → My response

Keep each response under 3 lines. WhatsApp conversations should feel like texting, not formal correspondence.
```

---

## Example Input

```
Business: [YOUR COMPANY NAME]
Offer: Free AI readiness assessment for their leadership team (30-min call)
Target: HR managers I've met at MIHRM events — warm contacts, have business cards
Goal: Book a 30-minute discovery call
```

---

## Example Output

**Broadcast Message**:
Hi [Name], hope you're well.

I'm reaching out because I'm offering a complimentary 30-minute AI Readiness Assessment for HR leaders in KL this month. It's a quick call to identify where your leadership team stands on AI adoption — and what the highest-leverage next step would be.

No pitch, just clarity. Would this be useful for you?

[YOUR NAME] | [YOUR COMPANY NAME]

**Follow-up (Day 3)**:
Hi [Name], just checking if you saw my message. Happy to share more details if helpful. 🙏

**Auto-reply when they say "interested"**:
Great, thank you! I have slots this week on [DAY] at [TIME] or [DAY] at [TIME] KL time. Which works better for you? I'll send a Zoom link once confirmed.

---

## Malaysia-Specific Tips

- **Opt-in is essential**: Only message contacts who have given you their number voluntarily — Malaysian PDPA applies to WhatsApp outreach
- **WhatsApp Business API vs App**: For more than 50 broadcasts/month, use the API (via providers like Wati, Interakt) to avoid being flagged
- **Bahasa Malaysia**: Consider BM messages for SME audiences and non-English-dominant industries
- **Timing**: Send between 9am–12pm or 2pm–5pm KL time on weekdays. Avoid Friday afternoons.
- **Voice notes**: For warm contacts, a 30-second voice note outperforms text — AI can't do this yet, but it's worth knowing

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| WhatsApp Business App | Free | Under 50 broadcasts/month |
| Wati.io | From RM 250/mo | API-based broadcasting, Malaysia-supported |
| Interakt | From USD 15/mo | WhatsApp CRM + automation |
| Claude (claude.ai) | Free / RM 85/mo | Writing all message copy |

---

## Expected Results

- Open rate: 85–95% (vs 20–30% for email)
- Reply rate: 15–35% for warm contacts (vs 2–5% for cold email)
- Best use case: Re-engaging warm leads who went cold on email
