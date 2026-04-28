# 16. Customer Onboarding Sequences

**Funnel Stage**: Retention
**Time Saved**: 4–8 hours to build; runs automatically thereafter
**Tools**: Claude + Gmail / HubSpot / Mailchimp
**Difficulty**: Beginner–Intermediate

---

## What This Workflow Does

Generates a complete client onboarding email sequence — from contract signing through to first value delivery. A strong onboarding sequence reduces churn, sets expectations, and makes clients feel they made the right decision. Most Malaysian SMEs have no formal onboarding at all — this becomes a competitive differentiator.

---

## The Prompt Template

```
You are a client success manager writing an onboarding email sequence for a Malaysian B2B service business.

My business:
- Company: [YOUR COMPANY]
- Service: [WHAT THE CLIENT PURCHASED]
- Engagement length: [HOW LONG THE ENGAGEMENT RUNS]
- Key milestones: [3–5 major milestones in your delivery process]
- Primary client contact: [THEIR TITLE — who receives these emails]
- Team members the client will work with: [YOUR NAMES + ROLES]

Client context:
- Company: [CLIENT COMPANY]
- Main contact name: [FIRST NAME]
- What they want to achieve: [THEIR STATED GOAL]
- Start date: [KICKOFF DATE]

Write an onboarding sequence with these emails:

Email 1 — Welcome (send day of signing):
- Warm welcome that confirms they made the right decision
- What happens next in the next 48 hours
- Who they'll hear from and when
- Emergency contact (WhatsApp preferred for Malaysian clients)
- Max 150 words

Email 2 — Pre-Kickoff Preparation (3 days before kickoff):
- What to prepare for the kickoff meeting
- Materials or data to bring / share in advance
- Agenda preview
- Confirm meeting time and logistics
- Max 150 words

Email 3 — Post-Kickoff Summary (same day as kickoff):
- Summary of decisions made
- What you'll do next, by when
- What the client needs to do next, by when
- Single point of contact and preferred communication channel
- Max 150 words

Email 4 — First Milestone Confirmation (upon reaching first milestone):
- Celebrate the first tangible progress point
- Share what was completed and what it means for the client
- Preview the next phase
- Ask: "Is there anything we should adjust based on what you've seen so far?"
- Max 120 words

Email 5 — Mid-Engagement Check-In (halfway through engagement):
- Progress summary (3 bullets)
- Are we on track for their stated goal?
- Flag any risks or changes in scope early — do not wait for the end
- Invite them to a 30-min review call
- Max 150 words

Rules for all emails:
- Professional but warm — not corporate cold
- First name only in greeting
- No jargon
- Plain text (no HTML fancy formatting — feels more personal)
- Malaysian professional register
```

---

## How to Use It

1. Fill in the template once per service type — you'll reuse it for every client with small personalisation
2. Run in Claude — adjust milestone-specific details for each client
3. Schedule the sequence in HubSpot, Mailchimp, or Gmail Scheduled Send
4. Personalise Email 1 and Email 3 manually — the others can run automatically
5. Add WhatsApp touchpoints between emails for higher-touch clients

---

## Example Input

```
My company: [YOUR COMPANY NAME]
Service: AI Readiness Audit + Implementation Roadmap (6-week engagement)
Key milestones:
1. Kickoff and diagnostic survey deployed (Week 1)
2. Department interviews complete (Week 3)
3. Readiness Report delivered (Week 4)
4. Roadmap workshop (Week 5)
5. Final report and presentation (Week 6)

Client: RHB Bank
Main contact: Izzati Mohd Zain, Head of Learning & Development
Goal: Board-ready AI capability framework before Q3 board meeting
Start date: April 7, 2026
```

---

## Example Output (Email 1 — Welcome)

**Subject**: You're On — Welcome to the AI Readiness Programme

Hi Izzati,

Welcome aboard — it's great to be working with RHB.

Here's what happens next:
— Our team lead Michael will send you a calendar invite for your kickoff session by tomorrow EOD
— We'll share a short pre-work diagnostic for you to distribute to department heads (takes under 10 minutes)
— First output: diagnostic summary, delivered 1 week after kickoff

Your primary contact throughout is Michael Hauge (WhatsApp: +1 XXX-XXX-XXXX). Message anytime — we aim to respond within 2 hours on business days.

Looking forward to building something useful for RHB.

[YOUR TEAM NAME]

---

## Malaysia-Specific Tips

- **WhatsApp as primary channel**: Include a WhatsApp number in every onboarding email — Malaysian clients default to WhatsApp for quick questions, and a missed WhatsApp creates more anxiety than a missed email
- **GLCs and banks**: Large clients have multiple internal stakeholders — ask in Email 2 who else should be copied on progress updates; don't assume your primary contact is the only decision-maker
- **Post-kickoff summary**: Malaysian meeting culture is high-context — a written summary after every meeting prevents misalignment and creates an approval trail
- **Mid-engagement check-in**: Don't wait until delivery to surface scope or timeline issues — Malaysian clients are often too polite to raise problems directly; the proactive check-in creates space for honest feedback

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Claude (claude.ai) | Free / RM 85/mo | Writing the sequence |
| HubSpot (free tier) | Free | Sequence automation and scheduling |
| Gmail Scheduled Send | Free | Simple scheduling for solo businesses |
| Mailchimp | Free (up to 500 contacts) | If onboarding many clients simultaneously |

---

## Expected Results

- Full 5-email sequence written in 30 minutes
- Client churn in the first 30 days drops significantly with structured onboarding
- Post-kickoff summary emails alone reduce scope misalignment by preventing "that's not what I expected" conversations at delivery
