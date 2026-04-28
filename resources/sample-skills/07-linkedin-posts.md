# Skill: LinkedIn Post Writer

**What it does:** Every Friday afternoon, your bot reviews your week — meetings, emails, and conversations — and drafts two LinkedIn post options for you to choose from. Turns your ordinary work week into thought leadership, with almost no extra effort.

**Requires:** Google Workspace plugin (`gog`) — Gmail + Calendar

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called LinkedIn Post Writer. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: LinkedIn Post Writer

Every Friday at 4pm, review my calendar and emails from the past 5 days.

Find the most interesting, useful, or insightful thing I did, learned, discussed, or decided this week. This could be from a client conversation, a meeting outcome, a problem I solved, a decision I made, or something I observed.

Draft two LinkedIn posts I could share:
- Post A: More professional and insight-driven (sounds like a business leader sharing a lesson)
- Post B: More conversational and personal (sounds like a real person, relatable tone)

Both posts should be:
- Under 200 words
- Written in first person
- Specific — reference a real detail from the week, not vague generalities
- End with a question or call to comment, to encourage engagement

Send both posts via WhatsApp. I'll choose one, edit it, and post it myself.

If my week was genuinely quiet with nothing worth sharing, say so — don't fabricate content.
```

---

## Set up the schedule

Send this to your bot:

> *"Set up a cron job at 4pm every Friday to draft two LinkedIn post options from my week."*

---

## On-demand trigger

Request a post draft any time:

> *"Draft a LinkedIn post about [topic or event from this week]"*

> *"Write two LinkedIn post options about the investor meeting I had yesterday"*

> *"I want to post about [idea]. Write two versions: one formal, one casual."*

---

## Example output

```
📝 LINKEDIN DRAFTS — Friday 25 April

POST A (professional)
---
I've been in three investor conversations this month.

The question that keeps coming up isn't "what's your growth rate" — it's "how do you know what to build next?"

The leaders who answer that question well aren't the ones with the most data. They're the ones who talk to customers every week without an agenda.

We implemented a standing 20-minute "no-pitch call" rule for every new client. It's changed how we build.

What's your signal for knowing you're solving the right problem?

---

POST B (conversational)
---
Had a funny moment in a board prep call this week.

We were reviewing the product roadmap and I realised half the items on it came from assumptions we made six months ago — not from anything customers actually said.

We paused the whole call and spent 30 minutes rewriting the list from scratch based on real conversations.

Felt like a waste of time at first. Ended up being the most useful hour of the month.

Anyone else had that experience?

---

Reply A or B to keep one. Or say "edit post A to mention [detail]".
```

---

## Tips

- Tell your bot your LinkedIn audience so the tone is right:
  > *"My LinkedIn audience is mostly Southeast Asian business owners and startup founders."*

- If you want posts on a specific theme:
  > *"This week only, write LinkedIn posts about [topic — e.g., leadership, AI, sales]"*

- Review and edit before posting — the bot captures the idea and draft; you refine the voice.

> See also: [LinkedIn Posts in WORKFLOWS.md](../../WORKFLOWS.md)
