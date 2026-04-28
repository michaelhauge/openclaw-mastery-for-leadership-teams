# Your First 7 Days (and Beyond)

**Reading time:** ~7 minutes

A practical guide to turning your new bot from "cool demo" into something you actually rely on. Each step builds on the last — follow the timeline and you'll have a fully configured assistant by the end of month one.

---

## Before you start — your baseline

Quick check: your bot should be able to do these right now without any extra setup:
- Search the web and summarise results
- Read and summarise any URL you send it
- Draft text (emails, messages, documents) from a prompt
- Answer questions using its training knowledge
- Do basic calculations and analysis

If any of these aren't working, see [SETUP-GUIDE.md Part 7 (Troubleshooting)](SETUP-GUIDE.md#part-7-troubleshooting) before continuing.

---

## Day 1 — Get your first "wow" moment (15 min)

The goal today is one genuinely useful output. Don't set up anything new yet — just use what you have.

**Try these four things:**

1. Send a URL from your browser to your bot: *"Summarise this and pull out any action items for me: [URL]"*
2. Paste a long email and ask: *"What is this person actually asking me to do? What's the one-line reply?"*
3. Ask about a competitor or topic: *"What do you know about [company]? What's their current positioning?"*
4. Ask it to draft something: *"Draft a one-paragraph response to this email: [paste email]"*

> 💡 The "wow" moment usually comes from the URL summarisation or email triage. Once you see it work on something from your actual inbox, the use cases become obvious.

**One thing to do:** Find one real email in your inbox and run it through the bot. That's it for today.

---

## Day 2–3 — Connect Google Workspace (30 min)

**Why this matters:** Without Google connected, your bot is a smart assistant that doesn't know your world. With Google connected, it knows your calendar, your email history, and your upcoming meetings — and can act on all of them.

**What you'll unlock:**
- "What's on my calendar tomorrow?"
- "Summarise my unread emails from the last 24 hours and flag anything urgent"
- "Who am I meeting with at 3pm? What's the most recent email thread with them?"
- "Schedule a 30-minute call with [person] next week"

**How to do it:** Follow [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md) — takes about 15 minutes, no SSH or technical knowledge required.

**First test once connected:**
> *"What's on my calendar today? And do I have any unread emails from clients?"*

> ⚠️ **Workshop server note:** Your workshop server expires in 7 days. If you want to keep using it beyond that, read [SETUP-GUIDE.md Part 8 (Taking it home)](SETUP-GUIDE.md#part-8-taking-it-home) before Day 7. Migration takes about an hour and is much easier when you're not rushed.

**One thing to do:** Connect Google and ask for today's calendar. Done.

---

## Day 4–5 — Your first automated workflow (10 min)

**Why this matters:** The real leverage isn't in asking the bot things — it's in the bot doing things automatically, without you asking. A cron job is a standing instruction that runs on a schedule.

**Start with ONE workflow.** Don't try to set up everything at once.

**Best first workflow — pick one:**

| Workflow | What it does | Set-up time |
|---|---|---|
| Daily briefing | 8am: emails + calendar digest | 1 min |
| End-of-day wrap | 5:30pm: what happened, what's next | 1 min |
| Meeting prep | 15 min before every meeting: attendee context | 1 min |

**Setup:** Copy the prompt from [WORKFLOWS.md](WORKFLOWS.md) for whichever one you chose and send it to your bot.

**Verify it worked:**
> *"List my cron jobs"*

You should see your new workflow in the list with the schedule confirmed.

> 💡 The meeting prep workflow has the fastest "this is magical" impact — the first time it automatically briefs you 15 minutes before a call you forgot you had, you'll understand why people say this changes their workday.

**One thing to do:** Pick one workflow, paste the setup prompt, confirm it scheduled.

---

## Week 1 (Days 6–7) — Give it context about your world

Your bot is smart but it doesn't know your world yet. Spend 5 minutes telling it.

**Send this to your bot:**
> *"I want to give you some standing context about my work. [Your name] here. I'm the [your role] at [company name]. We do [one sentence: what your company does]. My biggest priority right now is [goal]. My key clients are [names]. The people I work most closely with are [names and roles]. I prefer [any preferences: bullet points, concise answers, etc.]."*

The bot will save this as standing context and reference it in future conversations.

**Also do this week:**
- Install `memory-lancedb` if you want the bot to remember things across conversations: *"Install memory-lancedb"*
- Try a web search with context: *"Research [competitor] and tell me anything that's relevant to our business at [company]"*

**One thing to do:** Send your bot the context message above.

---

## Week 2 — Stack two more workflows

You've got one automated workflow running. Now add two more.

**Recommended additions:**

1. **Meeting Prep** (if you didn't start with it) — automatically briefs you 15 min before every meeting
2. **Proposal Tracker** — Tuesday/Friday scan of sent emails for proposals gone quiet

Setup prompts for both are in [WORKFLOWS.md](WORKFLOWS.md). Install as persistent skills with one-click install via [resources/sample-skills/](resources/sample-skills/).

**Also try these on-demand this week:**
- *"Prep me for my 3pm call with [name]"* — manual meeting brief
- *"Draft a follow-up email to [client] about [topic]"* — email draft with context
- *"Give me a competitor brief on [company]. Focus on their pricing and recent moves."* — competitive intel

**One thing to do:** Set up Meeting Prep OR Proposal Tracker.

---

## Week 3 — Create your first custom skill

A skill is a standing behaviour rule you teach the bot. Unlike cron jobs (which run on schedules), skills shape how the bot responds to you in every conversation.

**Try one of these:**

**Formatting preference:**
> *"From now on, always respond in bullet points. Maximum 5 bullets. No preamble, no summary at the end."*

**Role context:**
> *"From now on, when I ask for advice on business decisions, frame it as if you're an experienced operator who has built and sold a business in Southeast Asia. Be direct about what you'd actually do, not just theoretical options."*

**Email mode:**
> *"Create a skill called 'email mode'. When I start a message with 'email:', draft a professional email in my voice. Keep it under 150 words. Sign off with [your name]."*

The bot writes your instruction as a skill file that persists across restarts. Browse [resources/sample-skills/](resources/sample-skills/) for 8 ready-to-install skills covering daily briefing, meeting prep, LinkedIn posts, and more.

**One thing to do:** Create one formatting or behaviour skill.

---

## Day 30 — What good looks like

By Day 30, a well-configured setup should look something like this:

**Automated (running without you asking):**
- Daily briefing at 8am (emails + calendar)
- Meeting prep 15 min before each call
- End-of-day wrap at 5:30pm
- Weekly review Monday 9am
- Proposal tracker Tuesday/Friday

**On-demand use cases you do regularly:**
- Email triage and drafting
- Meeting prep for important calls
- Competitor and industry research
- Summarising long documents or URLs
- Drafting LinkedIn posts, client updates, or internal comms

**Bot knows your world:**
- Your name, company, role
- Your key clients and colleagues
- Your preferences (format, tone, priorities)
- Your standing context (memory installed)

If you're here and all of the above is working — you've built something genuinely valuable. Most people spend $20/month on ChatGPT Plus and use it 3 times a week to rewrite emails. You've built an AI assistant that runs your morning briefing, briefs you before meetings, and tracks your proposals without you asking.

---

## Going further

Once the basics are running, the ceiling is much higher:

- **25 GTM workflows** (SEO, cold email, proposals, competitor intel) → [resources/ai-gtm-playbook/](resources/ai-gtm-playbook/)
- **50+ business prompts** → [resources/ai-implementation-playbook/PROMPT-LIBRARY.md](resources/ai-implementation-playbook/PROMPT-LIBRARY.md)
- **Run your own permanent server** (own the infrastructure, not just the bot) → [SETUP-GUIDE.md Part 8](SETUP-GUIDE.md#part-8-taking-it-home)
- **VPS options: Mac, Oracle Free, DigitalOcean, Contabo** → [resources/openclaw-sea-guide/guides/](resources/openclaw-sea-guide/guides/)
- **Deep theory: how AI thinks, prompting guide, security** → [resources/openclaw-sea-guide/](resources/openclaw-sea-guide/)

---

## What's next

- Connecting Google Workspace → [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md)
- All 12 workflows with setup prompts → [WORKFLOWS.md](WORKFLOWS.md)
- 8 ready-to-install skill files → [resources/sample-skills/](resources/sample-skills/)
- Common questions about cost and privacy → [FAQ.md](FAQ.md)
