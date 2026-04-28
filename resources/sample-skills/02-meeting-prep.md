# Skill: Meeting Prep

**What it does:** 15 minutes before any calendar event with external attendees, your bot pulls recent email threads with those people and sends you a prep brief. You walk into every call already knowing the context — without lifting a finger.

**Requires:** Google Workspace plugin (`gog`) — Gmail + Calendar

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Meeting Prep. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Meeting Prep

Check my calendar every 15 minutes. If I have a meeting starting in exactly 15 minutes that has external attendees (people outside my own email domain), send me a meeting prep brief via WhatsApp.

The brief should include:
1. The meeting title, time, and who's attending
2. For each external attendee: their name, company, and a 2-sentence summary of the most recent email thread I've had with them
3. One suggested opening question or talking point based on the email context
4. Any action items or commitments I made to them in recent emails that I should follow up on

Format rules:
- Lead with the meeting name and countdown ("in 15 min")
- One section per external attendee
- Keep it tight — I should be able to read this in 90 seconds
- If I have no prior email history with an attendee, say so and suggest a generic opener

If there are no meetings starting in 15 minutes, do nothing — send no message.
```

---

## Set up the schedule

Send this to your bot:

> *"Set up a cron job that runs every 15 minutes to check for upcoming meetings and send me a meeting prep brief if I have one starting soon."*

Your bot will confirm. The schedule runs continuously during the day — it only sends a message when you have a meeting coming up.

---

## On-demand trigger

Get a prep brief for any meeting:

> *"Prep me for my 3pm call with [name]"*

> *"Who am I meeting with today and what do I need to know?"*

> *"Brief me before my next meeting"*

---

## Example output

```
📋 MEETING PREP — Investor call in 15 min

James Tan (Vertex Ventures)
→ Last email 3 days ago: discussed Series A cap table and timeline
→ He asked about monthly burn rate — have your latest numbers ready
→ Action item: you said you'd send the updated financial model by today

Sarah Chen (GreenTech Solutions)
→ Last email yesterday: she introduced James to the thread
→ No prior direct email history with her

Suggested opener: "James, I know you had questions about our burn rate last time — shall I start there, or would you prefer to walk through the deck first?"
```

---

## Tips

- Works best once you have several months of email history in Gmail — the bot gets smarter about context over time.

- For internal-only meetings, the bot stays silent (no message). You can change this:
  > *"Also brief me for internal meetings with more than 3 attendees"*

- After a meeting, capture what happened:
  > *"I just finished my investor call. Action items: send updated model by Thursday, schedule follow-up in 2 weeks."*

> See also: [Meeting Prep in WORKFLOWS.md](../../WORKFLOWS.md)
