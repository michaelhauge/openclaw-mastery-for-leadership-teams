# SEO Audit (30 Days)

**Purpose**: Audit and improve SEO in 30 days to increase organic traffic
**Time Investment**: 1-2 hours/day
**Team Size**: 1-2 people (marketer + developer)
**Output**: SEO audit report + action plan + implemented improvements

---

## Week 1: Technical SEO Audit (Days 1-7)

### Day 1: Site Crawl & Indexing

**Tools**: Google Search Console, Screaming Frog (free up to 500 URLs)

- [ ] Run full site crawl with Screaming Frog
- [ ] Check Google Search Console for indexed pages
- [ ] Compare: Pages on site vs pages indexed
- [ ] Identify:
  - [ ] Pages not indexed (why?)
  - [ ] Pages with errors (404, 500)
  - [ ] Redirect chains (A→B→C, should be A→C)
  - [ ] Duplicate pages

**Deliverable**: List of technical issues (errors, redirects, duplicates)

---

### Day 2: Page Speed & Core Web Vitals

**Tools**: PageSpeed Insights, GTmetrix

- [ ] Test homepage speed (mobile + desktop)
- [ ] Test 5 key pages (product, pricing, blog, etc.)
- [ ] Record Core Web Vitals:
  - [ ] LCP (Largest Contentful Paint) - target <2.5s
  - [ ] FID (First Input Delay) - target <100ms
  - [ ] CLS (Cumulative Layout Shift) - target <0.1
- [ ] Identify slow-loading elements (images, scripts, fonts)

**Deliverable**: Page speed report with issues

**Quick wins**:
- Compress images (use TinyPNG, ImageOptim)
- Enable caching
- Minify CSS/JS
- Use CDN (Cloudflare free tier)

---

### Day 3: Mobile-Friendliness

**Tools**: Google Mobile-Friendly Test, Chrome DevTools

- [ ] Test homepage on mobile
- [ ] Check responsive design (320px, 375px, 414px widths)
- [ ] Test tap targets (buttons >48px, links clickable)
- [ ] Check font size (minimum 16px)
- [ ] Test forms on mobile (easy to fill?)

**Deliverable**: Mobile issues list

**Common issues**:
- Text too small
- Buttons too close together
- Horizontal scrolling
- Interstitials blocking content

---

### Day 4: HTTPS & Security

- [ ] Verify HTTPS everywhere (no mixed content)
- [ ] Check SSL certificate (valid, not expiring soon)
- [ ] Test for security headers:
  - [ ] X-Frame-Options
  - [ ] X-Content-Type-Options
  - [ ] Strict-Transport-Security
- [ ] Check robots.txt (not blocking important pages)
- [ ] Check sitemap.xml (submitted to Google Search Console)

**Deliverable**: Security issues list

---

### Day 5: URL Structure & Site Architecture

- [ ] Review URL structure:
  - ✅ Good: `/blog/seo-audit-guide`
  - ❌ Bad: `/page?id=12345&ref=xyz`
- [ ] Check navigation depth (can reach any page in ≤3 clicks?)
- [ ] Review internal linking (important pages well-linked?)
- [ ] Check for orphan pages (no internal links pointing to them)

**Deliverable**: URL and architecture recommendations

---

### Day 6: Structured Data & Schema

**Tool**: Google Rich Results Test

- [ ] Check for schema markup:
  - [ ] Organization schema (homepage)
  - [ ] Article schema (blog posts)
  - [ ] Product schema (product pages)
  - [ ] FAQ schema (FAQ pages)
  - [ ] Breadcrumb schema
- [ ] Test with Rich Results Test
- [ ] Identify missing schema opportunities

**Deliverable**: Schema implementation plan

---

### Day 7: Week 1 Report

- [ ] Compile all technical issues
- [ ] Prioritize by impact (P0 = critical, P1 = important, P2 = nice-to-have)
- [ ] Assign to developer for fixing
- [ ] Set deadline (Week 2-3 for implementation)

**Deliverable**: Technical SEO issues report (prioritized)

---

## Week 2: Content Audit (Days 8-14)

### Day 8: Keyword Research

**Tools**: Ahrefs, SEMrush, or Google Keyword Planner

- [ ] Export current rankings (Google Search Console)
- [ ] Identify top 20 keywords (by traffic)
- [ ] Find keyword gaps:
  - [ ] Keywords competitors rank for (you don't)
  - [ ] High-volume, low-difficulty keywords
  - [ ] Long-tail opportunities
- [ ] Group keywords by intent:
  - Informational ("how to")
  - Commercial ("best", "vs")
  - Transactional ("buy", "pricing")

**Deliverable**: Keyword target list (50-100 keywords)

---

### Day 9: Content Inventory

- [ ] List all pages/posts (use sitemap or crawl)
- [ ] For each, record:
  - [ ] URL
  - [ ] Title
  - [ ] Word count
  - [ ] Last updated
  - [ ] Organic traffic (Google Analytics)
  - [ ] Keywords ranking (Google Search Console)
- [ ] Identify:
  - [ ] Top performers (high traffic)
  - [ ] Underperformers (low traffic)
  - [ ] Outdated content (>2 years old)
  - [ ] Thin content (<300 words)

**Deliverable**: Content inventory spreadsheet

---

### Day 10: On-Page SEO Audit

For top 10 pages by traffic:

- [ ] Check title tags:
  - [ ] Unique per page
  - [ ] Contains target keyword
  - [ ] <60 characters
- [ ] Check meta descriptions:
  - [ ] Unique per page
  - [ ] Compelling (calls to action)
  - [ ] <160 characters
- [ ] Check headings (H1-H6):
  - [ ] One H1 per page
  - [ ] Logical hierarchy
  - [ ] Include keywords naturally
- [ ] Check images:
  - [ ] Alt text (descriptive, includes keywords)
  - [ ] File names (descriptive, not IMG_1234.jpg)
  - [ ] Compressed (<200KB per image)

**Deliverable**: On-page issues list

---

### Day 11: Content Gap Analysis

- [ ] Identify topics competitors cover (you don't)
- [ ] Use Ahrefs Content Gap or SEMrush Gap Analysis
- [ ] Prioritize by:
  - Search volume (high = good)
  - Difficulty (low = good)
  - Relevance (high = good)
- [ ] Create content ideas list (20-30 topics)

**Deliverable**: Content ideas list

---

### Day 12: Internal Linking Strategy

- [ ] Identify cornerstone content (5-10 most important pages)
- [ ] Audit internal links pointing to cornerstone content
  - Target: 10+ internal links per cornerstone page
- [ ] Find orphan pages (0 internal links)
- [ ] Create internal linking plan:
  - Link from new content → cornerstone
  - Link from high-traffic pages → conversion pages

**Deliverable**: Internal linking plan

---

### Day 13-14: Content Improvement Plan

For top 10 underperforming pages:

- [ ] Identify issue:
  - [ ] Outdated (update with fresh data)
  - [ ] Thin (expand from 500 to 1,500+ words)
  - [ ] Off-topic (rewrite for target keyword)
  - [ ] Poor formatting (add images, headings, lists)
- [ ] Create improvement checklist per page
- [ ] Set deadline (Week 3-4 for updates)

**Deliverable**: Content improvement plan

---

## Week 3: Off-Page SEO & Competition (Days 15-21)

### Day 15: Backlink Audit

**Tool**: Ahrefs, SEMrush, or Moz

- [ ] Export current backlinks
- [ ] Analyze:
  - [ ] Total backlinks
  - [ ] Total referring domains
  - [ ] Domain authority (DA) of linking sites
  - [ ] Anchor text distribution
- [ ] Identify:
  - [ ] Toxic links (spam, low-quality sites)
  - [ ] Opportunities (broken links, unlinked mentions)

**Deliverable**: Backlink profile report

---

### Day 16: Competitor Analysis

**Identify top 3 competitors** (ranking for your keywords):

For each competitor:
- [ ] Domain authority (Ahrefs DR or Moz DA)
- [ ] Total backlinks
- [ ] Top pages (by traffic)
- [ ] Top keywords (by traffic)
- [ ] Content types (blog, guides, tools)
- [ ] Link building tactics (guest posts, PR, directories)

**Deliverable**: Competitor analysis report

---

### Day 17: Link Building Strategy

**Identify 5-10 tactics**:
- [ ] Guest posting (list 10 target sites)
- [ ] Broken link building (find broken links in your niche)
- [ ] Unlinked mentions (find brand mentions without links)
- [ ] Resource pages (get listed on "best tools" pages)
- [ ] HARO (Help a Reporter Out) - respond to journalist queries

**Deliverable**: Link building plan (with targets)

---

### Day 18: Local SEO (If Applicable)

- [ ] Claim Google Business Profile
- [ ] Verify NAP (Name, Address, Phone) consistency across web
- [ ] Get listed in local directories (Yelp, Yellow Pages, local chambers)
- [ ] Encourage reviews (Google, Facebook, industry-specific)
- [ ] Create location pages (if multi-location)

**Deliverable**: Local SEO checklist

---

### Day 19-21: Execute Quick Wins

**Priority**: High-impact, low-effort tasks

From Weeks 1-2, implement:
- [ ] Fix 404 errors (top 10)
- [ ] Update meta descriptions (top 20 pages)
- [ ] Compress images (top 50)
- [ ] Add schema markup (homepage, blog)
- [ ] Fix mobile issues (critical only)
- [ ] Submit updated sitemap to Google

**Deliverable**: Quick wins completed

---

## Week 4: Monitoring & Reporting (Days 22-30)

### Day 22-25: Content Updates

**From Week 2 content plan**, update:
- [ ] Top 5 underperforming pages
- [ ] Add 500-1,000 words (expand thin content)
- [ ] Update with fresh data (2026 stats)
- [ ] Improve headings (H2, H3 with keywords)
- [ ] Add images/graphics
- [ ] Improve internal links

**Deliverable**: 5 pages updated and republished

---

### Day 26: Set Up Tracking

- [ ] Verify Google Analytics tracking (GA4)
- [ ] Set up Google Search Console (if not already)
- [ ] Create SEO dashboard (Google Data Studio or Sheets):
  - [ ] Organic traffic (weekly)
  - [ ] Keyword rankings (top 20)
  - [ ] Click-through rate (CTR)
  - [ ] Impressions
  - [ ] Core Web Vitals
  - [ ] Backlinks (monthly)
- [ ] Set up alerts (traffic drops, errors)

**Deliverable**: SEO dashboard live

---

### Day 27-28: Final Audit Report

Compile everything into one report:

**1. Executive Summary**
- Current organic traffic: [X] visits/month
- Top issues identified: [X technical, Y content, Z backlinks]
- Improvements made: [X% speed increase, Y pages updated]
- Recommendations: [Top 5 priorities for next 90 days]

**2. Technical SEO**
- Issues found: [X]
- Issues fixed: [Y]
- Remaining: [Z]

**3. Content SEO**
- Pages audited: [X]
- Pages updated: [Y]
- New content needed: [Z topics]

**4. Off-Page SEO**
- Current backlinks: [X]
- Link building opportunities: [Y]
- Competitor gap: [Z links behind]

**Deliverable**: Final SEO audit report (PDF, 10-20 pages)

---

### Day 29: Create 90-Day Action Plan

**Month 1 (Days 31-60)**:
- [ ] Publish 4 new blog posts (from content gap analysis)
- [ ] Get 5 backlinks (from link building plan)
- [ ] Fix remaining P1 technical issues

**Month 2 (Days 61-90)**:
- [ ] Publish 4 more blog posts
- [ ] Update 10 more underperforming pages
- [ ] Get 5 more backlinks

**Month 3 (Days 91-120)**:
- [ ] Publish 4 more blog posts
- [ ] Launch link building outreach campaign
- [ ] Review and adjust based on results

**Deliverable**: 90-day SEO roadmap

---

### Day 30: Present to Team

- [ ] Present audit findings to team (30-45 min)
- [ ] Share dashboard (give access)
- [ ] Assign ownership (who owns technical? content? links?)
- [ ] Set monthly check-ins (review progress)

**Deliverable**: Team aligned on SEO priorities

---

## Expected Results

**After 30 days**:
- Technical issues identified and top ones fixed
- Content audit complete with improvement plan
- Backlink strategy in place
- Dashboard tracking progress

**After 90 days**:
- 20-30% increase in organic traffic
- 10-20 new backlinks acquired
- 10-15 new/updated content pieces
- Rankings improved for target keywords

**After 6 months**:
- 50-100% increase in organic traffic
- Top 3-5 rankings for target keywords
- Steady month-over-month growth

---

## SEO Audit Tools

**Free**:
- Google Search Console (must-have)
- Google Analytics (GA4)
- PageSpeed Insights
- Google Mobile-Friendly Test
- Screaming Frog (free up to 500 URLs)

**Paid** (choose one):
- Ahrefs ($99-999/mo) - best all-in-one
- SEMrush ($119-449/mo) - strong competitor analysis
- Moz ($99-599/mo) - good for beginners

**Recommendation**: Start with free tools + Ahrefs ($99/mo). Upgrade as you scale.

---

## Common SEO Issues & Fixes

**Issue**: Slow page speed
**Fix**: Compress images, enable caching, use CDN

**Issue**: Not mobile-friendly
**Fix**: Use responsive design, test on real devices

**Issue**: Thin content (<300 words)
**Fix**: Expand to 1,000+ words, add depth

**Issue**: No backlinks
**Fix**: Guest posting, broken link building, HARO

**Issue**: Duplicate content
**Fix**: Canonical tags, 301 redirects, noindex

---

## Next Steps

1. **Start Day 1** (site crawl)
2. **Work through Week 1-4** (30 days)
3. **Implement 90-day plan**
4. **Review monthly** (adjust based on results)
5. **Keep iterating** (SEO is ongoing, not one-time)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
