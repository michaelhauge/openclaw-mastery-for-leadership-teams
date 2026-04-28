# Data Classification Guide for AI Tools

**Detailed reference for what data can and cannot be shared with AI tools**

This guide expands on the 4-tier data classification framework from [SECURITY.md](../SECURITY.md) with specific examples for your business.

---

## How to Use This Guide

1. **Before using AI**: Identify what tier your data falls into
2. **Check allowable tools**: Each tier lists which AI tools are safe
3. **Apply anonymization**: Follow requirements for that tier
4. **When unsure**: Treat data as one tier higher (more restrictive)

---

## Tier 1: Public Data ✅

### Definition
Information that is already public or intended for public release. No harm if leaked.

### Approved AI Tools
**Any AI tool** including free tiers:
- ChatGPT (Free, Plus, Enterprise)
- Claude (Free, Pro, Enterprise)
- Gemini (Free, Advanced, Enterprise)
- Perplexity (Free, Pro)
- Specialized tools (Jasper, Copy.ai, etc.)

### Examples by Department

#### Marketing
- ✅ Published blog posts and articles
- ✅ Social media posts (already public)
- ✅ Press releases and media kits
- ✅ Product marketing materials (brochures, one-pagers)
- ✅ Public case studies (with customer permission)
- ✅ Website copy and landing pages
- ✅ Public webinar content

#### Sales
- ✅ Public product demos and presentations
- ✅ General pitch decks (no specific customer data)
- ✅ Sales email templates (generic, no real prospects)
- ✅ Publicly available company information (from website)

#### Product
- ✅ Public roadmap items
- ✅ Feature announcements (after public release)
- ✅ Public documentation and help articles
- ✅ Open-source code repositories

#### General
- ✅ Job postings and recruiting content
- ✅ General industry knowledge
- ✅ Public competitor information (from their websites)
- ✅ News articles and research papers

### Anonymization Required
**None** - This data is already public

### Risk Level
**Minimal** - No confidentiality concerns

---

## Tier 2: Internal Data ⚠️

### Definition
Internal business information that's not public but not highly sensitive. Moderate harm if leaked, but not catastrophic.

### Approved AI Tools
**Consumer Plus/Pro tiers** and above:
- ✅ ChatGPT Plus ($20/month)
- ✅ Claude Pro ($20/month)
- ✅ Gemini Advanced ($20/month)
- ✅ Enterprise tiers (even better)

**NOT approved**:
- ❌ Free tiers (ChatGPT Free, Claude Free) - may train on data

### Examples by Department

#### Marketing
- ⚠️ Marketing campaign plans (internal strategy)
- ⚠️ Social media content calendar (not yet published)
- ⚠️ Brand guidelines and voice docs
- ⚠️ Internal meeting notes (remove customer names first)
- ⚠️ Competitor analysis (internal research)
- ⚠️ Budget allocations (anonymized amounts)

#### Sales
- ⚠️ Sales playbooks and scripts
- ⚠️ Territory planning (no specific customer data)
- ⚠️ General sales methodology
- ⚠️ Email templates (personalize before sending)
- ⚠️ Objection handling guides

#### Product
- ⚠️ Internal roadmap discussions (not public)
- ⚠️ Feature prioritization frameworks
- ⚠️ User research insights (anonymized)
- ⚠️ Product requirement documents (remove customer specifics)
- ⚠️ Design mockups (before public release)

#### Operations
- ⚠️ Standard Operating Procedures (SOPs)
- ⚠️ Internal processes and workflows
- ⚠️ Team org charts (general structure)
- ⚠️ Meeting agendas and summaries (remove names)

#### HR
- ⚠️ Job descriptions (internal versions)
- ⚠️ Training materials (generic)
- ⚠️ Company culture documents
- ⚠️ Employee handbook (general policies)

### Anonymization Required

**MUST remove before sharing with AI**:
1. **Customer names and companies**: Replace with "Customer A," "Company X"
2. **Employee names**: Replace with "Employee 1," "Manager A" (unless discussing public roles like CEO)
3. **Contact information**: Remove emails, phone numbers, addresses
4. **Specific financials**: "$2,458,392" → "approximately $2.5M"
5. **Exact dates** (when sensitive): "March 15, 2024" → "Q1 2024"

**Example anonymization**:

❌ **Before**: "Sarah Johnson from Acme Corp mentioned their $500K annual contract is up for renewal in March. She's concerned about pricing."

✅ **After**: "Customer A mentioned their approximately $500K annual contract is up for renewal in Q1. They're concerned about pricing."

### Risk Level
**Moderate** - Embarrassing if leaked, but not catastrophic. No legal violations.

### When to Upgrade to Tier 3 (Confidential)
If the internal data includes:
- Real customer/employee names
- Specific revenue numbers
- Sensitive strategic plans (M&A, layoffs, pivots)
→ Treat as **Tier 3: Confidential**

---

## Tier 3: Confidential Data 🔒

### Definition
Sensitive business information that would cause significant harm to company or individuals if exposed. May involve legal/regulatory requirements.

### Approved AI Tools
**Enterprise tiers with contractual protections ONLY**:
- ✅ ChatGPT Enterprise (with DPA)
- ✅ Claude Enterprise (with DPA/BAA)
- ✅ Microsoft Copilot (with DPA/BAA)
- ✅ Google Gemini Enterprise (with DPA)

**NOT approved**:
- ❌ Consumer Plus/Pro tiers (no contractual data protections)
- ❌ Free tiers
- ❌ Unauthorized third-party tools

### Requirements Before Use
1. **Legal agreements in place**:
   - DPA (Data Processing Agreement) for GDPR compliance
   - BAA (Business Associate Agreement) if HIPAA-regulated
   - Reviewed by legal counsel

2. **Manager approval**:
   - Document what data will be processed
   - Justify business need
   - Confirm appropriate tool tier

3. **Access controls**:
   - SSO (Single Sign-On) enabled
   - Role-based access if possible
   - Audit logging enabled

### Examples by Department

#### Sales
- 🔒 Customer PII (names, emails, phone numbers, addresses)
- 🔒 Signed contracts with specific terms and pricing
- 🔒 Deal negotiations and pricing discussions
- 🔒 Customer revenue data
- 🔒 Pipeline forecasts with real customer names
- 🔒 Sales compensation plans (individual earnings)

#### Finance
- 🔒 Detailed financial statements (P&L, balance sheet, cash flow)
- 🔒 Bank account information
- 🔒 Tax returns and filings
- 🔒 Individual employee salaries
- 🔒 Vendor contracts with pricing
- 🔒 Investor agreements and cap tables

#### HR
- 🔒 Employee personal information (SSNs, DOB, addresses)
- 🔒 Salary and compensation data (individual)
- 🔒 Performance reviews
- 🔒 Disciplinary records
- 🔒 Health insurance elections
- 🔒 Background check results

#### Legal
- 🔒 Contracts with confidential terms
- 🔒 Legal advice and opinions
- 🔒 Litigation strategy and case files
- 🔒 Intellectual property filings (before public)
- 🔒 M&A due diligence materials

#### Product/Engineering
- 🔒 Source code for proprietary algorithms
- 🔒 Trade secrets and inventions
- 🔒 Customer usage data (identified)
- 🔒 API keys and credentials
- 🔒 Security vulnerability reports

#### Executive
- 🔒 M&A discussions and targets
- 🔒 Layoff or restructuring plans
- 🔒 Board meeting materials
- 🔒 Strategic pivots (pre-announcement)
- 🔒 Fundraising terms and investor negotiations

### Anonymization Required

**Even with enterprise tools, minimize exposure**:
1. Share only what's necessary for the AI task
2. Remove identifiers when possible
3. Use aggregated/summarized data when feasible

**If anonymization impossible**:
- Verify enterprise tier with DPA/BAA is in place
- Document what data was shared (for audit)
- Delete AI conversation after use (if tool allows)

### Risk Level
**High** - Significant harm to company, customers, or employees if leaked. Potential legal violations (GDPR, CCPA, HIPAA).

### Regulatory Considerations

**GDPR (EU customers)**:
- Customer PII requires DPA with AI vendor
- Must have lawful basis for processing (consent, contract, legitimate interest)
- Right to deletion applies (can you delete data from AI?)

**CCPA (California customers)**:
- Customer personal information has disclosure requirements
- Customers have right to know how data is used
- Must provide opt-out mechanism

**HIPAA (healthcare)**:
- Protected Health Information (PHI) requires BAA
- AI vendor must be HIPAA-compliant
- Strict penalties for breaches ($100-50,000 per violation)

---

## Tier 4: Restricted Data 🚫

### Definition
Legally protected or extremely sensitive information. Catastrophic harm if exposed. Legal/criminal penalties for mishandling.

### Approved AI Tools
**NONE** - Do not process with any AI tool

Process manually or with dedicated, compliant systems designed for this data type.

### Examples by Category

#### Financial Data (PCI-DSS)
- 🚫 Credit card numbers (full 16 digits)
- 🚫 CVV codes
- 🚫 Bank account numbers and routing numbers
- 🚫 Payment processor credentials

**Why restricted**: PCI-DSS violations = $5,000-100,000 per month in fines, card brand penalties, loss of payment processing ability

---

#### Personal Identifiers
- 🚫 Social Security Numbers (SSN)
- 🚫 National ID numbers (passport, driver's license)
- 🚫 Biometric data (fingerprints, facial recognition, iris scans)
- 🚫 Genetic information

**Why restricted**: Identity theft risk, GDPR/CCPA strict protections, potential criminal liability

---

#### Healthcare (HIPAA)
- 🚫 Protected Health Information (PHI) without BAA
  - Patient names + any health info
  - Medical Record Numbers (MRNs)
  - Diagnoses and treatment plans
  - Prescription information
  - Insurance information
  - Test results

**Why restricted**: HIPAA violations = $100-50,000 per violation, up to $1.5M per year, criminal charges possible

---

#### Security Credentials
- 🚫 Passwords (any type)
- 🚫 API keys and access tokens
- 🚫 Private encryption keys
- 🚫 Security certificates
- 🚫 Database connection strings
- 🚫 OAuth secrets

**Why restricted**: Direct system access, potential for complete compromise, regulatory violations

---

#### Legal Privilege
- 🚫 Attorney-client privileged communications
- 🚫 Work product prepared for litigation
- 🚫 Legal advice and opinions (in litigation context)

**Why restricted**: Sharing with third party waives privilege, can't un-waive

---

#### Government/Military
- 🚫 Classified information (any level)
- 🚫 Export-controlled technical data (ITAR, EAR)
- 🚫 Law enforcement records
- 🚫 Sensitive but Unclassified (SBU) information

**Why restricted**: Criminal penalties, national security implications, export violations

---

#### Other Restricted Data
- 🚫 Children's personal information (COPPA) without verified parental consent
- 🚫 Biometric privacy data (BIPA - Illinois and other states)
- 🚫 Insider trading material non-public information
- 🚫 Trade secrets currently in litigation

### What to Do Instead

**For each category**:

1. **Financial data**: Use dedicated PCI-compliant systems
   - Payment processors (Stripe, Square, etc.)
   - Never store full credit card numbers
   - Tokenize when possible

2. **Health data**: Use HIPAA-compliant EMR/EHR systems
   - Epic, Cerner, Athenahealth
   - Dedicated healthcare AI tools with BAA
   - Not general-purpose AI

3. **Credentials**: Use password managers and secrets management
   - 1Password, LastPass, Bitwarden
   - HashiCorp Vault for infrastructure
   - Never in plaintext, never in AI

4. **Legal privilege**: Consult attorney directly
   - In-person or encrypted channels
   - Dedicated legal case management systems
   - Not general-purpose AI

5. **Classified information**: Follow government protocols
   - Secure facilities and systems
   - Clearance-required personnel only
   - Never in commercial AI tools

### Risk Level
**Critical** - Catastrophic harm if exposed. Legal penalties, criminal charges, loss of business, personal liability.

---

## Decision Tree: "Can I Share This Data with AI?"

```
START: Do you want to share data with AI?
  ↓
Q1: Is this data public (on website, press release, etc.)?
  YES → ✅ Use any AI tool → DONE
  NO → Go to Q2
  ↓
Q2: Does it contain restricted data? (SSN, credit cards, passwords, PHI without BAA)
  YES → 🚫 Do NOT use AI → Use manual process → DONE
  NO → Go to Q3
  ↓
Q3: Does it contain confidential data? (customer PII, financial data, contracts, salaries)
  YES → Go to Q3a
  NO → Go to Q4
  ↓
Q3a: Do you have enterprise AI tool with DPA/BAA?
  YES → 🔒 Use enterprise tool (get manager approval) → DONE
  NO → Anonymize and treat as Internal data → Go to Q4
  ↓
Q4: Is this internal data? (strategy, processes, anonymized info)
  YES → ⚠️ Anonymize (remove names, contact info) → Use Plus/Pro tier → DONE
  NO → Something went wrong, review tiers again
```

---

## Quick Reference Table

| Data Type | Example | Tier | AI Tools Allowed | Must Anonymize? |
|-----------|---------|------|------------------|-----------------|
| Website content | Blog post, product page | Public | Any | No |
| Marketing plans | Q1 campaign strategy | Internal | Plus/Pro+ | Yes (customer names) |
| Customer email | john@acme.com | Confidential | Enterprise only | N/A (don't share unless necessary) |
| Credit card | 1234-5678-9012-3456 | Restricted | NONE | N/A |
| Meeting notes | Weekly standup summary | Internal | Plus/Pro+ | Yes (remove names) |
| Employee SSN | 123-45-6789 | Restricted | NONE | N/A |
| Sales contract | Signed agreement with pricing | Confidential | Enterprise only | N/A |
| Competitor info | Info from their public website | Public | Any | No |
| Patient name + diagnosis | John Smith has diabetes | Restricted | NONE (or Enterprise with BAA) | N/A |
| Code with trade secret | Proprietary algorithm | Confidential | Enterprise only | Depends |

---

## Common Questions

### Q: Can I share customer emails with AI to draft responses?

**A**: Depends on what's in the email:
- ✅ If you remove customer name, email, company → Internal data → Use Plus/Pro
- 🔒 If you keep customer name/email → Confidential → Use Enterprise tool only

**Best practice**: Remove PII, use AI to draft response, personalize before sending.

---

### Q: Can I paste employee performance review into AI for help writing feedback?

**A**:
- ❌ If includes employee name, salary → Confidential → Enterprise tool + manager approval
- ⚠️ If fully anonymized (no name, role, identifying details) → Internal → Plus/Pro

**Best practice**: Ask AI to draft feedback template, fill in employee-specific details manually.

---

### Q: Can I analyze customer survey data with AI?

**A**:
- ✅ If fully anonymized (no names, emails, companies) → Internal → Plus/Pro
- 🔒 If includes any PII → Confidential → Enterprise tool

**Best practice**: Export survey data with respondent identifiers removed, then analyze with AI.

---

### Q: What if I accidentally shared Tier 3 data with consumer AI tool?

**A**: Follow incident response protocol:
1. Delete conversation immediately
2. Report to IT within 1 hour
3. IT will assess and take action (data deletion request, customer notification if required)
4. You'll get retrained, not disciplined (if reported promptly)

---

### Q: How do I know if my AI tool has a DPA/BAA?

**A**: Ask your IT/legal team. They should maintain list of:
- Approved tools
- Which tiers are provisioned
- What legal agreements are in place

**If unsure**: Treat data as one tier higher (more restrictive) until confirmed.

---

## Updates and Questions

**This guide will be updated** as:
- New AI tools are approved
- Regulations change
- Company policies evolve

**Questions about data classification**:
- Email: [DATA-CLASSIFICATION-OWNER@COMPANY.COM]
- Slack: [#ai-data-questions]
- When in doubt: Treat as higher tier (more restrictive)

**Report classification errors**:
- If you think data is mis-classified: [EMAIL]
- We'll review and update guide if needed

---

**Last Updated**: [DATE]
**Owner**: [NAME, TITLE]
**Version**: 1.0
