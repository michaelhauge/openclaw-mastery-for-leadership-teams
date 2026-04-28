# OpenClaw Plugins & Skills Guide

Your bot works out of the box, but it becomes dramatically more useful once you connect it to the tools and data sources you already use. This guide covers the most useful plugins for business leaders — what they do, how to install them, and what to say to get value from them immediately.

---

## Plugins vs. skills — what's the difference?

**Plugins** extend what the bot can *do*. They add new capabilities — connecting to Gmail, searching the web with full page content, remembering things you tell it. They come from **ClawHub** (OpenClaw's plugin marketplace) and are installed in a single conversation.

**Skills** extend how the bot *behaves*. They're short markdown files that tell the bot your preferences, your role, or your workflows. No installation needed — you add them through conversation.

Most people start with plugins, then add skills once the bot is running well.

> New to terms like plugin, API key, or OAuth? → [GLOSSARY.md](GLOSSARY.md) has plain-English definitions for everything in this guide.

---

## How to install any plugin from ClawHub

The pattern is the same for every plugin:

**1. Search for it:**
> *"Search ClawHub for [plugin name]"*

**2. Install it:**
> *"Install [plugin name]"*

**3. Follow any auth prompts.** Some plugins need API keys or account connections. The bot walks you through each one.

**4. Test it:**
> *"What can you do with [plugin name] now?"*

That's it. The bot handles the technical installation.

---

## Top plugins for business leaders

### gog — Google Workspace

**What it does:** Connects your Gmail, Google Calendar, Google Drive, Contacts, Docs, and Sheets. Once connected, your bot can read email, draft replies, check your schedule, search Drive, and create calendar events — all from WhatsApp.

**What you need:** A Google account + a 5-minute device-flow OAuth setup (no SSH or technical knowledge required)

**Full setup guide:** [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md)

**Example prompts to try once connected:**
- *"Summarise my last 5 unread emails and flag anything urgent."*
- *"What's on my calendar this week? Are there any conflicts?"*
- *"Search my Drive for the latest board presentation."*
- *"Draft a reply to the last email from [person] — keep it under 3 sentences."*
- *"Every Monday morning, send me a WhatsApp summary of unread emails from the weekend."*

---

### firecrawl-search — Web search with full page content

**What it does:** Searches the web and retrieves the full content of pages — not just titles and snippets. Much more useful than basic web search when you need to actually read something.

**What you need:** A free API key from [firecrawl.dev](https://firecrawl.dev) (free tier is generous for personal use)

**Install:** Ask the bot to install `firecrawl-search`, then provide your API key when prompted.

**Example prompts:**
- *"Research the latest news about [company]. Pull the full articles, not just headlines."*
- *"Summarise this webpage: [URL]"*
- *"Find the pricing page for [product] and compare it to [competitor]."*
- *"Look up everything publicly available about [person/company] and give me a one-page brief."*

---

### web-search-plus — Multi-source web search

**What it does:** Searches across multiple web sources with summarisation. Good for quick lookups and current information without needing an API key.

**What you need:** Nothing — it works out of the box.

**Install:** *"Install web-search-plus"*

**Example prompts:**
- *"What did [company] announce this week?"*
- *"Who is [person] and what are they known for?"*
- *"What's the current exchange rate for MYR to USD?"*
- *"Give me a brief on [topic] — what do I need to know in 3 bullet points?"*

---

### notion — Notion workspace integration

**What it does:** Read and write to your Notion databases and pages. Great if your team uses Notion for project management, CRM, meeting notes, or knowledge bases.

**What you need:** A Notion API integration key (created at [notion.so/my-integrations](https://www.notion.so/my-integrations) — takes 2 minutes)

**Install:** *"Install the notion plugin"*, then provide your API key when prompted.

**Example prompts:**
- *"Add these action items to my meeting notes in Notion: [list]"*
- *"Show me the 5 most recently updated pages in my workspace."*
- *"Create a new page in [database] with the title [title] and this content: [content]"*
- *"Search my Notion for anything about [client name]."*

---

### memory-lancedb — Persistent memory

**What it does:** Gives the bot a real memory — it remembers things you tell it across conversations. Useful for preferences, context about your business, names of people you work with, and recurring workflows.

**What you need:** Nothing — it stores data locally on your VPS.

**Install:** *"Install memory-lancedb"*

**Example prompts to set memories:**
- *"Remember that I'm the CEO of [company] and we have 45 employees."*
- *"Remember that I prefer bullet-point summaries, max 5 bullets, no preamble."*
- *"Remember that [person] is my CFO and their email is [email]."*
- *"Remember that we close our books on the 25th of each month."*

**Retrieve memories:**
- *"What do you remember about me?"*
- *"What do you know about my business?"*

---

### linear — Linear issue tracker

**What it does:** Read and create issues in Linear. Useful if your engineering or product team uses Linear for task tracking.

**What you need:** A Linear API key (from your Linear account settings)

**Install:** *"Install the linear plugin"*, then provide your API key.

**Example prompts:**
- *"What issues are assigned to me in Linear?"*
- *"Create a bug report in Linear: [description]"*
- *"Show me the issues in the [team/project] backlog that are due this week."*

---

### x-tweet-fetcher — Read Twitter/X posts

**What it does:** Fetch tweets, timelines, and threads from Twitter/X. Useful for keeping up with industry conversations or tracking what competitors are saying.

**What you need:** Nothing for reading — no API key required.

**Install:** *"Install x-tweet-fetcher"*

**Example prompts:**
- *"What is [@handle] saying about [topic] this week?"*
- *"Fetch the latest 10 tweets from [@handle] and summarise the main themes."*
- *"Search Twitter for recent posts about [topic]."*

---

## Skills — customising how your bot behaves

Skills are much simpler than plugins. They're just text instructions that shape how the bot responds to you. You can add them in conversation:

> *"From now on, always respond in bullet points. Maximum 5 bullets. No preamble."*

> *"From now on, assume I'm a non-technical business leader. Avoid jargon. If you need to explain something technical, use a business metaphor."*

> *"When I say 'brief me', give me: current situation, key decision, recommended action. Three sections, nothing else."*

The bot writes these as a skill file and applies them to your future conversations. They persist across restarts.

**More advanced skill usage** — you can create role-specific skills:

> *"Create a skill called 'email mode': when I start a message with 'email:', draft a professional email in my voice. Keep it under 150 words. Sign it with my name."*

Once the skill exists, `email: follow up with David about the contract` becomes a complete email draft in seconds.

---

## What's next

- **Common questions about privacy and cost** → [FAQ.md](FAQ.md)
- **Connect Google Workspace** → [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md) — step-by-step with device-flow OAuth
- **Try 25 AI prompt workflows** → [resources/ai-gtm-playbook/](resources/ai-gtm-playbook/) — copy-paste workflows for SEO, cold email, proposals, and more
- **50+ business prompts** → [resources/ai-implementation-playbook/PROMPT-LIBRARY.md](resources/ai-implementation-playbook/PROMPT-LIBRARY.md)
- **Take the bot home** → [SETUP-GUIDE.md Part 8](SETUP-GUIDE.md#part-8-taking-it-home)
