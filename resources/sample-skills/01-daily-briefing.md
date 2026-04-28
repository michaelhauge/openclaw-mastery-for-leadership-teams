# Skill: Daily Briefing

**What it does:** Every weekday morning your bot sends a digest of overnight emails, today's calendar, and anything flagged from the day before. Replaces 20–30 minutes of inbox triage before your first meeting.

**Requires:** Google Workspace plugin (`gog`) — Gmail + Calendar

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Daily Briefing. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Daily Briefing

Every weekday at 8am, send me a morning briefing via WhatsApp.

The briefing should contain:
1. A summary of unread emails received in the last 12 hours. Flag anything urgent or from a client by name. Mark newsletters and automated emails separately — I don't need to action those.
2. My calendar for today — list each event with time, attendees, and a one-line description of what it's about if you can infer it.
3. Any emails I received yesterday that I still haven't replied to.

Format rules:
- Keep the whole message under 2 minutes to read
- Use clear section headers: EMAILS, TODAY, NEEDS REPLY
- Use 🔴 for urgent items, • for normal items
- If my inbox is quiet and calendar is clear, say so in one line — don't pad it out

This runs automatically. I don't need to trigger it.
```

---

## Set up the schedule

Send this to your bot to activate:

> *"Set up a cron job at 8am every weekday (Monday to Friday) to run the Daily Briefing skill."*

Your bot will confirm the schedule. To adjust the time later:

> *"Change my daily briefing to 7:30am"*

---

## On-demand trigger

Ask for a briefing any time:

> *"Give me my morning briefing now"*

> *"What's in my inbox and on my calendar today?"*

---

## Example output

```
☀️ Good morning — Tuesday 29 April

📬 EMAILS (7 unread)
🔴 Sarah Chen (client): "Re: Q2 proposal" — wants a revised timeline by Friday
🔴 James Tan: "Investor call prep" — sent you a deck to review before 11am
• 3 routine supplier updates
• 2 newsletter digests (not actioned)

📅 TODAY
09:00 Team standup (Ray, CT, you)
11:00 Investor call (James Tan, Vertex Ventures)
15:30 Sales pipeline review (internal)

⚠️ NEEDS REPLY
• Invoice query from ops@greentech.com — 2 days old
• Partnership intro from Linda Wu — 1 day old
```

---

## Tips

- Tell your bot who your most important clients are so it flags them by name:
  > *"My key clients are [names]. Always flag emails from them as urgent in my briefing."*

- If the briefing is too long, ask it to shorten:
  > *"Keep my daily briefing to 5 bullet points max"*
