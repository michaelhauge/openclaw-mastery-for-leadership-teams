---
title: "feat: Repo participant experience — professional redesign and portfolio upgrade"
type: feat
status: completed
date: 2026-04-28
---

# feat: Repo Participant Experience — Professional Redesign and Portfolio Upgrade

## Overview

Transform the `openclaw-mastery-for-leadership-teams` repo from a good workshop delivery kit into the most participant-friendly and professionally impressive AI workshop repo a leadership audience has ever seen. The repo doubles as a portfolio piece: every participant who reads it should come away thinking "this person understands AI deeply and I should ask them about my business."

Six changes achieve this: (1) a complete README redesign with journey-based navigation and a consultant credibility signal, (2) a new `WHY-SELF-HOSTED.md` positioning document that demonstrates strategic AI thinking, (3) a `FAQ.md` that answers the non-technical questions every business leader has, (4) a `FIRST-WEEK.md` post-workshop guide that bridges "I got it running" to "I rely on this daily," (5) a cross-linking and broken-link audit, and (6) a polish pass ensuring consistent formatting, reading time estimates, and "next steps" footers in every document.

---

## Problem Frame

The current repo is technically complete — it covers setup, workflows, skills, Google OAuth, and a glossary. But it reads like an instruction manual, not like a showcase of expertise. Three specific gaps prevent it from being great:

**Gap 1 — No "why" document.** Participants who discover this repo outside the workshop context (via LinkedIn, a referral, or search) have no way to understand the philosophy behind self-hosted AI. The comparison table in SETUP-GUIDE.md Part 1 is buried in a 478-line document. A standalone positioning page is missing entirely.

**Gap 2 — No FAQ.** Business leaders have a predictable set of non-technical questions: *Is my data safe? What does this cost to run? Can my team use this too? What happens when the workshop server expires? Is this legal in my country?* None of these are answered anywhere easily findable.

**Gap 3 — No post-workshop journey.** The gap between "I completed setup" and "this is now part of my daily workflow" is the hardest to cross. WORKFLOWS.md lists workflows but doesn't give participants a sequenced path: what to do on Day 1, Day 3, Day 7, and Day 30.

**Gap 4 — Broken external links.** `SETUP-GUIDE.md` has 10 links pointing to `github.com/michaelhauge/myeo-ai-resources/...` — the old repo. All the linked content now lives locally in `resources/openclaw-sea-guide/`. These links silently break for any reader.

**Gap 5 — No portfolio/credibility signal.** The repo builds toward consulting engagement but has no "about the facilitator" signal. A participant curious about working with Michael has no pathway to initiate contact from within the repo.

---

## Requirements Trace

- R1. README redesigned with journey-based navigation, strong opening, and portfolio signal
- R2. New `WHY-SELF-HOSTED.md` positioning document demonstrating strategic AI expertise
- R3. New `FAQ.md` answering business-leader non-technical questions
- R4. New `FIRST-WEEK.md` post-workshop progression guide (Day 1 → Day 30)
- R5. All 10 broken `myeo-ai-resources` external links in SETUP-GUIDE.md replaced with local `resources/` paths
- R6. WORKFLOWS.md entries cross-linked to corresponding `resources/sample-skills/` files
- R7. GLOSSARY.md linked from first occurrence of technical terms in main docs
- R8. Every document has a "What's next" / "Next steps" footer section
- R9. Consistent reading-time estimates in every participant-facing document

---

## Scope Boundaries

- No changes to workshop infrastructure (VPS scripts, dispenser, server config)
- No changes to CAPTAIN.md (captain-audience document, already well-structured)
- No changes to `docs/operator/` (internal ops docs)
- No restructuring of `resources/` subdirectories — content is already copied and correct
- No GitHub Pages setup, social preview images, or CI/CD pipelines in this pass
- Not building a full website or changing the URL structure of the repo
- `WHY-SELF-HOSTED.md` should not overlap with SETUP-GUIDE.md Part 1 — it supersedes and deepens that section; Part 1 should be condensed to a pointer

### Deferred to Follow-Up Work

- Video/Loom walkthroughs for any guide (separate pass once content is stable)
- Translating any documents into Malay or Mandarin
- `CONTRIBUTING.md` for open-source contribution model (not needed for workshop context)
- GitHub issue templates for participant bug reports

---

## Context & Research

### Existing Content Strengths to Preserve

- `SETUP-GUIDE.md` table of contents (lines 12–21) is already good — preserve it
- `SETUP-GUIDE.md` Part 1 comparison table (lines 30–39) — this content should live in `WHY-SELF-HOSTED.md` and become a pointer in Part 1, not be deleted
- `WORKFLOWS.md` example output blocks — well done, preserve and extend this pattern
- `SKILLS-GUIDE.md` plugin-per-section format — clear, preserve
- `GOOGLE-OAUTH-SETUP.md` opening concrete examples (lines 5–10) — strong, use as the pattern for opening sections elsewhere

### Broken Links to Fix (SETUP-GUIDE.md)

All 10 links point to `https://github.com/michaelhauge/myeo-ai-resources/...` and should be replaced with repo-relative paths:

| Line | Current (broken) | Replace with |
|------|-----------------|--------------|
| 46 | `.../openclaw-sea-guide/USE-CASES.md` | `resources/openclaw-sea-guide/USE-CASES.md` |
| 46 | `.../openclaw-sea-guide/MENTAL-MODEL.md` | `resources/openclaw-sea-guide/MENTAL-MODEL.md` |
| 110 | `.../openclaw-sea-guide/guides/02-llm-providers.md` | `resources/openclaw-sea-guide/guides/02-llm-providers.md` |
| 111 | `.../openclaw-sea-guide/guides/09-managed-hosting-providers.md` | `resources/openclaw-sea-guide/guides/09-managed-hosting-providers.md` |
| 112 | `.../openclaw-sea-guide/PRICING.md` | `resources/openclaw-sea-guide/PRICING.md` |
| 388 | `.../openclaw-sea-guide/guides/05-digitalocean.md` | `resources/openclaw-sea-guide/guides/05-digitalocean.md` |
| 389 | `.../openclaw-sea-guide/guides/06-contabo-vps.md` | `resources/openclaw-sea-guide/guides/06-contabo-vps.md` |
| 391 | `.../openclaw-sea-guide/guides/04-oracle-cloud-free.md` | `resources/openclaw-sea-guide/guides/04-oracle-cloud-free.md` |
| 392 | `.../openclaw-sea-guide/guides/03-local-mac.md` | `resources/openclaw-sea-guide/guides/03-local-mac.md` |
| 405 | `.../openclaw-sea-guide/guides/09-managed-hosting-providers.md` | `resources/openclaw-sea-guide/guides/09-managed-hosting-providers.md` |
| 473 | `.../openclaw-sea-guide` (tree link) | `resources/openclaw-sea-guide/` |

### Workflow-to-Skill Cross-Link Map

`WORKFLOWS.md` workflows 1–8 (by number) map to `resources/sample-skills/` files:

| WORKFLOWS.md section | Skill file |
|---|---|
| 1 — Daily briefing | `resources/sample-skills/01-daily-briefing.md` |
| 2 — End-of-day wrap | `resources/sample-skills/04-end-of-day-wrap.md` |
| 3 — Weekly preview | `resources/sample-skills/06-weekly-review.md` |
| 4 — Meeting prep | `resources/sample-skills/02-meeting-prep.md` |
| 5 — Agenda reminder | `resources/sample-skills/03-agenda-reminder.md` |
| 7 — Proposal tracker | `resources/sample-skills/05-proposal-tracker.md` |
| 10 — LinkedIn posts | `resources/sample-skills/07-linkedin-posts.md` |
| 12 — Competitor digest | `resources/sample-skills/08-competitor-digest.md` |

### Best-in-Class README Patterns to Follow

Strong GitHub workshop repos (The Missing Semester, Anthropic Cookbook, Cal.com) share these traits:
- A hero section with one-sentence value proposition, then "who is this for" and "what you'll get"
- A "Start here" decision tree for different reader types (participant vs. curious outsider vs. technical deep-diver)
- Journey-based navigation that tells the reader *what to do when*, not just *what exists*
- A tasteful "about the creator" signal with a contact path — typically 2–3 sentences max at the end

---

## Key Technical Decisions

- **`WHY-SELF-HOSTED.md` supersedes SETUP-GUIDE.md Part 1, not duplicates it.** Part 1 is condensed to 3–5 lines pointing to the new file. This avoids drift between two versions of the same comparison.
- **`FAQ.md` is a root-level file**, not buried in `docs/`. Business leaders who find the repo need to see it alongside the main guides.
- **`FIRST-WEEK.md` is structured as a Day-by-day timeline**, not a list of features. The progression metaphor ("Day 1 / Day 3 / Day 7 / Day 30") makes the learning journey concrete and achievable rather than overwhelming.
- **Portfolio signal lives in the README, not a separate `ABOUT.md`.** An `ABOUT.md` creates a navigation dead end; two sentences in the README footer keeps it discoverable without feeling like self-promotion.
- **Reading time estimates belong at the top of every document**, not just SETUP-GUIDE. They set reader expectations and are a signal of thoughtfulness.
- **GLOSSARY is not linked inline with `[term](GLOSSARY.md#term)` anchors** — this creates too much visual noise. Instead, a "New to any of these terms?" callout linking to GLOSSARY.md is added once near the top of SETUP-GUIDE, WORKFLOWS, and SKILLS-GUIDE.

---

## Open Questions

### Resolved During Planning

- **Should `WHY-SELF-HOSTED.md` include a cost breakdown?** Yes — it belongs here rather than being isolated in `resources/openclaw-sea-guide/PRICING.md`. A short 3-line cost summary with a pointer to PRICING.md for the full breakdown.
- **Should FAQ be its own page or merged into GLOSSARY?** Separate — FAQ is questions and answers (decision/action-oriented), GLOSSARY is term definitions (reference). Different use patterns; merging would make both worse.
- **Where does the portfolio/consultant signal go?** Two sentences in the README `## About this workshop` section, with LinkedIn profile link. Tasteful — not a sales pitch.

### Deferred to Implementation

- **Which specific GLOSSARY terms get "new to this?" callout links** — determined by reading each doc and identifying the first page where a cluster of technical terms appears. Not knowable in advance.
- **Exact wording of `FIRST-WEEK.md` Day-by-day activities** — must be calibrated against actual workshop participant pace, which the implementer knows from running the workshop.

---

## Output Structure

```
openclaw-mastery-for-leadership-teams/
├── README.md                    (rewritten — journey nav, portfolio signal)
├── WHY-SELF-HOSTED.md           (new — positioning/philosophy doc)
├── FAQ.md                       (new — business leader questions)
├── FIRST-WEEK.md                (new — Day 1 → Day 30 progression guide)
├── SETUP-GUIDE.md               (updated — broken links fixed, Part 1 pointer)
├── WORKFLOWS.md                 (updated — cross-links to skill files)
├── SKILLS-GUIDE.md              (updated — polish, next-steps footer)
├── GOOGLE-OAUTH-SETUP.md        (updated — polish, reading time, next steps)
├── GLOSSARY.md                  (unchanged content, linked from other docs)
└── resources/
    └── sample-skills/
        └── *.md                 (updated — cross-link back to WORKFLOWS.md)
```

---

## Implementation Units

- U1. **Create `WHY-SELF-HOSTED.md` — positioning and philosophy document**

**Goal:** A standalone, polished document that answers "why should I run my own AI assistant instead of using ChatGPT Plus or Claude Pro?" Demonstrates strategic AI thinking and positions self-hosted AI for leadership teams. This is the single biggest portfolio/credibility signal in the repo.

**Requirements:** R2, R9

**Dependencies:** None

**Files:**
- Create: `WHY-SELF-HOSTED.md`

**Approach:**

Structure:
1. **The question worth asking** — One paragraph framing: AI assistants are cheap now. The question isn't whether to use one — it's whether to rent one or own one.
2. **The case for self-hosted** — Four arguments in plain English:
   - *Your data stays yours* — no training on your conversations, no third-party database
   - *You choose the model* — swap Moonshot for Claude for GPT-4 without losing your setup
   - *You build on a foundation you control* — cron jobs, custom skills, plugins, no platform risk
   - *It costs less than a coffee per day at scale*
3. **Side-by-side comparison** — An expanded version of the SETUP-GUIDE Part 1 table, covering: ChatGPT Plus, Claude Pro, Microsoft 365 Copilot, Google Gemini Advanced, and OpenClaw. Rows: where it runs, data privacy, model flexibility, automation/scheduling, integrations, monthly cost, vendor lock-in.
4. **The cost breakdown** — Concrete numbers: $4–6/month Hetzner VPS + $2–10/month LLM API usage at typical leadership usage = $6–16/month total vs. $20–30/month for ChatGPT Plus or Claude Pro. Link to `resources/openclaw-sea-guide/PRICING.md` for the full breakdown.
5. **What you give up** — Honest tradeoffs: more setup, you're responsible for updates, no mobile app (WhatsApp is the interface), technical issues require some troubleshooting.
6. **Who this is for** — One paragraph on the ideal self-hosted AI user (business leader who values privacy/control, willing to invest 2 hours upfront for long-term gain).
7. **Ready to try it?** — Link to SETUP-GUIDE.md.

Voice: confident and clear, not evangelical. Acknowledge tradeoffs honestly. This builds more trust than overselling.

**Patterns to follow:**
- SETUP-GUIDE.md Part 1 comparison table format (expand and move here)
- GOOGLE-OAUTH-SETUP.md opening section tone (concrete, direct, benefit-first)

**Test scenarios:**
- Happy path: A business leader who finds this repo without attending the workshop can read this doc in 4–5 minutes and make a genuinely informed decision about whether self-hosted AI is right for them.
- Edge case: The document doesn't pretend self-hosted is always better — the "what you give up" section handles this honestly.
- Integration scenario: SETUP-GUIDE.md Part 1 is condensed to a 3-line pointer to this file after U5 runs.

**Verification:**
- File exists at `WHY-SELF-HOSTED.md`
- Contains: philosophy framing, side-by-side comparison table, cost numbers, honest tradeoffs, "who this is for", link to SETUP-GUIDE.md
- Readable in under 6 minutes
- Reading time estimate at the top

---

- U2. **Create `FAQ.md` — business leader questions**

**Goal:** A single-page FAQ answering the non-technical questions business leaders predictably ask when they encounter self-hosted AI. Removes friction for curious participants who become deterred by unanswered concerns.

**Requirements:** R3, R9

**Dependencies:** None (can be written in parallel with U1 and U3)

**Files:**
- Create: `FAQ.md`

**Approach:**

Organise into four question clusters:

**Privacy and security:**
- *Is my data private? Does anyone else see my conversations?* — No. Conversations go directly between your device, your server, and the LLM provider you chose. No third party aggregates them.
- *Is it safe to connect my Gmail?* — Yes. The `gog` plugin uses standard OAuth — the same mechanism your other apps use. You can revoke access any time from your Google account.
- *Who has access to my server?* — Only you (via the browser terminal) and your table captain during the workshop (via Tailscale, a private VPN). Tailscale access is removed after the event.

**Cost and pricing:**
- *What does it cost per month after the workshop?* — Typically $6–16/month: a VPS (~$4–6) plus LLM API usage (~$2–10 at typical usage). See `WHY-SELF-HOSTED.md` for the full breakdown.
- *What happens to the workshop server after 7 days?* — It gets destroyed. Your conversations and skills are lost unless you migrate first. See SETUP-GUIDE.md Part 8 for options.
- *Can I get a cheaper option?* — Yes. Oracle Cloud has a free VPS tier that runs OpenClaw well. See `resources/openclaw-sea-guide/guides/04-oracle-cloud-free.md`.

**Usage and team:**
- *Can my team use my bot, or is it just for me?* — It's personal by default. You can share your WhatsApp number with assistants, but the design intent is one bot per person. For team deployments, ask the facilitator about the multi-user setup.
- *Can I use it from my phone?* — Yes — that's the whole point. OpenClaw's WhatsApp interface means it works from anywhere you can send a WhatsApp message.
- *What happens if I say something wrong — will the bot remember it?* — Only if you have the `memory-lancedb` plugin installed. Without memory, each conversation is fresh. With memory, you can tell the bot "forget that" and it will.

**Technical:**
- *What if my bot stops replying?* — See SETUP-GUIDE.md Part 7 (Troubleshooting) or CAPTAIN.md.
- *Do I need to keep my laptop on for the bot to work?* — No. The bot runs on your VPS, which is always on. You just need WhatsApp on your phone.
- *What happens if the LLM provider raises prices or shuts down?* — Change two settings in a 2-minute bot conversation to switch to a different provider. Your skills, cron jobs, and memory stay intact.

Use question–answer format (bold question, plain answer). Keep each answer to 3–5 sentences. Link to the relevant guide for anything that needs a longer treatment.

**Patterns to follow:**
- `resources/openclaw-sea-guide/FAQ.md` (if it has content worth referencing)
- Clear, non-technical tone matching SETUP-GUIDE.md Part 1 voice

**Test scenarios:**
- Happy path: A non-technical CEO can read all questions and answers without needing to Google a single term
- Edge case: "What if I forget my browser terminal password?" — include this; it's a real participant question
- Edge case: "Is this legal in Malaysia / Singapore / Indonesia?" — answer honestly (generally yes; the bot itself is legal; users are responsible for how they use it)

**Verification:**
- File exists at `FAQ.md`
- Covers: privacy, Gmail/calendar safety, who has server access, costs, what happens after 7 days, team usage, phone usage, bot goes silent, always-on, provider switching
- Reading time estimate at top

---

- U3. **Create `FIRST-WEEK.md` — post-workshop progression guide**

**Goal:** A concrete "Day 1 through Day 30" guide that bridges the gap between "my bot is running" and "this is now part of my daily workflow." Structured as a progressive timeline, not a feature list.

**Requirements:** R4, R9

**Dependencies:** None

**Files:**
- Create: `FIRST-WEEK.md`

**Approach:**

Structure as a **timeline with milestones**, not a list of instructions:

**Before anything: your starting point**
- Your bot is running and replying on WhatsApp
- You can search the web and ask questions
- You have a browser terminal if you need it

**Day 1 — Test the foundation (15 minutes)**
- 5 things to ask your bot right now (web search, URL summary, draft an email from scratch, explain a concept, set a reminder)
- Goal: confirm it works; get the first "wow" moment
- If anything isn't working: link to SETUP-GUIDE.md Part 7

**Day 2–3 — Connect Google Workspace (30 minutes)**
- Install the `gog` plugin via WhatsApp
- Run the device-flow OAuth
- First test prompts: "What's on my calendar today?", "What's the last email from [person]?"
- Link to `GOOGLE-OAUTH-SETUP.md` for the full walkthrough

**Day 4–5 — Set up your first cron job (10 minutes)**
- Pick ONE workflow from `WORKFLOWS.md` — recommended first: Daily Briefing or End-of-Day Wrap
- Paste the setup prompt and confirm the cron job
- Check it works: ask "List my cron jobs" and verify it's scheduled

**Week 1 (Days 6–7) — Add context**
- Tell your bot about your business: `"I'm the CEO of [company]. We do [what]. My biggest priority right now is [goal]. My key clients are [names]."`
- Install one more plugin (web-search-plus if not installed; memory-lancedb for persistence)
- Link to `SKILLS-GUIDE.md`

**Week 2 — Stack two more workflows**
- Add Meeting Prep (automatic 15-min briefings before calendar events)
- Add the Proposal Tracker (Tuesday/Friday scan for quiet proposals)
- Try an on-demand use case: briefing, draft email, competitor research

**Week 3 — First custom skill**
- Create one behaviour skill via conversation (formatting preference, role context, or email mode)
- Adjust an existing cron job timing if needed
- Link to `resources/sample-skills/` for copy-paste skill templates

**Day 30 milestone — What good looks like**
- 2–3 automated cron jobs running daily/weekly
- Google Workspace connected and working
- Bot knows your context, preferences, and clients
- You've saved at least 2 hours in email triage and meeting prep

**If you want to go further:**
- Taking it home (own server): SETUP-GUIDE.md Part 8
- 25 more workflows: `resources/ai-gtm-playbook/`
- 50+ business prompts: `resources/ai-implementation-playbook/PROMPT-LIBRARY.md`

Keep each day's section short — 5–8 bullet points maximum. This is a guide to action, not a reference manual. Every section should end with a concrete task, not just information.

**Patterns to follow:**
- WORKFLOWS.md example output style (concrete, action-oriented)
- SETUP-GUIDE.md callout boxes (💡 for tips, ⚠️ for warnings)

**Test scenarios:**
- Happy path: A participant who finished the workshop can follow this guide for 30 days and end up with a bot they actively rely on
- Edge case: Participant didn't connect Google Workspace — the guide gracefully handles non-Google paths by marking those steps as optional
- Edge case: Participant's server expires before Day 30 — Day 7 section warns about the 7-day window and links to Part 8

**Verification:**
- File exists at `FIRST-WEEK.md`
- Timeline covers: Day 1 (foundation test), Day 2–3 (Google), Day 4–5 (first cron), Week 1 (context), Week 2 (stack workflows), Week 3 (custom skill), Day 30 (milestone check)
- Reading time estimate at top
- Links to WORKFLOWS.md, GOOGLE-OAUTH-SETUP.md, SKILLS-GUIDE.md, SETUP-GUIDE.md Part 8

---

- U4. **Redesign `README.md` — journey nav and portfolio signal**

**Goal:** Transform the README from a file index into a compelling first impression that serves three reader types: workshop participant (action-oriented), post-workshop explorer (wants to go deeper), and curious outsider (assessing whether to attend or hire the facilitator).

**Requirements:** R1, R9

**Dependencies:** U1, U2, U3 (new files must exist before README can link to them)

**Files:**
- Modify: `README.md`

**Approach:**

Revised structure:

**1. Hero section**
- Headline: `# OpenClaw Mastery for Leadership Teams`
- One-sentence value proposition: "A hands-on workshop that gives every participant a personal AI assistant — running on their own server, talking to them on WhatsApp — by the end of the day."
- Workshop metadata line: "Workshop hosted by [facilitator name] · April 29, 2026 · Kuala Lumpur"
- Quick-start callout box: "**Live at the workshop?** → [Claim your OpenClaw](claim URL) | **Already set up?** → [First week guide](FIRST-WEEK.md) | **Curious but not attending?** → [Why self-hosted?](WHY-SELF-HOSTED.md)"

**2. What you'll have by the end of the day** (keep existing section, tighten to 4 bullets)

**3. Start here — choose your path**
Three clearly labelled tracks (callout boxes or a decision table):
- **Workshop participant** → SETUP-GUIDE.md Part 3
- **Post-workshop: extend your bot** → FIRST-WEEK.md
- **Considering self-hosted AI for your business** → WHY-SELF-HOSTED.md

**4. All materials — complete contents table**
Updated table including WHY-SELF-HOSTED.md, FAQ.md, FIRST-WEEK.md. Keep the Audience column. Add a "Time to read" column.

**5. Quick links** (keep existing structure, add new files)

**6. Resources** (keep existing, add reading time hints)

**7. About this workshop** (new — 3 sentences)
"This workshop is designed and facilitated by [Michael Hauge](https://linkedin.com/in/michaelhauge), an AI implementation specialist based in Kuala Lumpur who helps leadership teams adopt AI tools that they own and control. If you'd like to bring this workshop to your organisation, or discuss an AI advisory engagement, reach out via LinkedIn."

**8. Licence** (keep)

Do NOT use emoji in the hero section or table headers — the repo should read as professional, not startup-casual. Emoji are already used in SETUP-GUIDE.md callout boxes (💡 ⚠️ ✅) and can stay there; the README tone should be slightly more formal.

**Patterns to follow:**
- The Missing Semester README structure (audience routing at the top)
- SETUP-GUIDE.md's matter-of-fact, non-condescending tone

**Test scenarios:**
- Happy path (participant): A workshop participant scans the README and immediately finds the "Live at the workshop?" callout and clicks through to set up in under 10 seconds
- Happy path (outsider): Someone who hasn't attended the workshop reads the README and can independently decide whether self-hosted AI is relevant to them
- Happy path (portfolio): A potential consulting client reads the README and walks away knowing this person runs professional AI workshops and is available for advisory work
- Edge case: The "All materials" table doesn't have orphaned rows — every root-level .md file appears

**Verification:**
- Three reader paths clearly signposted in the first 20 lines
- `WHY-SELF-HOSTED.md`, `FAQ.md`, `FIRST-WEEK.md` all linked
- "About this workshop" section present with Michael's LinkedIn link
- Reading time column in the materials table

---

- U5. **Fix broken links and complete cross-linking audit**

**Goal:** Repair all 10 broken external links in SETUP-GUIDE.md; add bidirectional links between WORKFLOWS.md and the corresponding `resources/sample-skills/` files; add GLOSSARY callout links in key documents.

**Requirements:** R5, R6, R7

**Dependencies:** U1, U2, U3 (so we can also link to the new files from SETUP-GUIDE.md and SKILLS-GUIDE.md)

**Files:**
- Modify: `SETUP-GUIDE.md` (10 broken links + Part 1 pointer to WHY-SELF-HOSTED.md)
- Modify: `WORKFLOWS.md` (cross-links to skill files)
- Modify: `resources/sample-skills/01-daily-briefing.md` through `08-competitor-digest.md` (link back to WORKFLOWS.md)
- Modify: `SKILLS-GUIDE.md` (add GLOSSARY callout, link to FAQ.md)
- Modify: `GOOGLE-OAUTH-SETUP.md` (link to FAQ.md privacy section)

**Approach:**

**SETUP-GUIDE.md fixes:**
- Replace all 10 broken `github.com/michaelhauge/myeo-ai-resources/...` links with the repo-relative `resources/openclaw-sea-guide/...` equivalents (see table in Context section)
- Condense Part 1 (lines ~25–46) to: "For the full case for self-hosted AI — including a side-by-side comparison with ChatGPT Plus, Claude Pro, and Microsoft Copilot — see [WHY-SELF-HOSTED.md](WHY-SELF-HOSTED.md)." Then keep only the 1-sentence summary table.
- Add a GLOSSARY callout near the top of the document (after the intro paragraph): "New to terms like VPS, cron job, or OAuth? → [GLOSSARY.md](GLOSSARY.md)"

**WORKFLOWS.md cross-links:**
- For each of the 8 workflows that have a corresponding skill file, add a line after the setup prompt: "**Want this to persist as a standing skill?** → [Install as a skill](resources/sample-skills/NN-skill-name.md)" (use the workflow-to-skill map from the Context section)
- The 4 workflows without skill files (post-meeting action capture, new contact brief, client update generator) get no change

**Sample skills cross-links:**
- Each of the 8 skill files already has an install prompt and schedule setup. Add a line in the Tips section or at the bottom of each: "This skill corresponds to [Workflow N](../../WORKFLOWS.md#N--workflow-name) in the main workflows guide."

**SKILLS-GUIDE.md:**
- Add after the intro paragraph: "New to any of the terms in this guide? → [GLOSSARY.md](GLOSSARY.md)"
- Add in the "What's next" section: "Common questions about privacy and costs → [FAQ.md](FAQ.md)"

**GOOGLE-OAUTH-SETUP.md:**
- Add in the Prerequisites section: "Worried about connecting your Google account? Read the [FAQ privacy section](FAQ.md#privacy-and-security) first."

**Patterns to follow:**
- Callout format already used in SETUP-GUIDE.md (`> 💡 ...`) for adding contextual cross-links
- Minimal disruption to existing content — add links, don't rewrite paragraphs

**Test scenarios:**
- Happy path: `grep -r "myeo-ai-resources" SETUP-GUIDE.md` returns zero results
- Happy path: Every WORKFLOWS.md entry for a skill with a corresponding file has a "Install as a skill" link
- Happy path: Each sample skill file links back to its WORKFLOWS.md counterpart
- Edge case: Cross-link text is consistent — use the same phrasing pattern in all 8 workflow-to-skill links

**Verification:**
- Zero broken `myeo-ai-resources` external links in SETUP-GUIDE.md
- 8 WORKFLOWS.md entries have "Install as a skill" links
- 8 sample skill files have "See also: WORKFLOWS.md" links
- GLOSSARY callout appears in SETUP-GUIDE.md, SKILLS-GUIDE.md
- FAQ linked from SKILLS-GUIDE.md and GOOGLE-OAUTH-SETUP.md

---

- U6. **Polish pass — reading times, next-steps footers, consistency**

**Goal:** Apply consistent polish across all participant-facing documents: reading time estimates, standardised "What's next" footer sections, and minor formatting consistency. This is the final pass that makes the repo feel cohesive rather than assembled.

**Requirements:** R8, R9

**Dependencies:** U1, U2, U3, U4, U5 (all content must be final before the polish pass)

**Files:**
- Modify: `SETUP-GUIDE.md` (reading time already present — verify; check "What's next")
- Modify: `WORKFLOWS.md` (add reading time estimate at top)
- Modify: `SKILLS-GUIDE.md` (add reading time estimate at top)
- Modify: `GOOGLE-OAUTH-SETUP.md` (add reading time estimate at top)
- Modify: `GLOSSARY.md` (add reading time estimate at top; add a "Common starting point" note)
- Modify: `WHY-SELF-HOSTED.md` (reading time already planned for U1 — verify)
- Modify: `FAQ.md` (reading time already planned for U2 — verify)
- Modify: `FIRST-WEEK.md` (reading time already planned for U3 — verify)

**Approach:**

**Reading time estimates:**
- Format: `**Reading time:** ~N minutes` immediately after the document title and one-line description
- Calculation: ~200 words per minute, rounded to nearest whole minute
- SETUP-GUIDE.md already has "~25 minutes" — verify this is still accurate after U5 edits
- WORKFLOWS.md: 175 lines → ~8 minutes
- SKILLS-GUIDE.md: 178 lines → ~6 minutes
- GOOGLE-OAUTH-SETUP.md: 159 lines → ~5 minutes
- GLOSSARY.md: 258 lines → ~10 minutes (or "reference — read as needed")

**"What's next" / "Next steps" footer standardisation:**
- Every participant document should end with a "What's next" section
- Check each file: SETUP-GUIDE (has Part 9 Glossary pointer — add broader "what's next"), WORKFLOWS (already has "What's next"), SKILLS-GUIDE (already has "What's next"), GOOGLE-OAUTH-SETUP (check end of file), GLOSSARY (add "now that you know the terms" pointer to FIRST-WEEK.md)
- WHY-SELF-HOSTED, FAQ, FIRST-WEEK will have "What's next" from U1/U2/U3 — verify they're present

**Formatting consistency audit:**
- All H2 sections separated by `---` horizontal rules (already standard in most docs)
- Callout boxes (`> 💡 ...`) used consistently for tips, `> ⚠️ ...` for warnings — not mixed with bold text for the same purpose
- WhatsApp prompts consistently formatted as `> *"Prompt text here"*` (italic blockquote) — audit for any that use backticks or plain text instead

**Test scenarios:**
- Happy path: A reader who opens any document can see reading time before committing to read
- Happy path: No document ends without pointing the reader somewhere useful
- Edge case: GLOSSARY.md — reading time should say "reference, read as needed" rather than implying someone reads it end-to-end

**Verification:**
- Reading time estimate present at top of all 8 participant-facing documents
- All participant documents have a "What's next" or "Next steps" footer section
- WhatsApp prompts formatted consistently as italic blockquotes across all docs

---

## System-Wide Impact

- **Navigation graph:** README is the root. All participant docs link to README (implicit via GitHub breadcrumb) and to at least one adjacent doc. No document should be a dead end after U5 and U6.
- **Content hierarchy:** WHY-SELF-HOSTED.md → SETUP-GUIDE.md → GOOGLE-OAUTH-SETUP.md + SKILLS-GUIDE.md → WORKFLOWS.md + sample-skills → FIRST-WEEK.md → resources/. This is the natural learning progression and all cross-links should reinforce it.
- **SETUP-GUIDE.md integrity:** Part 1 condensation (U5) must not remove the comparison table content — it's moved to WHY-SELF-HOSTED.md (U1), not deleted. Verify the content exists in the new home before condensing the old.
- **Unchanged invariants:** CAPTAIN.md, `docs/operator/`, and all `resources/` subdirectory content are not touched in this plan.

---

## Risks & Dependencies

| Risk | Mitigation |
|------|------------|
| SETUP-GUIDE.md Part 1 condensed before WHY-SELF-HOSTED.md exists | U5 depends on U1 — the comparison table must be in the new file before being removed from SETUP-GUIDE |
| README links to new files before they exist | U4 (README) depends on U1, U2, U3 — write new files first |
| Cross-links in U5 use wrong relative paths (depth varies across directories) | Root-level files use `resources/sample-skills/01-...md`; sample skill files use `../../WORKFLOWS.md` — verify path depth for each file |
| Polish pass (U6) inadvertently changes meaning in documents | U6 is formatting-only — reading time, section footers, blockquote style. No paragraph rewrites. |
| "About this workshop" section reads as self-promotional | Keep to 3 sentences max; frame as information for curious readers, not a sales pitch |

---

## Documentation / Operational Notes

- After this plan lands, the README and FIRST-WEEK.md together become the primary post-workshop handout reference. Keep them updated if new skills or workflows are added.
- The `WHY-SELF-HOSTED.md` cost numbers reference `resources/openclaw-sea-guide/PRICING.md` for details — if VPS pricing changes, update both.
- The "About this workshop" LinkedIn URL should be verified correct before publishing.

---

## Sources & References

- Current repo: `openclaw-mastery-for-leadership-teams/` (this repo)
- Prior plan: `docs/plans/2026-04-28-001-feat-workshop-expansion-plan.md`
- Related: `resources/openclaw-sea-guide/FAQ.md`, `resources/openclaw-sea-guide/PRICING.md`
- Pattern reference for README: The Missing Semester (missing.csail.mit.edu), Anthropic Cookbook
