# Workflow 24: WhatsApp Business Auto-Qualification Bot

**Funnel Stage:** Intelligence Layer (Level 2) + Conversion
**Time Saved:** 3–5 hours/week of manual WhatsApp triage
**Tools:** WhatsApp Business API, n8n, Claude, Google Sheets / CRM
**Difficulty:** Advanced

---

## What This Workflow Does

Deploys an AI-powered qualification bot on WhatsApp Business that handles inbound enquiries 24/7 — asks BANT qualification questions in a natural conversational style, determines if the lead is a good fit, routes hot leads to you immediately, and politely disqualifies poor-fit leads — all before you've read a single message. In Malaysia's WhatsApp-first business culture, this is the highest-leverage automation in the entire playbook.

---

## The System Prompt (for n8n + Claude API)

```
You are [BOT NAME], a helpful assistant for [COMPANY NAME], a [DESCRIPTION OF BUSINESS] based in [LOCATION].

Your job is to have a friendly, professional conversation with new enquiries on WhatsApp, understand their needs, and determine if we can help them.

QUALIFICATION CRITERIA (what makes a good fit):
- [CRITERION 1 — e.g. Company has 50+ employees]
- [CRITERION 2 — e.g. Budget of at least RM X]
- [CRITERION 3 — e.g. Timeline within 3 months]
- [CRITERION 4 — e.g. Based in Malaysia or Singapore]

YOUR CONVERSATION FLOW:
1. Greet them warmly. Ask what brought them to contact us today.
2. Listen to their answer. Ask 1–2 follow-up questions to understand their situation.
3. Naturally discover: company name, company size, their role, timeline, and whether they have budget allocated.
4. DO NOT ask all questions at once. Have a real conversation — one question at a time.
5. After 4–6 exchanges, you will have enough to make a qualification decision.

IF QUALIFIED:
- Acknowledge their situation warmly
- Tell them someone from our team will follow up within [X hours/by next business day]
- Ask: "Is there anything else I should pass along to the team before they reach out?"
- End the conversation professionally

IF NOT QUALIFIED:
- Be warm and honest: "Based on what you've shared, I want to be upfront — we may not be the right fit for where you are right now."
- Offer an alternative resource if possible (e.g. "Our free guide might be a better starting point")
- Leave the door open: "As your business grows, we'd love to hear from you."
- Never be dismissive or rude

RULES:
- Write in plain English. No jargon.
- Keep messages short — 2–3 sentences max per reply.
- Never promise anything the sales team hasn't confirmed.
- If asked about pricing, say: "Our team will give you an accurate quote based on your specific needs — that's one of the things they'll cover when they reach out."
- If the conversation goes off-topic, gently steer back: "That's a great question — our team would be better placed to answer that. Let me make sure I capture what you need so they can help."
- NEVER pretend to be human if directly asked.
```

---

## Qualification Question Bank

Use these naturally in conversation — never all at once:

```
COMPANY SIZE:
"Just so I understand the scale — roughly how many people are in your team?"

ROLE/AUTHORITY:
"And are you the person who'd be leading this initiative, or are there others involved in the decision?"

TIMELINE:
"Is there a specific timeframe you're working towards, or is this more exploratory for now?"

BUDGET:
"Have you set aside a budget for this, or is that still being worked out?" [Use only after rapport is established]

PROBLEM CLARITY:
"What's prompting you to look at this now — has something specific changed recently?"

PREVIOUS ATTEMPTS:
"Have you tried any solutions for this before, or is this the first time you're looking?"
```

---

## n8n Workflow Structure

```
TRIGGER: WhatsApp webhook (inbound message received)
  ↓
STEP 1: Load conversation history from database (by phone number)
  ↓
STEP 2: Append new message to history
  ↓
STEP 3: Send to Claude API with system prompt + conversation history
  ↓
STEP 4: Parse Claude response
  ↓
STEP 5: Check if Claude flagged QUALIFIED / DISQUALIFIED / CONTINUE
  ↓
IF CONTINUE: Send reply via WhatsApp API → update conversation history → end
IF QUALIFIED: Send reply → create CRM record → alert sales rep via Slack/SMS → end
IF DISQUALIFIED: Send reply → log to disqualified sheet → end
```

---

## Example Conversation

> **Inbound:** "Hi, I saw your workshop ad. Interested to know more."
>
> **Bot:** "Hi! Thanks for reaching out. I'd love to help. What kind of workshop were you looking at — is this for your team, or more for yourself personally?"
>
> **User:** "For my company. We want to train our staff on AI."
>
> **Bot:** "That's great timing — AI training is one of the most requested programmes right now. Roughly how many team members would you be looking to train?"
>
> **User:** "About 80 people. We're a logistics company."
>
> **Bot:** "Interesting — we've worked with a few logistics companies on this. Is this something you're looking to run in the next few months, or still in the planning stage?"
>
> **User:** "Hopefully Q3. Budget is approved already."
>
> **Bot:** "Perfect — that timeline works well. Let me flag this to our team and they'll reach out to you shortly to discuss the details. Is there anything specific you'd like them to know before the call?"

*[System internally marks as QUALIFIED, creates CRM record, alerts sales rep]*

---

## Malaysia-Specific Tips

- **Language switching:** Add a language detection step — if the user writes in Bahasa Malaysia, respond in BM. Bilingual bots convert significantly better in Malaysia.
- **Response timing:** Configure the bot to reply within 30 seconds. Malaysian buyers on WhatsApp expect fast responses and will move on quickly.
- **Business hours context:** Add a message for after-hours contacts: "Our team will review this and follow up with you on [next business day] — is morning or afternoon better for you?"
- **WhatsApp Business API:** Requires a verified Facebook Business account and a BSP (Business Solution Provider). Popular BSPs in Malaysia: WATI, Aisensy, Respond.io
- **Opt-in compliance:** Under PDPA, users must have opted in before receiving marketing messages. This bot handles inbound contacts (they reached out first) — this is generally compliant, but add a footer: "By continuing this conversation, you agree to our Privacy Policy at [URL]"

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| WATI / Respond.io | WhatsApp Business API BSP | USD 49–99/month |
| n8n | Conversation flow automation | Free (self-hosted) |
| Claude API | AI conversation engine | ~USD 0.10–0.50 per conversation |
| Airtable / Google Sheets | Lead log + conversation records | Free |
| HubSpot / Pipedrive | CRM for qualified lead routing | From USD 45/month |

---

## Expected Results

- 24/7 lead qualification without headcount
- Response time drops from hours to seconds
- Sales team only speaks to qualified leads
- 30–50% of inbound leads self-qualify or self-disqualify before human contact
- 20–30% increase in conversion rate from lead to booked call (better preparation)
