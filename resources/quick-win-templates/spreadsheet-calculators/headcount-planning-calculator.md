# Headcount Planning Calculator

**Purpose**: Plan team growth aligned with budget and revenue goals
**Time to Complete**: 2-4 hours (initial plan), ongoing updates
**Use Case**: Founders, HR, finance planning hiring for next 6-12 months
**Output**: Hiring plan with timeline, budget, org chart

---

## Headcount Planning Formula

**Budget Available for Hiring** = (Revenue - COGS - OpEx) ÷ Team Size Target

**Example**:
- Revenue: $10M
- COGS: $2M (20%)
- OpEx (non-payroll): $2M (20%)
- Available for payroll: $6M (60%)
- Target team size: 50 people
- **Budget per employee**: $120K/year (fully loaded)

---

## Headcount Planning Spreadsheet

### Tab 1: Inputs

| Input | Value | Notes |
|-------|-------|-------|
| **Revenue Plan** |||
| Current ARR | $2M | Today |
| Target ARR (12 months) | $10M | Goal |
| Target ARR (24 months) | $25M | Long-term |
||||
| **Current Team** |||
| Total headcount | 15 | As of today |
| Engineering | 8 | Backend, frontend, mobile |
| Product | 2 | PM, designer |
| Sales & Marketing | 3 | Sales, marketing |
| G&A | 2 | Finance, HR, ops |
||||
| **Budget** |||
| Cash in bank | $8M | Runway basis |
| Monthly burn | $250K | Current |
| Runway | 32 months | Without new hires |
| Budget for hiring | $3M | Next 12 months |
||||
| **Salaries (SEA - Singapore)** |||
| Senior Engineer | SGD 150K | $112K USD |
| Mid Engineer | SGD 100K | $75K USD |
| Junior Engineer | SGD 70K | $52K USD |
| Product Manager | SGD 120K | $90K USD |
| Sales Rep | SGD 80K + commission | $60K + 10% |
| Marketing Manager | SGD 100K | $75K USD |
| G&A (Finance, HR, Ops) | SGD 80K | $60K USD |

**Note**: Fully loaded cost = Salary × 1.3 (benefits, taxes, office, equipment)

---

### Tab 2: Hiring Plan (Next 12 Months)

| Role | Q1 | Q2 | Q3 | Q4 | Total | Annual Cost (Fully Loaded) |
|------|----|----|----|----|-------|-----------------------------|
| **Engineering** ||||||
| Senior Engineer | 2 | 2 | 2 | 2 | 8 | $1.2M |
| Mid Engineer | 1 | 2 | 2 | 1 | 6 | $585K |
| Junior Engineer | 1 | 1 | 1 | 1 | 4 | $270K |
| **Product** ||||||
| Product Manager | 1 | 0 | 1 | 0 | 2 | $234K |
| Designer | 0 | 1 | 0 | 1 | 2 | $195K |
| **Sales & Marketing** ||||||
| Sales Rep | 2 | 2 | 3 | 3 | 10 | $780K |
| Marketing Manager | 1 | 1 | 0 | 0 | 2 | $195K |
| **G&A** ||||||
| Finance | 1 | 0 | 0 | 1 | 2 | $156K |
| HR | 0 | 1 | 0 | 0 | 1 | $78K |
| Ops | 0 | 0 | 1 | 0 | 1 | $78K |
| **Total** | **9** | **10** | **10** | **9** | **38** | **$3.8M** |

**Ending Headcount**: 15 (current) + 38 (new hires) = **53 people**

**Note**: Q1 = Heavy hiring (ramp up), Q2-Q3 = Sustained hiring, Q4 = Selective hiring

---

### Tab 3: Budget Impact

| Quarter | Starting Headcount | New Hires | Ending Headcount | Quarterly Payroll | Cumulative Payroll |
|---------|-------------------|-----------|------------------|-------------------|--------------------|
| **Q1** | 15 | 9 | 24 | $700K | $700K |
| **Q2** | 24 | 10 | 34 | $950K | $1.65M |
| **Q3** | 34 | 10 | 44 | $1.2M | $2.85M |
| **Q4** | 44 | 9 | 53 | $1.4M | $4.25M |

**Annual Payroll Cost**: $4.25M (fully loaded, accounting for mid-year hires)

**Budget Check**:
- Budget available: $3M
- Projected cost: $4.25M
- **Shortfall**: $1.25M (need to adjust plan or raise more capital)

---

### Tab 4: Revenue per Employee

| Metric | Q1 | Q2 | Q3 | Q4 | Target |
|--------|----|----|----|----|--------|
| **Revenue (ARR)** | $3M | $5M | $7M | $10M | $10M |
| **Headcount** | 24 | 34 | 44 | 53 | 53 |
| **Revenue per Employee** | $125K | $147K | $159K | $189K | $200K+ |

**Benchmark (SaaS)**: $150K-300K revenue per employee

**Analysis**:
- Q1-Q2: Below benchmark (ramping up)
- Q3-Q4: Approaching benchmark
- Target: $200K+ per employee by end of year

---

### Tab 5: Org Chart (End of Year)

**Total: 53 people**

**CEO** (1)
├── **Engineering** (18)
│   ├── Backend (8)
│   ├── Frontend (6)
│   ├── Mobile (2)
│   └── DevOps (2)
├── **Product** (4)
│   ├── Product Managers (2)
│   └── Designers (2)
├── **Sales & Marketing** (15)
│   ├── Sales (10)
│   ├── Marketing (4)
│   └── Customer Success (1)
├── **G&A** (5)
│   ├── Finance (2)
│   ├── HR (1)
│   ├── Legal (1)
│   └── Ops (1)

**Department Breakdown**:
- Engineering: 34% (18/53)
- Sales & Marketing: 28% (15/53)
- Product: 8% (4/53)
- G&A: 9% (5/53)

**Benchmark (SaaS)**:
- Engineering: 30-40%
- Sales & Marketing: 25-35%
- Product: 5-10%
- G&A: 10-15%

---

## Hiring Timeline

**Lead Time by Role**:

| Role | Time to Hire | Notes |
|------|--------------|-------|
| **Junior Engineer** | 4-8 weeks | Easier to find |
| **Mid Engineer** | 8-12 weeks | Moderate difficulty |
| **Senior Engineer** | 12-16 weeks | Hard to find |
| **Engineering Lead** | 16-20 weeks | Very hard |
| **Product Manager** | 8-12 weeks | Moderate |
| **Sales Rep** | 6-10 weeks | Easier, high turnover |
| **Marketing** | 8-12 weeks | Moderate |
| **G&A** | 6-10 weeks | Easier |

**Time to Productivity**:

| Role | Ramp Time | Notes |
|------|-----------|-------|
| **Junior Engineer** | 3-4 months | Need mentoring |
| **Mid Engineer** | 2-3 months | Productive quickly |
| **Senior Engineer** | 1-2 months | Hit ground running |
| **Product Manager** | 2-3 months | Learn product, customers |
| **Sales Rep** | 3-6 months | Learn product, sales process |

**Planning Tip**: Start recruiting 3-4 months before you need the person to be productive

**Example**:
- Need Senior Engineer productive by July 1
- Ramp time: 2 months (May-June)
- Hiring time: 4 months (Jan-April)
- **Start recruiting**: January

---

## Headcount Planning by Company Stage

### Pre-Seed ($0-500K ARR)
- **Headcount**: 3-8 people
- **Focus**: Engineering (60%), founding team
- **Hiring**: Generalists (can wear multiple hats)
- **Budget**: $200K-600K/year payroll

### Seed ($500K-2M ARR)
- **Headcount**: 8-20 people
- **Focus**: Engineering (50%), Sales (20%), Product (10%)
- **Hiring**: First specialists (PM, designer, sales)
- **Budget**: $600K-2M/year payroll

### Series A ($2M-10M ARR)
- **Headcount**: 20-50 people
- **Focus**: Engineering (40%), Sales (30%), Product (10%)
- **Hiring**: Scale what works (more eng, more sales)
- **Budget**: $2M-5M/year payroll

### Series B ($10M-30M ARR)
- **Headcount**: 50-150 people
- **Focus**: Engineering (35%), Sales (30%), G&A (15%)
- **Hiring**: Build leadership team (VPs, directors)
- **Budget**: $5M-15M/year payroll

---

## Hiring Prioritization Framework

**Priority Matrix**:

| Role | Impact | Urgency | Difficulty | Priority |
|------|--------|---------|------------|----------|
| **Senior Backend Engineer** | High | High | High | P0 (hire now) |
| **Product Manager** | High | Medium | Medium | P1 (hire Q1) |
| **Sales Rep** | Medium | High | Low | P1 (hire Q1) |
| **Junior Engineer** | Medium | Medium | Low | P2 (hire Q2) |
| **Marketing Manager** | Medium | Low | Medium | P2 (hire Q2) |
| **Finance** | Low | Low | Low | P3 (hire Q3-Q4) |

**Priority Levels**:
- **P0**: Hire now (critical blocker)
- **P1**: Hire next quarter (important for growth)
- **P2**: Hire in 6 months (nice-to-have)
- **P3**: Hire in 12 months (can wait)

---

## Budget Constraints & Trade-Offs

### Scenario 1: Limited Budget (Cut 30%)

**Original Plan**: 38 hires, $3.8M
**Revised Plan**: 25 hires, $2.5M

**Cuts**:
- ❌ Reduce junior engineers from 4 → 2
- ❌ Reduce sales reps from 10 → 6
- ❌ Delay marketing hires (2 → 0)
- ❌ Delay G&A hires (4 → 2)

**Keep**:
- ✅ Senior engineers (8, critical for product)
- ✅ Product managers (2, critical for roadmap)
- ✅ Core sales team (6, needed for revenue)

**Impact**: Slower growth (target $8M ARR instead of $10M)

---

### Scenario 2: Aggressive Growth (Increase 50%)

**Original Plan**: 38 hires, $3.8M
**Revised Plan**: 57 hires, $5.7M

**Additions**:
- ✅ More senior engineers (8 → 12)
- ✅ More sales reps (10 → 15)
- ✅ More marketing (2 → 4)
- ✅ Customer success team (0 → 3)

**Funding Need**: Additional $2M (total $5.7M for payroll)

**Impact**: Faster growth (target $15M ARR), but higher burn

---

## Common Headcount Planning Mistakes

### ❌ Mistake 1: Not Accounting for Ramp Time

**Wrong**: "We need 10 engineers by Q4" → Start hiring in Q3
**Right**: "We need 10 engineers productive by Q4" → Start hiring in Q1

**Why**: Hiring takes 3-4 months, ramp takes 2-3 months → 5-7 months total lead time

---

### ❌ Mistake 2: Hiring Too Fast

**Wrong**: "Let's hire 50 people this quarter!"
**Right**: "Let's hire 10-15 people per quarter (sustainable)"

**Why**: Hiring too fast = poor quality, culture dilution, management chaos

**Rule of Thumb**: Don't grow faster than 50% per year (15 → 22 is okay, 15 → 50 is risky)

---

### ❌ Mistake 3: Ignoring Attrition

**Wrong**: Assume 0% attrition
**Right**: Plan for 10-20% annual attrition

**Example**:
- Current: 15 people
- Target: 50 people
- Attrition: 15% (3 people leave)
- **Need to hire**: 38 (to reach 50) + 3 (to replace) = 41 total

---

### ❌ Mistake 4: Not Accounting for Fully Loaded Cost

**Wrong**: "Engineer salary is $100K, so budget $100K"
**Right**: "Engineer salary is $100K, budget $130K (fully loaded)"

**Fully Loaded Cost** = Salary × 1.3
- Benefits: 15-20% (health insurance, retirement)
- Taxes: 7-10% (employer taxes)
- Office/Equipment: 3-5% (desk, laptop, monitors)

---

## Hiring Budget Breakdown

**Example**: Hiring 1 Senior Engineer (SGD 150K salary)

| Category | Cost | % of Salary |
|----------|------|-------------|
| **Base Salary** | SGD 150K | 100% |
| **Benefits** (health, retirement) | SGD 25K | 17% |
| **Taxes** (employer portion) | SGD 12K | 8% |
| **Equipment** (laptop, monitors) | SGD 5K | 3% |
| **Office** (desk, space, utilities) | SGD 3K | 2% |
| **Recruiting** (20% of salary, one-time) | SGD 30K | 20% (Year 1 only) |
| **Total Year 1** | **SGD 225K** | **150%** |
| **Total Ongoing** | **SGD 195K** | **130%** |

**Planning Tip**: Budget 1.5x salary for Year 1 (includes recruiting), 1.3x for ongoing years

---

## Google Sheets Formula Reference

**Fully Loaded Cost**:
```
=SALARY * 1.3
```

**Revenue per Employee**:
```
=REVENUE / HEADCOUNT
```

**Quarterly Payroll**:
```
=SUMPRODUCT(HEADCOUNT_BY_ROLE, SALARY_BY_ROLE) * 1.3 / 4
```

**Headcount at End of Quarter**:
```
=STARTING_HEADCOUNT + NEW_HIRES - ATTRITION
```

**Hiring Budget Remaining**:
```
=TOTAL_BUDGET - CUMULATIVE_PAYROLL
```

---

## Hiring Plan Checklist

**Before Hiring**:
- [ ] Revenue plan clear (know how much we need to grow)
- [ ] Budget approved (cash available for payroll)
- [ ] Roles prioritized (P0, P1, P2)
- [ ] Job descriptions written (clear expectations)
- [ ] Hiring manager assigned (who owns this hire?)

**During Hiring**:
- [ ] Pipeline built (100+ candidates per role)
- [ ] Interviews scheduled (move fast, don't lose candidates)
- [ ] Offers extended (competitive, timely)
- [ ] Onboarding planned (first 30-60-90 days)

**After Hiring**:
- [ ] Track time to hire (reduce over time)
- [ ] Track time to productivity (reduce ramp time)
- [ ] Track quality of hire (performance reviews)
- [ ] Track retention (attrition rate)

---

## Next Steps

1. **Set revenue targets** (where do we want to be in 12 months?)
2. **Calculate budget** (how much can we spend on payroll?)
3. **Prioritize roles** (what roles are critical? P0, P1, P2)
4. **Build hiring plan** (quarter-by-quarter breakdown)
5. **Account for lead time** (start recruiting 3-4 months early)
6. **Track progress** (monthly review of hires vs plan)
7. **Adjust quarterly** (revise based on revenue, budget, attrition)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Annual Budget Template](../one-page-templates/annual-budget-template.md), [Sales Capacity Calculator](./sales-capacity-calculator.md)
