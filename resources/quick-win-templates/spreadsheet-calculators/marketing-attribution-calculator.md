# Marketing Attribution Calculator

**Purpose**: Track which marketing channels drive revenue and optimize spend
**Time to Complete**: 1-2 hours (setup), ongoing tracking
**Use Case**: Marketing teams with 3+ channels and $10K+ monthly spend
**Output**: Channel ROI, attribution model, budget allocation recommendations

---

## Marketing Attribution Basics

**What is attribution?**
Determining which marketing touchpoints contributed to a sale or conversion.

**Why it matters**:
- Optimize budget allocation (invest more in what works)
- Prove marketing ROI to executives
- Identify underperforming channels
- Understand customer journey

**Common problem**: Customer sees your ad on Facebook, clicks Google search, reads blog, then converts via email. Which channel gets credit?

---

## Attribution Models

### Model 1: Last-Touch Attribution (Simplest)

**Definition**: 100% credit to the last touchpoint before conversion

**Example**:
- Customer journey: Facebook Ad → Blog Post → Google Search → **Email** (converts)
- Email gets 100% credit for the sale

**Pros**:
- ✅ Simple to track
- ✅ Easy to understand
- ✅ Works well for short sales cycles

**Cons**:
- ❌ Ignores earlier touchpoints (awareness, consideration)
- ❌ Undervalues top-of-funnel activities
- ❌ Poor for multi-touch journeys (B2B)

**When to use**: E-commerce, short sales cycles (<7 days)

---

### Model 2: First-Touch Attribution

**Definition**: 100% credit to the first touchpoint

**Example**:
- Customer journey: **Facebook Ad** → Blog Post → Google Search → Email (converts)
- Facebook Ad gets 100% credit

**Pros**:
- ✅ Simple to track
- ✅ Credits awareness activities
- ✅ Good for top-of-funnel optimization

**Cons**:
- ❌ Ignores nurture and closing activities
- ❌ Poor for long sales cycles

**When to use**: Brand awareness campaigns, top-of-funnel focus

---

### Model 3: Linear Attribution

**Definition**: Equal credit to all touchpoints

**Example**:
- Customer journey: Facebook Ad → Blog Post → Google Search → Email (converts)
- Each gets 25% credit (4 touchpoints)

**Pros**:
- ✅ Fair to all channels
- ✅ Recognizes multi-touch journey
- ✅ Easy to calculate

**Cons**:
- ❌ Oversimplifies (not all touches are equal)
- ❌ Doesn't reflect real influence

**When to use**: When you want balanced view of all channels

---

### Model 4: Time-Decay Attribution

**Definition**: More recent touchpoints get more credit (exponential decay)

**Example**:
- Customer journey: Facebook Ad (20%) → Blog Post (25%) → Google Search (30%) → Email (25%)
- Email and Google Search get more credit (closer to conversion)

**Pros**:
- ✅ Reflects recency bias
- ✅ Credits closing activities more
- ✅ More realistic than linear

**Cons**:
- ❌ Still somewhat arbitrary
- ❌ Complex to calculate

**When to use**: Mid-length sales cycles (1-3 months)

---

### Model 5: U-Shaped (Position-Based) Attribution ⭐ RECOMMENDED

**Definition**: 40% to first touch, 40% to last touch, 20% to middle touches

**Example**:
- Customer journey: Facebook Ad (40%) → Blog Post (10%) → Google Search (10%) → Email (40%)
- First and last get most credit, middle gets some

**Pros**:
- ✅ Balances awareness (first) and closing (last)
- ✅ Recognizes middle touches
- ✅ Most realistic for B2B

**Cons**:
- ❌ More complex to track
- ❌ Requires multi-touch tracking

**When to use**: B2B SaaS, long sales cycles (1-6 months)

---

## Marketing Attribution Calculator (Spreadsheet)

### Tab 1: Channel Performance

**Track each marketing channel**:

| Channel | Monthly Spend | Leads | Customers | Revenue | CPA | LTV | ROI |
|---------|---------------|-------|-----------|---------|-----|-----|-----|
| **Organic Search (SEO)** | $2,000 | 150 | 15 | $75,000 | $133 | $5,000 | 37.5x |
| **Paid Search (Google Ads)** | $10,000 | 200 | 20 | $100,000 | $500 | $5,000 | 10x |
| **Facebook Ads** | $5,000 | 250 | 10 | $50,000 | $500 | $5,000 | 10x |
| **LinkedIn Ads** | $8,000 | 100 | 12 | $60,000 | $667 | $5,000 | 7.5x |
| **Content Marketing** | $3,000 | 80 | 8 | $40,000 | $375 | $5,000 | 13.3x |
| **Email Marketing** | $1,000 | 50 | 10 | $50,000 | $100 | $5,000 | 50x |
| **Referrals** | $500 | 20 | 5 | $25,000 | $100 | $5,000 | 50x |
| **Total** | **$29,500** | **850** | **80** | **$400,000** | **$369** | **$5,000** | **13.6x** |

**Formulas**:
- **CPA** (Cost Per Acquisition) = Spend ÷ Customers
- **ROI** = Revenue ÷ Spend
- **LTV** (Lifetime Value) = Assumed $5,000 per customer

**Interpretation**:
- **Best ROI**: Email (50x), Referrals (50x), SEO (37.5x)
- **Worst ROI**: LinkedIn (7.5x)
- **Action**: Increase budget for email, SEO, referrals. Reduce LinkedIn or optimize targeting.

---

### Tab 2: Multi-Touch Attribution

**Track customer journeys** (U-Shaped model):

| Customer ID | First Touch (40%) | Middle Touches (20%) | Last Touch (40%) | Revenue | First Credit | Middle Credit | Last Credit |
|-------------|-------------------|----------------------|------------------|---------|--------------|---------------|-------------|
| **C001** | Facebook Ad | Blog (50%), Email (50%) | Google Search | $5,000 | $2,000 (FB) | $500 (Blog), $500 (Email) | $2,000 (Google) |
| **C002** | Organic Search | LinkedIn (100%) | Email | $5,000 | $2,000 (SEO) | $1,000 (LinkedIn) | $2,000 (Email) |
| **C003** | Google Ad | N/A | Google Ad | $5,000 | $2,000 (Google) | $0 | $2,000 (Google) |
| **C004** | Blog Post | Facebook (33%), Email (33%), Google (33%) | Email | $5,000 | $2,000 (Blog) | $333 (FB), $333 (Email), $333 (Google) | $2,000 (Email) |

**Attribution Summary**:

| Channel | First Touch Credit | Middle Touch Credit | Last Touch Credit | Total Credit | % of Revenue |
|---------|-------------------|---------------------|-------------------|--------------|--------------|
| **Facebook** | $2,000 | $333 | $0 | $2,333 | 11.7% |
| **Blog/SEO** | $2,000 | $500 | $0 | $2,500 | 12.5% |
| **Google Search** | $0 | $333 | $2,000 | $2,333 | 11.7% |
| **Google Ads** | $2,000 | $0 | $2,000 | $4,000 | 20% |
| **Email** | $0 | $833 | $4,000 | $4,833 | 24.2% |
| **LinkedIn** | $0 | $1,000 | $0 | $1,000 | 5% |
| **Organic Search** | $2,000 | $0 | $0 | $2,000 | 10% |
| **Referral** | $1,000 | $0 | $0 | $1,000 | 5% |
| **Total** | $8,000 | $4,000 | $8,000 | **$20,000** | **100%** |

**Interpretation**:
- Email contributes 24.2% of revenue (high last-touch credit)
- Google Ads contributes 20% (both first and last touch)
- LinkedIn only contributes 5% (middle touch only)

---

### Tab 3: Channel Attribution by Model

**Compare different attribution models**:

| Channel | Last-Touch | First-Touch | Linear | Time-Decay | U-Shaped |
|---------|------------|-------------|--------|------------|----------|
| **Facebook** | $2,000 | $8,000 | $5,000 | $4,500 | $4,000 |
| **Google Ads** | $6,000 | $6,000 | $6,000 | $6,200 | $5,500 |
| **Organic Search** | $1,000 | $5,000 | $4,000 | $3,500 | $3,000 |
| **Email** | $10,000 | $500 | $4,000 | $6,000 | $6,500 |
| **LinkedIn** | $500 | $500 | $500 | $500 | $750 |
| **Blog/Content** | $500 | $500 | $500 | $500 | $750 |

**Key Insight**: Model choice significantly affects channel credit
- Last-touch: Email looks best (10x credit)
- First-touch: Facebook looks best (4x credit)
- U-shaped: Balances both

---

### Tab 4: Budget Allocation Recommendations

**Current vs Recommended Budget** (based on U-Shaped attribution):

| Channel | Current Spend | Current % | Revenue Credit | Revenue % | Recommended Spend | Recommended % | Change |
|---------|---------------|-----------|----------------|-----------|-------------------|---------------|--------|
| **Email** | $1,000 | 3.4% | $6,500 | 32.5% | $9,600 | 32.5% | **+$8,600** ⬆️ |
| **Google Ads** | $10,000 | 33.9% | $5,500 | 27.5% | $8,100 | 27.5% | **-$1,900** ⬇️ |
| **Facebook** | $5,000 | 16.9% | $4,000 | 20% | $5,900 | 20% | **+$900** ⬆️ |
| **Organic Search** | $2,000 | 6.8% | $3,000 | 15% | $4,400 | 15% | **+$2,400** ⬆️ |
| **LinkedIn** | $8,000 | 27.1% | $750 | 3.75% | $1,100 | 3.75% | **-$6,900** ⬇️ |
| **Blog/Content** | $3,000 | 10.2% | $750 | 3.75% | $1,100 | 3.75% | **-$1,900** ⬇️ |
| **Referrals** | $500 | 1.7% | $1,000 | 5% | $1,500 | 5% | **+$1,000** ⬆️ |
| **Total** | **$29,500** | **100%** | **$20,000** | **100%** | **$29,500** | **100%** | **$0** |

**Key Actions**:
1. **Increase Email** spend from $1K to $9.6K (huge ROI, underinvested)
2. **Cut LinkedIn** from $8K to $1.1K (poor ROI, overinvested)
3. **Increase SEO** from $2K to $4.4K (strong ROI, underinvested)
4. **Slightly reduce Google Ads** (still good, but overweight)

---

## Setting Up Multi-Touch Tracking

### Step 1: Define Touchpoints

**List all marketing touchpoints**:
- Website visit (organic, paid, direct, referral)
- Blog post read
- Email opened/clicked
- Ad clicked (Facebook, Google, LinkedIn)
- Webinar attended
- Demo booked
- Case study read

---

### Step 2: Implement Tracking

**Tools**:
- **Google Analytics 4**: Track website visits, UTM parameters
- **CRM** (HubSpot, Salesforce): Track email, calls, meetings
- **Marketing automation** (Marketo, Pardot): Track email engagement
- **Ad platforms**: Track ad clicks (Facebook Pixel, Google Ads)

**UTM Parameters** (for tracking links):
```
https://yoursite.com/page?utm_source=facebook&utm_medium=cpc&utm_campaign=Q1-launch
```

- `utm_source`: facebook, google, linkedin, email
- `utm_medium`: cpc, email, social, referral
- `utm_campaign`: Q1-launch, product-demo, webinar

---

### Step 3: Connect Data Sources

**Centralize in one place** (CRM or data warehouse):
1. Import website visits (Google Analytics → CRM)
2. Import ad clicks (Facebook/Google → CRM)
3. Import email engagement (Email tool → CRM)
4. Link all to customer/lead records

**Example (HubSpot)**:
- Customer record shows: First visit (Google Ad) → Blog read → Email open → Demo booked (Webinar) → Closed (Email)

---

### Step 4: Calculate Attribution

**For each customer**:
1. List all touchpoints in chronological order
2. Apply attribution model (U-Shaped)
3. Assign credit to each channel
4. Sum up across all customers

**Example (U-Shaped)**:
- Customer journey: Google Ad → Blog → Email (close)
- Revenue: $5,000
- Attribution: Google ($2,000), Blog ($1,000), Email ($2,000)

---

## Attribution Reports

### Report 1: Channel Performance Dashboard

**Monthly view**:

| Metric | Facebook | Google Ads | SEO | Email | LinkedIn |
|--------|----------|------------|-----|-------|----------|
| **Spend** | $5,000 | $10,000 | $2,000 | $1,000 | $8,000 |
| **Impressions** | 1M | 500K | N/A | 50K | 200K |
| **Clicks** | 10K | 15K | 10K | 5K | 3K |
| **CTR** | 1% | 3% | N/A | 10% | 1.5% |
| **Leads** | 250 | 200 | 150 | 50 | 100 |
| **Customers** | 10 | 20 | 15 | 10 | 12 |
| **Revenue (Attributed)** | $4,000 | $5,500 | $3,000 | $6,500 | $750 |
| **ROI** | 0.8x | 0.55x | 1.5x | 6.5x | 0.09x |

**Actions**:
- Pause LinkedIn (0.09x ROI)
- Double down on Email (6.5x ROI) and SEO (1.5x ROI)
- Optimize Facebook (0.8x ROI, close to breakeven)

---

### Report 2: Customer Journey Analysis

**Top 5 Customer Journeys** (most common paths):

| Journey | Count | % of Customers | Avg. Touchpoints | Avg. Time to Close | Avg. Revenue |
|---------|-------|----------------|------------------|--------------------|--------------|
| **Google Ad → Demo → Email** | 25 | 31% | 3 | 14 days | $5,000 |
| **SEO → Blog → Email** | 20 | 25% | 4 | 30 days | $5,500 |
| **Facebook → Webinar → Email** | 15 | 19% | 5 | 45 days | $6,000 |
| **Referral → Demo → Close** | 10 | 12% | 2 | 7 days | $5,000 |
| **LinkedIn → Content → Email** | 8 | 10% | 6 | 60 days | $7,000 |

**Insights**:
- **Fastest**: Referral → Demo → Close (7 days)
- **Highest revenue**: LinkedIn path ($7K), but takes 60 days
- **Most common**: Google Ad → Demo → Email (31% of customers)

---

### Report 3: Funnel Drop-Off by Channel

**Track conversion at each stage**:

| Channel | Impressions | Clicks | Leads | Opps | Customers | Imp→Click | Click→Lead | Lead→Opp | Opp→Customer |
|---------|-------------|--------|-------|------|-----------|-----------|------------|----------|--------------|
| **Facebook** | 1M | 10K | 250 | 50 | 10 | 1% | 2.5% | 20% | 20% |
| **Google Ads** | 500K | 15K | 200 | 60 | 20 | 3% | 1.3% | 30% | 33% |
| **SEO** | N/A | 10K | 150 | 45 | 15 | N/A | 1.5% | 30% | 33% |
| **Email** | 50K | 5K | 50 | 30 | 10 | 10% | 1% | 60% | 33% |
| **LinkedIn** | 200K | 3K | 100 | 20 | 12 | 1.5% | 3.3% | 20% | 60% |

**Insights**:
- **Best click-through**: Email (10%)
- **Best lead quality**: LinkedIn (60% opp → customer)
- **Best volume**: Google Ads (15K clicks, 20 customers)

---

## Advanced Attribution: Machine Learning

**Algorithmic attribution** (data-driven):
- Uses machine learning to assign credit based on actual impact
- Analyzes thousands of customer journeys
- Finds patterns in conversions vs non-conversions

**Tools**:
- Google Analytics 4 (Data-Driven Attribution)
- Adobe Analytics
- Custom models (Python: scikit-learn, Prophet)

**When to use**:
- Large dataset (1,000+ customers)
- Complex multi-touch journeys (5+ touchpoints)
- Want to optimize beyond simple models

**Example**: Machine learning finds that webinar attendees who also read a case study convert 3x higher → Assign more credit to that sequence

---

## Common Attribution Mistakes

### ❌ Mistake 1: Ignoring Dark Social

**Problem**: Customers discuss your product in Slack, WhatsApp, private channels (can't track)

**Solution**:
- Ask customers "How did you hear about us?" (qualitative)
- Use "Direct" as proxy for dark social
- Don't over-optimize based on trackable channels only

---

### ❌ Mistake 2: Last-Touch Bias

**Problem**: Over-investing in closing channels (email, retargeting), under-investing in awareness (SEO, content)

**Solution**: Use U-Shaped or multi-touch model to credit awareness activities

---

### ❌ Mistake 3: Not Updating Model

**Problem**: Using same attribution model as 2 years ago, but customer journey changed

**Solution**: Review model quarterly, adjust based on actual behavior

---

### ❌ Mistake 4: Attribution ≠ Causation

**Problem**: Correlation doesn't mean causation (maybe email converts because customers are already ready to buy)

**Solution**:
- Run controlled experiments (A/B tests)
- Measure incrementality (what would happen without this channel?)

---

## Attribution by Company Stage

### Early-Stage (Pre-Seed, Seed)
- **Channels**: 1-3 (e.g., Google Ads, SEO, email)
- **Model**: Last-touch (simplicity > accuracy)
- **Focus**: Find what works, iterate fast

### Growth-Stage (Series A, B)
- **Channels**: 5-8 (ads, SEO, email, content, events, partnerships)
- **Model**: U-Shaped or Time-Decay
- **Focus**: Optimize budget allocation, prove ROI

### Scale-Stage (Series C+)
- **Channels**: 10+ (all channels, global markets)
- **Model**: Data-driven (ML-based)
- **Focus**: Incremental gains, efficiency at scale

---

## Google Sheets Formula Reference

**CPA (Cost Per Acquisition)**:
```
=SPEND / CUSTOMERS
```

**ROI (Return on Investment)**:
```
=REVENUE / SPEND
```

**U-Shaped Attribution (First Touch)**:
```
=REVENUE * 0.40
```

**U-Shaped Attribution (Middle Touches)**:
```
=REVENUE * 0.20 / COUNT_OF_MIDDLE_TOUCHES
```

**U-Shaped Attribution (Last Touch)**:
```
=REVENUE * 0.40
```

**Conversion Rate (Stage to Stage)**:
```
=NEXT_STAGE / CURRENT_STAGE
```

---

## Next Steps

1. **Choose attribution model** (recommend U-Shaped for B2B)
2. **Set up tracking** (UTM parameters, GA4, CRM integration)
3. **Collect 30-90 days of data** (need enough conversions)
4. **Build attribution spreadsheet** (Tab 1-4 above)
5. **Analyze results** (which channels over/under-performing?)
6. **Reallocate budget** (shift from low-ROI to high-ROI channels)
7. **Review monthly** (track changes in attribution over time)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Unit Economics Calculator](./unit-economics-calculator.md), [SaaS Pricing Calculator](./saas-pricing-calculator.md)
