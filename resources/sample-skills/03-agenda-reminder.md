# Skill: Agenda Reminder

**What it does:** Three times a day — 8am, 12pm, and 4pm — your bot checks your calendar and sends a heads-up for any meetings in the next 3 hours. Never get blindsided by a forgotten call.

**Requires:** Google Workspace plugin (`gog`) — Calendar only

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Agenda Reminder. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Agenda Reminder

Three times each weekday — at 8am, 12pm, and 4pm — check my calendar for meetings in the next 3 hours.

If there are meetings in that window:
- List each meeting with the start time, title, and attendees
- If a meeting has a description or location, include it in one line
- Flag any meeting I haven't accepted yet

If there are no meetings in the next 3 hours, send nothing. Don't send an empty message.

Keep the format clean and scannable — I should be able to read this in 20 seconds.
```

---

## Set up the schedule

Send this to your bot:

> *"Set up three cron jobs: at 8am, 12pm, and 4pm every weekday. Each run should check my calendar for the next 3 hours and send me an agenda reminder if I have any meetings coming up."*

Your bot will confirm all three schedules.

---

## On-demand trigger

Ask for your agenda any time:

> *"What's on my calendar this afternoon?"*

> *"Do I have any meetings in the next 2 hours?"*

> *"Show me today's schedule"*

---

## Example output

```
📅 AGENDA — next 3 hours

14:00 Sales pipeline review
  Ray, CT, you — internal

15:30 Client call: GreenTech onboarding
  Sarah Chen, Linda Wu — ⚠️ you haven't accepted this yet

17:00 Quick check-in with investor
  James Tan — 15 min
```

---

## Tips

- Combine with Meeting Prep (skill 02) for automatic briefings before each call.

- If you want reminders for the full day instead of just the next 3 hours:
  > *"Update my agenda reminder skill: show all meetings for the rest of the day, not just the next 3 hours"*

- To add a 6pm check-in as well:
  > *"Add a 6pm agenda reminder to my existing cron jobs"*

> See also: [Agenda Reminder in WORKFLOWS.md](../../WORKFLOWS.md)
