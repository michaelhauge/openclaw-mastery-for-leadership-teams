# AI Prompt Library for Business

**50+ proven prompts for common business tasks - Copy, customize, and use immediately**

This library provides ready-to-use prompts for the 10 AI use cases covered in this playbook. Each prompt includes customization guidance and example outputs.

---

## How to Use This Library

### Step 1: Find Your Task Category

Browse the categories below to find prompts for your use case:
- Customer Support
- Sales Enablement
- Content Creation
- Market Research
- Meeting Notes
- Document Analysis
- Recruitment
- Training Materials
- Data Analysis
- Product Descriptions

### Step 2: Copy the Prompt Template

Each prompt has:
- **Template**: Copy-paste ready prompt with [PLACEHOLDERS]
- **How to customize**: What to replace in brackets
- **Example**: Sample input and output
- **Tips**: Best practices for this prompt type

### Step 3: Customize for Your Business

Replace [PLACEHOLDERS] with your specific information:
- [COMPANY NAME] → Your company name
- [PRODUCT] → Your product/service
- [CUSTOMER NAME] → Actual customer (or anonymize)
- [CONTEXT] → Relevant background information

### Step 4: Iterate and Improve

- Run prompt, review output
- If not perfect, add more context or constraints
- Save your customized prompts for reuse
- Build a library of your best-performing prompts

---

## Customer Support Prompts

### 1. Draft Customer Support Email Response

**Prompt Template**:
```
You are a customer support agent for [COMPANY NAME], which provides [PRODUCT/SERVICE DESCRIPTION].

A customer wrote the following email:
"""
[PASTE CUSTOMER EMAIL HERE]
"""

Draft a helpful, empathetic response that:
1. Acknowledges their concern
2. Provides a clear solution or next steps
3. Maintains a professional but friendly tone
4. Keeps the response under 150 words

If you need additional information to solve their issue, ask specific questions.
```

**How to customize**:
- Replace [COMPANY NAME] with your company
- Replace [PRODUCT/SERVICE DESCRIPTION] with 1-2 sentence description
- Paste actual customer email (anonymize if needed)

**Example Input**:
```
You are a customer support agent for CloudSync, which provides cloud storage and file syncing.

A customer wrote:
"""
I've been trying to sync my files for 3 days and it's still not working. This is ridiculous. I need this fixed NOW or I want a refund.
"""

Draft a helpful, empathetic response...
```

**Example Output**:
```
Hi [Customer Name],

I sincerely apologize for the frustration with your file syncing. I understand how critical this is for your workflow.

To resolve this quickly, I need to understand what's happening:
1. What error message (if any) are you seeing?
2. Approximately how many files are you trying to sync?
3. Are you on Windows, Mac, or both?

In the meantime, I've escalated this to our senior technical team. We'll have someone reach out within 2 hours with a solution or temporary workaround.

Thank you for your patience.

Best regards,
[Your Name]
CloudSync Support Team
```

**Tips**:
- Always acknowledge emotion first (frustration, urgency)
- Ask specific questions, not "can you provide more details?"
- Set clear expectations (timeline, next steps)
- Offer escalation for urgent issues

---

### 2. Create FAQ Answers from Support Tickets

**Prompt Template**:
```
I have the following 5 customer support tickets about [TOPIC]:

Ticket 1: [PASTE TICKET]
Ticket 2: [PASTE TICKET]
Ticket 3: [PASTE TICKET]
Ticket 4: [PASTE TICKET]
Ticket 5: [PASTE TICKET]

Based on these tickets:
1. Identify the common questions customers are asking
2. Write clear, concise FAQ answers (2-3 sentences each)
3. Format as a FAQ section for our help center

FAQ should be beginner-friendly and avoid technical jargon.
```

**Output**: Ready-to-publish FAQ section

---

### 3. Categorize and Prioritize Support Tickets

**Prompt Template**:
```
Categorize and prioritize the following support tickets:

[PASTE 5-10 TICKET SUBJECTS/FIRST LINES]

For each ticket, provide:
1. Category (Bug, Feature Request, Billing, How-To, etc.)
2. Priority (Critical/High/Medium/Low)
3. Suggested first response (one sentence)

Format as a table.
```

**Use case**: Morning ticket triage

---

## Sales Enablement Prompts

### 4. Write Personalized Sales Email

**Prompt Template**:
```
Write a personalized cold outreach email for the following prospect:

Company: [PROSPECT COMPANY NAME]
Industry: [INDUSTRY]
Prospect Role: [TITLE/ROLE]
What they do: [1-2 SENTENCE COMPANY DESCRIPTION]
Recent news/trigger: [RECENT FUNDING, HIRE, PRODUCT LAUNCH, ETC. - OPTIONAL]

Our company: [YOUR COMPANY NAME]
Our product: [WHAT YOU SELL - 1 SENTENCE]
Value proposition: [KEY BENEFIT - 1 SENTENCE]

Email should:
- Start with relevant insight about their company/industry
- Explain how we solve a problem they likely have
- Include a clear, low-commitment CTA (15-min call, see demo, etc.)
- Keep under 100 words
- Professional but conversational tone

Do NOT use cliches like "I hope this email finds you well" or "I'd love to pick your brain."
```

**Example Input**:
```
Company: Acme Manufacturing
Industry: Industrial equipment manufacturing
Prospect Role: VP of Operations
What they do: Makes custom machinery for automotive plants
Recent news: Just opened second facility in Texas

Our company: FactoryOS
Our product: Workflow automation software for manufacturing
Value proposition: Reduce manual data entry by 60%, eliminate production bottlenecks

Email should...
```

**Example Output**:
```
Subject: Scaling to 2 facilities - data visibility question

Hi [Name],

Congrats on the Texas expansion - saw the announcement last week.

I work with manufacturers scaling to multiple facilities and the #1 pain point is production data visibility. When workflows span locations, manual tracking breaks down fast.

FactoryOS helps companies like [Similar Company] automate data flow between production lines and facilities - they cut manual data entry by 60% and spotted bottlenecks 3 days faster.

Worth a 15-minute conversation to see if something similar could help Acme?

Best,
[Your Name]
```

**Tips**:
- Always reference something specific about their company (funding, expansion, product launch)
- Lead with a problem they likely have, not your product
- Use social proof (similar company, specific metric)
- CTA should be low-commitment (15 min, not "30-min demo")

---

### 5. Create Follow-Up Email Sequence

**Prompt Template**:
```
Create a 3-email follow-up sequence for a prospect who didn't respond to my initial outreach.

Initial email context: [BRIEF SUMMARY OF FIRST EMAIL]
Prospect: [COMPANY, ROLE]
Our value prop: [WHAT WE DO]

Emails should:
- Email 1 (3 days later): Soft reminder with new value angle
- Email 2 (7 days later): Share relevant case study or resource
- Email 3 (14 days later): "Breakup email" - last attempt, open-ended question

Each email under 75 words, different subject lines.
```

**Output**: 3 complete follow-up emails ready to schedule

---

### 6. Research Prospect Before Sales Call

**Prompt Template**:
```
I have a sales call tomorrow with [PROSPECT NAME], [TITLE] at [COMPANY].

Research their company and provide:
1. What the company does (2 sentences)
2. Recent news (funding, product launches, hires)
3. Likely pain points based on their industry and size
4. 3 conversation starters (not about sales - build rapport first)
5. Potential objections they might raise

Company website: [URL]
LinkedIn: [COMPANY LINKEDIN URL]
```

**Use case**: Pre-call preparation (10 minutes with AI vs 45 minutes manual)

---

## Content Creation Prompts

### 7. Write Blog Post from Outline

**Prompt Template**:
```
Write a 1,500-word blog post on the following topic:

Topic: [BLOG TITLE]
Target audience: [WHO IS THIS FOR]
Goal: [EDUCATE, PERSUADE, ENTERTAIN, ETC.]
SEO keywords: [PRIMARY KEYWORD, SECONDARY KEYWORDS]

Outline:
1. [SECTION 1 HEADING]
   - [KEY POINT]
   - [KEY POINT]
2. [SECTION 2 HEADING]
   - [KEY POINT]
   - [KEY POINT]
3. [SECTION 3 HEADING]
   - [KEY POINT]

Writing style:
- Conversational but professional
- Use examples and analogies
- Include actionable takeaways
- Natural keyword integration (not stuffed)

Include:
- Engaging introduction with hook
- Clear H2/H3 headers
- Bullet points where appropriate
- Conclusion with CTA
```

**Example Input**:
```
Topic: "5 Ways AI Can Save Your Sales Team 10 Hours a Week"
Target audience: Sales managers at B2B SaaS companies
Goal: Educate and position our company as thought leader
SEO keywords: AI for sales, sales productivity, sales automation

Outline:
1. Introduction: The Sales Time Suck
   - Sales reps spend 64% of time on non-selling activities
   - AI can automate repetitive tasks

2. Way #1: Automated Email Personalization
   - AI researches prospects in seconds
   - Writes customized first drafts

3. Way #2: Meeting Notes and Summaries
   - AI transcribes and extracts action items
   - Reps stay focused on conversation

[... continue outline ...]

Writing style: Conversational but professional...
```

**Output**: Complete 1,500-word blog post ready for editing

**Tips**:
- Provide detailed outline (AI fills in, not creates structure)
- Specify word count and tone
- Always edit AI output (fact-check, add personal stories)
- Use AI for first draft, human for final polish

---

### 8. Generate Social Media Posts from Blog

**Prompt Template**:
```
I just published a blog post:

Title: [BLOG TITLE]
Key points:
- [POINT 1]
- [POINT 2]
- [POINT 3]

Create 5 social media posts promoting this blog:
1. LinkedIn post (150 words, professional, include 3 relevant hashtags)
2. Twitter/X thread (5 tweets, conversational tone)
3. Facebook post (100 words, engaging question at end)
4. Instagram caption (80 words, include call-to-action, suggest 5 hashtags)
5. LinkedIn comment-bait post (question that drives engagement)

Blog URL: [URL]
```

**Output**: 5 ready-to-post social updates

**Use case**: Get 5+ social posts from 1 blog (10x content leverage)

---

### 9. Write Product Marketing Copy

**Prompt Template**:
```
Write marketing copy for [PRODUCT/FEATURE]:

Product: [NAME]
What it does: [1-2 SENTENCE DESCRIPTION]
Target customer: [WHO NEEDS THIS]
Key benefit: [MAIN VALUE PROP]
Features:
- [FEATURE 1]
- [FEATURE 2]
- [FEATURE 3]

I need:
1. Headline (8 words max, benefit-focused)
2. Subheadline (15 words, expand on benefit)
3. 3 feature bullets (benefit + feature, not just feature)
4. Call-to-action button text (2-4 words)

Tone: [PROFESSIONAL, CASUAL, TECHNICAL, ETC.]
Avoid: Jargon, superlatives ("best," "revolutionary"), passive voice
```

**Example for SaaS landing page**

---

### 10. Create Email Newsletter

**Prompt Template**:
```
Create a weekly email newsletter for [COMPANY/TOPIC].

This week's content:
- [LINK 1: Article title + 1 sentence summary]
- [LINK 2: Article title + 1 sentence summary]
- [LINK 3: Article title + 1 sentence summary]
- [COMPANY UPDATE: New feature, hire, milestone, etc.]

Newsletter should:
1. Catchy subject line (under 50 characters, create urgency/curiosity)
2. Brief intro paragraph (2-3 sentences)
3. 3 content sections with:
   - Compelling headline
   - 2-3 sentence summary
   - "Read more" CTA
4. Company update section
5. Sign-off with next week preview

Tone: [FRIENDLY, PROFESSIONAL, WITTY, ETC.]
Audience: [WHO SUBSCRIBES]
```

**Output**: Complete newsletter ready to send

---

## Market Research Prompts

### 11. Competitive Analysis

**Prompt Template**:
```
Research the following competitors and create a competitive analysis:

Competitors:
1. [COMPETITOR 1 - include website]
2. [COMPETITOR 2 - include website]
3. [COMPETITOR 3 - include website]

For each competitor, provide:
1. Product/service description (2-3 sentences)
2. Pricing (if public)
3. Key differentiators
4. Target customer
5. Strengths (what they do well)
6. Weaknesses (gaps we can exploit)

Then create a comparison table showing:
- Feature comparison (our product vs theirs)
- Pricing comparison
- Recommended positioning (how we differentiate)
```

**Use case**: Quarterly competitive review

**Tools**: Use Perplexity Pro for best results (provides citations)

---

### 12. Analyze Customer Reviews

**Prompt Template**:
```
I'm researching customer pain points. Analyze these customer reviews:

[PASTE 10-20 CUSTOMER REVIEWS FROM G2, CAPTERRA, APP STORE, ETC.]

Identify:
1. Top 5 most mentioned pain points
2. Top 5 most praised features
3. Common feature requests
4. Sentiment themes (what frustrates vs delights customers)

Format as:
- Pain Points (with quote examples)
- Praise (with quote examples)
- Feature Gaps (opportunities for our product)
```

**Use case**: Product roadmap planning, positioning research

---

### 13. Industry Trend Summary

**Prompt Template**:
```
Research current trends in [INDUSTRY] for [YEAR].

Focus areas:
- Technology trends (AI, automation, etc.)
- Regulatory changes
- Customer behavior shifts
- Competitive landscape changes
- Market size/growth projections

Provide:
1. Summary of top 5 trends (2-3 sentences each)
2. How each trend impacts [OUR CUSTOMER TYPE]
3. Opportunities for our business

Sources: Industry reports, recent news (last 6 months), analyst predictions

Format as an executive summary (2 pages max).
```

**Output**: Trend report for strategy planning

---

## Meeting Notes Prompts

### 14. Summarize Meeting Transcript

**Prompt Template**:
```
Summarize the following meeting transcript:

[PASTE TRANSCRIPT FROM OTTER.AI, ZOOM, OR TEAMS]

Provide:
1. Meeting purpose (1 sentence)
2. Key decisions made
3. Action items (who, what, deadline)
4. Open questions / parking lot items
5. Next steps

Format for easy skimming (bullet points, bold text for names/dates).
```

**Use case**: Turn 1-hour meeting into 5-minute read

---

### 15. Extract Action Items from Notes

**Prompt Template**:
```
Extract action items from these meeting notes:

[PASTE NOTES OR TRANSCRIPT]

For each action item, provide:
- Task description
- Owner (person responsible)
- Deadline (if mentioned, otherwise "TBD")
- Priority (High/Medium/Low based on context)

Format as a table sorted by deadline.
```

**Output**: Action items table to paste in project management tool

---

## Document Analysis Prompts

### 16. Review Contract for Key Terms

**Prompt Template**:
```
Review the following contract and highlight key terms:

[PASTE CONTRACT TEXT OR UPLOAD PDF]

Extract and summarize:
1. Parties involved
2. Contract term (start date, end date, auto-renewal?)
3. Payment terms (amount, frequency, payment method)
4. Deliverables / scope of work
5. Termination clause (how to cancel, notice period, penalties)
6. Liability limitations
7. Any unusual or concerning clauses

Flag anything that seems risky or requires negotiation.
```

**⚠️ SECURITY NOTE**: Only use with anonymized contracts on consumer AI tools. For real contracts with client names, use enterprise AI tools with DPA/BAA.

---

### 17. Extract Data from Invoices

**Prompt Template**:
```
Extract the following information from these invoices:

[PASTE INVOICE TEXT OR UPLOAD IMAGES/PDFs]

For each invoice, extract:
- Invoice number
- Vendor name
- Date
- Due date
- Line items (description, quantity, unit price)
- Subtotal
- Tax
- Total amount

Format as CSV for import to accounting software.
```

**Use case**: Accounts payable automation

---

### 18. Summarize Long Document

**Prompt Template**:
```
Summarize the following document in [X] words:

[PASTE DOCUMENT OR UPLOAD PDF]

Summary should include:
1. Main thesis / purpose (1 sentence)
2. Key arguments / sections (3-5 bullet points)
3. Important data / statistics
4. Conclusions / recommendations
5. Notable quotes (if applicable)

Target audience: [EXECUTIVES, TEAM MEMBERS, BOARD, ETC.]
```

**Best tool**: Claude Pro (200K token context = ~500 pages)

---

## Recruitment Prompts

### 19. Score Resume Against Job Description

**Prompt Template**:
```
Score the following resume against our job description:

JOB DESCRIPTION:
"""
[PASTE JOB DESCRIPTION]
"""

RESUME:
"""
[PASTE RESUME - REMOVE CANDIDATE NAME/EMAIL FOR PRIVACY]
"""

Provide:
1. Overall fit score (1-10)
2. Must-have qualifications (Does candidate meet each? Yes/No/Partial)
3. Nice-to-have qualifications (Yes/No)
4. Red flags (gaps, job hopping, lack of required skills)
5. Strengths (what makes them stand out)
6. Recommendation (Interview / Pass / Maybe)

Brief explanation for score.
```

**Use case**: Resume screening (2 min per resume vs 8-10 min manual)

---

### 20. Write Job Description

**Prompt Template**:
```
Write a compelling job description for:

Role: [JOB TITLE]
Department: [TEAM]
Reports to: [MANAGER TITLE]
Location: [CITY / REMOTE / HYBRID]

Responsibilities:
- [RESPONSIBILITY 1]
- [RESPONSIBILITY 2]
- [RESPONSIBILITY 3]

Required qualifications:
- [QUALIFICATION 1]
- [QUALIFICATION 2]

Nice-to-have:
- [NICE-TO-HAVE 1]

Company: [COMPANY NAME]
What we do: [1-2 SENTENCES]
Company culture: [VALUES, WORK STYLE, ETC.]

Job description should:
- Start with compelling "Why this role matters"
- Use inclusive language
- Focus on impact, not just tasks
- Include salary range: [RANGE]
- Highlight benefits: [KEY BENEFITS]
- End with clear application instructions

Avoid: "Rockstar," "ninja," "guru," excessive requirements
```

**Output**: Ready-to-post job description

---

### 21. Draft Candidate Communication Emails

**Prompt Template**:
```
Draft an email to a job candidate:

Scenario: [REJECTION / INTERVIEW INVITE / OFFER / FOLLOW-UP]
Candidate name: [NAME]
Role: [POSITION APPLIED FOR]
Context: [ADDITIONAL DETAILS]

Email should:
- Be professional but warm
- [For rejection] Provide constructive feedback if possible
- [For interview] Include clear next steps, logistics, what to prepare
- [For offer] Express enthusiasm, outline next steps
- Keep under 150 words

Tone: [FRIENDLY, FORMAL, ETC.]
```

**Use case**: Automate candidate communication (save 30+ min/day for high-volume hiring)

---

## Training Materials Prompts

### 22. Create Standard Operating Procedure (SOP)

**Prompt Template**:
```
Create a standard operating procedure for:

Process: [PROCESS NAME]
Who performs this: [ROLE/TEAM]
When: [TRIGGER / FREQUENCY]
Goal: [WHAT SUCCESS LOOKS LIKE]

Process steps:
1. [STEP 1 - brief description]
2. [STEP 2]
3. [STEP 3]
[... continue ...]

Additional context:
- Tools used: [SOFTWARE, SYSTEMS]
- Common mistakes to avoid: [PITFALLS]
- Tips for efficiency: [BEST PRACTICES]

Format as:
- Clear numbered steps
- Screenshots/diagrams placeholders [SCREENSHOT: Description]
- "⚠️ Warning" boxes for critical steps
- "💡 Tip" boxes for efficiency hacks
- FAQ section at end (common questions)

Beginner-friendly language (someone new to role should understand).
```

**Output**: Complete SOP ready for team wiki

---

### 23. Generate Training Quiz

**Prompt Template**:
```
Create a 10-question quiz to test understanding of:

Topic: [TRAINING TOPIC]
Material covered:
- [CONCEPT 1]
- [CONCEPT 2]
- [CONCEPT 3]

Quiz should include:
- 5 multiple choice questions (4 options each)
- 3 true/false questions
- 2 short answer questions

Difficulty: [BEGINNER / INTERMEDIATE / ADVANCED]

Provide:
- Questions
- Correct answers
- Brief explanations for each answer
```

**Use case**: Onboarding assessments, compliance training

---

### 24. Create Onboarding Checklist

**Prompt Template**:
```
Create a comprehensive onboarding checklist for:

Role: [NEW HIRE ROLE]
Department: [TEAM]
Duration: [FIRST WEEK / FIRST MONTH / FIRST 90 DAYS]

Checklist should cover:
- Administrative setup (email, accounts, hardware)
- Training (systems, processes, product knowledge)
- Meetings (1:1s, team intros, key stakeholders)
- Projects/deliverables for first [TIMEFRAME]
- Cultural integration (team lunches, social events)

For each item:
- Task description
- Owner (who ensures this happens)
- Due date (Day 1, Week 1, Month 1, etc.)
- Resources/links

Format as table: Task | Owner | Deadline | Resources
```

**Output**: Copy-paste ready onboarding checklist

---

## Data Analysis Prompts

### 25. Analyze Spreadsheet and Generate Insights

**Prompt Template**:
```
I've uploaded a CSV file with [DESCRIPTION OF DATA].

Columns: [LIST COLUMN NAMES]

Please:
1. Summarize the data (date range, # rows, key fields)
2. Identify trends (what's increasing/decreasing over time)
3. Find anomalies (outliers, unexpected patterns)
4. Calculate key metrics:
   - [METRIC 1: e.g., average order value]
   - [METRIC 2: e.g., month-over-month growth]
   - [METRIC 3]
5. Create 3 visualizations (suggest chart types)
6. Provide 3 actionable insights

Format as executive summary.
```

**Tool**: ChatGPT Plus (Advanced Data Analysis mode) or Claude Pro

**Use case**: Monthly reporting automation

---

### 26. Create Data Visualization

**Prompt Template**:
```
Create a [CHART TYPE] showing [DATA DESCRIPTION]:

Data:
[PASTE DATA OR UPLOAD CSV]

Chart should:
- X-axis: [VARIABLE]
- Y-axis: [VARIABLE]
- Color by: [CATEGORY - OPTIONAL]
- Title: [DESCRIPTIVE TITLE]
- Annotations for key points

Make it presentation-ready (clean, professional, easy to read).

Export as: [PNG / Python code / etc.]
```

**Output**: Chart image or code to recreate chart

---

### 27. Write SQL Query

**Prompt Template**:
```
Write a SQL query for the following:

Database schema:
- Table: [TABLE NAME]
  - Column: [COLUMN 1] ([DATA TYPE])
  - Column: [COLUMN 2] ([DATA TYPE])
  - [...]

Query requirements:
[DESCRIBE WHAT YOU WANT TO RETRIEVE]

Example: "Get all customers who made a purchase in the last 30 days, ordered by total spend descending, limit to top 100"

Provide:
1. SQL query
2. Explanation of what it does
3. Expected output format
```

**Use case**: Non-technical team members generating reports

---

## Product Descriptions Prompts

### 28. Write E-commerce Product Description

**Prompt Template**:
```
Write a product description for:

Product: [PRODUCT NAME]
Category: [PRODUCT CATEGORY]
Key features:
- [FEATURE 1]
- [FEATURE 2]
- [FEATURE 3]
Specifications: [SIZE, MATERIAL, COLOR OPTIONS, ETC.]
Price: [PRICE]
Target customer: [WHO BUYS THIS]

Description should:
- Start with compelling benefit (not feature)
- Include 2-3 short paragraphs (50-75 words total)
- Use sensory language when relevant
- Include SEO keywords: [KEYWORDS]
- End with clear CTA ("Add to cart", "Shop now", etc.)

Tone: [LUXURY, PRACTICAL, PLAYFUL, ETC.]
```

**Example for furniture e-commerce store**

---

### 29. Create Product Variant Descriptions

**Prompt Template**:
```
I have a product with multiple variants. Write unique descriptions for each:

Base product: [PRODUCT NAME]
Base description: [COPY EXISTING DESCRIPTION]

Variants:
1. [VARIANT 1: e.g., "Blue, Large"]
2. [VARIANT 2: e.g., "Red, Medium"]
3. [VARIANT 3]

For each variant:
- Keep core benefit messaging consistent
- Customize for variant-specific details (color, size, etc.)
- 50-75 words
- Avoid duplicate content (SEO penalty)

Provide variant descriptions ready to upload to Shopify/WooCommerce.
```

**Use case**: Bulk product variant creation

---

### 30. Translate Product Descriptions

**Prompt Template**:
```
Translate the following product description to [TARGET LANGUAGE]:

[PASTE ENGLISH DESCRIPTION]

Translation should:
- Maintain marketing tone (not literal translation)
- Use culturally appropriate language
- Keep formatting (bullet points, paragraphs)
- Adapt currency if mentioned (USD → EUR, etc.)
- Localize measurements (inches → cm, etc.)

Target market: [COUNTRY/REGION]
```

**Use case**: International expansion

---

## Advanced / Multi-Purpose Prompts

### 31. Brainstorm Ideas

**Prompt Template**:
```
Help me brainstorm ideas for [TOPIC]:

Context:
- Goal: [WHAT WE'RE TRYING TO ACHIEVE]
- Constraints: [BUDGET, TIME, RESOURCES]
- Target audience: [WHO IS THIS FOR]

Generate 20 ideas, ranging from:
- Safe/obvious (5 ideas)
- Creative/innovative (10 ideas)
- Bold/risky (5 ideas)

For each idea:
- Idea name
- Brief description (1 sentence)
- Pros/cons
- Difficulty to execute (Easy/Medium/Hard)

Format as table.
```

**Use case**: Marketing campaigns, product features, content topics

---

### 32. Simplify Complex Topic

**Prompt Template**:
```
Explain [COMPLEX TOPIC] in simple terms:

Audience: [AGE, BACKGROUND, EXPERTISE LEVEL]
Purpose: [WHY THEY NEED TO UNDERSTAND THIS]

Explanation should:
- Use analogies and examples
- Avoid jargon (or define it when necessary)
- Include a real-world use case
- Be 200-300 words

Topic: [DETAILED DESCRIPTION OF COMPLEX TOPIC]
```

**Use case**: Customer education, internal training, investor pitches

---

### 33. Check Writing for Clarity and Tone

**Prompt Template**:
```
Review the following text for clarity, tone, and grammar:

[PASTE TEXT]

Intended audience: [WHO WILL READ THIS]
Desired tone: [PROFESSIONAL, CASUAL, PERSUASIVE, ETC.]

Provide:
1. Overall assessment (clear? appropriate tone?)
2. Specific improvements:
   - Confusing sentences (rewrite suggestions)
   - Tone mismatches
   - Grammar/spelling errors
   - Jargon to simplify
3. Rewritten version

Be constructive but honest.
```

**Use case**: Edit emails, proposals, reports before sending

---

### 34. Convert Meeting Notes to Action Plan

**Prompt Template**:
```
Convert these meeting notes into a structured action plan:

[PASTE MEETING NOTES]

Action plan should include:
1. Project name
2. Goal / desired outcome
3. Key deliverables
4. Action items:
   - Task
   - Owner
   - Deadline
   - Dependencies
5. Success metrics
6. Next meeting date

Format for project management tool (Asana, Monday, etc.).
```

**Output**: Ready-to-import project plan

---

### 35. Role-Play Difficult Conversation

**Prompt Template**:
```
Help me prepare for a difficult conversation:

Scenario: [DESCRIBE SITUATION - e.g., "Giving negative feedback to employee", "Negotiating salary", "Declining client request"]
My role: [YOUR POSITION]
Other person: [THEIR POSITION/PERSONALITY]
Goal: [DESIRED OUTCOME]

Please:
1. Suggest an opening statement (set the tone)
2. Anticipate their likely objections / reactions
3. Provide response scripts for each objection
4. Recommend how to close the conversation
5. Red flags to avoid (phrases that escalate tension)

Then role-play the conversation with me. You play [OTHER PERSON], I'll practice my responses.
```

**Use case**: Performance reviews, negotiations, conflict resolution

---

## Prompt Engineering Best Practices

### How to Write Better Prompts

**1. Be Specific**
- ❌ "Write a blog post about marketing"
- ✅ "Write a 1,500-word blog post about email marketing best practices for B2B SaaS companies, targeting marketing managers"

**2. Provide Context**
- Include who you are, what you're trying to achieve, who the audience is
- Example: "I'm the CEO of a 20-person SaaS startup..."

**3. Set Constraints**
- Word count, tone, format, what to avoid
- Example: "Keep under 100 words, professional tone, avoid jargon"

**4. Use Examples**
- Show the AI what "good" looks like
- Example: "Write like this example: [paste sample]"

**5. Iterate and Refine**
- First output not perfect? Add more detail and re-run
- Save your best-performing prompts for reuse

**6. Structure with Sections**
- Use headers, bullet points, numbered lists
- Makes it easy for AI to understand what you want

**7. Specify Output Format**
- "Format as a table", "Provide bullet points", "Write as email"
- Saves time on reformatting

---

## Saving and Organizing Your Prompts

### Create a Prompt Library

**Option 1: Spreadsheet**
Create a spreadsheet with columns:
- Prompt Name
- Category (Support, Sales, Content, etc.)
- Prompt Template
- Last Used Date
- Success Rating (1-5 stars)

**Option 2: Notion Database**
- Tag prompts by use case
- Track which ones perform best
- Share with team

**Option 3: Custom GPT (ChatGPT Plus)**
- Create custom GPT with your best prompts
- Team can access without copy-pasting

---

## Advanced Techniques

Once you're comfortable with the basic prompts above, these techniques will significantly improve your results.

### Technique 1: Chain-of-Thought (Show Your Reasoning)

**What it does**: Asks AI to explain its reasoning step by step, which produces more accurate and nuanced outputs.

**When to use**: Complex analysis, decision-making, anything where you need to verify the AI's logic.

**Template**:
```
Analyze [TOPIC/DOCUMENT/DATA] and show your reasoning step by step:

1. First, identify the key factors
2. Then, evaluate each factor
3. Then, consider potential risks or downsides
4. Finally, provide your recommendation with confidence level (high/medium/low)

Be explicit about any assumptions you're making.
```

**Example** (competitive analysis):
```
Analyze our top 3 competitors in the [INDUSTRY] space. Show your reasoning:

1. First, identify each competitor's core value proposition
2. Then, compare their pricing, features, and target audience to ours
3. Then, identify where we're stronger and where we're weaker
4. Finally, recommend 2-3 positioning opportunities we should pursue

Our product: [BRIEF DESCRIPTION]
Our pricing: [PRICING]
Our target customer: [DESCRIPTION]
```

**Why it works**: Without chain-of-thought, AI gives you a polished answer that may be wrong. With it, you can see *where* the reasoning breaks down and correct it.

---

### Technique 2: Role-Based Prompting

**What it does**: Gives AI a specific persona with expertise, which produces more focused and expert-level output.

**When to use**: When you need specialist-quality output (legal review, financial analysis, technical writing).

**Template**:
```
You are a [SPECIFIC ROLE] with [X] years of experience in [DOMAIN].
Your communication style is [STYLE DESCRIPTION].

Your task: [WHAT YOU NEED]

Context: [RELEVANT BACKGROUND]

Constraints:
- [CONSTRAINT 1]
- [CONSTRAINT 2]
```

**Example** (contract review):
```
You are a commercial lawyer with 15 years of experience reviewing SaaS contracts in Southeast Asia. You are thorough but practical — you flag real risks, not theoretical ones.

Your task: Review this vendor agreement and flag the top 5 risks for a 20-person company.

For each risk, provide:
- The specific clause (quote it)
- Why it's risky (plain English, not legal jargon)
- What to negotiate instead
- Risk level: Critical / Important / Minor

Context: We're a Singapore-based SaaS company, 20 employees, signing a 2-year contract with this vendor.

[PASTE CONTRACT]
```

**Why it works**: Without a role, AI gives generic advice. With a specific role, it prioritizes the right concerns and uses the right level of detail.

---

### Technique 3: Structured Output (Tables, JSON, Specific Formats)

**What it does**: Forces AI to output in a specific format that's immediately useful — no reformatting needed.

**When to use**: Data extraction, comparison tables, content that feeds into spreadsheets or other tools.

**Template**:
```
[YOUR REQUEST]

Output format: [EXACT FORMAT DESCRIPTION]

Example of desired output:
[PROVIDE ONE EXAMPLE ROW/ENTRY]
```

**Example** (invoice data extraction):
```
Extract the following fields from this invoice and output as a CSV row:

Fields: Vendor Name, Invoice Number, Date, Due Date, Line Items (description | quantity | unit price | total), Subtotal, Tax, Grand Total, Currency

Output one CSV row per invoice. Use | as delimiter within the Line Items field.

Example output:
"Acme Corp","INV-2024-001","2024-03-15","2024-04-15","Widget A | 10 | $50 | $500 | Widget B | 5 | $100 | $500","$1000","$70","$1070","USD"

[PASTE INVOICE]
```

**Why it works**: AI defaults to prose. If you need structured data, you must ask for it explicitly — and providing an example dramatically improves format consistency.

---

### Technique 4: Iterative Refinement (Build On Previous Output)

**What it does**: Uses AI's first draft as a starting point, then refines through follow-up prompts. Produces much higher quality than a single prompt.

**When to use**: Important content (client proposals, public-facing copy, strategic analysis) where quality matters more than speed.

**Workflow**:
```
Step 1 (Generate): "Write a [CONTENT TYPE] about [TOPIC]. Include [KEY POINTS]."

Step 2 (Critique): "Now critique what you just wrote. What's weak? What's missing? What would a [TARGET READER] find unconvincing?"

Step 3 (Improve): "Rewrite the piece addressing those weaknesses. Specifically improve [AREA 1] and [AREA 2]."

Step 4 (Polish): "Final pass: tighten the language, remove filler words, and ensure every paragraph adds value. Target [WORD COUNT]."
```

**Example** (sales proposal):
```
Step 1: "Write a 1-page proposal for [CLIENT NAME] explaining how our [PRODUCT] solves their [PROBLEM]. Include: problem statement, our solution, expected ROI, and next steps."

Step 2: "Critique this proposal from the perspective of a skeptical CFO. What would they push back on? What's missing?"

Step 3: "Rewrite addressing the CFO's concerns. Add specific numbers where I said 'significant improvement.' Make the ROI calculation transparent."

Step 4: "Final polish: make it concise (under 500 words), professional, and end with a clear call to action. Remove any vague claims."
```

**Why it works**: A single prompt produces a B+ draft. Four iterations produce an A draft. The AI's self-critique in Step 2 catches issues you might miss.

---

### When to Use Which Technique

| Situation | Best Technique | Why |
|-----------|---------------|-----|
| Analyzing complex documents | Chain-of-Thought | See the reasoning, catch errors |
| Writing expert-level content | Role-Based | Gets specialist-quality output |
| Extracting data from documents | Structured Output | Ready for spreadsheets immediately |
| Creating important deliverables | Iterative Refinement | Each pass improves quality |
| Quick daily tasks | Basic prompts (above) | Speed matters more than perfection |

**Pro tip**: Combine techniques. Use Role-Based + Chain-of-Thought for complex analysis. Use Structured Output + Iterative Refinement for important data work.

---

## Next Steps

1. **Browse prompts** above and find 3-5 relevant to your business
2. **Customize** by replacing [PLACEHOLDERS] with your info
3. **Test** with real work (not hypotheticals)
4. **Iterate** if output isn't perfect (add context, examples, constraints)
5. **Save** your best prompts for reuse
6. **Share** with team so everyone benefits

**Ready to train your team?** → [Read ADOPTION.md for training strategies](./ADOPTION.md)

---

## Related Resources

- **[USE-CASES.md](./USE-CASES.md)** - Identify which use cases to prioritize
- **[TOOLS.md](./TOOLS.md)** - Choose the right AI tool for your prompts
- **[SECURITY.md](./SECURITY.md)** - Know what data is safe to include in prompts
- **[README.md](./README.md)** - 30-Day AI Pilot implementation plan
