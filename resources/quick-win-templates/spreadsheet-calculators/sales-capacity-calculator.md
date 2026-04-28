# Sales Capacity Model Calculator

**Purpose**: Calculate how many sales reps you need to hit revenue goals
**Time to Complete**: 30 minutes
**Use Case**: Sales leaders planning headcount and quotas
**Output**: Rep count, quota per rep, hiring timeline, ramp plan

---

## Sales Capacity Formula

**Revenue Target** = (# of Reps) × (Quota per Rep) × (Quota Attainment %)

**Example**:
- Revenue target: $10M
- Quota per rep: $500K
- Average attainment: 85%
- **Reps needed**: $10M ÷ ($500K × 85%) = 23.5 → **24 reps**

---

## Quick Calculator

### Step 1: Set Revenue Target

**Annual revenue goal**: $[X]M

**Example**: $10M ARR

---

### Step 2: Determine Quota per Rep

**Factors**:
- Deal size (ACV)
- Sales cycle length
- Close rate
- Rep capacity (deals/year)

**Formula**: Quota = (Deals/Year) × (Average Deal Size) × (Close Rate)

**Example**:
- Average deal size: $50K ACV
- Sales cycle: 3 months (4 deals in pipeline at once)
- Close rate: 25%
- Deals closed/year: 16 (4 per quarter)
- **Quota: 16 × $50K = $800K** (before adjusting for attainment)

**Realistic quota**: $500K-600K (assuming 75-80% attainment)

---

### Step 3: Calculate Rep Count

**Formula**: Reps = Revenue Target ÷ (Quota × Attainment %)

**Example**:
- Revenue target: $10M
- Quota: $600K
- Attainment: 85%
- **Reps: $10M ÷ ($600K × 85%) = 19.6 → 20 reps**

---

### Step 4: Account for Ramp Time

**Ramp time** = Months for new rep to reach full productivity

**Typical ramp times**:
- SMB sales: 3-4 months
- Mid-market: 4-6 months
- Enterprise: 6-12 months

**Formula**: Effective Reps = (Fully Ramped Reps) + (Ramping Reps × Ramp %)

**Example** (Jan 2026):
- 15 fully ramped reps (100% productivity)
- 5 new reps hired Dec 2025 (Month 2 = 40% productivity)
- **Effective reps: 15 + (5 × 40%) = 17 reps**

---

## Sales Capacity Model (Google Sheets)

### Tab 1: Inputs

| Input | Value | Notes |
|-------|-------|-------|
| **Revenue Goals** |||
| Annual revenue target | $10M | Company goal |
| Q1 target | $2M | 20% (seasonality) |
| Q2 target | $2.5M | 25% |
| Q3 target | $2.5M | 25% |
| Q4 target | $3M | 30% |
||||
| **Rep Productivity** |||
| Quota per rep (annual) | $600K | Realistic, not stretch |
| Average attainment % | 85% | Historical average |
| Ramp time (months) | 4 | Time to full productivity |
||||
| **Deal Metrics** |||
| Average deal size (ACV) | $50K | Average contract value |
| Sales cycle (months) | 3 | Lead to close |
| Close rate % | 25% | Opps to close |
||||
| **Hiring** |||
| Current reps (Jan 2026) | 15 | Starting headcount |
| Attrition rate % | 15% | Annual turnover |

---

### Tab 2: Monthly Capacity Model

| Month | Starting Reps | New Hires | Attrition | Ending Reps | Ramp % | Effective Reps | Quota (Month) | Revenue |
|-------|---------------|-----------|-----------|-------------|--------|----------------|---------------|---------|
| **Jan 26** | 15 | 2 | 0 | 17 | 50% | 16 | $50K | $800K |
| **Feb 26** | 17 | 0 | 0 | 17 | 75% | 16.5 | $50K | $825K |
| **Mar 26** | 17 | 2 | -1 | 18 | 100%/50% | 18 | $50K | $900K |
| **Apr 26** | 18 | 0 | 0 | 18 | 75% | 18.5 | $50K | $925K |
| **May 26** | 18 | 0 | 0 | 18 | 100% | 19 | $50K | $950K |
| **Jun 26** | 18 | 2 | 0 | 20 | 100%/50% | 20 | $50K | $1,000K |
| **Q1** | - | 4 | -1 | - | - | **Avg 17** | - | **$2.5M** |
| **Q2** | - | 2 | 0 | - | - | **Avg 19** | - | **$2.9M** |

**Notes**:
- Ramp %: New hires at 50% → 75% → 100% over 4 months
- Attrition: -1 rep = 1 person left
- Effective reps: Accounts for ramping + attrition

---

### Tab 3: Hiring Plan

| Quarter | Needed Reps | Current Reps | Gap | New Hires | Start Date | Fully Ramped |
|---------|-------------|--------------|-----|-----------|------------|--------------|
| **Q1 2026** | 17 | 15 | 2 | 2 | Jan 1 | May 1 |
| **Q2 2026** | 19 | 17 | 2 | 2 | Apr 1 | Aug 1 |
| **Q3 2026** | 20 | 19 | 1 | 2 | Jul 1 | Nov 1 |
| **Q4 2026** | 20 | 20 | 0 | 1 | Oct 1 | Feb 1 |
| **Total 2026** | - | - | - | **7 hires** | - | - |

**Hiring timeline**:
- Start recruiting: 2 months before start date
- Interview → offer: 4-6 weeks
- Notice period: 1 month
- **Total**: 3-4 months lead time per hire

---

### Tab 4: Cost Model

| Category | Q1 | Q2 | Q3 | Q4 | Annual |
|----------|----|----|----|----|--------|
| **Rep Salaries** ||||||
| Base salary ($75K) | $281K | $356K | $375K | $375K | $1.4M |
| Commission (10% of sales) | $250K | $290K | $300K | $400K | $1.2M |
| **Total OTE** | $531K | $646K | $675K | $775K | **$2.6M** |
||||||
| **Support Costs** ||||||
| Sales ops (2 people) | $40K | $40K | $40K | $50K | $170K |
| Tools (Salesforce, etc.) | $15K | $15K | $20K | $20K | $70K |
| Marketing (lead gen) | $100K | $125K | $150K | $175K | $550K |
| **Total Support** | $155K | $180K | $210K | $245K | **$790K** |
||||||
| **Total Sales Cost** | $686K | $826K | $885K | $1,020K | **$3.4M** |
||||||
| **Revenue** | $2.5M | $2.9M | $3.1M | $3.5M | **$12M** |
| **CAC Ratio** | 27% | 28% | 29% | 29% | **28%** |

**Target CAC ratio**: 25-35% for SaaS

---

## Key Metrics

### Sales Efficiency

**Magic Number**: (Net New ARR × 4) ÷ S&M Spend

**Example**:
- Net new ARR (Q1): $500K
- S&M spend (Q1): $686K
- **Magic Number: ($500K × 4) ÷ $686K = 2.9** (very efficient)

**Benchmarks**:
- <0.5: Inefficient (burning cash)
- 0.5-0.75: Okay (break even)
- 0.75-1.0: Good (profitable growth)
- \>1.0: Excellent (highly efficient)

---

### Quota Attainment

**Average attainment** = Actual Revenue ÷ (Total Quota)

**Example**:
- 20 reps × $600K quota = $12M total quota
- Actual revenue: $10M
- **Attainment: $10M ÷ $12M = 83%**

**Benchmarks**:
- 70-80%: Realistic (quotas are achievable)
- 80-90%: Good (quotas are stretching but fair)
- 90-100%: Too easy (raise quotas)
- <70%: Too hard (lower quotas or fix process)

---

### Rep Productivity

**Revenue per rep** = Total Revenue ÷ # of Reps

**Example**:
- Revenue: $10M
- Reps: 20
- **Revenue per rep: $500K**

**Benchmarks (SaaS)**:
- SMB: $200K-400K per rep
- Mid-market: $400K-800K per rep
- Enterprise: $1M-3M per rep

---

## Scenario Planning

### Scenario 1: Aggressive Growth (2x Revenue)

**Goal**: $20M revenue (from $10M)

**Changes**:
- Hire 25 reps (vs 20)
- Increase marketing spend 2x
- Keep quota same ($600K)

**Result**: $20M revenue, but CAC ratio increases to 35%

---

### Scenario 2: Profitability Focus

**Goal**: Improve margins (reduce CAC)

**Changes**:
- Hire 15 reps (vs 20)
- Cut marketing spend 30%
- Increase quota to $700K

**Result**: $9M revenue (below target), but CAC drops to 22%

---

### Scenario 3: Balanced Growth

**Goal**: $12M revenue, maintain 28% CAC

**Changes**:
- Hire 20 reps (as planned)
- Increase marketing spend 10%
- Keep quota at $600K

**Result**: $12M revenue, CAC stays at 28%

---

## Common Mistakes

### ❌ Mistake 1: Ignoring Ramp Time

**Wrong**: "We have 20 reps, so we'll hit $12M"
**Right**: "We have 20 reps, but 5 are ramping at 50%, so effective reps = 17.5"

**Impact**: Miss revenue target by 15-20%

---

### ❌ Mistake 2: Unrealistic Quotas

**Wrong**: "Let's set $1M quotas to motivate reps"
**Right**: "Historical attainment is 75% at $600K, so realistic quota is $500K-600K"

**Impact**: Reps quit, morale drops, miss target

---

### ❌ Mistake 3: Not Planning for Attrition

**Wrong**: Assume 0% attrition
**Right**: Plan for 10-20% annual attrition (1-2 reps/quarter)

**Impact**: Unexpected shortfall when reps leave

---

### ❌ Mistake 4: Hiring Too Late

**Wrong**: Realize you need reps in Q4, start hiring in Q3
**Right**: Realize you need reps in Q4, start hiring in Q2 (4-6 months lead time)

**Impact**: Miss revenue target due to lack of capacity

---

## When to Hire More Reps

**Hire more when**:
- Reps consistently hit 90%+ of quota (quotas too easy)
- Pipeline is overflowing (can't cover all leads)
- CAC payback <6 months (efficient, can scale)
- Reps spending <50% time selling (too much admin)

**Don't hire when**:
- Reps hitting <70% of quota (fix sales process first)
- CAC payback >18 months (inefficient)
- High churn (product problem, not sales problem)

---

## Sales Capacity by Company Stage

### Pre-Seed ($0-500K ARR)
- Reps: 1-2 (founders selling)
- Quota: N/A (founder-led sales)
- Focus: Find product-market fit

### Seed ($500K-2M ARR)
- Reps: 2-5
- Quota: $200K-400K
- Focus: Prove repeatable sales motion

### Series A ($2M-10M ARR)
- Reps: 5-15
- Quota: $400K-600K
- Focus: Scale what's working

### Series B ($10M-30M ARR)
- Reps: 15-40
- Quota: $600K-1M
- Focus: Build sales org (managers, ops, enablement)

---

## Google Sheets Formulas

**Effective Reps**:
```
=FULLY_RAMPED_REPS + (RAMPING_REPS * RAMP_PERCENT)
```

**Quota per Rep (Monthly)**:
```
=ANNUAL_QUOTA / 12
```

**Revenue (Monthly)**:
```
=EFFECTIVE_REPS * MONTHLY_QUOTA * ATTAINMENT_PERCENT
```

**CAC Ratio**:
```
=TOTAL_SALES_COST / REVENUE
```

---

## Next Steps

1. **Set revenue target** (realistic, not stretch)
2. **Calculate quota per rep** (based on deal size, cycle, close rate)
3. **Determine rep count** (revenue ÷ quota)
4. **Account for ramp** (new hires take 3-6 months)
5. **Plan hiring** (start 4-6 months early)
6. **Build cost model** (salaries, commissions, support)
7. **Review monthly** (adjust based on actuals)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Unit Economics Calculator](./unit-economics-calculator.md), [Burn Rate Calculator](./burn-rate-calculator.md)
