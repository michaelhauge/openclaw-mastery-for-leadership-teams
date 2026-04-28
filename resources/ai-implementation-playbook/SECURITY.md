# AI Security & Privacy Guide

**Protect your data while using AI tools - Compliance, privacy, and best practices**

This guide helps you understand what data is safe to share with AI tools and how to create policies for your team.

---

## The Core Question

### "Can I safely use ChatGPT/Claude for business?"

**Short answer**: YES, but with caveats depending on:
1. **Which tool**: Consumer vs Enterprise tier
2. **What data**: Public vs Confidential vs Restricted
3. **Which use case**: General assistance vs Sensitive analysis

**This guide helps you make informed decisions.**

---

## Data Classification Framework

### Tier 1: Public Data ✅ SAFE FOR ALL AI TOOLS

**Definition**: Information already public or intended for public release

**Examples**:
- ✅ Company website content
- ✅ Published blog posts
- ✅ Public social media posts
- ✅ Press releases
- ✅ Product marketing materials
- ✅ General industry knowledge

**AI tools allowed**: Any (ChatGPT Free, Claude, Gemini, etc.)

**Why it's safe**: Already public, no confidentiality risk

---

### Tier 2: Internal Data ⚠️ SAFE WITH CONSUMER PLUS TIERS

**Definition**: Internal business information, not public but not highly sensitive

**Examples**:
- ⚠️ Meeting notes (without customer names)
- ⚠️ Internal processes and SOPs
- ⚠️ General business strategy
- ⚠️ Marketing plans
- ⚠️ Anonymized data
- ⚠️ Generic email templates

**AI tools allowed**:
- ✅ ChatGPT Plus, Claude Pro, Gemini Advanced
- ❌ NOT free tiers (may use data for training)

**Why it's safe**: Plus/Pro tiers don't train on your data (as of 2024)

**Precautions**:
- Remove names, emails, phone numbers
- Anonymize company-specific details if desired
- Don't include trade secrets

---

### Tier 3: Confidential Data 🔒 ENTERPRISE TOOLS ONLY

**Definition**: Sensitive business information that would harm company if exposed

**Examples**:
- 🔒 Customer PII (names, emails, addresses, phone)
- 🔒 Financial data (revenue, profit margins, bank info)
- 🔒 Employee data (salaries, performance reviews, SSN)
- 🔒 Contracts with specific terms
- 🔒 Pricing strategies
- 🔒 M&A discussions
- 🔒 Trade secrets, IP

**AI tools allowed**:
- ✅ Enterprise tiers with DPAs/BAAs (ChatGPT Enterprise, Claude Enterprise, Microsoft Copilot)
- ❌ NOT consumer tools (even Plus/Pro)

**Why**:
- Enterprise tools have contractual data protections
- Data Processing Agreements (DPA) for GDPR
- Business Associate Agreements (BAA) for HIPAA
- SOC 2, ISO 27001 compliance

**Precautions**:
- Requires legal review of vendor agreements
- May need data residency requirements
- Implement access controls (SSO)

---

### Tier 4: Restricted Data 🚫 NEVER IN ANY AI TOOL

**Definition**: Legally protected or extremely sensitive information

**Examples**:
- 🚫 Credit card numbers, bank account details
- 🚫 Social Security Numbers, national IDs
- 🚫 Passwords, API keys, credentials
- 🚫 Protected Health Information (PHI) without BAA
- 🚫 Attorney-client privileged communications
- 🚫 Government classified information
- 🚫 Data subject to export controls

**AI tools allowed**: NONE (process manually or with dedicated, compliant tools)

**Why**: Legal/regulatory prohibitions, catastrophic damage if leaked

---

## AI Tool Security Comparison

### Consumer Tiers

| Tool | Training on Data? | Data Retention | Security Certs | Use For |
|------|-------------------|----------------|----------------|---------|
| **ChatGPT Free** | ⚠️ Yes (opt-out available) | 30 days | Limited | Public data only |
| **ChatGPT Plus** | ✅ No (as of March 2023) | 30 days | Limited | Public + Internal data |
| **Claude Free** | ⚠️ Yes | Unknown | Limited | Public data only |
| **Claude Pro** | ✅ No | Unknown | Limited | Public + Internal data |
| **Gemini Free** | ⚠️ Likely yes | Unknown | Google security | Public data only |
| **Gemini Advanced** | ⚠️ Unclear | Unknown | Google security | Public + Internal (with caution) |

---

### Enterprise Tiers

| Tool | Price | DPA | BAA (HIPAA) | SOC 2 | Data Residency | Best For |
|------|-------|-----|-------------|-------|----------------|----------|
| **ChatGPT Enterprise** | $60/user/mo | ✅ Yes | ❌ No | ✅ Yes | ❌ No | General business, non-regulated |
| **Claude Enterprise** | Contact sales | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | Healthcare, finance, legal |
| **Microsoft Copilot** | $30/user/mo | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | Regulated industries, enterprises |
| **Google Gemini Enterprise** | Contact sales | ✅ Yes | ⚠️ Limited | ✅ Yes | ✅ Yes | Google Workspace organizations |

---

## Compliance by Industry

### Healthcare (HIPAA)

**Requirements**:
- ✅ Business Associate Agreement (BAA) with AI vendor
- ✅ Encrypted data in transit and at rest
- ✅ Access controls and audit logs
- ✅ Data breach notification procedures

**Recommended tools**:
1. Microsoft Copilot ($30/user) - BAA available
2. Claude Enterprise (contact sales) - BAA available
3. ❌ ChatGPT Enterprise - NO BAA available (as of 2024)

**Never share with ANY AI**:
- Patient names, MRNs, DOBs
- Diagnoses, treatment plans
- Insurance information
- Any PHI without anonymization

**Safe use cases with BAA**:
- ✅ Medical literature research (no PHI)
- ✅ Clinical note templates (generic)
- ✅ Patient education materials
- ⚠️ Anonymized case discussions (with BAA only)

---

### Finance (SOX, PCI-DSS)

**Requirements**:
- ✅ SOC 2 Type II compliance
- ✅ Data encryption
- ✅ Access controls and audit trails
- ✅ Data residency (may require on-premise or specific regions)

**Recommended tools**:
1. Microsoft Copilot ($30/user) - Best compliance
2. Claude Enterprise - Strong compliance
3. ChatGPT Enterprise - Adequate for most use cases

**Never share with ANY AI**:
- Credit card numbers (PCI scope)
- Bank account details
- Customer financial data
- Trading strategies, non-public financials

**Safe use cases**:
- ✅ Market research and analysis
- ✅ Email drafting (no customer data)
- ✅ Financial modeling templates
- ⚠️ Anonymized data analysis (enterprise tools only)

---

### Legal

**Requirements**:
- ✅ Attorney-client privilege protection
- ✅ Confidentiality agreements
- ✅ Data sovereignty
- ✅ No training on client data

**Recommended tools**:
1. Claude Enterprise - Best for legal (strong privacy commitments)
2. Specialized: Harvey AI, CoCounsel (legal-specific, very expensive)
3. Microsoft Copilot - Good for general legal work

**Never share with ANY AI**:
- Client names and case details (unless anonymized)
- Privileged communications
- Confidential contracts or agreements
- Litigation strategy

**Safe use cases**:
- ✅ Legal research (public case law)
- ✅ Contract template drafting (generic)
- ⚠️ Document review (anonymized, enterprise tier only)
- ⚠️ Memo drafting (remove client identifiers)

---

### Technology/SaaS (General Business)

**Requirements**:
- ✅ SOC 2 compliance (for enterprise customers)
- ✅ GDPR compliance (if EU customers)
- ✅ Reasonable data protections

**Recommended tools**:
1. ChatGPT Plus ($20/user) - Most use cases
2. Claude Pro ($20/user) - Privacy-focused alternative
3. Upgrade to Enterprise if handling customer data

**Never share**:
- Customer PII (names, emails, payment info)
- Source code with trade secrets
- API keys, credentials, secrets
- Detailed customer usage data

**Safe use cases**:
- ✅ Marketing content creation
- ✅ Customer support templates (no real customer data)
- ✅ Code assistance (no proprietary algorithms)
- ✅ Sales email drafting (anonymized prospects)

---

## Creating an AI Usage Policy

### Template: AI Acceptable Use Policy

**Purpose**: Define how employees can safely use AI tools

**Policy**:

```markdown
# AI Tools Acceptable Use Policy

## Approved Tools

The following AI tools are approved for business use:
- ChatGPT Plus (for general business tasks)
- Claude Pro (for document writing and analysis)
- Otter.ai (for meeting transcription)

## Prohibited Tools

Do NOT use the following without explicit approval:
- Free tier AI tools (ChatGPT Free, Claude Free, etc.)
- Unapproved third-party AI tools
- Personal AI tool accounts for business work

## Data Classification

### ✅ APPROVED for AI tools:
- Public information
- General business questions
- Anonymized data (remove names, emails, company identifiers)
- Marketing content
- Email templates

### ❌ PROHIBITED in AI tools:
- Customer PII (names, emails, phone numbers, addresses)
- Employee data (salaries, SSNs, performance reviews)
- Financial data (revenue, bank accounts, credit cards)
- Confidential contracts or agreements
- Trade secrets, proprietary IP
- Passwords, API keys, credentials

## Anonymization Requirements

Before sharing data with AI:
1. Remove all names (replace with "Customer A", "Employee 1")
2. Remove all email addresses and phone numbers
3. Remove company names (unless public information)
4. Remove specific financial figures (use "Company generated $X revenue")
5. When in doubt, ask IT/Legal

## Consequences

Violations of this policy may result in:
- First violation: Warning and retraining
- Second violation: Suspension of AI tool access
- Serious violations (sharing customer data): Disciplinary action up to termination

## Questions?

Contact [IT Lead] or [Legal] before sharing sensitive data with AI tools.
```

**Customize this template** for your organization and distribute to all employees.

---

## Anonymization Best Practices

### How to Anonymize Data Before Sharing with AI

**1. Replace Names**

❌ **Before**: "John Smith from Acme Corp purchased $50,000 of widgets"
✅ **After**: "Customer A purchased $50,000 of widgets"

**2. Remove Contact Info**

❌ **Before**: "Contact sarah.jones@example.com for details"
✅ **After**: "Contact the account manager for details"

**3. Generalize Numbers**

❌ **Before**: "Q4 revenue: $2,458,392.17"
✅ **After**: "Q4 revenue: approximately $2.5M"

**4. Remove Company Identifiers**

❌ **Before**: "XYZ Corp's API integration with our platform"
✅ **After**: "A customer's API integration with our platform"

**5. Mask Dates When Necessary**

❌ **Before**: "Contract signed on March 15, 2024 with Client ABC"
✅ **After**: "Contract signed in Q1 2024 with Client A"

**6. Use Placeholders**

❌ **Before**: "Employee ID 12345, Jane Doe, hired 1/15/2020, salary $85,000"
✅ **After**: "Employee X, hired in Q1 2020, salary in $80-90K range"

---

## Incident Response: What If Sensitive Data Was Shared?

### Step 1: Assess Severity

**Low risk**: Internal data shared with ChatGPT Plus/Claude Pro
- AI vendor states they don't train on data
- Data retained temporarily (30 days)
- **Action**: Delete conversation, document incident, remind employee of policy

**Medium risk**: Customer PII shared with consumer tool
- Potential privacy violation
- Data may be retained or used for training
- **Action**: Delete conversation, notify Legal, assess if customer notification required under GDPR/CCPA

**High risk**: Financial data, credentials, or regulated data shared
- Serious compliance violation
- **Action**: Immediately delete conversation, notify Legal/Compliance, assess breach notification requirements, revoke affected credentials

### Step 2: Contain

1. Delete AI conversation immediately
2. Request data deletion from vendor (if possible)
3. Change any exposed credentials
4. Assess which customers/employees affected

### Step 3: Notify

**GDPR** (EU customers):
- Notify customers within 72 hours if high risk to their rights

**CCPA** (California customers):
- Notify customers if PII exposed

**HIPAA** (healthcare):
- Notify HHS and patients if PHI exposed

**Consult legal counsel before customer notification.**

### Step 4: Prevent Recurrence

1. Retrain employee on AI usage policy
2. Review policy clarity (was it clear what's prohibited?)
3. Consider technical controls (DLP, monitoring)
4. Document incident for compliance records

---

## Technical Security Controls

### For IT Teams: Implementing AI Governance

**1. Approved Tool Whitelist**

Only allow approved AI tools through:
- Browser extensions (block unapproved sites)
- Network firewalls
- Mobile device management (MDM)

**2. Data Loss Prevention (DLP)**

Configure DLP rules to detect:
- Credit card numbers
- Social Security Numbers
- Email addresses in bulk
- Pasted code with API keys

**Alert** when sensitive data is pasted into AI tool websites.

**3. Single Sign-On (SSO)**

For enterprise AI tools:
- Require SSO authentication
- Enforce MFA
- Centralize access management
- Audit who's using AI tools

**4. Monitoring & Auditing**

- Log AI tool usage
- Review high-risk prompts
- Track which employees use AI most
- Audit compliance quarterly

**5. Network Segmentation**

For highest security:
- Block AI tools from networks with sensitive data
- Require VPN/jump box for AI tool access
- Separate corporate and AI tool networks

---

## Vendor Security Questionnaire

**Before approving a new AI tool**, ask the vendor:

### Data Handling

- [ ] Is our data used to train your models?
- [ ] How long is our data retained?
- [ ] Can we request data deletion?
- [ ] Where is our data stored (geography)?
- [ ] Is data encrypted in transit and at rest?

### Compliance

- [ ] Do you have SOC 2 Type II?
- [ ] Do you have ISO 27001?
- [ ] Can you provide a DPA (GDPR)?
- [ ] Can you provide a BAA (HIPAA)?
- [ ] What compliance certifications do you hold?

### Security

- [ ] How do you handle security vulnerabilities?
- [ ] Do you have a bug bounty program?
- [ ] What is your incident response process?
- [ ] Do you perform penetration testing?
- [ ] Can you provide a security audit report?

### Access Controls

- [ ] Do you support SSO (SAML/OIDC)?
- [ ] Do you support MFA?
- [ ] Can we enforce password policies?
- [ ] Do you provide audit logs?
- [ ] Can we set role-based access controls?

**If vendor can't answer satisfactorily, don't approve the tool for sensitive data.**

---

## FAQs

### Q: Is ChatGPT Plus safe for business use?

**A**: YES, for **Public** and **Internal** (anonymized) data. NO for **Confidential** or **Restricted** data.

ChatGPT Plus states they don't train on Plus conversations, but there's no contractual guarantee. For sensitive data, use ChatGPT Enterprise ($60/user) with DPA.

---

### Q: Can I share customer emails with AI to draft responses?

**A**: YES, if you remove customer names, email addresses, and company identifiers first.

**Example**:
❌ "Hi John at Acme Corp, regarding your order #12345..."
✅ "Hi [Customer Name] at [Company], regarding your order [number]..."

Better: Use AI to write a template, then customize manually with real customer data.

---

### Q: What's the difference between ChatGPT Plus and Enterprise?

| Feature | ChatGPT Plus | ChatGPT Enterprise |
|---------|--------------|-------------------|
| **Price** | $20/user/mo | $60/user/mo |
| **Training on data** | No | No (contractual guarantee) |
| **DPA (GDPR)** | ❌ No | ✅ Yes |
| **SSO** | ❌ No | ✅ Yes |
| **Admin controls** | ❌ No | ✅ Yes |
| **Audit logs** | ❌ No | ✅ Yes |
| **Unlimited messages** | ❌ 80/3hrs | ✅ Unlimited |
| **Use for confidential data** | ❌ No | ✅ Yes (with DPA review) |

**Upgrade to Enterprise if**: Handling customer PII, need compliance (SOC 2), >25 users.

---

### Q: My industry is heavily regulated. Can I use AI at all?

**A**: YES, with the right tools and precautions.

- **Healthcare**: Microsoft Copilot or Claude Enterprise with BAA
- **Finance**: Microsoft Copilot or Claude Enterprise with SOC 2
- **Legal**: Claude Enterprise (best privacy) or specialized legal AI

Always:
1. Get enterprise tier with appropriate agreements
2. Anonymize data when possible
3. Consult legal before implementing
4. Train team on usage policy

---

### Q: Can I use AI on my phone with company data?

**A**: Same rules apply as desktop.

- ✅ Use approved tools (ChatGPT Plus app, Claude app)
- ✅ Only share Public or Internal (anonymized) data
- ❌ Don't use free tier apps
- ❌ Don't share Confidential or Restricted data

Consider: Mobile AI apps are easier to accidentally paste sensitive data (clipboard). Use desktop for sensitive tasks.

---

## Next Steps

1. **Review your data classification** - What data does your team work with?
2. **Choose appropriate AI tools** - Consumer Plus tiers vs Enterprise based on data sensitivity
3. **Create AI usage policy** - Use template above, customize for your business
4. **Train your team** - Ensure everyone understands what's safe to share
5. **Monitor compliance** - Quarterly audits of AI tool usage

---

## Related Resources

- **[TOOLS.md](./TOOLS.md)** - Compare AI tools including security features
- **[USE-CASES.md](./USE-CASES.md)** - Identify use cases with data sensitivity notes
- **[templates/ai-usage-policy.md](./templates/ai-usage-policy.md)** - Customizable policy template
- **[templates/data-classification.md](./templates/data-classification.md)** - Detailed data classification guide
- **[templates/vendor-security-checklist.md](./templates/vendor-security-checklist.md)** - Evaluate AI vendors

**Ready to train your team?** → [Read ADOPTION.md for training strategies](./ADOPTION.md)
