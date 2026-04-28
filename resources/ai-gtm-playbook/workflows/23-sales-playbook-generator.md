# Workflow 23: Sales Playbook Generator

**Funnel Stage:** Intelligence Layer (Level 2)
**Time Saved:** 20–40 hours (one-time build) + ongoing updates in minutes
**Tools:** Claude, Notion/Google Docs
**Difficulty:** Beginner

---

## What This Workflow Does

Generates a complete, battle-tested sales playbook from your best historical deals. Instead of spending weeks building playbooks manually (or never building them at all), AI synthesises your ICP, objection library, discovery questions, talk tracks, and competitive positioning into a document your entire team can use from day one. When your market shifts, you update it in minutes, not months.

---

## The Prompt Template

### Prompt 1 — Full Playbook Generation

```
You are an expert B2B sales trainer and playbook writer. Build me a complete sales playbook for my business.

MY BUSINESS:
- Company: [COMPANY NAME]
- What we sell: [PRODUCT/SERVICE — 2-3 sentences]
- Price point: [PRICE RANGE]
- Sales cycle: [e.g. 2–8 weeks]
- Primary buyer: [JOB TITLE + COMPANY TYPE]
- Geography: [MARKETS YOU SERVE]

OUR BEST CUSTOMERS (describe 3 recent wins):
Win 1: [Industry, company size, what problem we solved, why they bought us over alternatives]
Win 2: [same]
Win 3: [same]

OUR LOST DEALS (describe 2–3 recent losses):
Loss 1: [Why we lost, what they chose instead, what we wish we'd done differently]
Loss 2: [same]

TOP OBJECTIONS WE HEAR (list 5–10 real ones):
1. [e.g. "Your price is too high"]
2. [e.g. "We're already working with [competitor]"]
3. [e.g. "Our team doesn't have time for training"]
...

Build a sales playbook with these sections:
1. OUR IDEAL CUSTOMER PROFILE (ICP) — who we target and why
2. QUALIFICATION CRITERIA — BANT + our specific must-haves
3. DISCOVERY QUESTIONS — 15 questions that reveal pain, urgency, and budget
4. TALK TRACK — how to open a discovery call (first 5 minutes)
5. VALUE PROPOSITION — our core pitch in 3 versions: 30-second, 2-minute, full pitch
6. OBJECTION HANDLING — response scripts for each of our top objections
7. COMPETITIVE POSITIONING — how we compare to [COMPETITOR 1, 2, 3]
8. CLOSING SCRIPTS — 3 closing approaches for different buyer types
9. FOLLOW-UP SEQUENCE — what to send after each stage
10. RED FLAGS — signs a deal is unlikely to close (cut early and move on)
```

### Prompt 2 — Quick Objection Handling Update

```
Add 3 new objection responses to our existing sales playbook.

NEW OBJECTIONS TO HANDLE:
1. "[NEW OBJECTION 1]"
2. "[NEW OBJECTION 2]"
3. "[NEW OBJECTION 3]"

Our company: [BRIEF DESCRIPTION]
Our value proposition: [BRIEF DESCRIPTION]

For each objection, write:
- ACKNOWLEDGE: Validate the concern without agreeing with it
- REFRAME: Shift the perspective without being defensive
- EVIDENCE: One specific proof point or case study that addresses it
- BRIDGE: Move back to discovery with a question
```

### Prompt 3 — Competitive Battle Card

```
Build a competitive battle card comparing us to [COMPETITOR NAME].

Our company: [BRIEF DESCRIPTION]
Our pricing: [RANGE]
Our key strengths: [LIST 3–5]
Our known weaknesses vs this competitor: [LIST 2–3]

[COMPETITOR NAME] details:
- What they offer: [DESCRIPTION]
- Their pricing: [IF KNOWN]
- Their typical pitch: [IF KNOWN]
- Where they win: [IF KNOWN]
- Where they lose: [IF KNOWN]

Produce:
1. When we WIN against them and why
2. When we LOSE against them and why
3. 5 questions to ask when this competitor is in the deal
4. 3 landmines to plant early (things that matter to buyers that this competitor can't deliver)
5. One-line response when a prospect says "We're already talking to [competitor]"
```

---

## How to Use It

1. Run Prompt 1 once to generate your full playbook — takes 10 minutes to fill in, 2 minutes to generate
2. Paste the output into Notion or Google Docs as your living playbook document
3. Share with your sales team — this becomes their onboarding document for new reps
4. Update monthly: when you hear a new objection in the field, use Prompt 2 to add it
5. Build a battle card per competitor using Prompt 3

---

## Example Output (Objection Handling excerpt)

**Objection:** "We don't have budget for this right now."

**Response Script:**
> **Acknowledge:** "That's a fair concern, and I appreciate you being direct about it."
>
> **Reframe:** "When our clients say that, it usually means one of two things: either the budget isn't there at all, or the ROI case hasn't been made compellingly enough internally. Can I ask — is this a priority your leadership team is aware of?"
>
> **Evidence:** "For context, our clients typically recover our fee within 6–8 weeks through reduced time on content creation and outreach. For a team of 5, that's roughly RM 180,000 in annual productivity recovered."
>
> **Bridge:** "Would it help if I put together a 1-page ROI summary you could share with your CFO?"

---

## Malaysia-Specific Tips

- Add a specific section on **HRD Corp positioning**: how to help the buyer claim your fees through SBL-Khas. This removes the "budget" objection for most Malaysian training clients.
- Include a **"Saving Face" objection category** — Malaysian buyers rarely say "no" directly. Phrases like "let me think about it", "need to check with my boss", or "timing isn't right" often mean the same thing. Train your team to read these signals.
- Build a **GLC-specific talk track** — government-linked companies have longer approval chains and different risk tolerances. The playbook should address procurement committee objections separately.
- **WhatsApp follow-up scripts** deserve their own section — more deals in Malaysia close over WhatsApp than email.

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Claude | Playbook generation + updates | USD 20/month |
| Notion | Living playbook storage + collaboration | Free or USD 10/month |
| Google Docs | Alternative for simpler sharing | Free |
| Loom | Record talk track examples as video | Free tier |

---

## Expected Results

- Full sales playbook in 2 hours (vs. 2–4 weeks manually)
- Consistent messaging across your entire team from day one
- New sales reps onboard 50–70% faster
- Objection handling rate improves as the library grows
- Competitive win rate increases with targeted battle cards
