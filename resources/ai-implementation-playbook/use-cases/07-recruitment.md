# AI for Recruitment

**Save 60-80% of time on resume screening, job descriptions, and candidate communication**

This guide shows you how to use AI to streamline recruitment from job posting to offer letter.

---

## Business Value

### Time Savings
- **Resume screening**: 85% faster (2 hours → 18 min for 50 resumes)
- **Job description writing**: 75% faster (90 min → 22 min per JD)
- **Candidate emails**: 80% faster (15 min → 3 min per message)
- **Interview prep**: 70% faster (30 min → 9 min per candidate)

### ROI Calculation

**Small company (2-3 hires/month)**:
- Current time on recruiting: 20 hours/month
- AI time savings: 70% = 14 hours/month saved
- Value: 14 hours × $50/hour × 12 months = **$8,400/year**
- Tool cost: ChatGPT Plus $20/month = $240/year
- **ROI: 35x**

**Growing company (10+ hires/month)**:
- Current time on recruiting: 80 hours/month
- AI time savings: 75% = 60 hours/month saved
- Value: 60 hours × $50/hour × 12 months = **$36,000/year**
- Tool cost: ChatGPT Plus $20/month = $240/year
- **ROI: 150x**

---

## Prerequisites

### Tools Required
**Recommended**: ChatGPT Plus ($20/month)
- Excellent at writing job descriptions
- Can analyze resumes (upload PDF)
- Good at drafting candidate emails

**Alternative**: Claude Pro ($20/month)
- Better for analyzing many resumes at once
- Can handle longer resumes (200K token context)

### Data Requirements
- ✅ Job requirements and responsibilities
- ✅ Company culture/values description
- ✅ Ideal candidate profile
- ✅ Salary range and benefits
- ⚠️ **Remove candidate PII** when sharing with AI (see [SECURITY.md](../SECURITY.md))

### Time Investment
- **Setup**: 1-2 hours (create templates for common roles)
- **Training team**: 30 minutes per recruiter/hiring manager
- **Ongoing**: 0 hours (part of normal workflow)

---

## Implementation Guide

### Step 1: Create Job Description Templates (60 minutes)

Build reusable prompts for writing job descriptions.

**Job Description Template**:
```
Write a job description for [JOB TITLE] at [COMPANY NAME].

Company: [COMPANY DESCRIPTION - 2-3 sentences]
Industry: [INDUSTRY]
Company size: [EMPLOYEES]
Location: [LOCATION / REMOTE]

Role details:
- Level: [Entry/Mid/Senior]
- Department: [E.G., Engineering, Marketing, Sales]
- Reports to: [TITLE]
- Team size: [NUMBER OF DIRECT REPORTS if applicable]

Key responsibilities (what they'll do day-to-day):
1. [RESPONSIBILITY 1]
2. [RESPONSIBILITY 2]
3. [RESPONSIBILITY 3]
4. [RESPONSIBILITY 4]
5. [RESPONSIBILITY 5]

Required qualifications:
- [EDUCATION / EXPERIENCE]
- [SKILLS]
- [TOOLS/TECHNOLOGIES]

Nice-to-have qualifications:
- [PREFERRED EXPERIENCE]
- [BONUS SKILLS]

Compensation:
- Salary range: [RANGE]
- Benefits: [LIST KEY BENEFITS]

Write a job description that:
1. Starts with compelling 2-3 sentence hook (why this role is exciting)
2. Describes company mission and culture (1 paragraph)
3. Lists responsibilities (5-7 bullets, starts with action verbs)
4. Lists requirements (Must-haves vs Nice-to-haves)
5. Describes compensation and benefits
6. Ends with application instructions

Tone: [E.g., "Professional but approachable," "Innovative and fast-paced," "Mission-driven"]
Length: 400-500 words
Avoid: Jargon, clichés like "rockstar" or "ninja", discriminatory language
```

---

### Step 2: Create Resume Screening Templates (45 minutes)

Build prompts for evaluating candidate fit.

**Resume Screening Template**:
```
Evaluate this resume for [JOB TITLE] position:

[UPLOAD RESUME PDF or PASTE TEXT]

Job requirements:
- [REQUIREMENT 1]
- [REQUIREMENT 2]
- [REQUIREMENT 3]
- [REQUIREMENT 4]
- [REQUIREMENT 5]

Must-have qualifications:
- [MUST-HAVE 1]
- [MUST-HAVE 2]
- [MUST-HAVE 3]

Nice-to-have qualifications:
- [NICE-TO-HAVE 1]
- [NICE-TO-HAVE 2]

Provide:

1. **Overall Score** (1-10):
   - 9-10: Strong match, interview immediately
   - 7-8: Good match, interview
   - 5-6: Possible match, depends on interview availability
   - 1-4: Not a match, pass

2. **Strengths** (what makes them a good fit):
   - Relevant experience
   - Skills that match
   - Notable achievements

3. **Gaps** (what's missing or weak):
   - Requirements they don't meet
   - Experience gaps
   - Skills to verify in interview

4. **Red Flags** (concerns to investigate):
   - Job hopping (short tenures)
   - Employment gaps
   - Skill mismatches
   - Unclear achievements

5. **Interview Questions** (3-5 questions to ask):
   - Clarify gaps or concerns
   - Assess key skills
   - Verify culture fit

6. **Recommendation**: Interview (Yes/No/Maybe) + brief justification

Keep analysis concise - 200-300 words.
```

---

### Step 3: Create Candidate Communication Templates (45 minutes)

**Initial Outreach Template** (for sourcing):
```
Write a LinkedIn outreach message to recruit this candidate:

Candidate profile:
- Name: [NAME]
- Current role: [TITLE at COMPANY]
- Experience: [YEARS in relevant field]
- Skills: [KEY SKILLS]
- Reason we're interested: [WHY THEY'RE A GOOD FIT]

Our role:
- Title: [JOB TITLE]
- Company: [COMPANY NAME]
- Why it's compelling: [KEY SELLING POINTS]

Write a message that:
1. Mentions something specific from their profile (personalization)
2. Briefly explains why we're reaching out (what caught our attention)
3. Highlights the opportunity (role, company, why it's interesting)
4. Suggests low-pressure next step (quick call, coffee chat)
5. Stays under 150 words
6. Doesn't sound like spam or generic recruiter message

Tone: Professional but warm, respectful of their time
```

---

**Rejection Email Template**:
```
Write a rejection email for a candidate who interviewed but wasn't selected:

Candidate: [NAME]
Role: [JOB TITLE]
Interview stage: [PHONE SCREEN / 1ST ROUND / FINAL ROUND]
Reason not selected: [BRIEF REASON - e.g., "other candidate had more relevant experience"]

Write an email that:
1. Thanks them for their time and interest
2. Delivers news clearly but kindly (no false hope)
3. Provides brief, honest feedback (if appropriate for interview stage)
4. Keeps door open for future opportunities
5. Wishes them well in their search

Tone: Professional, empathetic, respectful
Length: 100-150 words
Avoid: Generic templates, overly vague ("we decided to pursue other candidates")
```

---

**Offer Letter Template**:
```
Write an offer letter for:

Candidate: [NAME]
Position: [JOB TITLE]
Start date: [DATE]
Salary: [AMOUNT]
Equity: [IF APPLICABLE]
Benefits: [LIST]
Reports to: [MANAGER NAME, TITLE]

Include:
1. Congratulations and excitement to have them join
2. Position title, start date, reporting structure
3. Compensation (salary, bonus structure, equity)
4. Benefits (health, dental, 401k, PTO, etc.)
5. Employment type (full-time, exempt)
6. Contingencies (background check, references)
7. Acceptance deadline
8. Next steps (sign and return, contact for questions)

Tone: Professional but warm, welcoming
Length: 300-400 words
Format: Formal business letter format
```

---

### Step 4: Train Recruiting Team (30 minutes per person)

**Training Session Agenda**:

**0:00-0:10 - Why AI for Recruiting**
- Show time savings (2 hours → 18 min for resume screening)
- Explain AI as screening assistant, not hiring decision-maker
- Address concerns: "Will this introduce bias?" → AI reduces human bias when used correctly

**0:10-0:20 - Demo Resume Screening**
- Upload 3 sample resumes
- Show AI evaluation (scores, strengths, gaps)
- Emphasize: AI does initial filter, you make final decisions

**0:20-0:25 - Hands-On Practice**
- Recruiter picks 5 real resumes
- Runs through screening template
- Compares AI recommendations to their gut feel

**0:25-0:30 - Q&A and Guidelines**
- When to use: Resume screening, JD writing, email drafts
- When NOT to use: Final hiring decisions, performance evaluations
- Data privacy: Remove names when testing templates
- Set expectation: Use AI for next 10 resumes, track time saved

---

### Step 5: Measure Results (Week 2)

**Metrics to Track**:

1. **Time per hire**
   - Before AI: [Baseline - e.g., 15 hours]
   - After AI: [New average - e.g., 5 hours]
   - Savings: [Percentage - e.g., 67%]

2. **Resume screening time**
   - Before AI: [E.g., 2 hours for 50 resumes]
   - After AI: [E.g., 18 minutes]
   - Increase: [E.g., 85% faster]

3. **Quality of hire**
   - Track: Do AI-screened candidates perform as well as manually screened?
   - Target: No decrease in quality

**Expected Results**:
- 60-80% time savings on recruiting tasks
- 2-3x more candidates screened with same effort
- Same or better hire quality (AI reduces unconscious bias)

---

## Advanced Use Cases

### Use Case 1: Batch Resume Scoring

**Prompt**:
```
Score these 20 resumes for [JOB TITLE]:

[PASTE OR UPLOAD 20 RESUMES]

Job requirements:
[LIST REQUIREMENTS]

For each resume, provide:
- Candidate name
- Overall score (1-10)
- Top 2 strengths
- Top 2 gaps
- Recommendation (Interview / Pass)

Format as table sorted by score (highest to lowest).
```

**Time Savings**: 20 resumes in 5 minutes instead of 40 minutes manually

---

### Use Case 2: Interview Question Generation

**Prompt**:
```
Generate interview questions for [JOB TITLE] candidate:

Candidate resume: [UPLOAD or PASTE]

Role requirements:
[LIST REQUIREMENTS]

Create:
1. **Technical Questions** (5 questions):
   - Assess required skills
   - Include behavioral (STAR format) and scenario questions
   - Mix easy/medium/hard

2. **Cultural Fit Questions** (3 questions):
   - Assess alignment with [COMPANY VALUES]
   - Understand work style and motivations

3. **Questions to Clarify Resume** (3 questions):
   - Address gaps or unclear items from their resume
   - Verify claimed skills and achievements

For each question, include:
- The question
- What you're assessing
- What a good answer looks like
```

---

### Use Case 3: Candidate Comparison

**Prompt**:
```
Compare these 3 final-round candidates for [JOB TITLE]:

Candidate A: [NAME, BACKGROUND]
Candidate B: [NAME, BACKGROUND]
Candidate C: [NAME, BACKGROUND]

Interview feedback:
[PASTE NOTES FROM INTERVIEW PANEL]

Provide:
1. **Comparison Matrix**:
   - Technical skills (1-10 for each)
   - Experience fit (1-10)
   - Cultural alignment (1-10)
   - Growth potential (1-10)
   - Overall score

2. **Strengths** (for each candidate):
   - What they'd excel at
   - Unique advantages

3. **Concerns** (for each candidate):
   - Weaknesses or risks
   - Gaps to address

4. **Recommendation**:
   - Top choice and why
   - Close second (if applicable)
   - Reasoning based on role requirements and company needs
```

---

## Best Practices

### DO ✅

1. **Use AI to scale screening**
   - AI can review 100 resumes in the time it takes to read 5 manually
   - Use AI to filter top 20%, then manually review top candidates
   - Increases candidate pool without increasing time

2. **Personalize all communication**
   - AI drafts the structure, you add personal touches
   - Reference specific items from resume or conversation
   - Never send completely unedited AI emails

3. **Combine AI with human judgment**
   - AI scores resumes, you make final interview decisions
   - AI suggests questions, you adapt based on candidate
   - AI is a tool, not a replacement for recruiter expertise

4. **Reduce bias with AI**
   - AI can help standardize evaluation criteria
   - Less influenced by unconscious bias (name, school, etc.)
   - BUT: Verify AI isn't perpetuating biases from training data

5. **Track candidate experience**
   - Survey: "How was your interview process?"
   - Ensure AI-assisted process feels personal, not robotic
   - Iterate based on feedback

### DON'T ❌

1. **Don't fully automate hiring decisions**
   - AI can recommend, but humans must decide
   - Interview top AI-scored candidates, don't auto-reject low scores
   - Use AI to inform, not dictate

2. **Don't share candidate PII with consumer AI tools**
   - Remove names, contact info, SSN from resumes
   - Use enterprise tier if processing confidential data
   - See [SECURITY.md](../SECURITY.md) for guidelines

3. **Don't use AI for protected class decisions**
   - Never ask AI to filter by age, gender, ethnicity, disability
   - AI should evaluate job-relevant qualifications only
   - Consult legal team on EEOC compliance

4. **Don't ignore AI bias**
   - Audit AI recommendations for bias (gender, race, age)
   - If AI consistently scores certain demographics lower, investigate
   - Adjust prompts to focus on job-relevant criteria

5. **Don't send generic AI messages**
   - Candidates can tell when they're getting a template
   - Always customize AI drafts with specific details
   - Personalization = better candidate experience = higher acceptance rates

---

## Common Pitfalls and Solutions

### Pitfall 1: AI Filters Out Good Candidates

**Problem**: AI gives low scores to non-traditional candidates who might be great.

**Solution**:
- Set AI threshold lower (e.g., review anyone scored 6+ instead of 8+)
- Ask AI to identify "diamond in the rough" candidates (unconventional but promising)
- Always manually review borderline cases

---

### Pitfall 2: Generic Job Descriptions

**Problem**: AI-written JDs sound like every other posting.

**Solution**:
- Provide specific company culture details in prompt
- Include unique perks or selling points
- Edit AI draft to add personality and voice
- Reference real projects or challenges the role will tackle

---

### Pitfall 3: Candidate Ghosting

**Problem**: Candidates don't respond to AI-generated outreach.

**Solution**:
- Personalize every message (reference LinkedIn post, project, background)
- Make the opportunity compelling (specific role details, not generic)
- Low-pressure ask ("15-min call to learn more about you")
- Follow up once after 1 week

---

### Pitfall 4: Inconsistent Scoring

**Problem**: AI scores vary wildly depending on how prompt is worded.

**Solution**:
- Standardize prompt for each role (same criteria every time)
- Create scoring rubric: "Score 9-10 if candidate has [specific qualifications]"
- Test prompt on 10 resumes, verify consistency before deploying

---

## Success Metrics

### 1. Time to Fill
**Metric**: Days from posting to accepted offer
- **Baseline**: Current average (e.g., 45 days)
- **Target**: 20-30% reduction
- **Measurement**: Track in ATS or spreadsheet

**Example**:
- Before AI: 45 days to fill role
- After AI: 32 days (faster screening = faster interviews)
- **29% improvement**

---

### 2. Recruiter Productivity
**Metric**: Candidates screened per week
- **Baseline**: Current volume (e.g., 20 resumes/week per recruiter)
- **Target**: 2-3x increase
- **Measurement**: Count resumes reviewed

**Example**:
- Before AI: 20 resumes/week
- After AI: 55 resumes/week
- **175% increase = can fill more roles with same team**

---

### 3. Quality of Hire
**Metric**: 90-day performance rating of new hires
- **Baseline**: Current average (e.g., 75% meet or exceed expectations)
- **Target**: Maintain or improve
- **Measurement**: Manager surveys at 90 days

**Example**:
- Before AI: 75% of hires rated "meets expectations" or better
- After AI: 78% rated "meets expectations" or better
- **AI screening doesn't hurt quality, may improve by reducing bias**

---

## Real-World Examples

### Example 1: Tech Startup (20 employees, hiring 2/month)

**Before AI**:
- Founder screened all resumes manually (3 hours/week)
- Wrote job descriptions from scratch (2 hours each)
- Total: 11 hours/month on recruiting tasks

**After AI** (2 months):
- AI screens resumes, founder reviews top 10 (45 min/week)
- AI drafts JDs, founder customizes (30 min each)
- Total: 4 hours/month (64% reduction)

**ROI**:
- Time saved: 7 hours/month × $100/hour = $700/month = $8,400/year
- Better candidate pool: Can screen 3x more applications
- Tool cost: ChatGPT Plus $20/month = $240/year
- **ROI: 35x**

**Founder feedback**:
- "I can finally review 100 applicants instead of 30. Found amazing candidates I would have missed."

---

### Example 2: Growing SaaS Company (100 employees, hiring 10/month)

**Before AI**:
- 2 recruiters, 40 hours/week each = 320 hours/month
- Screening 500+ resumes/month manually
- High burnout, inconsistent quality

**After AI** (3 months):
- Same 2 recruiters, 25 hours/week each = 200 hours/month (38% reduction)
- AI screens 500+ resumes, recruiters interview top 50
- More time for candidate relationships, less time on admin

**ROI**:
- Time saved: 120 hours/month × $40/hour = $4,800/month = $57,600/year
- Avoided hiring 3rd recruiter (saved $60K salary)
- Tool cost: ChatGPT Plus $20/month × 2 = $480/year
- **ROI: 120x + avoided new hire**

**Recruiter feedback**:
- "We went from drowning in resumes to having time for proactive sourcing and candidate nurturing."

---

### Example 3: Professional Services Firm (50 employees)

**Before AI**:
- Hiring manager screened resumes themselves (no recruiter)
- 5 hours/week on recruiting (writing JDs, screening, emails)
- Slow hiring process (60+ days to fill)

**After AI** (2 months):
- Hiring manager uses AI for screening and communication
- 1.5 hours/week on recruiting (review AI-recommended candidates)
- Faster hiring (40 days to fill)

**ROI**:
- Time saved: 3.5 hours/week × $75/hour = $262/week = $13,650/year
- Faster time to fill = less lost productivity from open role
- Tool cost: ChatGPT Plus $20/month = $240/year
- **ROI: 57x**

**Manager feedback**:
- "I don't have recruiting expertise. AI levels the playing field - I can screen like a pro."

---

## Related Resources

- **[PROMPT-LIBRARY.md](../PROMPT-LIBRARY.md)** - Copy-paste recruiting prompts
- **[SECURITY.md](../SECURITY.md)** - What candidate data is safe to share with AI
- **[TOOLS.md](../TOOLS.md)** - Compare ChatGPT vs Claude for recruiting

---

## Next Steps

1. **Week 1**: Create templates for your most common roles
2. **Week 2**: Test with 10-20 real resumes, refine prompts
3. **Week 3**: Train hiring managers and recruiters (30 min each)
4. **Week 4**: Measure time savings and candidate quality

**Ready to explore more use cases?** → [See all 10 AI use cases](../USE-CASES.md)
