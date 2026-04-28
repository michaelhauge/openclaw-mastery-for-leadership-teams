# Sample OpenClaw Skills

Eight ready-to-install skills for business leaders. Each file is a self-contained OpenClaw skill — it tells your bot how to behave, how to format output, and includes the exact WhatsApp prompt to activate it.

---

## How to install a skill

**Method 1 — Paste to your bot (easiest)**

Copy the contents of the skill file below and send it to your bot with this message:

> *"Add this as a skill called [skill name]. Here's the skill content:"*
> *(paste the full file contents)*

**Method 2 — Fetch from GitHub**

Tell your bot:

> *"Fetch and install the skill at this URL: https://raw.githubusercontent.com/michaelhauge/openclaw-mastery-for-leadership-teams/main/resources/sample-skills/01-daily-briefing.md"*

Replace the filename with whichever skill you want.

---

## Skills in this folder

| File | Skill | Requires Google? |
|---|---|---|
| [01-daily-briefing.md](01-daily-briefing.md) | Morning email + calendar digest, 8am daily | Yes — Gmail + Calendar |
| [02-meeting-prep.md](02-meeting-prep.md) | Auto-brief 15 min before every meeting | Yes — Gmail + Calendar |
| [03-agenda-reminder.md](03-agenda-reminder.md) | Upcoming meeting alerts at 8am, 12pm, 4pm | Yes — Calendar |
| [04-end-of-day-wrap.md](04-end-of-day-wrap.md) | Daily wrap at 5:30pm — what happened, what's next | Yes — Gmail + Calendar |
| [05-proposal-tracker.md](05-proposal-tracker.md) | Follow-up drafts for proposals gone quiet | Yes — Gmail |
| [06-weekly-review.md](06-weekly-review.md) | Monday morning business review | Yes — Gmail + Calendar |
| [07-linkedin-posts.md](07-linkedin-posts.md) | Friday — two LinkedIn post options from your week | Yes — Calendar |
| [08-competitor-digest.md](08-competitor-digest.md) | Monday — competitor and industry news roundup | No — web search only |

> Skills marked **Yes** require the `gog` plugin (Google Workspace). See [GOOGLE-OAUTH-SETUP.md](../../GOOGLE-OAUTH-SETUP.md) to connect.

---

## After installing

Once a skill is loaded, your bot uses it as standing instructions for that function. You can always update a skill by sending:

> *"Update my [skill name] skill with these changes: ..."*

Or remove it:

> *"Remove the [skill name] skill"*
