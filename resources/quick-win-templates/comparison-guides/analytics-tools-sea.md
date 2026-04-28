# Analytics Tools Comparison (SEA)

**Purpose**: Choose the right analytics platform for tracking product and marketing metrics
**Time to Complete**: 30-45 minutes
**Use Case**: Product managers, marketers, data analysts tracking web/app analytics
**Output**: Analytics tool decision with implementation plan

---

## Quick Decision Matrix

| Tool | Best For | Price (100K events/mo) | Learning Curve | SEA Support | Rating |
|------|----------|------------------------|----------------|-------------|--------|
| **Google Analytics 4** | General web analytics, SEO | Free | Medium | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Mixpanel** | Product analytics, retention | $25-300/mo | Easy | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Amplitude** | Product analytics, enterprise | $61-2K/mo | Medium | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Segment** | Data pipeline (routes to other tools) | $120-1K/mo | Easy | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **PostHog** | Open-source, product analytics | $0-450/mo | Medium | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Heap** | Auto-capture, retroactive analysis | $3,600/year | Easy | ⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## Detailed Comparison

### Google Analytics 4 (GA4)

**Best for**: Content sites, e-commerce, SEO-focused businesses

**Pricing**:
- **Free**: Up to 10M events/month
- **GA4 360**: $50K-150K/year (enterprise)

**Key Features**:
- **Traffic sources**: Organic, paid, referral, direct
- **User behavior**: Page views, sessions, bounce rate
- **Conversions**: Goal tracking, funnels
- **E-commerce**: Revenue, transactions, product performance
- **Integration**: Google Ads, Search Console, BigQuery

**Pros**:
- ✅ Free (for most use cases)
- ✅ Industry standard (everyone knows it)
- ✅ Great for SEO (integrates with Search Console)
- ✅ E-commerce tracking (built-in)
- ✅ Strong SEA support

**Cons**:
- ❌ Not great for product analytics (limited cohorts, funnels)
- ❌ Confusing UI (GA4 is complex)
- ❌ Data sampling at scale (>10M events)
- ❌ Limited retention analysis

**When to choose**:
- You're a content site or blog (page views >> events)
- You need SEO insights (organic traffic, keywords)
- You're on a tight budget (free)
- You run Google Ads (tight integration)

**SEA Considerations**:
- Works well in all SEA countries
- Data stored in Singapore or US (choose region)
- PDPA compliant with proper setup

---

### Mixpanel

**Best for**: SaaS products, mobile apps, product-led growth

**Pricing** (based on events tracked):
- **Free**: Up to 100K events/month
- **Growth**: $25/month (100K events) to $300/month (1M events)
- **Enterprise**: Custom (10M+ events)

**Key Features**:
- **Event tracking**: Button clicks, feature usage, user actions
- **Funnels**: Conversion analysis (signup → activation → retention)
- **Cohorts**: Group users by behavior (active users, churned users)
- **Retention**: Track user return rates (daily, weekly, monthly)
- **A/B testing**: Compare feature variants
- **Notifications**: Email, push, in-app messages

**Pros**:
- ✅ Best product analytics (funnels, cohorts, retention)
- ✅ Easy to use (clean UI, simple setup)
- ✅ Generous free tier (100K events)
- ✅ Mobile SDKs (iOS, Android, React Native)
- ✅ Real-time data (no delay)

**Cons**:
- ❌ Expensive at scale (>1M events)
- ❌ Not great for marketing (no SEO, no traffic sources)
- ❌ Limited data warehouse export (need paid plan)

**When to choose**:
- You're a SaaS or mobile app
- You need product analytics (feature adoption, retention)
- You care about funnels and cohorts
- You're under 1M events/month

**SEA Considerations**:
- Data stored in US (no SEA data center)
- GDPR/PDPA compliant with proper settings
- 24/7 support (email, chat)

---

### Amplitude

**Best for**: Enterprise product analytics, data-driven companies

**Pricing** (based on events + users):
- **Free**: Up to 1M events/month + 10M total events
- **Plus**: $61/month (10M events tracked annually)
- **Growth**: $649/month (100M events annually)
- **Enterprise**: $2K+/month (custom)

**Key Features**:
- **Behavioral cohorts**: Advanced user segmentation
- **Funnel analysis**: Multi-step conversion tracking
- **Retention**: Cohort retention, lifecycle analysis
- **Pathfinder**: Visualize user journeys
- **Experiments**: A/B testing + feature flags
- **Warehouse integration**: Snowflake, BigQuery, Redshift

**Pros**:
- ✅ Most advanced product analytics (better than Mixpanel)
- ✅ Generous free tier (1M events/mo, 10M total)
- ✅ Great for data teams (SQL, warehouse integrations)
- ✅ Enterprise features (SSO, governance, permissions)
- ✅ Best retention analysis

**Cons**:
- ❌ Steeper learning curve (more complex than Mixpanel)
- ❌ Pricing jumps fast after free tier
- ❌ Not great for marketing analytics

**When to choose**:
- You're enterprise or growth-stage
- You need advanced analytics (behavioral cohorts, retention)
- You have a data team
- You need warehouse integrations

**SEA Considerations**:
- Data residency: US or EU (no SEA yet)
- Enterprise support includes SEA hours
- Large SEA customer base (Grab, Shopee, etc.)

---

### Segment

**Best for**: Data pipeline (routes data to other tools)

**Pricing** (based on events + destinations):
- **Free**: Up to 1K users/month + 2 destinations
- **Team**: $120/month (10K users/mo + unlimited destinations)
- **Business**: $1K+/month (100K+ users/mo)

**Key Features**:
- **Data collection**: One SDK, send to multiple tools
- **Destinations**: 300+ integrations (GA4, Mixpanel, Amplitude, etc.)
- **Data warehouse**: Send to Snowflake, BigQuery, Redshift
- **Protocols**: Data quality (validation, schema enforcement)
- **Personas**: Customer data platform (CDP)

**Pros**:
- ✅ One SDK for all tools (don't rewire code when changing tools)
- ✅ 300+ integrations (analytics, marketing, CRM)
- ✅ Data quality (validation, deduplication)
- ✅ Easy to switch tools (just toggle destination)

**Cons**:
- ❌ Expensive (adds cost on top of analytics tools)
- ❌ Not an analytics tool (just a pipeline)
- ❌ Overkill for simple setups (use native SDKs)

**When to choose**:
- You use 3+ analytics/marketing tools
- You want flexibility (easy to switch tools)
- You need data warehouse exports
- You have budget ($120-1K/month)

**SEA Considerations**:
- Global infrastructure (low latency)
- EU + US data residency (no SEA)
- Strong SEA customer base

---

### PostHog

**Best for**: Open-source, self-hosted, privacy-focused

**Pricing** (based on events + features):
- **Free**: Up to 1M events/month
- **Paid**: $0.00045/event (450K events = $200/month)
- **Self-hosted**: Free (you host it)

**Key Features**:
- **Product analytics**: Funnels, cohorts, retention (like Mixpanel)
- **Session replay**: Watch user sessions (like Hotjar)
- **Feature flags**: A/B testing, gradual rollouts
- **Heatmaps**: Click maps, scroll maps
- **Open-source**: Self-host for free

**Pros**:
- ✅ All-in-one (analytics + session replay + flags + heatmaps)
- ✅ Open-source (free, self-host for data control)
- ✅ Generous free tier (1M events)
- ✅ Privacy-focused (GDPR/PDPA compliant)
- ✅ No vendor lock-in (export all data)

**Cons**:
- ❌ Self-hosting complexity (DevOps needed)
- ❌ Smaller ecosystem vs Mixpanel/Amplitude
- ❌ Limited enterprise features (vs Amplitude)

**When to choose**:
- You want all-in-one (analytics + replay + flags)
- You're privacy-conscious (GDPR, PDPA)
- You want open-source (data control)
- You're under 1M events/month (generous free tier)

**SEA Considerations**:
- Cloud hosted in US or EU
- Self-host in SEA (Singapore, Jakarta, etc.)
- Growing SEA adoption

---

### Heap

**Best for**: Auto-capture (no manual tracking), retroactive analysis

**Pricing** (based on sessions):
- **Free**: Up to 10K sessions/month
- **Growth**: $3,600/year (unlimited sessions)
- **Pro**: Custom (enterprise features)

**Key Features**:
- **Auto-capture**: Tracks all events automatically (no code)
- **Retroactive analysis**: Define events after the fact
- **Funnels**: Conversion analysis
- **Retention**: Cohort analysis
- **Session replay**: Watch user sessions

**Pros**:
- ✅ No manual tracking (auto-captures everything)
- ✅ Retroactive analysis (define events later)
- ✅ Easy setup (one script, done)
- ✅ Session replay included

**Cons**:
- ❌ Expensive ($3,600/year minimum)
- ❌ Auto-capture = large data volume
- ❌ Limited free tier (10K sessions)
- ❌ Less flexible than manual tracking

**When to choose**:
- You don't know what events to track yet
- You want retroactive analysis
- You have budget ($3,600+/year)
- You need session replay

**SEA Considerations**:
- US-based (no SEA data center)
- Limited SEA customer base

---

## Side-by-Side Comparison

| Feature | GA4 | Mixpanel | Amplitude | Segment | PostHog | Heap |
|---------|-----|----------|-----------|---------|---------|------|
| **Product Analytics** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Marketing Analytics** | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ | N/A | ⭐⭐ | ⭐⭐ |
| **Funnels** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Retention** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Session Replay** | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |
| **A/B Testing** | ❌ | ✅ | ✅ | ❌ | ✅ | ✅ |
| **Free Tier** | Generous | Generous | Very Generous | Limited | Generous | Limited |
| **Ease of Use** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Price (Value)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |

---

## Recommendation by Use Case

### Scenario 1: Content Site / Blog
**Recommendation**: **Google Analytics 4**

**Why**:
- Free
- Great for SEO (organic traffic, keywords)
- Page view tracking (not event tracking)
- E-commerce tracking (if selling)

**Cost**: $0/month

---

### Scenario 2: SaaS Product (Early-Stage)
**Recommendation**: **Mixpanel** or **Amplitude**

**Why**:
- Product analytics (feature usage, funnels, retention)
- Easy to use (non-technical PMs can use)
- Generous free tiers

**Cost**: $0-100/month (under 1M events)

---

### Scenario 3: Mobile App
**Recommendation**: **Mixpanel** or **PostHog**

**Why**:
- Mobile SDKs (iOS, Android, React Native)
- Event tracking (not page views)
- Push notifications (Mixpanel)

**Cost**: $0-300/month

---

### Scenario 4: Enterprise / Data-Driven
**Recommendation**: **Amplitude** + **Segment**

**Why**:
- Advanced analytics (Amplitude)
- Data pipeline (Segment routes to warehouse)
- Enterprise features (SSO, governance)

**Cost**: $1K-5K/month

---

### Scenario 5: Privacy-Focused / Open-Source
**Recommendation**: **PostHog** (self-hosted)

**Why**:
- Open-source (full data control)
- GDPR/PDPA compliant
- Self-host in SEA (Singapore, Jakarta)

**Cost**: $0/month (if self-hosted) + infrastructure ($50-200/month)

---

## Implementation Checklist

**Week 1: Setup**
- [ ] Sign up for free trial
- [ ] Install SDK (JavaScript, mobile, backend)
- [ ] Define key events (10-20 critical events)
- [ ] Test tracking (send test events)

**Week 2: Core Tracking**
- [ ] Track signup flow (email → verification → onboarding)
- [ ] Track feature usage (clicks, form submissions)
- [ ] Track conversions (free → paid, trial → paid)
- [ ] Set up funnels (signup funnel, activation funnel)

**Week 3: Advanced Tracking**
- [ ] User properties (plan type, company size, location)
- [ ] Cohorts (active users, churned users, trial users)
- [ ] Retention reports (daily, weekly, monthly)
- [ ] A/B tests (if applicable)

**Week 4: Monitoring & Optimization**
- [ ] Set up dashboards (key metrics: DAU, WAU, MAU, retention)
- [ ] Alert on key metrics (churn spike, low activation)
- [ ] Review data quality (missing events, duplicates)
- [ ] Train team (how to use analytics tool)

---

## Key Events to Track

**For SaaS Products**:
- **Signup**: User creates account
- **Activation**: User completes onboarding (e.g., first project created)
- **Feature Usage**: User uses key features (e.g., exported report, invited team)
- **Upgrade**: User upgrades to paid plan
- **Churn**: User cancels subscription

**For E-Commerce**:
- **Product View**: User views product page
- **Add to Cart**: User adds item to cart
- **Checkout Started**: User begins checkout
- **Purchase**: User completes purchase
- **Repeat Purchase**: User buys again (retention)

**For Mobile Apps**:
- **App Open**: User opens app
- **Screen View**: User views specific screen
- **Feature Usage**: User completes action (e.g., post created, message sent)
- **Push Notification**: User receives/clicks notification
- **In-App Purchase**: User buys premium feature

---

## Common Mistakes

### ❌ Mistake 1: Tracking Too Many Events

**Problem**: Tracking 100+ events = noise, hard to find signal
**Solution**: Start with 10-20 key events, add more as needed

---

### ❌ Mistake 2: Not Defining Events Upfront

**Problem**: "Let's track everything" → inconsistent naming, hard to analyze
**Solution**: Create event taxonomy (naming convention) before implementing

**Naming Convention**:
Use consistent snake_case format for all events (lowercase with underscores)

---

### ❌ Mistake 3: No User Properties

**Problem**: Can't segment users (who's using what?)
**Solution**: Track user properties (plan type, company size, location)

**Example**:
```javascript
mixpanel.identify(userId);
mixpanel.people.set({
  "Plan Type": "Pro",
  "Company Size": "50-100",
  "Country": "Singapore"
});
```

---

### ❌ Mistake 4: Not Reviewing Data Regularly

**Problem**: Set up analytics, never look at it
**Solution**: Weekly review (30 min), monthly deep dive (2 hours)

---

## Multi-Tool Strategy

**Common pattern**: Use 2-3 tools together

**Example 1** (SaaS Startup):
- **GA4**: Marketing analytics (SEO, paid ads, traffic sources)
- **Mixpanel**: Product analytics (feature usage, funnels, retention)
- **Segment**: Data pipeline (route to both GA4 + Mixpanel + data warehouse)

**Cost**: $0 (GA4) + $100 (Mixpanel) + $120 (Segment) = $220/month

---

**Example 2** (E-Commerce):
- **GA4**: Traffic, e-commerce tracking
- **Hotjar**: Heatmaps, session replay (see what users click)
- **Facebook Pixel**: Retargeting ads

**Cost**: $0 (GA4) + $0-80 (Hotjar) + $0 (Facebook Pixel) = $0-80/month

---

**Example 3** (Enterprise SaaS):
- **Amplitude**: Product analytics
- **Segment**: Data pipeline
- **Salesforce**: CRM (customer data)
- **Snowflake**: Data warehouse (all data centralized)

**Cost**: $2K (Amplitude) + $1K (Segment) + $1K (Salesforce) + $2K (Snowflake) = $6K/month

---

## Google Sheets Formula Reference

**Daily Active Users (DAU)**:
```
=COUNTUNIQUE(user_id WHERE event_date = TODAY())
```

**Weekly Active Users (WAU)**:
```
=COUNTUNIQUE(user_id WHERE event_date >= TODAY() - 7)
```

**Monthly Active Users (MAU)**:
```
=COUNTUNIQUE(user_id WHERE event_date >= TODAY() - 30)
```

**Retention Rate (Day 7)**:
```
=USERS_WHO_RETURNED_DAY_7 / USERS_WHO_SIGNED_UP
```

**Conversion Rate (Funnel)**:
```
=USERS_WHO_COMPLETED_STEP_2 / USERS_WHO_COMPLETED_STEP_1
```

---

## Next Steps

1. **Choose tool(s)** based on use case (GA4 for marketing, Mixpanel for product)
2. **Sign up for free trial** (test before committing)
3. **Define key events** (10-20 events to track)
4. **Install SDK** (frontend, backend, mobile)
5. **Test tracking** (send test events, verify in dashboard)
6. **Set up dashboards** (key metrics: DAU, WAU, retention, funnels)
7. **Review weekly** (30 min review of key metrics)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Marketing Attribution Calculator](../spreadsheet-calculators/marketing-attribution-calculator.md), [SaaS Pricing Calculator](../spreadsheet-calculators/saas-pricing-calculator.md)
