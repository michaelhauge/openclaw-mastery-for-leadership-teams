# Pricing Sensitivity Analysis (Spreadsheet)

**Purpose**: Test different price points and predict impact on conversions and revenue
**Time to Complete**: 2-3 hours (initial analysis), run before pricing changes
**Use Case**: Founders, product managers, pricing strategists testing new pricing
**Output**: Revenue projections at different price points, optimal pricing recommendation

---

## Pricing Sensitivity Formula

**Price Elasticity of Demand** = % Change in Quantity Demanded ÷ % Change in Price

**Optimal Price** = Price that maximizes revenue (Price × Volume)

**Example**:
- Current: $100/month, 1,000 customers, $100K MRR
- Test: $120/month (+20% price), 850 customers (-15% conversion), $102K MRR
- **Result**: +20% price → -15% customers → +2% revenue (price increase wins)

---

## Pricing Sensitivity Analysis Spreadsheet

### Tab 1: Current State (Baseline)

**Current Pricing**:

| Metric | Value | Notes |
|--------|-------|-------|
| **Price per Month** | $100 | Current subscription price |
| **Trial-to-Paid Conversion** | 25% | 25% of trials convert |
| **Monthly Trials** | 400 | New trials per month |
| **New Customers per Month** | 100 | 400 trials × 25% conversion |
| **Churn Rate** | 5% | Monthly churn |
| **Current Customers** | 1,000 | Active paying customers |
| **Monthly Recurring Revenue (MRR)** | $100,000 | 1,000 customers × $100 |
| **Annual Recurring Revenue (ARR)** | $1.2M | MRR × 12 |

---

### Tab 2: Price Sensitivity Test (Scenarios)

**Test Multiple Price Points**:

| Scenario | Price | Price Change | Conversion Impact | New Customers/Month | Total Customers (Year 1) | MRR (Year 1) | ARR (Year 1) | Revenue Change |
|----------|-------|--------------|-------------------|---------------------|--------------------------|--------------|--------------|----------------|
| **Current (Baseline)** | $100 | 0% | 25% | 100 | 1,500 | $150K | $1.8M | 0% |
| **Scenario 1: -20%** | $80 | -20% | 30% (+20%) | 120 | 1,740 | $139K | $1.67M | -7% |
| **Scenario 2: -10%** | $90 | -10% | 27% (+8%) | 108 | 1,596 | $144K | $1.72M | -4% |
| **Scenario 3: +10%** | $110 | +10% | 23% (-8%) | 92 | 1,404 | $154K | $1.85M | +3% |
| **Scenario 4: +20%** | $120 | +20% | 20% (-20%) | 80 | 1,260 | $151K | $1.81M | +1% |
| **Scenario 5: +30%** | $130 | +30% | 18% (-28%) | 72 | 1,164 | $151K | $1.81M | +1% |
| **Scenario 6: +50%** | $150 | +50% | 15% (-40%) | 60 | 1,020 | $153K | $1.84M | +2% |

**Assumptions**:
- Price elasticity: -1.5 (every 10% price increase → 15% conversion decrease)
- Churn stays constant at 5% (realistic assumption)
- Trial volume stays constant at 400/month (may decrease with higher price due to less inbound interest)

**Key Insights**:
- **Sweet spot**: $110/month (+10% price, +3% revenue, $50K more ARR)
- **Max revenue**: $110-130/month range ($1.85M ARR)
- **Avoid**: $80/month (lower price doesn't compensate for lost revenue)
- **Risk**: $150/month (50% price increase loses too many customers)

---

### Tab 3: Tiered Pricing Analysis

**Compare Single Tier vs Multi-Tier Pricing**:

**Current (Single Tier)**:
- $100/month, 1,000 customers, $100K MRR

**Proposed (Three Tiers)**:

| Tier | Price | % of Customers | Customer Count | MRR Contribution | Notes |
|------|-------|----------------|----------------|------------------|-------|
| **Starter** | $50/month | 30% | 300 | $15K | Small businesses, basic features |
| **Professional** | $100/month | 50% | 500 | $50K | Current customers, standard features |
| **Enterprise** | $250/month | 20% | 200 | $50K | Large teams, advanced features |
| **Total** | - | 100% | 1,000 | **$115K** | +15% MRR from tiering |

**Analysis**:
- 30% of customers downgrade to $50 (Starter)
- 50% stay at $100 (Professional)
- 20% upgrade to $250 (Enterprise)
- **Net impact**: +15% MRR ($15K more per month)

**Why Tiering Works**:
- Captures customers with lower willingness to pay ($50 Starter)
- Captures customers with higher willingness to pay ($250 Enterprise)
- Reduces churn (customers can downgrade instead of cancel)

---

### Tab 4: Feature-Based Pricing

**Test Charging for Features**:

**Current**: All features included at $100/month

**Proposed**: Base + add-ons

| Item | Price | % Attach Rate | MRR Impact |
|------|-------|---------------|------------|
| **Base Plan** | $80/month | 100% (1,000 customers) | $80K |
| **Add-on: Advanced Analytics** | $20/month | 40% (400 customers) | $8K |
| **Add-on: API Access** | $30/month | 15% (150 customers) | $4.5K |
| **Add-on: Priority Support** | $15/month | 25% (250 customers) | $3.75K |
| **Total MRR** | - | - | **$96.25K** |

**Analysis**:
- Base plan drops from $100 → $80 (20% decrease)
- Add-ons generate $16.25K MRR (from 40% of customers)
- **Net impact**: -4% MRR compared to current ($100K → $96.25K)
- **Conclusion**: Feature-based pricing doesn't work (too complex, lower MRR)

**Why It Failed**:
- Only 40% of customers buy add-ons (lower than expected)
- Customers feel nickel-and-dimed (bad experience)
- **Recommendation**: Keep all-inclusive pricing at $100 or increase to $110

---

### Tab 5: Competitive Pricing Analysis

**Compare Your Pricing to Competitors**:

| Competitor | Price | Features | Market Position | Our Price Relative |
|------------|-------|----------|-----------------|-------------------|
| **Competitor A** | $75/month | Basic | Low-end | We're 33% more expensive |
| **Competitor B** | $100/month | Standard | Mid-market | We're at parity |
| **Competitor C** | $150/month | Premium | High-end | We're 33% cheaper |
| **Your Company** | $100/month | Standard | Mid-market | - |

**Positioning Options**:
1. **Match low-end** ($75): Compete on price, high volume
2. **Stay mid-market** ($100): Balanced price/value
3. **Move premium** ($125-150): Premium features, higher value

**Recommendation**: Stay at $100 or increase to $110-120 (premium positioning)

---

### Tab 6: Customer Segmentation Analysis

**Price Sensitivity by Customer Segment**:

| Segment | % of Customers | Current Price | Willingness to Pay | Recommended Price | Revenue Impact |
|---------|----------------|---------------|-------------------|-------------------|----------------|
| **Startups (<10 employees)** | 40% (400) | $100 | $80 | $80 | -$8K MRR |
| **SMBs (10-50 employees)** | 40% (400) | $100 | $120 | $120 | +$8K MRR |
| **Enterprises (50+ employees)** | 20% (200) | $100 | $200 | $200 | +$20K MRR |
| **Total** | 100% (1,000) | $100 | - | - | **+$20K MRR** |

**Analysis**:
- Startups are price-sensitive (willing to pay $80)
- SMBs can pay 20% more ($120)
- Enterprises can pay 2x ($200)
- **Opportunity**: Segment pricing (Starter $80, Pro $120, Enterprise $200)

**Implementation**:
- Create 3 tiers based on customer segment
- Grandfather existing customers at $100 (avoid churn)
- New customers: Route to appropriate tier based on company size

---

### Tab 7: Price Testing Results (A/B Test Data)

**Run A/B Test on Pricing Page**:

| Variant | Price | Visitors | Trials | Trial Conversion | Revenue (30 days) | Winner? |
|---------|-------|----------|--------|------------------|-------------------|---------|
| **Control (Current)** | $100/month | 10,000 | 400 | 25% | $10K (100 new customers) | - |
| **Variant A (+10%)** | $110/month | 10,000 | 380 | 23% | $9.6K (88 new customers) | No |
| **Variant B (+20%)** | $120/month | 10,000 | 360 | 20% | $8.6K (72 new customers) | No |
| **Variant C (Annual -20%)** | $80/month (annual) | 10,000 | 450 | 28% | $11.2K (126 new customers) | Yes |

**Results**:
- **Winner**: Variant C (annual pricing at $80/month)
- **Insight**: Customers prefer annual commitment with discount
- **Action**: Offer annual plan at $960/year ($80/month, 20% discount vs $100/month)

**Annual Pricing Benefits**:
- Lower monthly price ($80 vs $100)
- Upfront cash (12 months revenue immediately)
- Lower churn (annual commitment)
- Better unit economics (lower CAC payback)

---

### Tab 8: Revenue Impact Summary

**Revenue Projections** (Year 1):

| Scenario | Price | Customers (End of Year 1) | MRR (Year 1) | ARR (Year 1) | Change vs Baseline |
|----------|-------|---------------------------|--------------|--------------|-------------------|
| **Baseline (Current)** | $100 | 1,500 | $150K | $1.8M | 0% |
| **Recommended: +10% Price** | $110 | 1,404 | $154K | $1.85M | +$50K (+3%) |
| **Alternative: Tiered Pricing** | $50/$100/$250 | 1,500 | $173K | $2.07M | +$270K (+15%) |
| **Alternative: Annual Discount** | $80/month annual | 1,890 | $151K | $1.81M | +$10K (+1%) |

**Recommendation**:
- **Best ROI**: Tiered pricing ($50/$100/$250) → +$270K ARR (+15%)
- **Simplest**: +10% price increase ($100 → $110) → +$50K ARR (+3%)
- **Fastest cash**: Annual plan ($960/year) → 12 months upfront

**Implementation Plan**:
1. **Month 1**: Launch tiered pricing (Starter $50, Pro $100, Enterprise $250)
2. **Month 2**: Add annual plan option (save 20% with annual commitment)
3. **Month 3**: Grandfather existing customers at $100 (no forced migration)
4. **Month 4-12**: Monitor conversion, churn, revenue impact

---

## Price Elasticity Examples

### Example 1: B2B SaaS (Low Elasticity)

**Scenario**: Increase price from $100 → $120 (+20%)

- **Price elasticity**: -0.5 (inelastic, customers not very price-sensitive)
- **Conversion impact**: 25% → 22.5% (-10% conversion)
- **Revenue impact**: $100K MRR → $108K MRR (+8%)
- **Conclusion**: Price increase wins (low elasticity = customers will pay more)

**When to use**: Enterprise SaaS, mission-critical tools, high switching costs

---

### Example 2: Consumer App (High Elasticity)

**Scenario**: Increase price from $10 → $12 (+20%)

- **Price elasticity**: -2.0 (elastic, customers very price-sensitive)
- **Conversion impact**: 10% → 6% (-40% conversion)
- **Revenue impact**: $10K MRR → $7.2K MRR (-28%)
- **Conclusion**: Price increase loses (high elasticity = customers won't pay more)

**When to use**: Consumer apps, games, low-value products, high competition

---

## Pricing Psychology Tactics

### Tactic 1: Anchoring (Show Higher Price First)

**Without Anchoring**:
- Professional: $100/month

**With Anchoring**:
- Enterprise: $500/month (anchor)
- Professional: $100/month (looks cheap by comparison)

**Result**: 15-20% more customers choose Professional (anchored by higher price)

---

### Tactic 2: Decoy Pricing (Make One Option Look Better)

**Without Decoy**:
- Starter: $50/month
- Professional: $100/month

**With Decoy**:
- Starter: $50/month
- Professional: $100/month (best value)
- **Decoy**: Professional Plus: $95/month (almost same features as Pro, worse value)

**Result**: 30-40% more customers choose Professional (decoy makes it look better)

---

### Tactic 3: Charm Pricing (End in 9)

**Without Charm Pricing**:
- $100/month

**With Charm Pricing**:
- $99/month

**Result**: 5-10% higher conversion (customers perceive $99 as significantly cheaper than $100)

---

## Common Pricing Mistakes

### ❌ Mistake 1: Pricing Too Low

**Wrong**: $50/month (trying to undercut competitors)
**Right**: $100/month (charge for value, not cost)

**Why**: Low price = low perceived value = attract wrong customers

---

### ❌ Mistake 2: Not Testing Pricing

**Wrong**: Set price once, never change
**Right**: Test price every 12-18 months (A/B test, survey customers)

**Why**: Customer willingness to pay changes as product improves

---

### ❌ Mistake 3: Too Many Tiers

**Wrong**: 5 tiers (Starter, Basic, Pro, Premium, Enterprise)
**Right**: 3 tiers (Starter, Pro, Enterprise)

**Why**: Too many options = decision paralysis = lower conversion

---

### ❌ Mistake 4: Feature-Based Pricing (Instead of Value-Based)

**Wrong**: $10/month per user (cost-based)
**Right**: $100/month for 10 users (value-based)

**Why**: Charge for value delivered, not cost to serve

---

## Google Sheets Formula Reference

**Price Elasticity**:
```
=(New_Conversion - Old_Conversion) / Old_Conversion / ((New_Price - Old_Price) / Old_Price)
```

**MRR at Different Price Points**:
```
=Price * Customers * (1 - Churn_Rate)
```

**Customer Count (Year 1)**:
```
=Current_Customers + (Monthly_New_Customers * 12) - (Current_Customers * Churn_Rate * 12)
```

**Revenue Impact**:
```
=(New_MRR - Current_MRR) / Current_MRR
```

---

## Pricing Sensitivity Checklist

**Before Testing**:
- [ ] Gather current data (conversion rate, price, MRR, churn)
- [ ] Research competitors (what do they charge?)
- [ ] Survey customers (willingness to pay, perceived value)
- [ ] Calculate current metrics (LTV, CAC, payback period)

**During Testing**:
- [ ] Run A/B test (2-4 weeks minimum)
- [ ] Test 2-3 price points (don't test 10 at once)
- [ ] Segment by customer type (startup vs enterprise)
- [ ] Track conversion, churn, revenue impact

**After Testing**:
- [ ] Analyze results (which price point won?)
- [ ] Calculate revenue impact (short-term and long-term)
- [ ] Communicate changes to customers (30-day notice)
- [ ] Grandfather existing customers (avoid churn)
- [ ] Monitor for 3-6 months (ensure no unexpected churn)

---

## Tools & Resources

**Pricing Tools**:
- **Price Intelligently** (Profitwell): Pricing surveys, benchmarks (free)
- **Paddle**: SaaS billing with pricing optimization ($0, takes % of revenue)
- **Chargebee**: Subscription billing ($249-599/month)
- **Stripe Billing**: Flexible subscription billing ($0, takes % of revenue)

**Pricing Research**:
- **Van Westendorp Price Sensitivity Meter**: Survey method to find optimal price
- **Conjoint Analysis**: Advanced survey method (shows trade-offs)
- **Competitor pricing**: Use BuiltWith, SimilarWeb to estimate competitor pricing

**Calculators**:
- **SaaS Metrics Calculator**: LTV, CAC, payback period (free templates)
- **Price Elasticity Calculator**: Calculate elasticity from A/B test results

---

## Next Steps

1. **Gather current data** (conversion rate, price, MRR, churn)
2. **Define test scenarios** (test 2-3 price points)
3. **Calculate revenue projections** (MRR, ARR at each price point)
4. **Run A/B test** (2-4 weeks, 10K+ visitors)
5. **Analyze results** (which price point maximizes revenue?)
6. **Consider tiered pricing** (Starter, Pro, Enterprise)
7. **Communicate changes** (30-day notice to customers)
8. **Grandfather existing customers** (avoid churn)
9. **Monitor impact** (track conversion, churn, revenue for 3-6 months)
10. **Iterate annually** (test pricing every 12-18 months)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Marketing Attribution Calculator](./marketing-attribution-calculator.md), [Sales Capacity Calculator](./sales-capacity-calculator.md)
