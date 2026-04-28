# Burn Rate Calculator

**Purpose**: Calculate how long your money will last and when you'll run out
**Time to Complete**: 15-30 minutes
**Use Case**: Startups, pre-revenue companies, VC-backed companies
**Output**: Burn rate, runway months, breakeven date, cash flow forecast

---

## What is Burn Rate?

**Burn rate** = How much cash you're spending per month

**Two types**:
1. **Gross burn**: Total monthly expenses (all cash out)
2. **Net burn**: Expenses - Revenue (cash out minus cash in)

**Example**:
- Monthly expenses: $200K
- Monthly revenue: $50K
- **Gross burn**: $200K/month
- **Net burn**: $150K/month

**Most people mean "net burn" when they say "burn rate"**

---

## Quick Calculator (Simple Version)

### Step 1: Calculate Net Burn

**Formula**: Net Burn = Monthly Expenses - Monthly Revenue

**Example**:
- Expenses: $200K/month
- Revenue: $50K/month
- **Net Burn = $200K - $50K = $150K/month**

---

### Step 2: Calculate Runway

**Formula**: Runway (months) = Cash in Bank ÷ Net Burn

**Example**:
- Cash in bank: $1.8M
- Net burn: $150K/month
- **Runway = $1.8M ÷ $150K = 12 months**

---

### Step 3: Calculate Breakeven Date

**Formula**: Breakeven Date = Today + Runway (if burn stays constant)

**Example**:
- Today: February 2026
- Runway: 12 months
- **Breakeven Date = February 2027**

**Note**: This assumes burn stays constant. In reality, burn changes (increases with hiring, decreases with revenue growth).

---

## Full Calculator (Advanced Version)

### Tab 1: Monthly Expenses

| Expense Category | Amount | Notes |
|------------------|--------|-------|
| **Payroll** |||
| Engineering salaries | $[X] | [X] engineers × avg $[Y]/month |
| Sales salaries | $[X] | [X] AEs × avg $[Y]/month |
| Marketing salaries | $[X] | [X] people × avg $[Y]/month |
| Operations salaries | $[X] | [X] people × avg $[Y]/month |
| G&A salaries (CEO, CFO, HR) | $[X] | [X] people × avg $[Y]/month |
| **Total Payroll** | **$[X]** | 50-70% of expenses for most startups |
||||
| **Non-Payroll** |||
| Marketing/advertising | $[X] | Paid ads, events, content |
| Cloud/hosting (AWS, GCP) | $[X] | Infrastructure costs |
| Software/tools | $[X] | SaaS subscriptions (Slack, Notion, etc.) |
| Office rent | $[X] | Office space (if not remote) |
| Travel | $[X] | Conferences, sales trips |
| Legal/accounting | $[X] | Lawyers, accountants |
| Insurance | $[X] | D&O, health, liability |
| Recruiting/hiring | $[X] | Recruiters, job boards |
| Other | $[X] | Miscellaneous |
| **Total Non-Payroll** | **$[X]** | 30-50% of expenses |
||||
| **Total Monthly Expenses** | **$[X]** | Sum of payroll + non-payroll |

---

### Tab 2: Monthly Revenue

| Revenue Stream | Amount | Notes |
|----------------|--------|-------|
| **Recurring Revenue (MRR)** |||
| Subscription revenue | $[X] | Monthly subscription customers |
| SaaS revenue | $[X] | Annual contracts / 12 |
| **Total MRR** | **$[X]** ||
||||
| **One-Time Revenue** |||
| Setup fees | $[X] | Implementation, onboarding |
| Services revenue | $[X] | Consulting, custom dev |
| Other | $[X] | One-off sales |
| **Total One-Time** | **$[X]** ||
||||
| **Total Monthly Revenue** | **$[X]** | MRR + one-time |

---

### Tab 3: Cash Flow & Runway

| Metric | Formula | Value |
|--------|---------|-------|
| **Cash in Bank (Today)** | [Current balance] | $[X] |
| **Monthly Expenses** | From Tab 1 | $[X] |
| **Monthly Revenue** | From Tab 2 | $[X] |
| **Net Burn Rate** | Expenses - Revenue | $[X]/month |
| **Runway (Months)** | Cash ÷ Net Burn | [X] months |
| **Runway End Date** | Today + Runway | [Month Year] |
| **Breakeven Revenue** | When Revenue = Expenses | $[X]/month |
| **Current Revenue** | From Tab 2 | $[X]/month |
| **Gap to Breakeven** | Breakeven - Current | $[X]/month |

---

### Tab 4: 12-Month Forecast

| Month | Revenue | Expenses | Net Burn | Cash Balance | Runway |
|-------|---------|----------|----------|--------------|--------|
| **Feb 2026** | $50K | $200K | -$150K | $1,800K | 12 mo |
| **Mar 2026** | $55K | $205K | -$150K | $1,650K | 11 mo |
| **Apr 2026** | $60K | $210K | -$150K | $1,500K | 10 mo |
| **May 2026** | $66K | $215K | -$149K | $1,351K | 9 mo |
| **Jun 2026** | $73K | $220K | -$147K | $1,204K | 8 mo |
| **Jul 2026** | $80K | $225K | -$145K | $1,059K | 7 mo |
| **Aug 2026** | $88K | $230K | -$142K | $917K | 6 mo |
| **Sep 2026** | $97K | $235K | -$138K | $779K | 5 mo |
| **Oct 2026** | $107K | $240K | -$133K | $646K | 4 mo |
| **Nov 2026** | $118K | $245K | -$127K | $519K | 3 mo |
| **Dec 2026** | $130K | $250K | -$120K | $399K | 2 mo |
| **Jan 2027** | $143K | $255K | -$112K | $287K | 1 mo |

**Assumptions**:
- Revenue grows 10% MoM
- Expenses grow 2.5% MoM (inflation + slow hiring)

**Result**: Runway extends from 12 months to 14 months (due to revenue growth)

---

## Example: Early-Stage SaaS Startup

### Inputs

**Monthly Expenses** ($180K total):
- Payroll: $120K
  - 5 engineers × $15K = $75K
  - 2 sales × $12K = $24K
  - 1 marketer × $10K = $10K
  - CEO/CFO × $0.5K = $1K (taking low salary)
- Non-payroll: $60K
  - Marketing: $30K (paid ads)
  - Cloud: $10K (AWS, Vercel)
  - Tools: $5K (Slack, Notion, GitHub, etc.)
  - Legal/accounting: $5K
  - Other: $10K

**Monthly Revenue** ($40K):
- MRR: $35K (70 customers × $500/month)
- Setup fees: $5K (1-2 new customers/month)

**Cash in Bank**: $1.4M (raised $2M seed 8 months ago)

---

### Outputs

**Net Burn**: $180K - $40K = **$140K/month**

**Runway**: $1.4M ÷ $140K = **10 months** (until December 2026)

**Breakeven Revenue**: $180K/month (need to grow from $40K to $180K = 4.5x)

**Gap to Breakeven**: $180K - $40K = **$140K/month** (need $140K more MRR)

---

## What-If Scenarios

### Scenario 1: Base Case (Current Plan)

- Revenue grows 15% MoM (aggressive but achievable)
- Expenses grow 5% MoM (hiring 1 person/month)
- **Result**: Runway extends to 14 months (vs 10 months if flat)

### Scenario 2: Cut Burn by 30%

- Cut marketing spend from $30K to $15K
- Freeze hiring (expenses stay flat at $180K)
- **Result**: Burn drops from $140K to $125K → Runway extends to 11 months

### Scenario 3: Grow Revenue 25% MoM (Aggressive)

- Double down on sales (hire 1 more AE)
- Increase marketing to $40K/month
- Expenses increase to $195K
- **Result**: Reach breakeven in 9 months (vs 10 months base case)

---

## Burn Rate Benchmarks

### By Stage

| Stage | Typical Burn | Runway Target | Notes |
|-------|--------------|---------------|-------|
| **Pre-seed** | $20K-50K/mo | 12-18 months | Lean team (2-5 people) |
| **Seed** | $100K-200K/mo | 18-24 months | Small team (5-15 people) |
| **Series A** | $300K-500K/mo | 18-24 months | Growing team (15-30 people) |
| **Series B** | $500K-1M/mo | 18-24 months | Scaling team (30-100 people) |

### By Headcount

| Headcount | Typical Burn | Notes |
|-----------|--------------|-------|
| **1-5 people** | $30K-80K/mo | Mostly salaries |
| **5-10 people** | $80K-150K/mo | Salaries + marketing |
| **10-20 people** | $150K-300K/mo | Salaries + marketing + scale costs |
| **20-50 people** | $300K-600K/mo | Full go-to-market motion |
| **50-100 people** | $600K-1.2M/mo | Significant infrastructure |

---

## Red Flags

### 🚩 Red Flag 1: Runway < 6 Months

**Problem**: Not enough time to raise money (fundraising takes 3-6 months)
**Fix**: Cut burn immediately OR raise emergency bridge round

**Actions**:
- Cut 30-50% of expenses (freeze hiring, cut marketing)
- Prioritize revenue (sell harder, close deals faster)
- Reach out to existing investors for bridge funding
- Consider layoffs if necessary (last resort)

---

### 🚩 Red Flag 2: Burn Increasing Faster Than Revenue

**Problem**: Expenses growing 20%/month, revenue growing 10%/month
**Fix**: Unit economics broken, fix before scaling

**Actions**:
- Freeze hiring until unit economics work
- Cut non-essential spend (marketing, travel, events)
- Focus on retention (stop churn)
- Fix CAC payback period (should be <12 months)

---

### 🚩 Red Flag 3: No Path to Breakeven

**Problem**: Need to 10x revenue to break even (not realistic)
**Fix**: Cut burn OR pivot business model

**Example**:
- Current: $40K revenue, $180K expenses
- Need: $180K revenue (4.5x growth)
- If 4.5x takes >2 years → Not enough runway

**Actions**:
- Cut burn to make breakeven more achievable ($100K expenses = 2.5x growth)
- Increase prices (faster path to breakeven)
- Consider pivot (different business model)

---

### 🚩 Red Flag 4: Burning Entire Raise in <12 Months

**Problem**: Raised $2M, burning $200K/month = 10 months runway
**Fix**: You raised too little OR spending too much

**Actions**:
- Cut burn by 30-50% (freeze hiring)
- Extend runway to 18-24 months (safe zone)
- Raise more money (if possible)

---

## How to Extend Runway

### 1. Cut Expenses (Immediate)

**Fastest wins**:
- ✅ Freeze hiring (save $10K-30K/month per role)
- ✅ Cut marketing spend by 50% (usually safe short-term)
- ✅ Renegotiate contracts (cloud, software, office)
- ✅ Cancel unused tools (audit Slack channels for what's actually used)
- ✅ Reduce travel/events (conferences, offsites)

**Example**:
- Cut 3 planned hires = $60K/month saved
- Cut marketing $30K → $15K = $15K/month saved
- Renegotiate cloud bill (AWS credits) = $5K/month saved
- **Total savings: $80K/month**
- **Runway before: 10 months**
- **Runway after: 17 months** ($1.4M ÷ $82K)

---

### 2. Grow Revenue (Medium-term)

**Tactics**:
- ✅ Close pipeline faster (shorten sales cycle)
- ✅ Upsell existing customers (easier than new logos)
- ✅ Increase prices (5-10% for new customers)
- ✅ Annual contracts (get 12 months upfront)
- ✅ Reduce churn (save existing revenue)

**Example**:
- Close 2 extra deals/month = +$10K MRR
- Upsell 10 customers = +$5K MRR
- Price increase (new customers) = +$2K MRR
- **Total: +$17K MRR**
- **Burn before: $140K/month**
- **Burn after: $123K/month**
- **Runway: 11 months** (vs 10 months)

---

### 3. Raise Money (Long-term)

**Options**:
- Venture debt (6-12 months runway extension, no dilution)
- Bridge round from existing investors (fast, low dilution)
- Full fundraise (3-6 months, high dilution)

**When to raise**:
- Ideally when runway > 12 months (raise from strength)
- Latest when runway = 6 months (still possible but harder)
- If runway < 6 months → Emergency bridge or cut burn

---

## Cash Flow Traps to Avoid

### Trap 1: Annual Contracts (Cash Timing)

**Problem**: Customer pays $100K upfront, but you recognize $8.3K/month
**Impact**: Your bank account is high, but MRR is low (misleading)

**Fix**: Track both:
- **Cash in bank**: What you actually have
- **MRR**: Monthly run rate (recurring revenue)

**Example**:
- 10 customers pay $10K each upfront (annual contracts)
- Bank account: +$100K (looks great!)
- MRR: $8.3K (still burning $140K/month - danger!)

---

### Trap 2: One-Time Revenue (Not Recurring)

**Problem**: Land a $500K consulting project, think you're profitable
**Impact**: Burn rate temporarily looks good, but not sustainable

**Fix**: Separate one-time and recurring revenue
- **MRR** (recurring): The only sustainable revenue
- **One-time** (consulting, setup fees): Don't rely on this

---

### Trap 3: Delayed Payment (ARR ≠ Cash)

**Problem**: Customer signs $100K contract, pays Net-60 (60 days later)
**Impact**: ARR increases, but cash doesn't arrive for 2 months

**Fix**: Track:
- **ARR**: Contracted revenue (what they owe)
- **Cash collected**: Actual cash in bank (what you have)
- **DSO**: Days Sales Outstanding (how long to collect)

---

## Google Sheets Formula Reference

### Cell B1 (Net Burn):
```
=B5-B6
```
Where:
- B5 = Total Monthly Expenses
- B6 = Total Monthly Revenue

### Cell B2 (Runway):
```
=B4/B1
```
Where:
- B4 = Cash in Bank
- B1 = Net Burn

### Cell B3 (Runway End Date):
```
=EDATE(TODAY(), B2)
```
Where:
- B2 = Runway (months)
- EDATE adds months to today's date

### Cell B4 (Breakeven Revenue):
```
=B5
```
Where:
- B5 = Total Monthly Expenses
- Breakeven = when revenue equals expenses

### Cell B5 (Status):
```
=IF(B2>=18,"🟢 Safe",IF(B2>=12,"🟡 OK",IF(B2>=6,"🟠 Caution","🔴 Danger")))
```
- Green: 18+ months runway (safe)
- Yellow: 12-18 months (okay)
- Orange: 6-12 months (caution - consider fundraising)
- Red: <6 months (danger - cut burn or raise now)

---

## Common Mistakes

### ❌ Mistake 1: Not Tracking Burn Rate Monthly

**Wrong**: "We'll check burn rate at year-end"
**Right**: Track burn rate monthly, review in monthly board meetings

---

### ❌ Mistake 2: Including Non-Cash Expenses

**Wrong**: Including depreciation, amortization in burn rate
**Right**: Only count cash expenses (salaries, marketing, rent)

**Why**: Burn rate = cash out the door. Non-cash expenses don't affect runway.

---

### ❌ Mistake 3: Forgetting Taxes

**Wrong**: "We make $50K revenue, so burn is $150K"
**Right**: After taxes (if applicable), actual cash is less

**Example**:
- Revenue: $50K
- Taxes (20%): $10K
- **Net cash in: $40K**
- **Burn: $160K** (not $150K)

---

## Next Steps

1. **Calculate current burn rate** (use Tab 1-3 above)
2. **Check runway** (is it >12 months? >6 months?)
3. **Forecast next 12 months** (use Tab 4, adjust assumptions)
4. **Identify actions** (cut burn? grow revenue? raise money?)
5. **Track monthly** (update sheet every month)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related guides**: [Founder Scaling Guide](../../saas-optimization-guide/), [CFO Cost Optimization](../../saas-cost-optimization-guide/)
