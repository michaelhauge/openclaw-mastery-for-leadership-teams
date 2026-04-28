# Skill: Proposal Follow-Up Tracker

**What it does:** Twice a week, your bot scans your sent emails for proposals, quotes, and offers that have gone quiet. For each one with no reply in 5+ days, it drafts a short follow-up message for you to review and send. Deals stop slipping through the cracks.

**Requires:** Google Workspace plugin (`gog`) — Gmail

---

## Install this skill

Copy the block below and send it to your bot:

> *"Add this as a skill called Proposal Tracker. Here's the skill content:"*
> *(paste everything below)*

---

```
SKILL: Proposal Follow-Up Tracker

Every Tuesday and Friday at 9am, scan my sent emails from the last 30 days.

Find emails I sent that:
- Contain words like "proposal", "quotation", "quote", "offer", "scope of work", or "pricing"
- Have received no reply in more than 5 days

For each one found:
1. Note who it was sent to, the subject line, and how many days ago
2. Draft a short, warm follow-up email (3–4 sentences max) that:
   - References the original email naturally
   - Doesn't sound desperate or pushy
   - Ends with a simple call to action (reply, schedule a call, confirm interest)

Send me the drafts via WhatsApp — one per proposal. I'll choose which ones to send.

If nothing is overdue, say so in one line. Don't send an empty report.
```

---

## Set up the schedule

Send this to your bot:

> *"Set up a cron job at 9am every Tuesday and Friday to run the Proposal Tracker skill."*

---

## On-demand trigger

Run a check any time:

> *"Check my sent emails for proposals that haven't had a reply"*

> *"Any outstanding quotes or proposals I should follow up on?"*

> *"Draft a follow-up for my proposal to [client name]"*

---

## Example output

```
📊 PROPOSAL TRACKER — Tuesday 29 April

1. GreenTech Solutions — "Q2 Website Redesign Proposal"
   Sent 8 days ago. No reply.

   Draft follow-up:
   "Hi Sarah, hope you've had a chance to look over the Q2 proposal I sent across last week. Happy to walk you through it on a quick call if that's easier — just let me know a time that suits. Looking forward to hearing your thoughts."

   → Reply YES to send, or say "edit it to mention the discount"

---

2. Nexus Capital — "AI Implementation Scoping Proposal"
   Sent 6 days ago. No reply.

   Draft follow-up:
   "Hi David, just checking in on the scoping proposal from last week. If you have any questions or want to adjust the scope before deciding, I'm happy to jump on a call. Let me know how you'd like to proceed."

   → Reply YES to send, or give me edits
```

---

## Tips

- After reviewing a draft, reply to your bot with the number to send it:
  > *"Send follow-up 1"* or *"Send both follow-ups"*

- Mark deals as closed so the tracker ignores them:
  > *"The GreenTech proposal is closed — don't track it any more"*

- Adjust the sensitivity:
  > *"Update my proposal tracker to flag emails with no reply after 3 days instead of 5"*
