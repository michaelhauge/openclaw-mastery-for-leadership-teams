---
title: "feat: Expand workshop repo — Google OAuth guide, skills review, myeo-ai content, unbranded"
type: feat
status: active
date: 2026-04-28
---

# feat: Expand Workshop Repo — Google OAuth, Skills Guide, Resource Packs, Unbranded

## Overview

The `openclaw-mastery-for-leadership-teams` repo currently covers one workshop day. This
expansion adds three new content areas (Google OAuth setup, skills review, four resource
packs from myeo-ai-resources) and strips out branding that ties the materials to Pertama
Partners, making the repo usable as a generic unbranded workshop deliverable.

---

## Problem Frame

The existing repo is a good workshop delivery kit, but it has two gaps:

1. **Content gaps** — participants leave the workshop with a running bot but no structured
   guide for what to connect next (Google Workspace OAuth) or which plugins to install
   first. The "extending your bot" section in SETUP-GUIDE.md Part 6 is brief. No
   collection of practical business resources accompanies the materials.

2. **Branding lock-in** — The README title, "About Pertama Partners" section,
   `pertamapartners.com` links, copyright notice, and support email all tie the materials
   to Pertama Partners. For workshops run under a client's or partner's brand, these
   references need to go.

Note: `/opt/pertama/` filesystem paths, the `pertama@workshop-NN` SSH username, and
`pertama_openclaw-config` Docker volume names are **technical infrastructure paths**, not
brand marketing. These are baked into the VPS deployment scripts and should remain
unchanged.

---

## Requirements Trace

- R1. All Pertama brand/marketing references removed from participant-facing files (README,
  SETUP-GUIDE, CAPTAIN). Infrastructure paths (`/opt/pertama/`, `pertama@`) unchanged.
- R2. New dedicated Google OAuth setup guide covering the full device-flow connection
  process for gog (Google Workspace) plugin, including verification and troubleshooting.
- R3. New skills and plugins guide reviewing the most useful OpenClaw plugins for business
  leaders, with install instructions and example prompts for each.
- R4. `openclaw-sea-guide` content from myeo-ai-resources copied into `resources/`.
- R5. `ai-gtm-playbook` workflows copied into `resources/`.
- R6. `quick-win-templates` copied into `resources/`.
- R7. `ai-implementation-playbook` content (use cases, prompt library) copied into
  `resources/`.
- R8. README updated to reflect the new structure and link to all new content, with
  unbranded introduction.

---

## Scope Boundaries

- Infrastructure paths (`/opt/pertama/`, `pertama@workshop-NN`, `pertama_openclaw-config`,
  `pertama-daemon`) are NOT changed — they are server-side paths in the VPS deployment
  scripts, not marketing copy.
- OPERATOR.md and CUT-LIST-EMAIL-DRAFT.md are internal operational documents. They
  contain many Pertama references tied to operational infrastructure. These files should be
  moved to a `docs/operator/` folder to keep them out of the main participant view, but
  are not fully debranded in this pass — their audience is always the workshop operator.
- No new content is written from scratch for the myeo-ai-resources packs — these are
  copied as-is. Light additions (a short README or intro note per pack) are acceptable
  if they improve navigation.
- The existing `docs/solutions/` post-mortems are technical reference documents that do
  not need debranding (they're not participant-facing).
- No changes to the VPS deployment infrastructure or setup.sh.

### Deferred to Follow-Up Work

- Full debranding of OPERATOR.md (many references are tied to Pertama-specific
  infrastructure URLs and workflows — a more thorough pass belongs in a future iteration
  if the operator role changes).
- Adding a Loom/video walkthrough for the Google OAuth guide.
- Adding more advanced skill configs (custom personas, memory tuning) beyond the intro
  coverage in the skills guide.

---

## Context & Research

### Relevant Existing Content

- `SETUP-GUIDE.md` Part 5 (lines ~235–310): existing Google OAuth device-flow guidance.
  The new `GOOGLE-OAUTH-SETUP.md` should supersede and expand this; Part 5 in the
  main guide can be shortened to a pointer.
- `SETUP-GUIDE.md` Part 6 (lines ~311–362): existing plugins/skills intro. The new
  `SKILLS-GUIDE.md` expands this; Part 6 can also become a pointer.
- `myeo-ai-resources/openclaw-sea-guide/guides/` — 9 guides covering prerequisites,
  LLM providers, VPS setup options, WhatsApp/Telegram setup, and managed hosting.
- `myeo-ai-resources/ai-gtm-playbook/workflows/` — 25 numbered workflow files (01–25).
- `myeo-ai-resources/quick-win-templates/` — 4 subdirectories: `one-page-templates/`,
  `comparison-guides/`, `30-day-checklists/`, `spreadsheet-calculators/`.
- `myeo-ai-resources/ai-implementation-playbook/` — `README.md`, `USE-CASES.md`,
  `PROMPT-LIBRARY.md`, `TOOLS.md`, `ADOPTION.md`, `SECURITY.md`, `templates/`,
  `use-cases/`, `scripts/`.

### Pertama References to Remove (confirmed brand/marketing only)

| File | What to change |
|------|---------------|
| README.md line 3 | "Pertama Partners' OpenClaw Mastery" → "OpenClaw Mastery for Leadership Teams" |
| README.md lines 68–76 | Remove "About Pertama Partners" section entirely |
| README.md line 76 (copyright) | "© 2026 Pertama Partners" → "© 2026 Workshop Facilitator" or remove |
| SETUP-GUIDE.md line 122 | `claim.workshop.pertamapartners.com` → `<YOUR-WORKSHOP-URL>` placeholder |
| SETUP-GUIDE.md line 216 | "Pertama's curated skills" → "curated skills" |
| SETUP-GUIDE.md line 526 | "Pertama can transfer the server" → "Ask a captain — there's a one-line `hcloud server transfer` command" |
| SETUP-GUIDE.md line 585 | `michael@pertamapartners.com` → link to repo Issues |
| CAPTAIN.md line 15 | `claim.workshop.pertamapartners.com` → `<YOUR-WORKSHOP-URL>` placeholder |

### Key myeo-ai-resources Content to Copy

All four are MIT-licensed, markdown-based, self-contained. Copying the directory trees
verbatim is the right approach — no adaptation needed except for a nav note.

---

## Key Technical Decisions

- **Copy resources as-is, don't merge or adapt.** The myeo-ai-resources content is
  already well-structured and MIT-licensed. Merging it in would create maintenance burden
  with no benefit. A short intro README per resource folder is sufficient.
- **New guides are top-level files, not buried in subdirectories.** GOOGLE-OAUTH-SETUP.md
  and SKILLS-GUIDE.md go at the repo root alongside SETUP-GUIDE.md — same discoverability,
  same audience routing logic.
- **Shorten SETUP-GUIDE Parts 5 and 6 to pointers.** The full content for OAuth and
  plugins now lives in dedicated guides. Keeping the full content in both places creates
  drift risk.
- **Move OPERATOR.md and CUT-LIST-EMAIL-DRAFT.md to `docs/operator/`**, out of the root.
  They're internal ops documents, not participant or captain resources.
- **Resources go under `resources/` subfolder**, not at root. Four new directories at root
  would make navigation unwieldy.

---

## Open Questions

### Resolved During Planning

- **Which Pertama references to remove?** Brand/marketing only (above table). Infrastructure
  paths are explicitly preserved — they're VPS paths, not copywriting.
- **Which myeo-ai-resources components?** All four (openclaw-sea-guide, ai-gtm-playbook,
  quick-win-templates, ai-implementation-playbook).
- **Where do new guides go?** Top-level files for discoverability parity with SETUP-GUIDE.

### Deferred to Implementation

- **Exact wording of the new README introduction** — written during U8 based on workshop
  facilitator's context.
- **Whether to add a `resources/README.md`** that indexes all four packs — decide during
  U7 based on how the directory looks.

---

## Output Structure

```
openclaw-mastery-for-leadership-teams/
├── README.md                          (updated — unbranded)
├── SETUP-GUIDE.md                     (updated — Pertama brand refs removed, Parts 5+6 condensed to pointers)
├── CAPTAIN.md                         (updated — URLs genericized)
├── GOOGLE-OAUTH-SETUP.md              (new — full device-flow OAuth guide)
├── SKILLS-GUIDE.md                    (new — plugins and skills review for business leaders)
├── docs/
│   ├── operator/
│   │   ├── OPERATOR.md               (moved from root)
│   │   └── CUT-LIST-EMAIL-DRAFT.md   (moved from root)
│   └── solutions/                    (unchanged)
└── resources/
    ├── README.md                      (new — nav index for resource packs)
    ├── openclaw-sea-guide/            (copied from myeo-ai-resources)
    │   └── guides/ (9 files)
    ├── ai-gtm-playbook/               (copied from myeo-ai-resources)
    │   └── workflows/ (25 files)
    ├── quick-win-templates/           (copied from myeo-ai-resources)
    │   ├── one-page-templates/
    │   ├── comparison-guides/
    │   ├── 30-day-checklists/
    │   └── spreadsheet-calculators/
    └── ai-implementation-playbook/    (copied from myeo-ai-resources)
        ├── PROMPT-LIBRARY.md
        ├── USE-CASES.md
        ├── use-cases/
        └── templates/
```

---

## Implementation Units

- U1. **Remove Pertama brand references from participant-facing files**

**Goal:** Strip every brand/marketing mention of "Pertama Partners" and `pertamapartners.com`
from the three participant-facing documents (README.md, SETUP-GUIDE.md, CAPTAIN.md).
Infrastructure paths are left unchanged.

**Requirements:** R1

**Dependencies:** None

**Files:**
- Modify: `README.md`
- Modify: `SETUP-GUIDE.md`
- Modify: `CAPTAIN.md`
- Move (new location): `docs/operator/OPERATOR.md`
- Move (new location): `docs/operator/CUT-LIST-EMAIL-DRAFT.md`

**Approach:**
- In README.md: change the subtitle on line 3 from "Pertama Partners' OpenClaw Mastery"
  to "OpenClaw Mastery for Leadership Teams"; delete the "About Pertama Partners" section
  (lines 68–76 roughly); replace the copyright line with a generic attribution or remove.
- In SETUP-GUIDE.md: replace `claim.workshop.pertamapartners.com` with
  `<YOUR-WORKSHOP-CLAIM-URL>` (one occurrence, the dispenser URL); replace
  "Pertama's curated skills" with "curated skills"; replace "Pertama can transfer the
  server" phrasing with a neutral alternative; replace `michael@pertamapartners.com`
  with a link to the repo's GitHub Issues.
- In CAPTAIN.md: replace the dashboard URL `claim.workshop.pertamapartners.com/admin...`
  with `<YOUR-WORKSHOP-DASHBOARD-URL>`.
- Create `docs/operator/` and `git mv` OPERATOR.md and CUT-LIST-EMAIL-DRAFT.md there.
  Update README.md "Repository contents" table to reflect the new location.

**Patterns to follow:** Existing document voice and structure — these are targeted removals,
not rewrites. Preserve tone throughout.

**Test scenarios:**
- Happy path: `grep -r "pertamapartners.com" README.md SETUP-GUIDE.md CAPTAIN.md` returns
  zero results; `/opt/pertama/` and `pertama@` references are still present.
- Edge case: A Pertama reference exists in a code block (shell command) — confirm whether
  it is a brand mention or infrastructure path. If it's `pertama@workshop-NN` it stays;
  if it's a URL it goes.

**Verification:**
- No `pertamapartners.com` or "Pertama Partners" in README.md, SETUP-GUIDE.md, CAPTAIN.md.
- `/opt/pertama/` paths are still present and unchanged in SETUP-GUIDE.md and CAPTAIN.md.
- OPERATOR.md and CUT-LIST-EMAIL-DRAFT.md appear at `docs/operator/`, not at root.
- README "Repository contents" table reflects the new paths.

---

- U2. **Create Google OAuth setup guide (`GOOGLE-OAUTH-SETUP.md`)**

**Goal:** A standalone, step-by-step guide for connecting Google Workspace to OpenClaw via
the `gog` plugin using device-flow OAuth. This becomes the definitive reference,
replacing the briefer treatment in SETUP-GUIDE.md Part 5.

**Requirements:** R2

**Dependencies:** U1 (U1 trims Part 5 to a pointer — do that after U2 exists so there's no
gap in the content chain). In practice U2 can be written first; U1 just needs to add
the pointer.

**Files:**
- Create: `GOOGLE-OAUTH-SETUP.md`
- Modify: `SETUP-GUIDE.md` (condense Part 5 to a 3-line pointer to the new file)

**Approach:**

Structure for GOOGLE-OAUTH-SETUP.md:
1. **What you get** — bullet list of capabilities: drafting emails from your bot, checking
   your calendar, searching Drive files, creating calendar events by request. Concrete
   examples help.
2. **Prerequisites** — a Google account, the `gog` plugin installed from ClawHub (see
   SKILLS-GUIDE.md), a paired and working bot.
3. **Step-by-step: installing gog**
   - Tell the bot: *"Search ClawHub for a plugin called 'gog'"*
   - Bot describes it; tell it: *"Install gog"*
   - Bot installs it and prompts for auth.
4. **Step-by-step: the device-flow OAuth**
   - Why device-flow (no browser on the VPS, no SSH needed — works from your phone)
   - Tell the bot: *"I want to connect my Google account. Use device-flow authentication."*
   - Bot gives a URL + code (like `https://google.com/device`) — visit it on your phone
     or laptop, enter the code, approve the permissions
   - Bot confirms connection
5. **Verify it works** — test prompts: "What do I have on my calendar tomorrow?", "Search
   my Gmail for messages from [person]", "Find the most recent PDF in my Drive"
6. **Troubleshooting**
   - Bot suggests SSH instead of device-flow → push back: say "Use device-flow, not SSH"
   - Stuck on authorization for >5 minutes → restart: tell the bot to try again from step 3
   - Bot connected but can't find emails → check the OAuth scopes; may need to reconnect
     with `gog reconnect` or `gog reset`
7. **Privacy note** — your Google data stays between your bot and your Google account;
   it does not pass through any third-party server

Use conversation scripts (dialogue format) throughout — consistent with the voice in
SETUP-GUIDE.md.

**Patterns to follow:**
- SETUP-GUIDE.md Part 5 for voice, format, and conversation script style.
- SETUP-GUIDE.md's callout box style (💡 tips, ⚠️ warnings) for troubleshooting.

**Test scenarios:**
- Happy path: A reader who has never touched SSH could follow the guide from Prerequisites
  through to a successful "What's on my calendar tomorrow?" response.
- Edge case: Participant has two Google accounts and accidentally authorizes the wrong one —
  guide should cover how to switch (reconnect flow).
- Integration scenario: The pointer in SETUP-GUIDE.md Part 5 links correctly to this file.

**Verification:**
- File exists at `GOOGLE-OAUTH-SETUP.md`.
- Guide covers: prerequisites, gog install, device-flow OAuth, verification prompts,
  troubleshooting, privacy note.
- SETUP-GUIDE.md Part 5 is condensed to a pointer (3–5 lines) referencing this file.

---

- U3. **Create OpenClaw skills and plugins guide (`SKILLS-GUIDE.md`)**

**Goal:** A review of the most useful OpenClaw plugins for business leaders — what each
does, how to install it from ClawHub, example prompts to try, and any prerequisites.

**Requirements:** R3

**Dependencies:** U2 (gog is covered in the OAuth guide; SKILLS-GUIDE.md should reference
that guide rather than re-document the OAuth flow).

**Files:**
- Create: `SKILLS-GUIDE.md`
- Modify: `SETUP-GUIDE.md` (condense Part 6 to a 3-line pointer to this new file)

**Approach:**

Structure for SKILLS-GUIDE.md:

**Section 1: Plugins vs. skills — what's the difference?**
- Plugins (from ClawHub): extend what the bot can *do* (connect to Gmail, search the web,
  remember things). Installed via chat commands.
- Skills: markdown files that extend how the bot *behaves* (tone, domain knowledge,
  workflows). Live in the skills folder; added by conversation or file drop.

**Section 2: How to install a plugin from ClawHub**
- Standard install pattern (consistent conversation script for any plugin):
  - *"Search ClawHub for [plugin name]"*
  - *"Install [plugin name]"*
  - Follow any auth prompts the bot gives

**Section 3: Top plugins for business leaders**

| Plugin | What it does | What you need | Example prompts |
|--------|-------------|---------------|-----------------|
| **gog** (Google Workspace) | Gmail, Calendar, Drive, Contacts | Google account + device-flow OAuth (see GOOGLE-OAUTH-SETUP.md) | "What's on my calendar this week?", "Find emails from [client]" |
| **firecrawl-search** | Web search + full page content (not just snippets) | Firecrawl API key (free tier: firecrawl.dev) | "Research the latest news about [topic]", "Summarize this webpage: [URL]" |
| **notion** | Read + write Notion pages and databases | Notion API integration key | "Add this to my meeting notes", "List my open tasks in Notion" |
| **web-search-plus** | Enhanced web search, good for quick lookups | None | "What did [company] announce recently?", "Who is [person]?" |
| **memory-lancedb** | Persistent memory — bot remembers across conversations | None (stores locally on your VPS) | "Remember that I prefer bullet-point summaries", "What do you know about me?" |
| **linear** | Read + create Linear issues | Linear API key | "What issues are assigned to me?", "Create a bug report for..." |
| **x-tweet-fetcher** | Read Twitter/X posts, timelines, threads | None for reading | "What is [handle] saying about [topic]?" |

**Section 4: Skills (behaviour customisation)**
- How to find the skills folder: tell the bot "Where is your skills folder?"
- Adding a skill via conversation: "From now on, be more concise — one paragraph max"
  (the bot can write this to a skill file for you)
- Example skills to try: role-specific persona ("You are my EA — always check my calendar
  before scheduling"), formatting preferences, topic focus

**Section 5: What's next**
- Point to GOOGLE-OAUTH-SETUP.md for the gog connection flow
- Point to `resources/` folder for the full resource packs

**Patterns to follow:** SETUP-GUIDE.md Part 6 for voice. Table format from the plugin table
already in SETUP-GUIDE.md. Conversation scripts in dialogue format.

**Test scenarios:**
- Happy path: A business leader with no technical background could identify which plugin
  to install first and complete the install using only the conversation scripts.
- Edge case: A participant who has already connected gog (via GOOGLE-OAUTH-SETUP.md)
  shouldn't be confused by the gog row — the "see GOOGLE-OAUTH-SETUP.md" cross-reference
  handles this.
- Integration scenario: SETUP-GUIDE.md Part 6 pointer leads cleanly to this file with
  no duplication of content.

**Verification:**
- File exists at `SKILLS-GUIDE.md`.
- Covers plugins/skills distinction, install pattern, at least 6 plugin entries with
  prompts, skills customization intro.
- SETUP-GUIDE.md Part 6 condensed to a pointer referencing this file.

---

- U4. **Copy `openclaw-sea-guide` resource pack**

**Goal:** Bring the openclaw-sea-guide content from myeo-ai-resources into
`resources/openclaw-sea-guide/` so participants have a comprehensive self-service
reference beyond the workshop setup.

**Requirements:** R4

**Dependencies:** None (pure copy, no edits to existing files)

**Files:**
- Create: `resources/openclaw-sea-guide/` (directory)
- Create: copy of all files from `../myeo-ai-resources/openclaw-sea-guide/`

**Approach:**
- Copy the full directory: `cp -r ../myeo-ai-resources/openclaw-sea-guide/ resources/`
- The guides directory contains 9 files covering prerequisites, LLM providers, VPS
  options (local Mac, Oracle Cloud free tier, DigitalOcean, Contabo), WhatsApp/Telegram
  setup, and managed hosting providers.
- Do not adapt content — copy verbatim. The MIT license permits this; the content is
  already tuned for the SEA context.
- If the source has a top-level README.md in openclaw-sea-guide/, keep it as-is.

**Test scenarios:**
- Happy path: `ls resources/openclaw-sea-guide/guides/` lists 9 files.
- Verification: the copied files are readable markdown with no broken internal links
  (check relative links point within the openclaw-sea-guide/ directory, not back to
  the myeo-ai-resources root).

**Verification:**
- `resources/openclaw-sea-guide/guides/` contains 9 guides.
- Files open and render in GitHub markdown preview without errors.

---

- U5. **Copy `ai-gtm-playbook` workflows**

**Goal:** Bring the 25 GTM prompt workflows from myeo-ai-resources into
`resources/ai-gtm-playbook/workflows/` — practical AI workflows participants can
put to work immediately with their new bot.

**Requirements:** R5

**Dependencies:** None (pure copy)

**Files:**
- Create: `resources/ai-gtm-playbook/` (directory)
- Create: copy of `../myeo-ai-resources/ai-gtm-playbook/workflows/` and the
  `ai-gtm-playbook/README.md`

**Approach:**
- Copy the directory: `cp -r ../myeo-ai-resources/ai-gtm-playbook/ resources/`
- The workflows directory contains 25 files (01-seo-content-engine through
  24-whatsapp-auto-qualification-bot plus any additional files). Each file is a
  self-contained prompt workflow.
- Keep the top-level ai-gtm-playbook README.md — it explains how to navigate the
  25 workflows.

**Test scenarios:**
- Happy path: `ls resources/ai-gtm-playbook/workflows/ | wc -l` returns ≥25.

**Verification:**
- `resources/ai-gtm-playbook/workflows/` contains 25+ workflow files.
- README.md is present at `resources/ai-gtm-playbook/README.md`.

---

- U6. **Copy `quick-win-templates`**

**Goal:** Bring the 40 templates and calculators from myeo-ai-resources into
`resources/quick-win-templates/`.

**Requirements:** R6

**Dependencies:** None (pure copy)

**Files:**
- Create: `resources/quick-win-templates/` (directory with 4 subdirectories)
- Create: copy of `../myeo-ai-resources/quick-win-templates/`

**Approach:**
- Copy the directory: `cp -r ../myeo-ai-resources/quick-win-templates/ resources/`
- The source has 4 subdirectories: `one-page-templates/` (10 strategic frameworks),
  `comparison-guides/` (10 tool comparisons), `30-day-checklists/` (10 execution plans),
  `spreadsheet-calculators/` (10 financial models).

**Test scenarios:**
- Happy path: `ls resources/quick-win-templates/` shows 4 subdirectories + README.

**Verification:**
- 4 subdirectories present; total file count consistent with source (40+ markdown files).

---

- U7. **Copy `ai-implementation-playbook` content**

**Goal:** Bring the ai-implementation-playbook content into `resources/ai-implementation-playbook/`.

**Requirements:** R7

**Dependencies:** None (pure copy)

**Files:**
- Create: `resources/ai-implementation-playbook/` (directory)
- Create: copy of `../myeo-ai-resources/ai-implementation-playbook/`

**Approach:**
- Copy the directory: `cp -r ../myeo-ai-resources/ai-implementation-playbook/ resources/`
- Key files: README.md, PROMPT-LIBRARY.md (50+ business prompts), USE-CASES.md,
  TOOLS.md, ADOPTION.md, SECURITY.md, `templates/`, `use-cases/` directory, `scripts/`.
- Also create `resources/README.md` at this point — a short index (10–15 lines)
  describing each of the four resource packs with a one-line description and a link.

**Test scenarios:**
- Happy path: `resources/README.md` exists and links to all four packs.
- Happy path: `resources/ai-implementation-playbook/PROMPT-LIBRARY.md` is present and
  non-empty.

**Verification:**
- `resources/ai-implementation-playbook/` present with PROMPT-LIBRARY.md, USE-CASES.md.
- `resources/README.md` links to all four subdirectories.

---

- U8. **Update README — unbranded introduction and new navigation**

**Goal:** Rewrite the README to serve as a clean, unbranded entry point that surfaces
all new content and removes any remaining Pertama references (U1 handles the editorial
cuts; U8 handles the structural additions).

**Requirements:** R1 (final cleanup), R8

**Dependencies:** U1–U7 (all content must exist before navigation links are written)

**Files:**
- Modify: `README.md`

**Approach:**

The updated README should have these sections:

1. **Title + one-line description** — "OpenClaw Mastery for Leadership Teams" + "Workshop
   materials and post-workshop reference for hands-on AI assistant setup."
2. **What you'll have by the end of the workshop** — brief 3-bullet outcome statement
   (your own AI assistant, on your own server, connected to WhatsApp and optionally
   Google Workspace).
3. **Repository contents** — table mapping each file/folder to its audience, updated to
   include GOOGLE-OAUTH-SETUP.md, SKILLS-GUIDE.md, `resources/`, and the relocated
   `docs/operator/` files.
4. **Quick links** (existing section, updated with new files)
5. **Resources** section — brief description of the four packs in `resources/` with links
6. **License** — MIT (generic; remove Pertama copyright)

The "About Pertama Partners" section and the pertamapartners.com link are removed as part
of U1 — confirm they are gone, don't re-add.

**Patterns to follow:**
- Existing README structure (audience-first, table of contents style).
- Keep the friendly non-technical tone.

**Test scenarios:**
- Happy path: A new reader arriving at the GitHub repo can navigate to any section of the
  content within two clicks from the README.
- Edge case: The "Repository contents" table has a row for every top-level file and the
  `resources/` folder — no orphaned content.
- Verification: `grep -i "pertamapartners.com\|pertama partners" README.md` returns zero
  results.

**Verification:**
- README renders cleanly in GitHub markdown preview.
- All new files/folders are linked from the README.
- No Pertama brand references remain anywhere in the README.
- MIT license (or equivalent) present; Pertama copyright removed.

---

## System-Wide Impact

- **Audience routing:** The README is the primary routing hub. New additions must be
  reflected there or participants won't find them.
- **SETUP-GUIDE.md integrity:** Condensing Parts 5 and 6 to pointers means the new
  standalone guides MUST exist before the edit is made. Sequence: write new guides (U2,
  U3) before trimming the SETUP-GUIDE references. This is captured in the U2/U3
  dependencies.
- **Unchanged invariants:** CAPTAIN.md and SETUP-GUIDE.md procedural content (troubleshooting
  flowchart, workshop-day steps) must not change — only the branding strings are edited.

---

## Risks & Dependencies

| Risk | Mitigation |
|------|------------|
| Infrastructure paths (`/opt/pertama/`) accidentally removed during search-replace | Use targeted grep to verify paths are unchanged after U1; the verification step for U1 checks this explicitly. |
| Parts 5 or 6 of SETUP-GUIDE.md condensed before new guides exist | U2 and U3 must be complete before the Part 5/6 pointers are added. Noted in dependencies. |
| Copied resources have internal relative links that break in the new location | Links in the source are relative within each guide's directory. As long as the directory structure is preserved on copy (which `cp -r` does), internal links stay valid. Cross-repo links (pointing back to myeo-ai-resources root) do not exist in these packs. |
| openclaw-sea-guide duplicates SETUP-GUIDE content | Some overlap is expected and acceptable — the sea-guide covers more VPS options. No merge needed; let them coexist. |

---

## Documentation / Operational Notes

- After this plan lands, the README is the canonical nav document. Keep it up to date if
  new files are added in future passes.
- The `resources/README.md` is the nav document for the resources pack — update it
  if resource directories are added or renamed.
- MIT license should be stated in the repo root LICENSE file (if it doesn't exist,
  create one as part of U8).

---

## Sources & References

- Current repo: `~/development/openclaw-mastery-for-leadership-teams/`
- Source repo: `~/development/myeo-ai-resources/`
- Related plan: `~/.claude/plans/20260427-workshop-morning-kickoff-plan.md`
