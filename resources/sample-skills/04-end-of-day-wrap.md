# Skill: End-of-Day Wrap

**What it does:** At 5:30pm every weekday, your bot sends a concise summary of what happened today and primes you for tomorrow. You leave the office with a clear head instead of a nagging feeling that something slipped through.

**Requires:** Google Workspace plugin (`gog`) — Gmail + Calendar

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called End-of-Day Wrap. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: End-of-Day Wrap

Every weekday at 5:30pm, send me an end-of-day wrap via WhatsApp.

Include:
1. Meetings I had today — list them with a one-line note on what happened or any action items mentioned in calendar notes or related emails
2. Emails I received today that I haven't replied to yet — flag anything from clients or that seems time-sensitive
3. The first 3 things on my calendar tomorrow so I know what to wake up to

Format rules:
- Maximum 8 bullet points total across all sections
- Use section headers: TODAY'S MEETINGS, NEEDS REPLY, TOMORROW
- Keep it short enough to read in 60 seconds
- If today was quiet (no meetings, no unread emails), say so in one line — don't pad it out
```

---

## Set up the schedule

Send this to your bot:

> *"Set up a cron job at 5:30pm every weekday to send me an end-of-day wrap."*

To adjust the time:

> *"Change my end-of-day wrap to 6pm"*

---

## On-demand trigger

Get a wrap any time:

> *"Give me an end-of-day summary"*

> *"What didn't I finish today and what's first tomorrow?"*

---

## Example output

```
🌆 End of day — Tuesday 29 April

📋 TODAY'S MEETINGS
• Team standup — Ray flagged the Q2 pipeline needs updating before Friday
• Investor call — James wants the financial model by Thursday; follow-up call in 2 weeks
• Sales review — no actions captured

📬 NEEDS REPLY
🔴 Sarah Chen: proposal revision request — 5 hours old
• ops@greentech.com: invoice query — 3 days old

📅 TOMORROW
09:00 Board prep call (Ray, you)
11:30 Product demo — new client
14:00 Free until 4pm
```

---

## Tips

- Tell your bot about recurring priorities so it can flag them:
  > *"In my end-of-day wrap, always check if I replied to any emails from my board members."*

- Chain it with a reminder the next morning:
  > *"If I have unanswered emails in my end-of-day wrap, remind me about them again in my morning briefing."*

- Use it as a team communication tool:
  > *"At the end of the day, also draft a 3-bullet status update I can share with my team on Slack"*
