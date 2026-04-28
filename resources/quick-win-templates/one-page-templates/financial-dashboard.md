# Financial Dashboard Metrics (1-Page)

**Purpose**: Track the 15-20 most important financial metrics for your business
**Time to Complete**: 20-30 minutes to set up
**Use Case**: Founders, CFOs tracking company financial health
**Output**: Live dashboard with key metrics updated monthly/weekly

---

## Why a Financial Dashboard?

**Without dashboard**:
- ❌ "How are we doing?" → 2 hours to pull reports
- ❌ Different numbers from different people
- ❌ Reactive (discover problems too late)

**With dashboard**:
- ✅ Answer "How are we doing?" in 30 seconds
- ✅ Single source of truth
- ✅ Proactive (catch problems early)

---

## Core Financial Metrics (All Companies)

| Metric | Formula | Target | Frequency |
|--------|---------|--------|-----------|
| **Cash in Bank** | Bank balance | >6 months runway | Daily |
| **Burn Rate** | Expenses - Revenue | Decreasing | Monthly |
| **Runway** | Cash ÷ Burn Rate | >12 months | Monthly |
| **Revenue (Monthly)** | Total sales | Growing MoM | Monthly |
| **Revenue Growth Rate** | (This Month - Last Month) ÷ Last Month | >10% MoM | Monthly |
| **Gross Margin** | (Revenue - COGS) ÷ Revenue | >70% (SaaS), >40% (e-commerce) | Monthly |
| **Operating Margin** | (Revenue - All Expenses) ÷ Revenue | Improving toward 20%+ | Monthly |

---

## SaaS-Specific Metrics

| Metric | Formula | Target | Frequency |
|--------|---------|--------|-----------|
| **MRR** | Monthly Recurring Revenue | Growing 10-20% MoM | Weekly |
| **ARR** | MRR × 12 | For Series A+: >$2M | Monthly |
| **New MRR** | MRR from new customers | Growing | Monthly |
| **Churn Rate** | % customers who cancel | <5% monthly (SaaS) | Monthly |
| **Net Revenue Retention** | (Start MRR + Upsells - Churned) ÷ Start MRR | >100% | Monthly |
| **CAC** | Sales & Marketing Spend ÷ New Customers | Decreasing | Monthly |
| **LTV** | (ARPU × Gross Margin) ÷ Churn Rate | LTV:CAC >3:1 | Quarterly |
| **Payback Period** | CAC ÷ (ARPU × Gross Margin) | <12 months | Quarterly |
| **Magic Number** | (New MRR × 4) ÷ S&M Spend | >0.75 (efficient) | Quarterly |

---

## E-commerce Metrics

| Metric | Formula | Target | Frequency |
|--------|---------|--------|-----------|
| **GMV** | Gross Merchandise Value | Growing | Weekly |
| **Orders** | Number of orders | Growing | Weekly |
| **AOV** | Average Order Value | Growing | Weekly |
| **Repeat Rate** | % customers who order 2+ times | >30% | Monthly |
| **CAC** | Marketing Spend ÷ New Customers | <AOV | Monthly |
| **Contribution Margin** | (Revenue - COGS - Shipping - Payment Fees) ÷ Revenue | >20% | Monthly |
| **Inventory Turnover** | COGS ÷ Average Inventory | >6x/year | Monthly |

---

## Dashboard Template (Google Sheets)

### Tab 1: Key Metrics Summary

| Metric | This Month | Last Month | Change | Target | Status |
|--------|------------|------------|--------|--------|--------|
| **Cash** | $1,500K | $1,650K | -$150K | >$1,000K | 🟢 |
| **Burn Rate** | $150K/mo | $160K/mo | -$10K | <$150K | 🟢 |
| **Runway** | 10 months | 10 months | 0 | >12 mo | 🟡 |
| **MRR** | $85K | $75K | +$10K | $100K | 🟢 |
| **MRR Growth** | 13% | 15% | -2% | >10% | 🟢 |
| **Churn** | 4% | 5% | -1% | <5% | 🟢 |
| **CAC** | $450 | $500 | -$50 | <$400 | 🟡 |
| **LTV:CAC** | 3.2:1 | 3.0:1 | +0.2 | >3:1 | 🟢 |

**Status**:
- 🟢 Green: On track or ahead
- 🟡 Yellow: Close to target, watch closely
- 🔴 Red: Below target, needs action

---

### Tab 2: Revenue Breakdown

| Revenue Source | This Month | Last Month | % of Total | Growth |
|----------------|------------|------------|------------|--------|
| **New MRR** | $15K | $12K | 18% | +25% |
| **Expansion MRR** | $3K | $2K | 4% | +50% |
| **Churned MRR** | -$3K | -$4K | -4% | -25% |
| **Net New MRR** | $15K | $10K | 18% | +50% |
||||
| **Total MRR** | $85K | $75K | 100% | +13% |
||||
| **ARR** | $1,020K | $900K | | +13% |

---

### Tab 3: Expense Breakdown

| Expense Category | This Month | Last Month | % of Revenue | Change |
|------------------|------------|------------|--------------|--------|
| **Payroll** | $90K | $90K | 106% | 0% |
| - Engineering | $40K | $40K | 47% | 0% |
| - Sales | $25K | $25K | 29% | 0% |
| - Marketing | $15K | $15K | 18% | 0% |
| - Operations | $10K | $10K | 12% | 0% |
||||
| **Non-Payroll** | $60K | $70K | 71% | -14% |
| - Marketing/Ads | $35K | $40K | 41% | -13% |
| - Cloud/Hosting | $10K | $12K | 12% | -17% |
| - Tools/Software | $5K | $5K | 6% | 0% |
| - Other | $10K | $13K | 12% | -23% |
||||
| **Total Expenses** | $150K | $160K | 176% | -6% |
||||
| **Net Burn** | -$65K | -$85K | -76% | -24% |

**Note**: When "% of Revenue" < 100%, you're profitable. When >100%, you're burning cash.

---

### Tab 4: Customer Metrics

| Metric | This Month | Last Month | Change | Target |
|--------|------------|------------|--------|--------|
| **Total Customers** | 170 | 150 | +20 | 200 |
| **New Customers** | 25 | 20 | +5 | 25 |
| **Churned Customers** | 5 | 8 | -3 | <8 |
| **Net New Customers** | +20 | +12 | +8 | +20 |
||||
| **ARPU** | $500 | $500 | $0 | $500 |
| **CAC** | $450 | $500 | -$50 | <$400 |
| **LTV** | $1,440 | $1,440 | $0 | >$1,200 |
| **LTV:CAC** | 3.2:1 | 2.9:1 | +0.3 | >3:1 |
||||
| **Monthly Churn** | 4% | 5% | -1% | <5% |
| **NRR** | 102% | 98% | +4% | >100% |

---

## How to Set Up Your Dashboard

### Step 1: Choose Your Tool

**Simple** (Recommended for startups):
- Google Sheets (free, easy to share)
- Notion (database views)
- Airtable (database + visualizations)

**Advanced** (For Series A+):
- Metabase (open-source BI)
- ChartMogul (SaaS-specific)
- Looker/Tableau (enterprise BI)

**Recommendation**: Start with Google Sheets. Upgrade to Metabase/ChartMogul when >50 people.

---

### Step 2: Connect Data Sources

**Manual** (Early-stage):
- Export data from Stripe, QuickBooks, bank monthly
- Copy-paste into Google Sheets
- Update formulas

**Automated** (Later-stage):
- Zapier (connect Stripe → Google Sheets)
- Segment (warehouse → BI tool)
- Native integrations (ChartMogul ← Stripe)

---

### Step 3: Set Update Frequency

| Metric | Frequency | Who Updates |
|--------|-----------|-------------|
| Cash in bank | Daily | CFO/Founder |
| MRR | Weekly | Finance/RevOps |
| Churn | Monthly | CS/RevOps |
| CAC/LTV | Monthly | Finance |
| Burn rate | Monthly | CFO |

---

### Step 4: Share with Team

**Who sees what**:
- **Full dashboard**: Founders, executives, board
- **Department metrics**: Department heads (Sales sees sales metrics)
- **High-level summary**: All employees (transparency)

**Where to share**:
- Monthly all-hands (show 5-10 key metrics)
- Weekly leadership meeting (review full dashboard)
- Slack channel (automated updates from dashboard)

---

## Example: Early-Stage SaaS Dashboard

### Summary (Top of Dashboard)

**Company**: GreenCart (Sustainable Grocery Delivery)
**As of**: February 2026
**Stage**: Seed ($2M raised 8 months ago)

| Category | Status | Details |
|----------|--------|---------|
| **Financial Health** | 🟡 | 10 months runway, need to extend |
| **Growth** | 🟢 | MRR growing 13% MoM |
| **Unit Economics** | 🟢 | LTV:CAC 3.2:1, payback 9 months |
| **Product** | 🟢 | 4% churn (below 5% target) |

---

### Key Metrics (Last 6 Months)

| Month | MRR | Customers | Churn | CAC | Burn | Runway |
|-------|-----|-----------|-------|-----|------|--------|
| Sep 25 | $50K | 100 | 6% | $600 | $180K | 11 mo |
| Oct 25 | $55K | 110 | 5% | $550 | $175K | 11 mo |
| Nov 25 | $62K | 124 | 5% | $530 | $170K | 11 mo |
| Dec 25 | $68K | 136 | 5% | $510 | $165K | 11 mo |
| Jan 26 | $75K | 150 | 5% | $500 | $160K | 10 mo |
| Feb 26 | $85K | 170 | 4% | $450 | $150K | 10 mo |

**Trends**:
- ✅ MRR accelerating (13% MoM vs 10% avg)
- ✅ Churn improving (6% → 4%)
- ✅ CAC decreasing ($600 → $450)
- 🟡 Runway flat (need to cut burn or grow faster)

---

### Action Items (Bottom of Dashboard)

**This Month's Priorities**:
1. 🔴 **Extend runway**: Cut burn to $130K/month (freeze 2 planned hires)
2. 🟢 **Improve CAC**: Launch referral program (target CAC <$400)
3. 🟢 **Reduce churn**: Implement customer success program (target <3%)

---

## Dashboard Best Practices

### 1. Keep It Simple

**Bad**: 50 metrics on one page
**Good**: 10-15 key metrics (fits on one screen)

---

### 2. Update Regularly

**Bad**: Update dashboard once a quarter
**Good**: Update monthly (or weekly for fast-growing companies)

---

### 3. Show Trends, Not Just Snapshots

**Bad**: "MRR is $85K"
**Good**: "MRR is $85K, up 13% MoM (vs 10% last month)"

---

### 4. Use Color Coding

**Bad**: All numbers in black
**Good**: Green (good), yellow (caution), red (action needed)

---

### 5. Add Context

**Bad**: "LTV:CAC = 3.2:1"
**Good**: "LTV:CAC = 3.2:1 (target >3:1 ✅, benchmark 3-5:1 for SaaS)"

---

## Common Mistakes

### ❌ Mistake 1: Vanity Metrics

**Wrong**: "We have 10,000 users!" (but only 100 paying)
**Right**: Focus on revenue, not users

**Vanity metrics to avoid**:
- Total users (if free)
- Page views (if not monetized)
- Social media followers (if no conversion)

---

### ❌ Mistake 2: Not Tracking Cohorts

**Wrong**: "Our churn is 4%" (total customer base)
**Right**: "Sep cohort: 3% churn, Oct cohort: 5% churn" (identify problem cohorts)

---

### ❌ Mistake 3: Ignoring Leading Indicators

**Wrong**: Only track lagging indicators (revenue, churn)
**Right**: Also track leading indicators (pipeline, trial conversions, NPS)

**Example**:
- Lagging: Churn (tells you what happened)
- Leading: NPS (predicts future churn)

---

## Tools for Building Dashboards

### Google Sheets (Free)
**Pros**: Free, easy to share, good for <50 people
**Cons**: Manual updates, limited visualizations
**Best for**: Pre-seed to Seed

### ChartMogul ($100-500/mo)
**Pros**: Auto-sync with Stripe, SaaS metrics built-in, beautiful
**Cons**: $$, SaaS-only
**Best for**: Series A SaaS companies

### Metabase (Free/Self-Hosted)
**Pros**: Open-source, SQL access, customizable
**Cons**: Requires technical setup, self-hosting
**Best for**: Technical teams, Series A+

### Looker/Tableau ($$$)
**Pros**: Enterprise-grade, unlimited customization
**Cons**: $$$, complex setup
**Best for**: Series B+

---

## Google Sheets Formula Cheat Sheet

**MRR Growth Rate**:
```
=(THIS_MONTH_MRR - LAST_MONTH_MRR) / LAST_MONTH_MRR
```

**Churn Rate**:
```
=CHURNED_CUSTOMERS / START_OF_MONTH_CUSTOMERS
```

**CAC**:
```
=(SALES_SALARIES + MARKETING_SPEND) / NEW_CUSTOMERS
```

**LTV**:
```
=(ARPU * GROSS_MARGIN_PERCENT) / MONTHLY_CHURN_RATE
```

**Payback Period**:
```
=CAC / (ARPU * GROSS_MARGIN_PERCENT)
```

**Runway**:
```
=CASH_IN_BANK / NET_BURN_RATE
```

---

## Next Steps

1. **Choose your tool** (Google Sheets for early-stage)
2. **Select 10-15 metrics** (use templates above based on your business type)
3. **Build dashboard** (2-3 hours first time)
4. **Set update schedule** (monthly or weekly)
5. **Share with team** (all-hands, Slack, meetings)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Burn Rate Calculator](../../spreadsheet-calculators/burn-rate-calculator.md), [Unit Economics Calculator](../../spreadsheet-calculators/unit-economics-calculator.md)
