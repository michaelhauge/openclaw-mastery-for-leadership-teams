# Skill: Weekly Business Review

**What it does:** Every Monday morning, your bot sends a structured overview of the week ahead and any unfinished threads from last week. Useful to read before your first meeting, or screenshot and share with your EA or team.

**Requires:** Google Workspace plugin (`gog`) — Gmail + Calendar

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Weekly Review. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Weekly Business Review

Every Monday at 9am, send me a weekly business review via WhatsApp.

Include:
1. This week's calendar — grouped by day, with total meeting count for the week. Flag any days that look overloaded (4+ meetings).
2. Three emails from last week that still need a reply, ordered by how long they've been waiting. Include sender name, subject, and how many days it's been sitting.
3. One suggested focus — based on my calendar and emails, what's the single most important thing I should prioritise this week? Keep this to 2 sentences max.

Format rules:
- Use day headers (MON, TUE, etc.) for the calendar section
- Total meeting count at the top of the calendar section
- Keep the whole message to under 3 minutes reading time
- Format it cleanly enough that I could screenshot and share with my team
```

---

## Set up the schedule

Send this to your bot:

> *"Set up a cron job at 9am every Monday to send me a weekly business review."*

To get a preview version instead:

> *"Set up a weekly preview on Sunday evening at 7pm"* (swaps Monday morning for Sunday night)

---

## On-demand trigger

Request a review any time:

> *"Give me a weekly business review"*

> *"What's my week looking like and what's still outstanding from last week?"*

---

## Example output

```
📊 WEEKLY REVIEW — Monday 28 April
11 meetings this week

MON: Team standup 9am, Board prep 2pm
TUE: Investor call 11am, Sales review 3pm ⚠️ 4 meetings
WED: Free morning, Client workshop 2pm
THU: Product demo 10am, Internal sync 4pm
FRI: Team retro 9am, Partner catch-up 3pm

📬 STILL NEEDS REPLY (from last week)
1. Sarah Chen — "Q2 Proposal feedback" — 6 days old
2. ops@greentech.com — "Invoice query" — 4 days old
3. David Lim — "Partnership intro" — 3 days old

🎯 THIS WEEK'S FOCUS
The investor call on Tuesday is the most time-sensitive item — James asked for the updated financial model before the call. Clear Tuesday morning to prepare that before anything else.
```

---

## Tips

- Give your bot standing context to make the focus recommendation smarter:
  > *"My biggest business priority right now is [goal]. Factor that into my weekly review."*

- Ask for the review as a shareable format:
  > *"Generate this week's review as a clean summary I can paste into Slack for my team"*

- Combine with the End-of-Day Wrap to close the loop:
  > *"At the end of every Friday, summarise the week so I can compare it to what I planned on Monday"*

> See also: [Weekly Review in WORKFLOWS.md](../../WORKFLOWS.md)
