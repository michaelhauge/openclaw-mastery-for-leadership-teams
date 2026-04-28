# AI for Document Analysis

**Save 70-90% of time on reviewing contracts, extracting data from invoices, and summarizing long documents**

This guide shows you how to use AI to accelerate document review, data extraction, and comprehension tasks.

---

## Business Value

### Time Savings
- **Contract review**: 75% faster (2 hours → 30 min per contract)
- **Invoice data extraction**: 90% faster (20 min → 2 min per batch of 10)
- **Document summarization**: 85% faster (60 min → 9 min for 50-page doc)
- **Compliance review**: 70% faster (4 hours → 1.2 hours per policy doc)

### ROI Calculation

**Small business (5-10 documents/week)**:
- Current time on document review: 10 hours/week
- AI time savings: 75% = 7.5 hours/week saved
- Value: 7.5 hours × $50/hour × 52 weeks = **$19,500/year**
- Tool cost: Claude Pro $20/month = $240/year
- **ROI: 81x**

**Medium business (20-30 documents/week)**:
- Current time on document review: 30 hours/week
- AI time savings: 80% = 24 hours/week saved
- Value: 24 hours × $60/hour × 52 weeks = **$74,880/year**
- Tool cost: Claude Pro $20/month × 3 people = $720/year
- **ROI: 104x**

---

## Prerequisites

### Tools Required
**Recommended**: Claude Pro ($20/month)
- Best for long documents (200K tokens = ~150,000 words = 500+ pages)
- Excellent comprehension and analysis
- Can upload PDFs, Word docs, text files

**Alternative**: ChatGPT Plus ($20/month)
- Good for shorter documents (up to ~100 pages)
- Advanced Data Analysis can extract structured data
- Can process images (scanned invoices, receipts)

### Document Types This Works For
- ✅ Contracts and legal agreements
- ✅ Invoices and receipts
- ✅ Financial reports and statements
- ✅ RFPs and proposals
- ✅ Technical specifications
- ✅ Research papers and articles
- ✅ Policy and compliance documents
- ✅ Meeting transcripts (see [05-meeting-notes.md](./05-meeting-notes.md))

### Time Investment
- **Setup**: 1-2 hours (create document review templates)
- **Training team**: 30-45 minutes per person
- **Ongoing**: 0 hours (part of normal workflow)

---

## Implementation Guide

### Step 1: Create Document Review Templates (60 minutes)

Build reusable prompts for common document types.

#### **Contract Review Template**:
```
Review this contract and provide analysis:

[UPLOAD PDF or PASTE TEXT]

Provide:

1. **Contract Overview**
   - Parties involved
   - Contract type (NDA, MSA, SOW, etc.)
   - Effective dates (start, end, renewal)
   - Contract value (if stated)

2. **Key Terms**
   - Payment terms (amount, schedule, method)
   - Deliverables and timeline
   - Termination conditions
   - Liability and indemnification
   - IP ownership

3. **Obligations**
   - What we must do
   - What the other party must do
   - Deadlines and milestones

4. **Risks and Red Flags**
   - Unfavorable terms
   - Unusual clauses
   - Auto-renewal clauses
   - Penalties or liquidated damages
   - Non-compete or exclusivity

5. **Missing Elements**
   - Standard clauses not included
   - Ambiguous language
   - Items that should be clarified

6. **Recommended Actions**
   - Negotiate these items (priority order)
   - Clarify these terms
   - Add these protections

Format as executive summary (500-600 words).
```

---

#### **Invoice Data Extraction Template**:
```
Extract data from these invoices:

[UPLOAD INVOICE PDFs or IMAGES]

For each invoice, extract:
- Invoice number
- Vendor name
- Invoice date
- Due date
- Line items (description, quantity, unit price, total)
- Subtotal
- Tax
- Total amount
- Payment terms
- Account/reference numbers

Format as CSV:
InvoiceNumber,Vendor,Date,DueDate,LineItem,Qty,UnitPrice,LineTotal,Subtotal,Tax,Total,PaymentTerms

If any field is missing, leave blank or mark as "N/A".
```

---

#### **Document Summarization Template**:
```
Summarize this document:

[UPLOAD PDF or PASTE TEXT]

Provide:

1. **One-sentence summary**: What is this document?

2. **Key Points** (5-7 bullets):
   - Main ideas or findings
   - Important data or statistics
   - Key recommendations

3. **Who should read this**:
   - Which roles or teams need this info

4. **Action items** (if any):
   - What needs to be done based on this document
   - Who should do it
   - When

5. **Related topics**:
   - Other documents or areas this connects to

Length: 200-300 words total.
```

---

#### **Compliance Review Template**:
```
Review this policy/procedure for compliance with [REGULATION - e.g., GDPR, HIPAA, SOC 2]:

[UPLOAD POLICY DOCUMENT]

Analyze:

1. **Compliance Coverage**:
   - Requirements this policy addresses
   - How well each requirement is covered (Strong/Partial/Missing)

2. **Gaps**:
   - Requirements not addressed
   - Incomplete sections
   - Ambiguous language

3. **Risks**:
   - Non-compliance risks
   - Severity (High/Medium/Low)
   - Likelihood of issue

4. **Recommendations**:
   - What to add or change (priority order)
   - Specific language to include
   - Policies to reference or link

5. **Best Practices**:
   - Industry standards we should follow
   - Examples from similar companies

Format as compliance audit report.
```

---

### Step 2: Test With Sample Documents (60 minutes)

Test each template with real documents.

**Example: Contract Review Test**

**Upload**: Sample NDA or vendor contract

**Expected Output**:
- Clear summary of parties, dates, key terms
- List of obligations for both parties
- Any red flags highlighted (auto-renewal, unfavorable terms)
- Recommended negotiation points

**Review Checklist**:
- ✅ Accurate extraction of key dates and terms?
- ✅ Identified actual risks in the contract?
- ✅ Recommendations are actionable?
- ✅ Nothing critical missed?

**If output isn't right**:
- Missing info → Add to template: "Extract these specific fields"
- Too generic → Add: "Focus on [specific concern - e.g., IP ownership]"
- Wrong interpretation → Provide context: "This is a [type] contract for [use case]"

---

### Step 3: Create Document Processing Workflows (45 minutes)

Combine prompts for multi-step document tasks.

#### **Contract Approval Workflow**:

**Step 1**: Initial Review (use Contract Review Template)
- Upload contract
- Get overview, key terms, risks

**Step 2**: Comparison to Standard Terms
```
Compare this contract to our standard terms:

Contract to review:
[PASTE CONTRACT]

Our standard terms:
[PASTE STANDARD AGREEMENT TEMPLATE]

Identify:
1. Terms that match our standard
2. Terms that deviate from our standard
3. Terms missing from their version
4. Terms we should negotiate to match our standard
```

**Step 3**: Generate Negotiation Points
```
Based on the contract review above, draft an email to the vendor requesting these changes:

[LIST OF ITEMS TO NEGOTIATE]

Email should:
- Be professional and collaborative (not confrontational)
- Explain why each change is needed
- Prioritize must-haves vs nice-to-haves
- Suggest specific language
- Include deadline for response
```

**Total time**: 20 minutes instead of 2-3 hours

---

### Step 4: Train Your Team (45 minutes per person)

**Training Session Agenda**:

**0:00-0:10 - Why AI for Documents**
- Show time savings (2 hours → 30 min for contract review)
- Explain AI as analysis assistant, not legal advice
- Address concerns: "Is this safe?" → Yes, use enterprise tier for confidential docs

**0:10-0:25 - Demo Document Review**
- Pick a real contract or document
- Show: Upload PDF → AI review → Extracted key points
- Emphasize: AI finds 90% of key info, you verify and add judgment

**0:25-0:35 - Hands-On Practice**
- Team member picks a document to review
- Uses template to analyze
- Compares AI output to their manual review

**0:35-0:45 - Q&A and Guidelines**
- When to use: Routine document review, data extraction, summaries
- When NOT to use: Final legal advice, signing contracts without human review
- Data privacy: See [SECURITY.md](../SECURITY.md) for what data is safe
- Set expectation: Use AI for next 5 documents this week, track time saved

---

### Step 5: Measure Results (Week 2)

**Metrics to Track**:

1. **Time per document**
   - Before AI: [Baseline - e.g., 2 hours per contract]
   - After AI: [New average - e.g., 30 min]
   - Savings: [Percentage - e.g., 75%]

2. **Documents processed per week**
   - Before AI: [Baseline - e.g., 5 contracts/week]
   - After AI: [New volume - e.g., 15 contracts/week]
   - Increase: [E.g., 200% more throughput]

3. **Accuracy**
   - Track: How often AI misses critical terms
   - Target: <5% miss rate (AI + human review catches everything)

**Expected Results**:
- 70-90% time savings per document
- 2-3x more documents processed with same resources
- Same or better accuracy (AI catches details humans miss)

---

## Advanced Use Cases

### Use Case 1: Compare Multiple Contracts

**Prompt**:
```
Compare these 3 vendor contracts and create a comparison matrix:

[UPLOAD or PASTE 3 CONTRACTS]

Create a table comparing:
- Vendor name
- Contract term length
- Total contract value
- Payment terms
- Deliverables
- SLA commitments
- Termination conditions
- Auto-renewal (Yes/No)
- Liability caps
- Our obligations
- Their obligations

For each item, highlight:
- Best terms (which vendor offers best)
- Worst terms (which vendor has unfavorable)
- Missing terms (what's not specified)

Recommend which contract to sign based on overall terms.
```

---

### Use Case 2: Extract and Analyze Financial Data

**Prompt**:
```
Analyze these financial statements:

[UPLOAD P&L, Balance Sheet, Cash Flow Statement]

Provide:

1. **Financial Health Summary**:
   - Revenue trend (growing/declining, %)
   - Profitability (net margin, trend)
   - Cash position (runway in months)
   - Burn rate (if applicable)

2. **Key Metrics**:
   - Gross margin
   - Operating margin
   - Quick ratio
   - Current ratio
   - Debt-to-equity ratio

3. **Red Flags**:
   - Concerning trends
   - Unusual items
   - Risks to highlight

4. **Opportunities**:
   - Areas to improve margins
   - Cost reduction opportunities
   - Revenue growth levers

5. **Recommendation**:
   - Is this company financially healthy? (Yes/No/Concerns)
   - Action items based on analysis

Format as investment memo or credit analysis report.
```

---

### Use Case 3: Create Document Database

**Prompt**:
```
I'm uploading 20 company policies. Create a master policy index:

[UPLOAD 20 POLICY DOCUMENTS]

For each policy:
- Policy name
- Version/date
- What it covers (1 sentence)
- Who it applies to (employees, contractors, vendors)
- Key requirements (3-5 bullets)
- Related policies (cross-reference)
- Last reviewed date
- Next review date

Format as CSV for easy filtering and searching.
```

---

## Best Practices

### DO ✅

1. **Always review AI analysis**
   - AI is excellent at extraction and pattern recognition
   - You provide judgment and domain expertise
   - Never sign a contract based solely on AI review

2. **Use for initial review**
   - AI does first pass (90% of work in 10% of time)
   - You review AI's findings and add nuance
   - Escalate complex issues to legal/experts

3. **Provide context**
   - Tell AI: "This is a [type] contract for [purpose]"
   - Specify what you care about: "Focus on IP ownership and liability"
   - Better context = better analysis

4. **Verify extracted data**
   - For invoice/data extraction, spot-check 10% of results
   - Ensure accuracy before importing to accounting system
   - Fix any systematic errors in prompt

5. **Build a template library**
   - Save best-performing prompts
   - Standardize team's document review process
   - Iterate and improve over time

### DON'T ❌

1. **Don't upload confidential docs to consumer tools**
   - Use enterprise tiers (Claude Enterprise, ChatGPT Enterprise)
   - Or use on-premise AI solutions for highly sensitive docs
   - See [SECURITY.md](../SECURITY.md) Tier 3 guidelines

2. **Don't skip legal review for major contracts**
   - AI can identify issues, but can't replace lawyer for critical contracts
   - Use AI to make legal review more efficient, not replace it
   - For small contracts (NDAs, SOWs), AI review may be sufficient

3. **Don't trust AI on complex legal interpretation**
   - AI is great at "what does this say?" not "what should we do?"
   - Consult experts for nuanced legal questions
   - Use AI to surface issues, humans to decide how to handle

4. **Don't assume 100% accuracy**
   - AI can miss items or misinterpret
   - Always spot-check critical sections manually
   - For invoices/data extraction, verify totals and key fields

5. **Don't forget version control**
   - Track which version of contract you reviewed
   - If contract changes, re-run AI analysis
   - Don't rely on outdated summaries

---

## Common Pitfalls and Solutions

### Pitfall 1: AI Misses Critical Clause

**Problem**: AI overlooks important contract term buried in legal language.

**Solution**:
- Specify what to look for: "Pay special attention to IP ownership, indemnification, auto-renewal"
- Review AI summary against contract yourself
- Create checklist of must-have terms to verify

---

### Pitfall 2: Incorrect Data Extraction

**Problem**: Invoice data extracted incorrectly (wrong totals, dates).

**Solution**:
- Verify: Run AI extraction on 10 sample invoices, check manually
- If >95% accurate, deploy. If not, refine prompt.
- Add validation: "Verify subtotal + tax = total. Flag any mismatches."

---

### Pitfall 3: Overwhelmed by Long Documents

**Problem**: 500-page RFP, not sure where to start.

**Solution**:
- Ask AI for table of contents first
- Then: "Summarize Section 3.2 in detail"
- Break into chunks rather than analyzing all at once

---

### Pitfall 4: Generic Summary

**Problem**: AI summary lacks depth, doesn't answer key questions.

**Solution**:
- Be specific: "Summarize this contract with focus on our obligations and termination rights"
- Ask follow-up questions: "What are the financial penalties if we terminate early?"
- Iterate until you get the insights you need

---

## Success Metrics

### 1. Time Savings
**Metric**: Hours saved per week on document review
- **Baseline**: Time before AI (e.g., 10 hours/week)
- **Target**: 75-85% reduction
- **Measurement**: Track time spent on documents

**Example**:
- Before AI: 10 hours/week reviewing contracts
- After AI: 2.5 hours/week (AI review + human verification)
- **Savings: 7.5 hours/week = $375/week = $19,500/year**

---

### 2. Document Throughput
**Metric**: Documents processed per week
- **Baseline**: Current volume (e.g., 5 contracts/week)
- **Target**: 2-3x increase
- **Measurement**: Count documents reviewed

**Example**:
- Before AI: 5 contracts/week
- After AI: 13 contracts/week
- **160% increase = can handle growth without hiring**

---

### 3. Error Rate
**Metric**: % of critical terms missed or misinterpreted
- **Baseline**: Human error rate (e.g., 3-5%)
- **Target**: Maintain or improve
- **Measurement**: Audit sample of reviews

**Example**:
- Before AI: 5% miss rate (humans miss terms in dense contracts)
- After AI: 2% miss rate (AI catches most, humans verify)
- **Better quality through AI + human combination**

---

## Real-World Examples

### Example 1: Legal Tech Startup (20 employees)

**Before AI**:
- Lawyer reviewed all vendor contracts (2 hours each)
- 10 contracts/month = 20 hours/month
- Cost: $300/hour lawyer × 20 hours = $6,000/month

**After AI** (3 months):
- Paralegal uses Claude to review contracts (30 min each)
- Lawyer reviews AI summary and makes decisions (30 min each)
- 10 contracts/month = 10 hours total (paralegal + lawyer)
- Cost: 5 hours paralegal @ $50/hr + 5 hours lawyer @ $300/hr = $1,750/month

**ROI**:
- Savings: $4,250/month = $51,000/year
- Tool cost: Claude Pro $20/month = $240/year
- **ROI: 213x**

**Team feedback**:
- "Our lawyer now spends time on high-value work, not reading 50-page MSAs line by line."

---

### Example 2: Finance Team (50 employees)

**Before AI**:
- Manually extracted data from 200 invoices/month
- 15 min per invoice = 50 hours/month
- 2 full-time AP clerks

**After AI** (2 months):
- ChatGPT Advanced Data Analysis extracts invoice data
- Human verifies and uploads to accounting system
- 2 min per invoice = 6.7 hours/month
- 1 AP clerk (other reassigned to higher-value work)

**ROI**:
- Time saved: 43 hours/month = 520 hours/year
- Cost savings: 1 clerk salary saved = $45,000/year
- Tool cost: ChatGPT Plus $20/month = $240/year
- **ROI: 188x + eliminated tedious work**

**Team feedback**:
- "I used to spend 40 hours/week typing invoice data. Now I spend 6 hours verifying AI extractions. Life-changing."

---

### Example 3: Professional Services Firm (100 employees)

**Before AI**:
- Consultants reviewed RFPs manually (6-8 hours each)
- 15 RFPs/month = 100 hours/month
- Stressful, often missed key details

**After AI** (4 months):
- Claude Pro reviews RFPs, extracts requirements
- Consultants review AI analysis, draft responses (2-3 hours each)
- 15 RFPs/month = 40 hours/month (60% time savings)

**ROI**:
- Time saved: 60 hours/month × $100/hour = $6,000/month = $72,000/year
- Win rate: 25% → 30% (AI helps find hidden requirements, better proposals)
- Tool cost: Claude Pro $20/month × 5 people = $1,200/year
- **ROI: 60x + higher win rate**

**Team feedback**:
- "We used to miss requirements buried in 200-page RFPs. AI finds everything, we focus on strategy."

---

## Common Mistakes

Avoid these pitfalls when using AI for document analysis:

| Mistake | What Happens | How to Avoid |
|---------|-------------|--------------|
| **Trusting AI for legal analysis without lawyer review** | AI misses jurisdiction-specific clauses, non-standard terms, or subtle liability language — one missed clause can cost millions | Use AI to flag and summarize, but always have a qualified lawyer review any contract before signing |
| **Uploading confidential documents to consumer AI tools** | Sensitive contracts, financial data, or M&A documents sent to ChatGPT/Claude consumer plans may be used for training | Use enterprise plans with data retention agreements, or redact confidential details before uploading |
| **Assuming AI reads every page equally well** | AI can miss content in tables, headers/footers, scanned PDFs, or appendices — especially in poorly formatted documents | Ask AI explicitly: "Did you review all appendices and schedules?" and spot-check key sections manually |
| **Not verifying extracted numbers** | AI sometimes transposes digits, misreads currency symbols, or calculates totals incorrectly | Always cross-reference extracted financial data against the source document |
| **Using AI as a replacement for domain expertise** | AI can extract and summarize, but it doesn't understand your business context (e.g., whether a 90-day payment term is normal for your industry) | Use AI to surface information faster, but apply your domain judgment to interpret it |
| **Analyzing one document at a time when you should batch** | Processing 20 invoices individually takes 20 prompts when a batch approach works better | Create a structured template: upload multiple docs and ask AI to extract the same fields from each into a table |

---

## Related Resources

- **[PROMPT-LIBRARY.md](../PROMPT-LIBRARY.md)** - Copy-paste document analysis prompts
- **[SECURITY.md](../SECURITY.md)** - What documents are safe to share with AI
- **[TOOLS.md](../TOOLS.md)** - Compare Claude vs ChatGPT for document analysis

---

## Next Steps

1. **Week 1**: Create document review templates for your most common doc types
2. **Week 2**: Test with 10-20 real documents, refine prompts
3. **Week 3**: Train team (45 min per person)
4. **Week 4**: Measure time savings and accuracy

**Ready to explore more use cases?** → [See all 10 AI use cases](../USE-CASES.md)
