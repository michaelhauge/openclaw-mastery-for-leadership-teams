# Unit Economics (CAC/LTV) Calculator

**Purpose**: Calculate Customer Acquisition Cost (CAC), Lifetime Value (LTV), and payback period
**Time to Complete**: 15-30 minutes (once you have data)
**Use Case**: SaaS, subscription businesses, e-commerce with repeat purchases
**Output**: LTV:CAC ratio, payback period, profitability forecast

---

## What Are Unit Economics?

**Unit economics** = The profit/loss for each customer

**Two key metrics**:
1. **CAC** (Customer Acquisition Cost): How much you spend to get one customer
2. **LTV** (Lifetime Value): How much profit one customer generates over their lifetime

**The Golden Rule**:
- **LTV:CAC ratio should be ≥ 3:1** (every $1 spent on acquisition returns $3 in profit)
- **Payback period should be ≤ 12 months** (recover acquisition cost within a year)

---

## Quick Calculator (Simple Version)

### Step 1: Calculate CAC

**Formula**: CAC = Total Sales & Marketing Spend ÷ New Customers Acquired

**Example**:
- Sales & marketing spend (last month): $50,000
- New customers acquired: 100
- **CAC = $50,000 ÷ 100 = $500**

---

### Step 2: Calculate LTV

**Formula**: LTV = (ARPU × Gross Margin %) ÷ Churn Rate %

Where:
- **ARPU** = Average Revenue Per User (monthly or annual)
- **Gross Margin %** = (Revenue - COGS) ÷ Revenue
- **Churn Rate %** = % of customers who cancel each month

**Example**:
- ARPU: $100/month
- Gross margin: 80% (typical for SaaS)
- Churn rate: 5%/month
- **LTV = ($100 × 80%) ÷ 5% = $80 ÷ 0.05 = $1,600**

---

### Step 3: Calculate LTV:CAC Ratio

**Formula**: LTV:CAC = LTV ÷ CAC

**Example**:
- LTV: $1,600
- CAC: $500
- **LTV:CAC = $1,600 ÷ $500 = 3.2:1** ✅ (Good!)

---

### Step 4: Calculate Payback Period

**Formula**: Payback Period = CAC ÷ (ARPU × Gross Margin %)

**Example**:
- CAC: $500
- ARPU: $100/month
- Gross margin: 80%
- **Payback = $500 ÷ ($100 × 80%) = $500 ÷ $80 = 6.25 months** ✅ (Good!)

---

## Full Calculator (Advanced Version)

### Tab 1: Inputs

Copy this into Google Sheets:

| Metric | Value | Notes |
|--------|-------|-------|
| **Sales & Marketing Spend** |||
| Sales team salaries (monthly) | $[X] | Base + commission + benefits |
| Marketing spend (monthly) | $[X] | Ads, content, events, tools |
| **Total S&M Spend** | **$[X]** | Sum of above |
||||
| **New Customers** |||
| New customers (monthly) | [X] | Paying customers (not trials) |
||||
| **Revenue** |||
| ARPU (monthly) | $[X] | Average revenue per user |
| ARPU (annual) | $[X] | ARPU × 12 (if annual plans) |
||||
| **Costs** |||
| COGS per customer (monthly) | $[X] | Hosting, support, payment fees |
| Gross margin % | [X]% | (ARPU - COGS) ÷ ARPU |
||||
| **Retention** |||
| Monthly churn rate | [X]% | % who cancel each month |
| Annual churn rate | [X]% | % who cancel each year |
| Average customer lifetime (months) | [X] | 1 ÷ Monthly churn rate |

---

### Tab 2: Outputs

| Metric | Formula | Value | Status |
|--------|---------|-------|--------|
| **CAC** | S&M Spend ÷ New Customers | $[X] | |
| **LTV** | (ARPU × Gross Margin) ÷ Churn | $[X] | |
| **LTV:CAC Ratio** | LTV ÷ CAC | [X]:1 | 🟢 Good / 🟡 OK / 🔴 Bad |
| **Payback Period** | CAC ÷ (ARPU × Gross Margin) | [X] months | 🟢 <12mo / 🟡 12-18mo / 🔴 >18mo |
| **Breakeven Months** | Same as payback | [X] months | |
| **Gross Profit per Customer** | (ARPU × Gross Margin) × Lifetime | $[X] | |

---

### Tab 3: Scenario Analysis

Test different scenarios:

| Scenario | CAC | LTV | LTV:CAC | Payback | Notes |
|----------|-----|-----|---------|---------|-------|
| **Current** | $500 | $1,600 | 3.2:1 | 6.3mo | Baseline |
| **Reduce CAC by 20%** | $400 | $1,600 | 4:1 | 5mo | Focus on organic, referrals |
| **Increase ARPU by 20%** | $500 | $1,920 | 3.8:1 | 5.2mo | Upsell, price increase |
| **Reduce churn by 50%** | $500 | $3,200 | 6.4:1 | 6.3mo | Improve retention |
| **All improvements** | $400 | $3,840 | 9.6:1 | 4.2mo | Best case |

---

## Example: SaaS Company

### Inputs

**Sales & Marketing**:
- Sales team: 5 AEs × $10K/month = $50K
- Marketing: $20K/month (ads, tools, content)
- **Total S&M: $70K/month**

**New Customers**:
- New customers: 50/month

**Revenue**:
- ARPU: $200/month (average customer pays $200/mo)

**Costs**:
- COGS: $40/month/customer (hosting, support, payment fees)
- Gross margin: ($200 - $40) ÷ $200 = 80%

**Retention**:
- Monthly churn: 5% (5 out of 100 customers cancel each month)
- Average lifetime: 1 ÷ 5% = 20 months

---

### Outputs

**CAC**: $70,000 ÷ 50 = **$1,400**

**LTV**: ($200 × 80%) ÷ 5% = $160 ÷ 0.05 = **$3,200**

**LTV:CAC**: $3,200 ÷ $1,400 = **2.3:1** 🟡 (OK, but below 3:1 target)

**Payback**: $1,400 ÷ ($200 × 80%) = $1,400 ÷ $160 = **8.75 months** 🟢 (Good, under 12 months)

**Verdict**: Unit economics are OK but need improvement. Focus on:
1. Reducing CAC (more organic, referrals)
2. Increasing ARPU (upsell, annual plans)
3. Reducing churn (better onboarding, customer success)

---

## Benchmarks by Industry

### B2B SaaS

**Good**:
- LTV:CAC ≥ 3:1
- Payback ≤ 12 months
- Monthly churn ≤ 5%

**Typical**:
- CAC: $500-3,000 (SMB), $5,000-25,000 (Enterprise)
- LTV: $1,500-10,000 (SMB), $50,000-500,000 (Enterprise)
- Churn: 3-7%/month (SMB), 1-2%/month (Enterprise)

---

### E-commerce (Subscription)

**Good**:
- LTV:CAC ≥ 3:1
- Payback ≤ 6 months (faster than SaaS)
- Monthly churn ≤ 10%

**Typical**:
- CAC: $20-80 (consumer), $100-300 (premium)
- LTV: $100-500 (consumer), $500-2,000 (premium)
- Churn: 5-15%/month

---

### Consumer Apps (Freemium)

**Good**:
- LTV:CAC ≥ 3:1
- Payback ≤ 3 months (very fast)
- Monthly churn ≤ 15%

**Typical**:
- CAC: $1-10 (paid acquisition)
- LTV: $5-50 (in-app purchases, ads)
- Churn: 10-30%/month

---

## How to Improve Unit Economics

### 1. Reduce CAC (Get More Efficient)

**Tactics**:
- ✅ Focus on high-performing channels (cut low ROI channels)
- ✅ Build organic acquisition (SEO, content, referrals)
- ✅ Improve conversion rates (better landing pages, faster sales cycles)
- ✅ Target better-fit customers (easier to close, lower churn)

**Example**: Cut CAC from $1,400 to $1,000 (29% reduction)
- Before: LTV:CAC = 2.3:1
- After: LTV:CAC = 3.2:1 ✅

---

### 2. Increase LTV (Get More Revenue per Customer)

**Tactics**:
- ✅ Upsell/cross-sell (add-ons, premium tiers)
- ✅ Price increase (5-10% annually)
- ✅ Annual plans (12 months upfront vs monthly)
- ✅ Expand into higher-value customers (enterprise vs SMB)

**Example**: Increase ARPU from $200 to $250 (25% increase)
- Before: LTV = $3,200
- After: LTV = $4,000 (25% increase)
- New LTV:CAC = 4,000 ÷ 1,400 = 2.9:1 ✅

---

### 3. Reduce Churn (Keep Customers Longer)

**Tactics**:
- ✅ Better onboarding (80% of churn happens in first 90 days)
- ✅ Customer success (proactive check-ins)
- ✅ Product improvements (fix top reasons for churn)
- ✅ Annual contracts (harder to cancel)

**Example**: Reduce churn from 5% to 3% (40% reduction)
- Before: LTV = $3,200 (20 month lifetime)
- After: LTV = $5,333 (33 month lifetime)
- New LTV:CAC = 5,333 ÷ 1,400 = 3.8:1 ✅

---

## Red Flags

### 🚩 Red Flag 1: LTV:CAC < 1:1

**Meaning**: You're losing money on every customer
**Fix**: STOP GROWING. Fix unit economics first.
**Actions**:
- Cut marketing spend by 50%
- Focus on existing customers (retention, upsells)
- Fix churn (why are customers leaving?)
- Raise prices (if possible)

---

### 🚩 Red Flag 2: Payback > 24 months

**Meaning**: Takes 2+ years to recover acquisition cost
**Fix**: You'll run out of money before profitability
**Actions**:
- Reduce CAC aggressively (organic channels)
- Increase ARPU (upsell, annual plans)
- Reduce churn (better onboarding)
- Consider pivoting to shorter-cycle business

---

### 🚩 Red Flag 3: Monthly Churn > 10%

**Meaning**: You're losing customers faster than you can acquire them
**Fix**: Stop growing, fix retention
**Actions**:
- Interview churned customers (why did they leave?)
- Fix top 3 reasons for churn
- Implement customer success program
- Pause marketing until churn < 5%

---

### 🚩 Red Flag 4: CAC Increasing Over Time

**Meaning**: Acquisition is getting more expensive (channels saturating)
**Fix**: Diversify channels, improve efficiency
**Actions**:
- Audit marketing channels (which are rising?)
- Cut underperforming channels
- Invest in organic (SEO, content, referrals)
- Improve conversion rates (better landing pages)

---

### 🚩 Red Flag 5: LTV Decreasing Over Time

**Meaning**: Customers are staying shorter or spending less
**Fix**: Fix retention, improve product
**Actions**:
- Cohort analysis (why are recent cohorts churning faster?)
- Survey customers (what changed?)
- Improve onboarding (especially for new customers)
- Launch customer success program

---

## Advanced: Cohort Analysis

Track LTV by cohort (month acquired):

| Cohort | Customers | Month 1 Rev | Month 6 Rev | Month 12 Rev | LTV (Projected) |
|--------|-----------|-------------|-------------|--------------|-----------------|
| Jan 2025 | 50 | $10,000 | $8,000 | $6,000 | $3,200 |
| Feb 2025 | 55 | $11,000 | $9,000 | $7,000 | $3,500 |
| Mar 2025 | 60 | $12,000 | $10,000 | $8,500 | $4,000 |

**Insight**: March cohort has 25% higher LTV than January. Why?
- Better onboarding?
- Higher-quality customers?
- Product improvements?

**Action**: Double down on what's working in March cohort.

---

## Google Sheets Template

### Formula Reference

**Cell B1** (CAC):
```
=B5/B6
```
Where:
- B5 = Total S&M Spend
- B6 = New Customers

**Cell B2** (LTV):
```
=(B8*B10)/B12
```
Where:
- B8 = ARPU
- B10 = Gross Margin %
- B12 = Monthly Churn %

**Cell B3** (LTV:CAC):
```
=B2/B1
```

**Cell B4** (Payback):
```
=B1/(B8*B10)
```

**Cell B5** (Status):
```
=IF(B3>=3,"🟢 Good",IF(B3>=2,"🟡 OK","🔴 Bad"))
```

---

## Common Mistakes

### ❌ Mistake 1: Including All Marketing Spend in CAC

**Wrong**: Include brand marketing, PR, events (non-measurable)
**Right**: Only include marketing with direct attribution (ads, SDRs)

**Example**:
- Total marketing: $50K ($20K performance ads, $30K brand/PR)
- **Correct CAC**: Use $20K (performance ads only)

---

### ❌ Mistake 2: Using Revenue Instead of Gross Profit for LTV

**Wrong**: LTV = ARPU × Lifetime (ignores costs)
**Right**: LTV = (ARPU × Gross Margin %) × Lifetime

**Example**:
- ARPU: $100/month
- Gross margin: 60%
- Lifetime: 20 months
- **Wrong LTV**: $100 × 20 = $2,000
- **Correct LTV**: ($100 × 60%) × 20 = $1,200

---

### ❌ Mistake 3: Measuring Churn on Total Base (Not Cohort)

**Wrong**: "We had 100 customers, 5 churned, so 5% churn"
**Right**: Track by cohort (customers acquired same month)

**Why**: Early customers are more loyal. Total base churn masks poor retention in new cohorts.

---

## Next Steps

1. **Gather data** (S&M spend, new customers, ARPU, churn)
2. **Calculate CAC and LTV** (use formulas above)
3. **Compare to benchmarks** (LTV:CAC ≥ 3:1, payback ≤ 12mo)
4. **Identify improvement areas** (CAC, LTV, churn)
5. **Set 90-day goals** (e.g., "Reduce CAC by 20%")

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related guides**: [SaaS Cost Optimization](../../saas-cost-optimization-guide/), [Founder Scaling](../../saas-optimization-guide/)
