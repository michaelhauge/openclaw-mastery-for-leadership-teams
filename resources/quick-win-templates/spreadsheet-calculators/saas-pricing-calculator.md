# SaaS Pricing Calculator

**Purpose**: Determine optimal pricing for your SaaS product
**Time to Complete**: 30-45 minutes (once you have cost data)
**Use Case**: SaaS companies setting or adjusting pricing
**Output**: Recommended pricing tiers, margins, positioning

---

## Pricing Strategy Framework

### Step 1: Calculate Costs

**Unit costs** (per customer per month):
- Hosting/infrastructure: $[X]
- Support time: $[Y] (hours × hourly rate / customers)
- Payment processing: $[Z] (3% of price)
- **Total COGS**: $[X+Y+Z]

**Example**:
- Hosting: $5/customer/month (AWS, database)
- Support: $10/customer/month (2 hours × $50/hr ÷ 10 customers)
- Payment processing: 3% of subscription price
- **Total COGS: ~$15-20/customer**

---

### Step 2: Set Target Margins

**SaaS margin targets**:
- Gross margin: 70-90% (most SaaS)
- Operating margin: 20-30% (at scale)

**Formula**: Price = COGS ÷ (1 - Target Gross Margin)

**Example**:
- COGS: $20
- Target gross margin: 80%
- **Minimum price: $20 ÷ (1 - 0.80) = $100/month**

---

### Step 3: Research Competitors

**Find 5 competitors**, record:
- Pricing tiers (Basic, Pro, Enterprise)
- Price points
- Features per tier
- Target customer

**Example**:
| Competitor | Basic | Pro | Enterprise |
|------------|-------|-----|------------|
| Competitor A | $49 | $99 | $299 |
| Competitor B | $39 | $89 | $249 |
| Competitor C | $59 | $119 | Custom |
| **Average** | **$49** | **$102** | **$274** |

---

### Step 4: Determine Value Metric

**What drives value for customers?**

**Good value metrics**:
- Per user (most common)
- Per transaction
- Per GB stored
- Per API call
- Per active customer

**Bad value metrics**:
- Flat fee (leaves money on table)
- Per login (penalizes usage)
- Per feature (too complex)

**Example**: Email marketing tool
- Good: Per 1,000 subscribers
- Bad: Per email sent (punishes engagement)

---

## Pricing Calculator (3-Tier Model)

### Tier 1: Starter

**Target**: SMBs, early-stage startups (5-10 people)

| Component | Value | Calculation |
|-----------|-------|-------------|
| **COGS** | $15/mo | Hosting + support |
| **Target margin** | 80% | Industry standard |
| **Minimum price** | $75/mo | $15 ÷ 0.20 |
| **Market position** | Low-mid | 20-30% below avg competitor |
| **Recommended price** | **$49-79/mo** | Round down for appeal |

**Features (Starter)**:
- Core functionality (80% of features)
- Email support
- Basic integrations
- 1-5 users

---

### Tier 2: Professional

**Target**: Growing companies (10-50 people)

| Component | Value | Calculation |
|-----------|-------|-------------|
| **COGS** | $25/mo | Higher support, more usage |
| **Target margin** | 85% | Efficiency at scale |
| **Minimum price** | $167/mo | $25 ÷ 0.15 |
| **Market position** | Mid-market | Align with competitor avg |
| **Recommended price** | **$99-149/mo** | Sweet spot for SMBs |

**Features (Professional)**:
- All Starter features
- Advanced features (API, webhooks, custom fields)
- Priority support
- More integrations
- 5-25 users

---

### Tier 3: Enterprise

**Target**: Large companies (50-500+ people)

| Component | Value | Calculation |
|-----------|-------|-------------|
| **COGS** | $50/mo | Dedicated support, onboarding |
| **Target margin** | 90% | High-touch, high-margin |
| **Minimum price** | $500/mo | $50 ÷ 0.10 |
| **Market position** | Premium | 20-30% above competition |
| **Recommended price** | **$299-999/mo** | Or custom/quote |

**Features (Enterprise)**:
- Everything in Professional
- Dedicated account manager
- SLA (99.9% uptime)
- SSO, advanced security
- Custom integrations
- Unlimited users

---

## Pricing Comparison Table

| Tier | Price | Margin | Features | Target Customer |
|------|-------|--------|----------|-----------------|
| **Starter** | $49-79/mo | 75-85% | Core features | 5-10 person teams |
| **Professional** | $99-149/mo | 80-90% | Advanced features | 10-50 person teams |
| **Enterprise** | $299-999/mo | 85-95% | Premium + custom | 50-500+ person teams |

---

## Pricing Optimization Strategies

### Strategy 1: Anchor Pricing

**Show highest price first** (makes others look cheap)

**Example**:
| Enterprise | Professional | Starter |
|------------|--------------|---------|
| $299/mo | $99/mo ⭐ POPULAR | $49/mo |

Most customers choose middle tier (Professional).

---

### Strategy 2: Annual Discount

**Offer 15-20% discount for annual prepay**

**Example**:
- Monthly: $99/mo × 12 = $1,188/year
- Annual: $1,000/year (save $188, or 16%)

**Benefits**:
- Cash upfront (reduces churn risk)
- Locks in customer for 12 months
- Improves LTV:CAC ratio

---

### Strategy 3: Free Trial + Freemium

**Freemium**:
- Free tier (limited features)
- Converts 2-5% to paid

**Free trial**:
- 14-30 days full access
- Converts 10-25% to paid

**Recommendation**: Free trial for B2B SaaS, freemium for consumer

---

### Strategy 4: Usage-Based Pricing

**Charge for what they use**

**Example**:
- Base: $49/mo (includes 1,000 contacts)
- Overage: $10 per additional 1,000 contacts

**Benefits**:
- Grows with customer (automatic upsell)
- Fair (small customers pay less, large pay more)

**Risks**:
- Unpredictable revenue
- Bill shock (customers upset at high bills)

---

## Price Sensitivity Analysis

### Test Different Price Points

| Price | Conversion Rate | MRR | Annual Revenue |
|-------|-----------------|-----|----------------|
| **$49** | 20% | $980 (20 × $49) | $11,760 |
| **$79** | 15% | $1,185 (15 × $79) | $14,220 |
| **$99** | 12% | $1,188 (12 × $99) | $14,256 ⭐ |
| **$149** | 8% | $1,192 (8 × $149) | $14,304 |
| **$199** | 5% | $995 (5 × $199) | $11,940 |

**Optimal price**: $99-149 (highest revenue, reasonable conversion)

---

## Pricing Psychology

### Rule 1: Charm Pricing

**Use $99 instead of $100** (feels much cheaper)

**Examples**:
- ✅ $49, $99, $299
- ❌ $50, $100, $300

---

### Rule 2: Decoy Pricing

**Add expensive tier to make middle tier look good**

**Example**:
- Starter: $49
- Pro: $99 (looks reasonable)
- Enterprise: $499 (makes Pro look cheap)

---

### Rule 3: Value-Based Language

**Bad**: "Features: X, Y, Z"
**Good**: "Save 10 hours/week with X, Y, Z"

---

## When to Raise Prices

**Raise prices when**:
- Churn rate <5% (customers love your product)
- Customer acquisition cost is high (need more margin)
- Adding significant new features
- Competitors raise prices

**How much to raise**:
- Existing customers: 5-10% annually (grandfathered)
- New customers: 10-20% (test and iterate)

**Example**:
- Old: $99/mo
- New: $119/mo (20% increase)
- Existing customers stay at $99 (grandfather)

---

## Regional Pricing (SEA)

### Adjust for Purchasing Power

| Country | GDP per Capita | Price Adjustment | Starter Price |
|---------|----------------|------------------|---------------|
| **Singapore** | $72K | 100% (baseline) | $49/mo |
| **Malaysia** | $12K | 30-40% | $15-20/mo |
| **Thailand** | $7K | 20-30% | $10-15/mo |
| **Indonesia** | $5K | 15-25% | $7-12/mo |
| **Philippines** | $3.5K | 15-20% | $7-10/mo |
| **Vietnam** | $4K | 15-20% | $7-10/mo |

**Note**: These are rough guidelines. Test with real customers.

---

## Pricing Mistakes to Avoid

### ❌ Mistake 1: Pricing Too Low

**Problem**: "Let's start at $9/mo to win customers"
**Reality**: Customers don't value cheap products, hard to raise later

**Fix**: Start at $49-99/mo (can always discount later)

---

### ❌ Mistake 2: Too Many Tiers

**Problem**: 5-7 pricing tiers (confuses customers)
**Fix**: 3 tiers maximum (Starter, Pro, Enterprise)

---

### ❌ Mistake 3: Feature-Based, Not Value-Based

**Problem**: "Pro tier has 10 features, Enterprise has 20"
**Fix**: "Pro saves you 5 hours/week, Enterprise saves 20 hours/week"

---

### ❌ Mistake 4: Not Testing

**Problem**: Pick pricing and never change it
**Fix**: Test annually (price, packaging, positioning)

---

## Pricing A/B Testing

### Test 1: Price Point

- Control: $99/mo
- Variant: $119/mo
- Measure: Conversion rate, MRR

**Run for**: 30 days or 100+ signups

---

### Test 2: Annual Discount

- Control: No annual plan
- Variant: Annual at 16% discount
- Measure: % choosing annual, cash collected

---

### Test 3: Free Trial Length

- Control: 14-day trial
- Variant: 30-day trial
- Measure: Trial-to-paid conversion

---

## Google Sheets Formula Reference

**Minimum Price**:
```
=COGS / (1 - TARGET_GROSS_MARGIN)
```

**Gross Margin %**:
```
=(PRICE - COGS) / PRICE
```

**MRR at Different Prices**:
```
=PRICE * CUSTOMERS * CONVERSION_RATE
```

**Annual Revenue**:
```
=MRR * 12
```

---

## Next Steps

1. **Calculate COGS** (hosting, support, payment processing)
2. **Research competitors** (pricing, positioning)
3. **Set target margins** (75-90% gross margin)
4. **Create 3 tiers** (Starter, Pro, Enterprise)
5. **Test with customers** (surveys, pilot pricing)
6. **Launch and iterate** (adjust based on data)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Unit Economics Calculator](./unit-economics-calculator.md), [Burn Rate Calculator](./burn-rate-calculator.md)
