# Workflows — What to Build First

Twelve ready-to-run workflows for business leaders. Each one is a WhatsApp message you send to your bot to set it up. Most take under 60 seconds to activate.

> **Prerequisites:** Workflows marked 📧 require Google Workspace connected — see [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md). Everything else works straight out of the box.

---

## How to set up any workflow

Just paste the **Setup prompt** into WhatsApp and send it to your bot. For scheduled workflows, the bot creates a cron job and confirms the schedule. You can always cancel or adjust later:

> *"List my scheduled cron jobs"*
> *"Cancel the meeting prep cron"*
> *"Change my daily briefing to 7:30am"*

---

## Morning routines

### 1 — Daily briefing 📧
**What it does:** Every morning your bot sends a digest of overnight emails, today's calendar, and anything flagged from the day before. Replaces 20 minutes of inbox triage.

**Setup prompt:**
> *"Set up a daily briefing cron job at 8am every weekday. Each morning, send me: (1) A summary of unread emails from the last 12 hours — flag anything urgent or from clients by name. (2) My calendar for today — list each meeting with time, attendees, and a one-line description. (3) Any emails I received but didn't reply to yesterday. Format it as a clean WhatsApp message I can read in 2 minutes."*

**Example output:**
```
☀️ Good morning — Tuesday 29 April

📬 EMAILS (7 unread)
🔴 Sarah Chen (client): "Re: Q2 proposal" — wants a revised timeline
• 3 routine supplier updates
• 2 newsletter digests

📅 TODAY
09:00 Team standup (Ray, CT, you) — weekly check-in
11:00 Investor call (James Tan, Vertex) — Series A update
15:30 Sales review (internal)

⚠️ NEEDS REPLY: Invoice query from ops@greentech.com (2 days old)
```

---

### 2 — End-of-day wrap 📧
**What it does:** At 5:30pm, the bot summarises what happened today and primes you for tomorrow — so you leave the office with a clear head.

**Setup prompt:**
> *"Set up a cron job at 5:30pm every weekday. Send me an end-of-day wrap: (1) Meetings I had today — list any action items I mentioned in emails or calendar notes. (2) Emails I received but haven't replied to. (3) First 3 things on my calendar tomorrow so I know what to expect. Keep it to 8 bullet points max."*

---

### 3 — Weekly preview 📧
**What it does:** Sunday evening, your bot sends a preview of the week ahead — meetings, pending follow-ups, and suggested priorities. Start Monday already oriented.

**Setup prompt:**
> *"Set up a cron job at 7pm every Sunday. Send me a weekly preview: (1) My full calendar for the coming week, grouped by day. (2) Any emails from last week with no reply that I should action this week. (3) Three suggested priorities for the week based on what's in my inbox and calendar. Format it as a short WhatsApp message."*

---

## Meeting intelligence

### 4 — Meeting prep (15 minutes before) 📧
**What it does:** 15 minutes before any calendar event, the bot automatically pulls recent emails from those attendees and sends you a prep brief — so you walk into every call informed.

**Setup prompt:**
> *"Set up a cron job that runs every 15 minutes. At each run, check if I have a calendar event starting in 15 minutes that has external attendees. If yes, send me a meeting prep brief: who's attending, a 2-sentence summary of the most recent email thread I've had with each person, and one suggested opening question. If there's no upcoming meeting, do nothing."*

**Example output:**
```
📋 MEETING PREP — Investor call in 15 min

James Tan (Vertex Ventures)
→ Last email 3 days ago: discussed cap table and Series A timeline
→ He asked about monthly burn rate — come prepared with latest figures

Suggested opener: "James, I know you had questions about our burn — shall I start there?"
```

---

### 5 — Agenda reminder (8am / 12pm / 4pm) 📧
**What it does:** Three times a day, the bot scans your calendar and sends you a heads-up for any meetings in the next 3 hours. Never get caught off-guard by a forgotten call.

**Setup prompt:**
> *"Set up three cron jobs: at 8am, 12pm, and 4pm every weekday. Each run: check my calendar for meetings in the next 3 hours. If there are any, send me a WhatsApp message listing each one with the time, attendees, and meeting title. If there are no meetings in the next 3 hours, send nothing."*

---

### 6 — Post-meeting action capture 📧
**What it does:** 30 minutes after a calendar event ends, the bot asks if you have action items to capture — then stores them and reminds you 24 hours later if they're not done.

**Setup prompt:**
> *"Set up a cron job that runs every 30 minutes. Check if a calendar event ended 30 minutes ago. If yes, send me a WhatsApp message: 'Just finished [meeting name] — any action items to capture? Reply with a quick list and I'll remind you tomorrow.' If I reply, save the items and set a reminder for 24 hours from now."*

---

## Business operations

### 7 — Proposal follow-up tracker 📧
**What it does:** Twice a week, the bot scans your sent emails for proposals and quotations, then drafts follow-up messages for anything that's gone quiet for 5+ days.

**Setup prompt:**
> *"Set up a cron job at 9am every Tuesday and Friday. Search my sent emails from the last 30 days for messages containing the words 'proposal', 'quotation', or 'offer'. For each one with no reply in more than 5 days, draft a short, friendly follow-up email and send me the drafts via WhatsApp. I'll choose which ones to send."*

---

### 8 — New contact brief 📧
**What it does:** When you receive an email from someone new, your bot automatically enriches their profile with a web search — so you know who they are before you reply.

**Setup prompt:**
> *"Whenever I receive an email from someone I've never emailed before, search the web for their name and company, then send me a brief WhatsApp message: who they are, what their company does, and one relevant fact I might find useful. Keep it to 3 bullet points."*

> *Note: This is triggered manually — paste this prompt after opening a new email thread: "Who is [name] from [company]? Find out and brief me."*

---

### 9 — Weekly business review 📧
**What it does:** Every Monday morning, a structured overview of the week ahead and unfinished threads from last week. Useful to share with your EA or team.

**Setup prompt:**
> *"Set up a cron job at 9am every Monday. Send me a weekly business review: (1) This week's calendar — grouped by day, with total meeting count. (2) Three emails from last week that still need a reply, ordered by how long they've been waiting. (3) Based on my recent emails and calendar, suggest the single most important thing I should focus on this week. Format it so I can screenshot and share with my team."*

---

## Content and communication

### 10 — LinkedIn post from your week 📧
**What it does:** Every Friday afternoon, the bot reviews your week and drafts two LinkedIn post options for you to choose from — turning your work into thought leadership without extra effort.

**Setup prompt:**
> *"Set up a cron job at 4pm every Friday. Review my calendar and emails from this week. Pick the most interesting thing I did, learned, or discussed. Draft two short LinkedIn posts (under 200 words each) I could share: one more professional, one more conversational. Send them via WhatsApp for me to pick and edit."*

---

### 11 — Client update generator 📧
**What it does:** Before a weekly or monthly client check-in, the bot pulls the relevant email history and drafts a concise update email you can review and send in minutes.

**Setup prompt (trigger on demand):**
> *"Draft a client update email for [Client Name]. Review our last 2 weeks of emails, summarise what's been done, what's in progress, and what's coming next. Keep it under 200 words, professional tone, no jargon."*

---

### 12 — Competitor and industry digest
**What it does:** Every Monday, your bot searches the web for news about your competitors and industry, then sends you a summary of anything worth knowing.

**Setup prompt:**
> *"Set up a cron job at 8:30am every Monday. Search the web for news in the last 7 days about [your industry, e.g. 'B2B SaaS Southeast Asia'] and [up to 3 competitor names]. For each relevant article, give me a one-line summary and why it matters to me. Maximum 5 items. If nothing significant, say so."*

> *Replace the bracketed text with your actual industry and competitor names when you send this.*

---

## Tips for getting more out of these

**Adjust the timing:** Tell your bot *"Change the daily briefing to 7am"* and it updates the cron. All schedules are in your local timezone.

**Chain workflows:** Once the basics are running, ask your bot to connect them. For example: *"After my daily briefing, if there are any unread emails from clients, also draft short reply starters for each one and include them at the bottom of the briefing."*

**Add your own context:** Your bot works better when it knows your world. Tell it once:
> *"My most important clients are [names]. My business is [what you do]. My biggest current priority is [goal]."*

It will use this context in every workflow.

**Export a weekly summary:** Every Friday, ask: *"Summarise my week — meetings, key emails, decisions made — in a format I can paste into my journal or share with my team."*

---

## What's next

- **Install the Google Workspace plugin** to unlock the 📧 workflows → [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md)
- **Explore more plugins** (web search, Notion, memory) → [SKILLS-GUIDE.md](SKILLS-GUIDE.md)
- **25 more workflows across the full business funnel** → [resources/ai-gtm-playbook/](resources/ai-gtm-playbook/)
