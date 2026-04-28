# Getting Better Results from AI: The Prompting Guide

**How to write prompts that save time, money, and frustration**

---

## The Problem This Guide Solves

You're using OpenClaw. You send it a message:

**You**: "Write an email about the meeting"

**OpenClaw**: "Subject: Meeting Update

Dear Team,

I wanted to follow up on the meeting we had. There were several important points discussed. Please let me know if you have any questions.

Best regards"

**You**: 😤 "That's useless! Which meeting? What points?"

**This is a prompting problem, not an AI problem.**

Good prompts get good results. Bad prompts waste money and time.

This guide teaches you how to brief an AI like you'd brief an employee - with clarity, context, and examples.

---

## Table of Contents

1. [The Briefing Framework](#1-the-briefing-framework---5-elements-of-a-good-prompt)
2. [Show, Don't Just Tell](#2-show-dont-just-tell---the-power-of-examples)
3. [The Chain of Steps](#3-the-chain-of-steps---breaking-complex-tasks-down)
4. [Common Mistakes That Waste Money](#4-common-mistakes-that-waste-money)
5. [Templates for SEA Business Leaders](#5-templates-for-sea-business-leaders)
6. [The 80/20 Rule of Prompting](#6-the-8020-rule-of-prompting)

---

## 1. The Briefing Framework - 5 Elements of a Good Prompt

### The Metaphor: Briefing a New Employee

When you ask a new employee to write an email, you don't just say "write an email." You give them:

1. **Their role** - "You're our client relations manager"
2. **Context** - "We missed a delivery deadline due to supplier issues"
3. **Task** - "Write an apology email to TechCorp"
4. **Format** - "Professional tone, under 150 words"
5. **Constraints** - "Don't promise a specific new date yet"

**AI is the same. Give it these 5 elements.**

---

### The 5-Element Structure

| Element | What It Is | Example |
|---------|------------|---------|
| **1. Role** | Who is the AI pretending to be? | "You're a Singapore-based accountant with 10 years of experience" |
| **2. Context** | What background does it need? | "Our client is a manufacturing SME. They're worried about GST increase impact." |
| **3. Task** | What exactly should it do? | "Draft an email explaining how the GST increase affects their quarterly payments" |
| **4. Format** | What should the output look like? | "Professional but warm tone. 200 words max. Use bullet points for numbers." |
| **5. Constraints** | What should it NOT do? | "Don't give specific tax advice. Don't mention other clients." |

---

### Bad Prompt vs. Good Prompt

**❌ Bad prompt** (vague, no context):
```
"Write an email to a client about a delay"
```

**AI's response**: Generic, useless fluff with no specifics.

---

**✅ Good prompt** (uses 5 elements):
```
[ROLE] You're the operations manager at a logistics company in Malaysia.

[CONTEXT] Our client, a furniture retailer, ordered 500 units of office chairs.
The shipment is delayed by 2 weeks because our supplier in China had a factory
fire. We're absorbing the extra shipping cost to use air freight and catch up.

[TASK] Draft an email to the client explaining the delay.

[FORMAT] Professional but empathetic tone. Keep it under 150 words. Structure:
1. Acknowledge the issue
2. Explain what happened (briefly)
3. Explain our solution
4. Apologize and offer reassurance

[CONSTRAINTS] Don't blame the supplier directly. Don't promise an exact new date
(just say "within 2 weeks"). Don't mention cost details.
```

**AI's response**: Specific, professional, usable draft that actually addresses the situation.

---

### SEA-Specific Additions

**Language/culture context**:
- Specify formality level: "Singapore corporate formality" vs. "Casual Malay startup style"
- Specify language mix: "Formal English with occasional Bahasa Malaysia terms (acceptable in client comms)"
- Specify cultural norms: "In Malaysia, we avoid direct 'no' - soften rejections politely"

**Example**:
```
[ROLE] You're the HR manager at a Malaysian tech startup.

[CONTEXT] An employee requested 3 weeks of unpaid leave during our busiest quarter.
Company policy allows max 2 weeks unpaid leave per year.

[TASK] Draft a rejection email.

[CONSTRAINTS] Use Malaysian business English (polite, indirect). Avoid blunt "no."
Offer alternative (1 week now, 1 week later). Warm but firm tone.
```

---

## 2. Show, Don't Just Tell - The Power of Examples

### One-Shot vs. Few-Shot Prompting

**Zero-shot** = No examples (AI guesses the style)
**One-shot** = Give 1 example
**Few-shot** = Give 2-3 examples (best for style consistency)

---

### Real Example: Email Tone

**❌ Zero-shot** (no example):
```
Prompt: "Draft a client rejection email. Keep it professional."
```

**AI's response**: Generic corporate-speak that could be from anywhere.

---

**✅ Few-shot** (with examples):
```
Prompt: "Draft a client rejection email. Match this tone:

EXAMPLE 1 (past email we sent):
---
Hi Sarah,

Thanks for thinking of us for this project! We're flattered.

Unfortunately, we're at capacity until Q2 and wouldn't be able to give your
project the attention it deserves. I'd hate to take it on and do a rushed job.

Can we revisit this in March? I'll set a reminder to check in.

Cheers,
Tom
---

EXAMPLE 2 (another past email):
---
Hey Marcus,

Appreciate the inquiry! The timeline is a bit tight for us right now - we've
got three launches in the next month.

If you're flexible on the start date, we'd love to chat in 4-6 weeks when
things calm down. Sound good?

Best,
Tom
---

Now draft a similar email rejecting a web design project from "Alex at TechStart."
```

**AI's response**: Matches Tom's casual-but-professional tone, uses similar phrasing, feels authentic.

---

### When to Use Examples

| Scenario | Use Examples? | Why |
|----------|---------------|-----|
| Email tone consistency | ✅ YES | AI can mimic your voice |
| Legal document drafting | ✅ YES | Ensures format compliance |
| Translation style | ✅ YES | Maintains brand voice across languages |
| Basic Q&A | ❌ NO | Wastes tokens, no benefit |
| Summarization | ❌ NO | Style doesn't matter much |

**Rule of thumb**: If you care about STYLE or FORMAT, give examples. If you only care about CONTENT, skip examples.

---

## 3. The Chain of Steps - Breaking Complex Tasks Down

### The Problem: AI Overwhelm

**Bad prompt** (too complex, AI gets confused):
```
"Research our top 5 competitors in Singapore F&B, analyze their social media
strategies, identify gaps we can exploit, draft a 3-month content calendar,
and write 10 Instagram captions."
```

**What happens**: AI tries to do everything at once, produces mediocre results across all tasks.

---

### The Solution: Chain of Thought Prompting

Break one complex task into **sequential steps**. Feed each output into the next prompt.

**Step 1**:
```
Prompt: "List the top 5 F&B competitors to our restaurant in Singapore.
We're a mid-range Italian restaurant in CBD. Focus on competitors with strong
Instagram presence."
```

**AI outputs**: 5 competitor names

**Step 2**:
```
Prompt: "For these 5 competitors [paste list], analyze their Instagram strategies:
- Post frequency
- Content types (food photos, behind-the-scenes, promotions, etc.)
- Engagement patterns
- Unique tactics

Summarize in a table."
```

**AI outputs**: Comparison table

**Step 3**:
```
Prompt: "Based on this competitor analysis [paste table], identify 3 content gaps
we could exploit. What are they doing that we should do? What are they NOT doing
that we could own?"
```

**AI outputs**: 3 gap opportunities

**Step 4**:
```
Prompt: "Based on these gaps [paste gaps], draft a 3-month Instagram content
calendar. Focus on [gap 1] and [gap 2]. Include post types, frequency, and themes."
```

**AI outputs**: Content calendar

**Step 5**:
```
Prompt: "Based on this content calendar [paste calendar], write 10 Instagram
captions for the first month. Match this tone: [paste example caption]."
```

**AI outputs**: 10 captions

---

### Why This Works Better

| Approach | Quality | Cost | Time |
|----------|---------|------|------|
| **One mega-prompt** | Low (tries to do everything, does nothing well) | High (wastes tokens on bad outputs) | Fast (but useless) |
| **Chain of steps** | High (focused, deliberate) | Moderate (only pays for useful work) | Slower (but valuable) |

**Analogy**: You wouldn't ask a new employee to "handle the entire Q2 campaign" in one sentence. You'd break it into: research, strategy, content plan, execution. AI is the same.

---

### When to Use Chain of Thought

**Use it for**:
- Complex analysis (competitor research, financial modeling)
- Multi-step workflows (research → strategy → execution)
- High-stakes decisions (legal, financial, client-facing)

**Don't use it for**:
- Simple tasks (email summaries, translation)
- Repetitive actions (same prompt 50 times)

---

## 4. Common Mistakes That Waste Money

### Mistake 1: Over-Prompting (Paying for Redundancy)

**❌ Bad** (repeating yourself):
```
"Summarize this email. Make it short. I want a brief summary. Keep it concise.
Don't include unnecessary details. Just the key points."
```

**Cost**: ~40 tokens wasted on redundancy

**✅ Good** (concise):
```
"Summarize this email in 3 bullet points."
```

**Cost**: ~8 tokens

**Savings**: 80% fewer tokens for the same result

---

### Mistake 2: Not Setting Max Length

**❌ Bad** (no length limit):
```
"Write a proposal for a web design project."
```

**AI response**: 1,200 words (costs $0.02 in output tokens)

**But you only needed**: 300 words

**✅ Good** (with limit):
```
"Write a 300-word proposal for a web design project."
```

**AI response**: ~300 words (costs $0.005 in output tokens)

**Savings**: 75% reduction in output costs

---

### Mistake 3: Including Irrelevant Context

**❌ Bad** (too much context):
```
"Our company was founded in 2018 by John and Sarah. We started in KL, then
expanded to Singapore in 2020. We have 15 employees now. We specialize in
digital marketing for SMEs. Our office is in KLCC. We use Slack for communication.

Anyway, can you draft an email to a client about a delayed report?"
```

**Problem**: AI reads ALL that context (costs tokens), but none of it matters for the task.

**✅ Good** (only relevant context):
```
"Draft an email to a client explaining a 2-day delay in their marketing report.
We're a digital marketing agency. Professional but warm tone."
```

**Savings**: 90% fewer input tokens

---

### Mistake 4: Vague Output Format

**❌ Bad** (no format specified):
```
"Analyze our website traffic data."
```

**AI response**: 3 paragraphs of prose (hard to scan)

**✅ Good** (format specified):
```
"Analyze our website traffic data. Output as a table with:
- Traffic source
- Monthly visitors
- Conversion rate
- Key insight (1 sentence)"
```

**AI response**: Clean table (easy to scan and use)

**Time saved**: 5 minutes of manual reformatting

---

### Mistake 5: Not Using System Prompts

**What's a system prompt?** A persistent instruction that applies to ALL future messages.

**Example: Accounting firm setup**

**❌ Bad** (repeating every time):
```
Message 1: "You're a Singapore accountant. Professional tone. Draft this email..."
Message 2: "You're a Singapore accountant. Professional tone. Draft this email..."
Message 3: "You're a Singapore accountant. Professional tone. Draft this email..."
```

**✅ Good** (set once in system prompt):
```
System prompt (set in OpenClaw config):
"You are a senior accountant at a Singapore-based firm. Always use professional
but approachable tone. Assume Singapore tax/regulatory context unless stated
otherwise."

Message 1: "Draft an email about GST changes..."
Message 2: "Draft an email about corporate tax deadlines..."
Message 3: "Draft an email about audit preparation..."
```

**Savings**: 20-30 tokens saved per message (adds up over time)

---

## 5. Templates for SEA Business Leaders

### Template 1: Email Drafting

```
You're a [ROLE] at a [COMPANY TYPE] in [Singapore/Malaysia].

Context:
- [SITUATION]
- [RECIPIENT INFO]
- [KEY FACTS]

Task: Draft an email to [RECIPIENT] about [TOPIC].

Format:
- Tone: [Professional/Casual/Empathetic]
- Length: [X words]
- Structure: [Opening / Body / Closing]

Constraints:
- [WHAT TO AVOID]
- [WHAT TO EMPHASIZE]
```

**Example use**:
```
You're an operations manager at a logistics company in Johor Bahru.

Context:
- Client ordered 200 units, delivery due Friday
- Supplier shortage means we can only deliver 150 units on Friday
- Remaining 50 units will arrive Monday

Task: Draft an email to the client explaining the partial shipment.

Format:
- Tone: Professional but empathetic
- Length: 100-150 words
- Structure: Apologize / Explain / Offer solution / Reassure

Constraints:
- Don't blame the supplier
- Don't offer a discount (not authorized)
- Emphasize that product quality is unaffected
```

---

### Template 2: Document Summarization

```
Summarize the attached [DOCUMENT TYPE] in [FORMAT].

Focus on:
- [KEY AREA 1]
- [KEY AREA 2]
- [KEY AREA 3]

Ignore:
- [IRRELEVANT SECTIONS]

Length: [X bullet points / X words]
```

**Example use**:
```
Summarize the attached vendor contract in a bullet-point list.

Focus on:
- Payment terms
- Delivery timeline
- Penalty clauses

Ignore:
- Legal boilerplate
- Definitions section

Length: 5-7 bullet points max
```

---

### Template 3: Competitor Research

```
Research [COMPETITORS] in [INDUSTRY] in [LOCATION].

Focus on:
- [RESEARCH ANGLE 1]
- [RESEARCH ANGLE 2]

Output format:
- [TABLE / LIST / PROSE]

Sources: Cite where information comes from (so I can verify).
```

**Example use**:
```
Research these 3 competitors in Malaysia coworking space industry:
- Common Ground
- Colony
- WORQ

Focus on:
- Pricing (day pass, monthly membership)
- Locations
- Unique selling points

Output format: Comparison table

Sources: Cite sources so I can verify pricing.
```

---

### Template 4: Meeting Prep

```
I have a meeting with [WHO] about [TOPIC] on [DATE].

Background:
- [CONTEXT ABOUT THE RELATIONSHIP]
- [PREVIOUS INTERACTIONS]
- [CURRENT STATUS]

Prepare:
1. [BRIEFING DOC - key points to know]
2. [QUESTIONS TO ASK]
3. [POTENTIAL OBJECTIONS & RESPONSES]

Length: Keep briefing under 1 page.
```

**Example use**:
```
I have a meeting with Sarah Tan (CFO of TechCorp) about renewing our IT services
contract on March 15.

Background:
- Current 1-year contract expires March 31
- They've been happy with service, but complained about response time in Dec
- We want to upsell them to 24/7 support tier (+30% price)

Prepare:
1. Briefing doc - Sarah's priorities, company financials, our service history
2. Questions to ask - What's their budget? Any new pain points?
3. Potential objections - "Too expensive" / "Don't need 24/7" / "Might switch vendors"

Length: Keep briefing under 1 page.
```

---

### Template 5: Translation (With Cultural Adaptation)

```
Translate this [LANGUAGE A] text into [LANGUAGE B].

Context:
- Audience: [WHO]
- Purpose: [WHY]
- Tone: [FORMAL/CASUAL]

Cultural notes:
- [SPECIFIC ADAPTATIONS NEEDED]

Do NOT translate literally - adapt for cultural appropriateness.
```

**Example use**:
```
Translate this English email into Bahasa Malaysia.

Context:
- Audience: A Malaysian government agency (formal)
- Purpose: Request for a meeting about a tender submission
- Tone: Very formal, respectful

Cultural notes:
- Use "Yang Berhormat" as appropriate
- Avoid overly casual phrases like "let me know"
- Follow Malaysian government correspondence norms

Do NOT translate literally - adapt for cultural appropriateness.
```

---

### Template 6: Data Analysis

```
Analyze this data: [PASTE DATA / ATTACH FILE]

Questions to answer:
1. [QUESTION 1]
2. [QUESTION 2]
3. [QUESTION 3]

Output format: [TABLE / CHART / PROSE]

Focus on: [SPECIFIC INSIGHTS NEEDED]
```

**Example use**:
```
Analyze this sales data: [paste CSV]

Questions to answer:
1. Which product category is growing fastest?
2. Which region has the highest profit margin?
3. Are there any seasonal patterns?

Output format: Table with key metrics + 3-sentence summary

Focus on: Actionable insights for Q2 planning
```

---

### Template 7: Content Generation (Social Media)

```
Write [NUMBER] [CONTENT TYPE] for [PLATFORM].

Brand voice: [DESCRIPTION] (see examples below)

Examples of our past posts:
[PASTE 2-3 EXAMPLES]

Topic: [WHAT TO POST ABOUT]

Format:
- Length: [X characters]
- Include: [HASHTAGS / EMOJI / CALL-TO-ACTION]
- Avoid: [WHAT NOT TO DO]
```

**Example use**:
```
Write 5 Instagram captions for our restaurant.

Brand voice: Warm, welcoming, slightly humorous. We're a family-run Italian place
in Singapore. Not too corporate, not too casual. (See examples below)

Examples of our past posts:
1. "Nonna's ragu takes 6 hours to make. Your lunch break takes 1 hour. We timed
   it perfectly. 😉🍝 #ItalianDoneRight #LunchGoals"
2. "New menu alert: Truffle carbonara is here. Yes, we went there. No, we're not
   sorry. 🍄✨ #TruffleTime #SingaporeFoodie"

Topic: Promoting our new weekend brunch menu

Format:
- Length: 100-150 characters
- Include: 1-2 relevant emojis, 2-3 hashtags
- Avoid: Corporate jargon, being too salesy
```

---

## 6. The 80/20 Rule of Prompting

### The 20% That Gives You 80% of Results

**Master these 4 techniques and you'll get 80% of the value:**

---

#### 1. **Always Specify Role + Task + Format**

**Minimum viable prompt**:
```
You're a [ROLE]. [TASK]. Output as [FORMAT].
```

**Example**:
```
You're a HR manager. Draft a job posting for a marketing executive. Output as
a 200-word LinkedIn post.
```

---

#### 2. **Give 1-2 Examples When Style Matters**

**When to do it**: Email tone, content generation, translations

**How**:
```
Match this style:

[EXAMPLE 1]
[EXAMPLE 2]

Now do the same for [NEW TASK].
```

---

#### 3. **Break Complex Tasks Into Steps**

**When to do it**: Research, analysis, strategy work

**How**:
```
Step 1: [RESEARCH TASK] → Get output
Step 2: [ANALYSIS TASK using Step 1 output] → Get output
Step 3: [SYNTHESIS TASK using Step 2 output] → Get output
```

---

#### 4. **Set Length Limits**

**Always specify**:
- Word count: "200 words"
- Bullet points: "5 bullet points"
- Time limit: "1-minute read"

**Why**: Saves tokens, forces AI to be concise

---

### Quick Decision Tree

```
Do I care about STYLE?
├─ YES → Give 1-2 examples
└─ NO → Skip examples

Is the task COMPLEX?
├─ YES → Break into steps
└─ NO → One prompt is fine

Is the output CLIENT-FACING?
├─ YES → Specify role, tone, format, constraints
└─ NO → Just specify task + format

Do I need to SAVE COSTS?
└─ Always set length limits
```

---

## Cost Impact: Bad Prompts vs. Good Prompts

### Real Example: Monthly Email Management

**Scenario**: You use OpenClaw to draft 50 emails per month.

**❌ Bad prompting**:
- Vague prompts → AI produces 300-word drafts (you needed 150 words)
- No examples → AI uses wrong tone, you re-prompt 30% of the time
- No length limits → Output tokens waste 50% of budget

**Monthly cost**: $18 (mostly wasted tokens)

---

**✅ Good prompting**:
- Clear role + task + format → AI produces 150-word drafts (exactly what you need)
- 1-2 examples → AI matches tone 95% of the time, rare re-prompts
- Length limits → Output tokens match actual needs

**Monthly cost**: $9 (50% savings)

---

**Takeaway**: Good prompting isn't just about quality - it directly cuts costs.

---

## Quick Reference Card

**Print this and keep it at your desk:**

### The 3-Sentence Prompt Formula

```
1. You're a [ROLE] at [COMPANY/CONTEXT].
2. [TASK] about [TOPIC] for [AUDIENCE].
3. Output as [FORMAT], [LENGTH], [TONE].
```

**Example**:
```
1. You're a finance manager at a Malaysian SME.
2. Draft an email to our CFO requesting approval for new accounting software.
3. Output as a professional email, 150 words, persuasive tone.
```

---

### The 4 Questions to Ask Before Sending a Prompt

1. **Did I specify the role?** (Who is the AI pretending to be?)
2. **Did I give enough context?** (What background does it need?)
3. **Did I specify the format?** (Email? Table? Bullet points?)
4. **Did I set a length limit?** (Word count? Number of points?)

If you answer "NO" to any of these, improve your prompt.

---

## What to Read Next

- **[How AI Thinks](HOW-AI-THINKS.md)** - Understanding LLMs, hallucination, and model selection
- **[Your Data, Your Rules](YOUR-DATA-YOUR-RULES.md)** - Data privacy and PDPA compliance
- **[Use Cases](USE-CASES.md)** - Real examples for SEA business leaders

---

**Questions or feedback?** Open an issue on GitHub or join the OpenClaw Discord community.
