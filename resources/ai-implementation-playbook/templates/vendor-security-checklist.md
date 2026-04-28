# AI Vendor Security Evaluation Checklist

**Use this checklist to evaluate AI tools before approving for company use**

---

## Instructions

1. **Complete this checklist** for any AI tool being considered
2. **Gather information** from vendor's website, security page, or direct inquiry
3. **Evaluate score** (see scoring at end)
4. **Make decision**: Approve, Conditional Approve, or Reject
5. **Document**: Keep completed checklist for compliance records

---

## Vendor Information

**Tool Name**: ___________________________
**Vendor**: ___________________________
**Website**: ___________________________
**Requested By**: ___________________________
**Department/Use Case**: ___________________________
**Date Evaluated**: ___________________________

---

## Section 1: Data Handling (40 points)

### 1.1 Training Data Usage (10 points)

**Question**: Is customer data used to train AI models?

- [ ] **+10 pts**: No, data is NOT used for training (documented in terms)
- [ ] **+5 pts**: No for paid tiers, but yes for free tier
- [ ] **+0 pts**: Yes, all data is used for training
- [ ] **-5 pts**: Unclear or no documentation

**Vendor Statement**: ___________________________
**Source**: ___________________________

---

### 1.2 Data Retention (10 points)

**Question**: How long is customer data retained?

- [ ] **+10 pts**: Data deleted immediately after processing (or within 30 days)
- [ ] **+7 pts**: Data retained 30-90 days, then deleted
- [ ] **+5 pts**: Data retained indefinitely but can request deletion
- [ ] **+0 pts**: Data retained indefinitely, no deletion option
- [ ] **-5 pts**: Unclear or no documentation

**Retention Period**: ___________________________
**Deletion Process**: ___________________________

---

### 1.3 Data Location (10 points)

**Question**: Where is customer data stored geographically?

- [ ] **+10 pts**: Customer can choose region (e.g., US, EU)
- [ ] **+7 pts**: Documented location (e.g., "US data centers")
- [ ] **+5 pts**: General location (e.g., "North America")
- [ ] **+0 pts**: Unknown or global replication
- [ ] **-5 pts**: Data stored in countries with weak data protection laws

**Storage Location**: ___________________________
**Meets our requirements?** ☐ Yes ☐ No

**Notes**: Consider GDPR (EU data must stay in EU), data sovereignty laws

---

### 1.4 Data Encryption (10 points)

**Question**: Is data encrypted in transit and at rest?

- [ ] **+5 pts**: Data encrypted in transit (TLS/SSL)
- [ ] **+5 pts**: Data encrypted at rest (AES-256 or equivalent)
- [ ] **+0 pts**: Only encrypted in transit
- [ ] **-5 pts**: Not encrypted or unclear

**Encryption Standards**: ___________________________

---

**Section 1 Total**: ______ / 40 points

---

## Section 2: Compliance & Certifications (30 points)

### 2.1 SOC 2 Type II (10 points)

**Question**: Does vendor have SOC 2 Type II certification?

- [ ] **+10 pts**: Yes, can provide report
- [ ] **+5 pts**: SOC 2 Type I (planning Type II)
- [ ] **+0 pts**: No SOC 2

**SOC 2 Status**: ___________________________
**Report Date** (if available): ___________________________

**Notes**: SOC 2 Type II audits security, availability, confidentiality annually

---

### 2.2 ISO 27001 (5 points)

**Question**: Does vendor have ISO 27001 certification?

- [ ] **+5 pts**: Yes
- [ ] **+0 pts**: No

**Certification Status**: ___________________________

---

### 2.3 GDPR Compliance (5 points)

**Question**: Is vendor GDPR-compliant (for EU data)?

- [ ] **+5 pts**: Yes, offers Data Processing Agreement (DPA)
- [ ] **+3 pts**: Claims compliance but no DPA available
- [ ] **+0 pts**: No GDPR compliance
- [ ] **N/A**: We don't process EU resident data

**DPA Available?** ☐ Yes ☐ No
**DPA Reviewed by Legal?** ☐ Yes ☐ No ☐ Pending

---

### 2.4 HIPAA Compliance (10 points) - If Applicable

**Question**: Is vendor HIPAA-compliant (for healthcare data)?

- [ ] **+10 pts**: Yes, offers Business Associate Agreement (BAA)
- [ ] **+0 pts**: No HIPAA compliance
- [ ] **N/A**: We don't process PHI

**BAA Available?** ☐ Yes ☐ No
**BAA Reviewed by Legal?** ☐ Yes ☐ No ☐ Pending

**Notes**: REQUIRED for any PHI processing, non-negotiable

---

**Section 2 Total**: ______ / 30 points (or adjusted if N/A items)

---

## Section 3: Security Practices (20 points)

### 3.1 Vulnerability Management (5 points)

**Question**: Does vendor have vulnerability management program?

- [ ] **+5 pts**: Regular penetration testing + bug bounty program
- [ ] **+3 pts**: Regular penetration testing or bug bounty
- [ ] **+0 pts**: Unclear or none

**Bug Bounty Program?** ☐ Yes ☐ No
**Pen Test Frequency**: ___________________________

---

### 3.2 Incident Response (5 points)

**Question**: Does vendor have documented incident response process?

- [ ] **+5 pts**: Documented process, committed notification timeline
- [ ] **+3 pts**: Documented process, no commitment on timeline
- [ ] **+0 pts**: No documented process

**Notification Timeline**: ___________________________
**Breach History** (public info): ___________________________

---

### 3.3 Access Controls (5 points)

**Question**: What access controls are available?

- [ ] **+2 pts**: SSO (Single Sign-On) support
- [ ] **+2 pts**: MFA (Multi-Factor Authentication) required
- [ ] **+1 pt**: Role-based access controls (RBAC)
- [ ] **+0 pts**: Basic username/password only

**SSO Protocol**: ___________________________  (SAML, OIDC, etc.)
**MFA Options**: ___________________________

---

### 3.4 Audit Logging (5 points)

**Question**: Does vendor provide audit logs of user activity?

- [ ] **+5 pts**: Comprehensive audit logs available to admins
- [ ] **+3 pts**: Limited logs available
- [ ] **+0 pts**: No audit logs

**Log Details**: ___________________________
**Retention Period**: ___________________________

---

**Section 3 Total**: ______ / 20 points

---

## Section 4: Vendor Stability & Support (10 points)

### 4.1 Company Viability (5 points)

**Question**: Is vendor financially stable?

- [ ] **+5 pts**: Public company or well-funded (Series B+), >3 years operating
- [ ] **+3 pts**: Early-stage but funded, 1-3 years operating
- [ ] **+0 pts**: Unknown funding, <1 year operating

**Funding**: ___________________________
**Founded**: ___________________________

**Notes**: Evaluate risk of vendor shutting down and taking our data

---

### 4.2 Support & SLA (5 points)

**Question**: What support and SLAs are offered?

- [ ] **+3 pts**: Documented SLA with uptime guarantee (99%+)
- [ ] **+2 pts**: Support available (email, chat, phone)
- [ ] **+0 pts**: No SLA, limited support

**SLA**: ___________________________
**Support Channels**: ___________________________
**Response Time**: ___________________________

---

**Section 4 Total**: ______ / 10 points

---

## Section 5: Additional Considerations (Bonus/Penalty)

### 5.1 Industry-Specific Requirements

**Question**: Does tool meet industry-specific needs?

☐ **Healthcare**: BAA required, HIPAA-compliant infrastructure
☐ **Finance**: SOC 2 mandatory, data residency controls
☐ **Legal**: Strong privacy commitments, attorney-client privilege protection
☐ **Government**: FedRAMP authorization (if federal) or equivalent
☐ **Education**: FERPA compliance (student data)

**Meets requirements?** ☐ Yes ☐ No ☐ Partial

**Impact**: ___________________________

---

### 5.2 Data Sovereignty

**Question**: Can we enforce data residency requirements?

- [ ] **+5 pts**: Yes, can specify region and data never leaves
- [ ] **+0 pts**: No control over data location
- [ ] **-5 pts**: Data replicates globally with no opt-out

**Important for**: GDPR, data localization laws

---

### 5.3 Vendor Lock-In

**Question**: How easy is it to export data and switch vendors?

- [ ] **+5 pts**: Easy export, open formats, migration support
- [ ] **+0 pts**: Export available but limited
- [ ] **-5 pts**: Difficult to export, proprietary formats

**Export Options**: ___________________________

---

### 5.4 References & Reviews

**Question**: What do existing customers say?

- [ ] **+5 pts**: Positive references, good reviews (4+ stars), no major security incidents
- [ ] **+0 pts**: Mixed reviews, minor incidents
- [ ] **-10 pts**: Negative reviews, history of breaches

**G2/Capterra Rating**: ___________________________
**Security Incidents**: ___________________________

---

**Section 5 Total**: ______ bonus/penalty points

---

## Final Score & Decision

**Total Score**: ______ / 100 points (+ bonus/penalty)

### Scoring Interpretation

**80-100 points**: ✅ **APPROVE**
- Strong security and compliance
- Appropriate for Confidential data (Tier 3)
- Recommended for enterprise deployment

**60-79 points**: ⚠️ **CONDITIONAL APPROVE**
- Adequate security for Internal data (Tier 2)
- NOT approved for Confidential or Restricted data
- Require additional controls:
  - [ ] User training on data classification
  - [ ] Regular audit of usage
  - [ ] Restrict to specific use cases: ___________________________

**40-59 points**: ⚠️ **APPROVE FOR PUBLIC DATA ONLY (Tier 1)**
- Minimal security/compliance
- Only use for public information
- Consider alternatives if confidential data needed

**Below 40 points**: ❌ **REJECT**
- Insufficient security/compliance
- Recommend alternative vendors
- Do not approve for any company use

---

## Recommendation

**Decision**: ☐ Approve ☐ Conditional Approve ☐ Reject

**Approved For**:
- ☐ Public data (Tier 1)
- ☐ Internal data (Tier 2) - with anonymization
- ☐ Confidential data (Tier 3) - enterprise tier only

**Conditions/Requirements**:
1. ___________________________
2. ___________________________
3. ___________________________

**Alternative Tools Considered**: ___________________________

**Legal Review Required?** ☐ Yes ☐ No

**Approved By**:
- IT/Security: ___________________________ Date: _______
- Legal (if required): ___________________________ Date: _______
- Department Head: ___________________________ Date: _______

---

## Vendor Questionnaire (Optional - Send to Vendor)

If information isn't available publicly, send this to vendor:

```
Subject: Security and Compliance Questionnaire for [COMPANY NAME]

Dear [VENDOR] Team,

We are evaluating [TOOL NAME] for use at [COMPANY NAME]. To complete our security assessment, please provide the following information:

1. Data Usage:
   - Is customer data used to train AI models?
   - How long is data retained?
   - Can we request data deletion?

2. Data Protection:
   - Where is data stored (geographic location)?
   - Is data encrypted in transit and at rest?
   - What encryption standards are used?

3. Compliance:
   - Do you have SOC 2 Type II certification? (Please provide report)
   - Do you have ISO 27001?
   - Can you provide a Data Processing Agreement (DPA) for GDPR?
   - [If applicable]: Can you provide a Business Associate Agreement (BAA) for HIPAA?

4. Security:
   - Describe your vulnerability management program
   - Describe your incident response process
   - What happened if there's a data breach? (Notification timeline)
   - Have you had any security incidents in the past 2 years?

5. Access Controls:
   - Do you support SSO (SAML/OIDC)?
   - Is MFA available?
   - Do you provide audit logs?

6. Support:
   - What support channels do you offer?
   - What is your SLA for uptime and support response?

Please provide responses by [DATE]. Thank you!

Best regards,
[YOUR NAME]
[TITLE]
[COMPANY]
```

---

## Vendor Response Tracking

**Sent**: ___________________________ (date)
**Follow-up**: ___________________________ (date)
**Received**: ___________________________ (date)

**Vendor Responsiveness Score**:
- ☐ Excellent (responded within 3 business days with complete info)
- ☐ Good (responded within 1 week with most info)
- ☐ Poor (slow response or incomplete info)
- ☐ No response (red flag)

**Notes**: ___________________________

---

## Post-Approval Actions

**Once approved, complete these actions**:

1. **Procurement**:
   - [ ] Purchase/subscribe to appropriate tier
   - [ ] Negotiate enterprise agreement if needed
   - [ ] Add to IT asset inventory

2. **Legal Documentation**:
   - [ ] Obtain and review DPA/BAA
   - [ ] Store executed agreements in [LOCATION]
   - [ ] Add vendor to compliance tracking

3. **IT Configuration**:
   - [ ] Configure SSO if available
   - [ ] Set up admin accounts
   - [ ] Enable audit logging
   - [ ] Configure data residency (if available)

4. **User Communication**:
   - [ ] Add to approved tools list
   - [ ] Create usage guidelines for this tool
   - [ ] Train users on data classification
   - [ ] Announce availability to team

5. **Ongoing Monitoring**:
   - [ ] Schedule annual security review
   - [ ] Monitor for security incidents (vendor blog, news)
   - [ ] Review usage quarterly
   - [ ] Re-evaluate when contract renews

---

## Review Schedule

**Next Review Date**: ___________________________
**Reviewed By**: ___________________________
**Changes Since Last Review**: ___________________________

---

**Version**: 1.0
**Last Updated**: [DATE]
**Template Owner**: [NAME, TITLE]
