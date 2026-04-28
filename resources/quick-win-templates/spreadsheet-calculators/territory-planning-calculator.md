# Territory Planning Calculator (Spreadsheet)

**Purpose**: Assign sales territories to optimize coverage and fairness
**Time to Complete**: 3-4 hours (initial planning), quarterly review
**Use Case**: VP Sales, Sales Ops planning territory assignments
**Output**: Territory assignments with quotas, account distribution, workload balance

---

## Territory Planning Formula

**Fair Territory** = Equal Opportunity (not equal accounts)

**Opportunity Score** = (Account Count × Avg Deal Size × Close Rate) ÷ Sales Cycle Length

**Example**:
- Territory A: 100 accounts, $50K avg deal, 25% close rate, 3 months cycle
- Territory B: 50 accounts, $100K avg deal, 30% close rate, 6 months cycle
- **Territory A opportunity**: (100 × $50K × 25%) ÷ 3 = $416K/month
- **Territory B opportunity**: (50 × $100K × 30%) ÷ 6 = $250K/month
- Territory A has more opportunity (assign to senior rep or split)

---

## Territory Planning Spreadsheet

### Tab 1: Account Universe (Input)

**Import Account List**:

| Account Name | Industry | Region | Employees | Revenue Estimate | Deal Size Potential | Current Relationship | Assigned Rep |
|--------------|----------|--------|-----------|------------------|---------------------|----------------------|--------------|
| Acme Corp | Fintech | Singapore | 150 | $10M | $75K | Customer (Year 2) | Sarah |
| BigCo | E-commerce | Malaysia | 500 | $50M | $150K | Prospect (Engaged) | Unassigned |
| StartupX | SaaS | Indonesia | 25 | $2M | $25K | Prospect (Cold) | Unassigned |
| RetailCo | Retail | Thailand | 200 | $20M | $50K | Customer (Year 1) | John |
| BankCo | Financial Services | Singapore | 1,000 | $200M | $250K | Prospect (Engaged) | Unassigned |

**Account Segmentation**:
- **Tier 1 (Enterprise)**: 500+ employees, $50M+ revenue, $100K+ deal size
- **Tier 2 (Mid-Market)**: 100-500 employees, $10M-50M revenue, $50K-100K deal size
- **Tier 3 (SMB)**: <100 employees, <$10M revenue, <$50K deal size

**Total Accounts**: 500 (100 Tier 1, 200 Tier 2, 200 Tier 3)

---

### Tab 2: Territory Definition

**Geographic Territories** (Example: SEA):

| Territory ID | Region | Countries | Account Count | Potential ARR | Assigned Rep |
|--------------|--------|-----------|---------------|---------------|--------------|
| **SEA-SG-1** | Singapore | Singapore | 80 | $4M | Sarah (Senior AE) |
| **SEA-SG-2** | Singapore | Singapore | 80 | $4M | John (AE) |
| **SEA-MY** | Malaysia | Malaysia | 60 | $3M | Priya (AE) |
| **SEA-ID** | Indonesia | Indonesia | 50 | $2.5M | Unassigned |
| **SEA-TH** | Thailand | Thailand | 40 | $2M | Unassigned |
| **SEA-PH** | Philippines | Philippines | 40 | $2M | Unassigned |
| **SEA-VN** | Vietnam | Vietnam | 30 | $1.5M | Unassigned |

**Total**: 380 accounts, $19M potential ARR

---

**Industry-Based Territories** (Alternative to geographic):

| Territory ID | Industry | Account Count | Potential ARR | Assigned Rep |
|--------------|----------|---------------|---------------|--------------|
| **IND-Fintech** | Fintech, Banking | 80 | $6M | Sarah (Fintech specialist) |
| **IND-Ecommerce** | E-commerce, Retail | 100 | $5M | John (E-commerce specialist) |
| **IND-SaaS** | SaaS, Tech | 120 | $4M | Priya (SaaS specialist) |
| **IND-Other** | Healthcare, Education, etc. | 80 | $4M | Unassigned |

**Total**: 380 accounts, $19M potential ARR

---

**Hybrid Territories** (Geographic + Tier):

| Territory ID | Region | Account Tier | Account Count | Potential ARR | Assigned Rep |
|--------------|--------|--------------|---------------|---------------|--------------|
| **SG-Enterprise** | Singapore | Tier 1 (Enterprise) | 30 | $6M | Sarah (Enterprise AE) |
| **SG-MidMarket** | Singapore | Tier 2 (Mid-Market) | 70 | $3.5M | John (AE) |
| **SG-SMB** | Singapore | Tier 3 (SMB) | 80 | $2M | Inside Sales Team |
| **SEA-Enterprise** | Malaysia, Indonesia, Thailand | Tier 1 | 40 | $8M | Priya (Regional Enterprise AE) |

**Total**: 220 accounts, $19.5M potential ARR

---

### Tab 3: Quota Assignment

**Quota Calculation**:

**Total Company Quota**: $15M ARR (Year 1)

**Quota by Territory**:

| Territory | Account Count | Potential ARR | % of Total | Quota | Coverage Ratio |
|-----------|---------------|---------------|------------|-------|----------------|
| **SEA-SG-1** | 80 | $4M | 21% | $3.15M | 79% |
| **SEA-SG-2** | 80 | $4M | 21% | $3.15M | 79% |
| **SEA-MY** | 60 | $3M | 16% | $2.4M | 80% |
| **SEA-ID** | 50 | $2.5M | 13% | $1.95M | 78% |
| **SEA-TH** | 40 | $2M | 11% | $1.65M | 83% |
| **SEA-PH** | 40 | $2M | 11% | $1.65M | 83% |
| **SEA-VN** | 30 | $1.5M | 8% | $1.05M | 70% |
| **Total** | **380** | **$19M** | **100%** | **$15M** | **79%** |

**Coverage Ratio** = Quota ÷ Potential ARR
- **Target**: 70-80% (achievable but challenging)
- **Too low** (<60%): Easy quotas, reps sandbag
- **Too high** (>90%): Unachievable, reps demoralized

---

### Tab 4: Workload Balance

**Workload Analysis**:

| Rep | Territory | Account Count | Tier 1 (Enterprise) | Tier 2 (Mid-Market) | Tier 3 (SMB) | Quota | Workload Score |
|-----|-----------|---------------|---------------------|---------------------|--------------|-------|----------------|
| **Sarah** | SEA-SG-1 | 80 | 10 | 30 | 40 | $3.15M | 130 |
| **John** | SEA-SG-2 | 80 | 10 | 30 | 40 | $3.15M | 130 |
| **Priya** | SEA-MY | 60 | 8 | 25 | 27 | $2.4M | 103 |
| **Unassigned** | SEA-ID | 50 | 5 | 20 | 25 | $1.95M | 80 |
| **Unassigned** | SEA-TH | 40 | 4 | 15 | 21 | $1.65M | 65 |

**Workload Score Calculation**:
- Tier 1 (Enterprise): 5 points per account (high touch, complex sale)
- Tier 2 (Mid-Market): 2 points per account (moderate touch)
- Tier 3 (SMB): 1 point per account (low touch, high velocity)

**Example** (Sarah):
- Tier 1: 10 accounts × 5 = 50 points
- Tier 2: 30 accounts × 2 = 60 points
- Tier 3: 40 accounts × 1 = 40 points
- **Total**: 150 points

**Balance Check**:
- **Target**: All reps within ±20% of average workload
- **Average workload**: 120 points
- **Acceptable range**: 96-144 points
- Sarah (150) and John (150) are slightly above range → Consider redistributing Tier 3 accounts

---

### Tab 5: Territory Fairness Analysis

**Fairness Metrics**:

| Rep | Quota | Potential ARR | Coverage Ratio | Avg Deal Size | Close Rate Est. | Expected ARR | Quota Attainment Est. |
|-----|-------|---------------|----------------|---------------|-----------------|--------------|------------------------|
| **Sarah** | $3.15M | $4M | 79% | $50K | 25% | $3.2M | 102% |
| **John** | $3.15M | $4M | 79% | $50K | 25% | $3.2M | 102% |
| **Priya** | $2.4M | $3M | 80% | $45K | 23% | $2.3M | 96% |
| **Unassigned (ID)** | $1.95M | $2.5M | 78% | $40K | 20% | $1.8M | 92% |
| **Unassigned (TH)** | $1.65M | $2M | 83% | $38K | 20% | $1.6M | 97% |

**Expected ARR Calculation**:
```
Expected ARR = Account Count × Avg Deal Size × Close Rate
```

**Fairness Check**:
- **Goal**: All reps have 90-110% estimated quota attainment
- **Issue**: SEA-ID territory is under-resourced (92% attainment) → Hire new rep or reassign accounts
- **Solution**: Hire new rep for SEA-ID, split larger territories

---

## Territory Planning Scenarios

### Scenario 1: New Rep Onboarding (Redistribute Accounts)

**Problem**: Hiring new rep for SEA-ID territory

**Before**:
- Sarah: 80 accounts, $3.15M quota
- John: 80 accounts, $3.15M quota
- Priya: 60 accounts, $2.4M quota
- **New Rep (Alex)**: 0 accounts, $0 quota

**After** (Redistribute):
- Sarah: 70 accounts, $2.8M quota (gave 10 accounts to Alex)
- John: 70 accounts, $2.8M quota (gave 10 accounts to Alex)
- Priya: 60 accounts, $2.4M quota (no change)
- **Alex**: 30 accounts (from Sarah, John), $1.2M quota

**Notes**:
- Don't take all accounts from one rep (hurts their quota attainment)
- Take mix from multiple reps (fairness)
- Give new rep mix of Tier 2/3 accounts (easier to close, learn faster)

---

### Scenario 2: Rep Leaves (Reassign Accounts)

**Problem**: John leaves company

**Before**:
- John: 80 accounts, $3.15M quota

**After** (Redistribute):
- **Option 1: Split among existing reps**:
  - Sarah: 80 → 100 accounts (+20), $3.15M → $3.9M quota
  - Priya: 60 → 80 accounts (+20), $2.4M → $3.2M quota
  - Alex: 30 → 50 accounts (+20), $1.2M → $2M quota

- **Option 2: Hire backfill**:
  - Hire new rep (Maria), assign John's 80 accounts
  - Maria: 80 accounts, $3.15M quota
  - No disruption to other reps

**Recommendation**: Option 2 (hire backfill) if budget allows. Option 1 if hiring freeze.

---

### Scenario 3: Mid-Year Territory Rebalance

**Problem**: Sarah hitting 150% quota (over-performing), John hitting 60% quota (under-performing)

**Analysis**:
- Sarah's territory has more high-intent accounts (timing, luck)
- John's territory has fewer engaged prospects

**Solution**:
- **Don't penalize Sarah** (don't take her best accounts mid-year)
- **Help John**: Give him 10 warm accounts from inbound pipeline
- **Next year**: Rebalance territories (give John better accounts)

**Note**: Mid-year rebalancing is disruptive. Only do if absolutely necessary (e.g., rep quitting, major market shift).

---

## Territory Handoff Process

**When New Rep Takes Over Territory**:

**Week 1: Knowledge Transfer**:
- [ ] Previous rep creates handoff doc (top 20 accounts, status, next steps)
- [ ] 1-hour call with new rep (introduce accounts, context)
- [ ] New rep reviews CRM notes (understand account history)

**Week 2-3: Introduction Emails**:
- [ ] New rep emails all accounts: "I'm taking over from [Previous Rep]"
- [ ] Include: Background, commitment to service, contact info
- [ ] CC previous rep (for warm handoff)

**Week 4: Calls with Top 20 Accounts**:
- [ ] Schedule 30-min calls with top 20 accounts
- [ ] Build rapport, understand needs, align on next steps

**Month 2-3: Full Ramp**:
- [ ] New rep fully ramped, hitting quota
- [ ] Previous rep no longer involved

---

## Territory Planning Best Practices

### Best Practice 1: Balance Opportunity (Not Account Count)

**Wrong**: Give each rep 100 accounts (equal count)
**Right**: Give each rep equal opportunity (revenue potential × close rate)

**Why**: 100 SMB accounts ≠ 20 enterprise accounts in terms of revenue potential

---

### Best Practice 2: Avoid Mid-Year Changes

**Wrong**: Rebalance territories every quarter
**Right**: Set territories annually, only change if necessary (rep leaves, market shift)

**Why**: Mid-year changes disrupt rep momentum, destroy trust

---

### Best Practice 3: Protect Top Performers

**Wrong**: Take best accounts from top performers (they're over-quota)
**Right**: Let top performers keep their territory (reward performance)

**Why**: Taking accounts = punishment for success = demoralized reps

---

### Best Practice 4: Give New Reps Easier Accounts

**Wrong**: Give new rep hardest accounts (enterprise, long sales cycles)
**Right**: Give new rep mix of Tier 2/3 accounts (faster wins, build confidence)

**Why**: New reps need wins to build confidence and learn product

---

## Common Territory Planning Mistakes

### ❌ Mistake 1: Equal Account Count (Not Equal Opportunity)

**Wrong**: Each rep gets 100 accounts (50 Tier 1, 50 Tier 3)
**Right**: Balance opportunity (revenue potential × close rate)

**Why**: Tier 1 accounts take 3x effort vs Tier 3 accounts

---

### ❌ Mistake 2: Cherry-Picking Accounts

**Wrong**: Rep A gets all inbound leads, Rep B gets cold accounts
**Right**: Distribute inbound leads equally (round-robin)

**Why**: Inbound leads = 5x close rate vs cold. Unfair if one rep gets all inbound.

---

### ❌ Mistake 3: No Workload Balance

**Wrong**: Rep A has 20 enterprise accounts (100+ hours/month), Rep B has 200 SMB accounts (50 hours/month)
**Right**: Balance workload using workload score (Tier 1 = 5 points, Tier 2 = 2 points, Tier 3 = 1 point)

**Why**: Equal workload = fair quotas

---

### ❌ Mistake 4: Mid-Year Territory Changes

**Wrong**: Rebalance territories every quarter (disruptive)
**Right**: Set annually, only change if necessary (rep leaves, major market shift)

**Why**: Mid-year changes destroy trust, disrupt momentum

---

## Google Sheets Formula Reference

**Potential ARR**:
```
=Account_Count * Avg_Deal_Size * Close_Rate
```

**Coverage Ratio**:
```
=Quota / Potential_ARR
```

**Workload Score**:
```
=(Tier1_Accounts * 5) + (Tier2_Accounts * 2) + (Tier3_Accounts * 1)
```

**Expected ARR**:
```
=Account_Count * Avg_Deal_Size * Close_Rate
```

**Quota Attainment Estimate**:
```
=Expected_ARR / Quota
```

---

## Territory Planning Checklist

**Before Planning**:
- [ ] Export account list from CRM (Salesforce, HubSpot)
- [ ] Segment accounts by tier (Enterprise, Mid-Market, SMB)
- [ ] Calculate potential ARR per account (avg deal size × close rate)
- [ ] Review current territory assignments (what's working? what's not?)

**During Planning**:
- [ ] Define territory structure (geographic, industry, tier, or hybrid)
- [ ] Assign accounts to territories (balance opportunity, not count)
- [ ] Calculate quota per territory (70-80% coverage ratio)
- [ ] Calculate workload per rep (balance using workload score)
- [ ] Check fairness (expected quota attainment within 90-110%)

**After Planning**:
- [ ] Communicate changes to reps (30-day notice before effective date)
- [ ] Update CRM (assign accounts to reps)
- [ ] Host territory kickoff meeting (explain assignments, quotas)
- [ ] Monitor quarterly (track quota attainment by territory)
- [ ] Adjust annually (rebalance based on performance, market changes)

---

## Tools & Resources

**CRM (Territory Management)**:
- **Salesforce**: Territory management, account assignment
- **HubSpot**: Account assignment, pipelines
- **Pipedrive**: Territory management (via custom fields)

**Territory Optimization Tools**:
- **Varicent** ($10K-50K/year): Enterprise territory planning
- **Xactly AlignStar** ($10K-50K/year): Territory design, quota setting
- **Anaplan** ($20K-100K/year): Enterprise planning (finance + sales)

**DIY (Spreadsheets)**:
- **Google Sheets**: Free, collaborative
- **Excel**: Offline, powerful formulas
- **Airtable**: Database + spreadsheet hybrid ($10-20/user/month)

---

## Next Steps

1. **Export account list** (from CRM)
2. **Segment accounts** (Tier 1, 2, 3)
3. **Define territories** (geographic, industry, hybrid)
4. **Assign accounts** (balance opportunity, not count)
5. **Calculate quotas** (70-80% coverage ratio)
6. **Check workload balance** (±20% of average)
7. **Validate fairness** (expected attainment 90-110%)
8. **Communicate changes** (30-day notice)
9. **Update CRM** (assign accounts to reps)
10. **Monitor quarterly** (adjust if needed)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Sales Capacity Calculator](./sales-capacity-calculator.md), [Sales Commission Plan](../one-page-templates/sales-commission-plan.md)
