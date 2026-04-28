# Tech Stack Decision Framework (1-Page)

**Purpose**: Choose the right technology stack for your product
**Time to Complete**: 2-4 hours (research + decision)
**Use Case**: CTOs, technical founders building new product or replatforming
**Output**: Tech stack decision with rationale and implementation plan

---

## Tech Stack Decision Framework

**The Stakes**:
- Wrong stack = months of wasted time, technical debt, expensive rewrites
- Right stack = faster development, lower costs, easier hiring

**Key Questions**:
1. **What are we building?** (Web app, mobile app, API, data platform)
2. **Who's building it?** (Team skills, experience, location)
3. **What are our constraints?** (Budget, timeline, scale, compliance)
4. **What's our growth plan?** (MVP → Scale → Enterprise)

---

## Step 1: Define Requirements

**Project Type**:
- [ ] Web application (customer-facing)
- [ ] Mobile app (iOS, Android, or both)
- [ ] API / Backend service
- [ ] Data platform (ETL, analytics, ML)
- [ ] E-commerce platform
- [ ] Internal tools / Admin dashboard

**Performance Requirements**:
- [ ] Expected users: [X] (Day 1), [Y] (Year 1), [Z] (Year 3)
- [ ] Expected traffic: [X] requests/sec
- [ ] Latency target: <[X]ms (p99)
- [ ] Uptime target: [X]% (e.g., 99.9% = 8 hours downtime/year)

**Compliance & Security**:
- [ ] Data residency: [Country] (e.g., Singapore PDPA, EU GDPR)
- [ ] Industry regulations: [e.g., HIPAA, PCI-DSS, SOC 2]
- [ ] Data encryption: [At rest, in transit]

**Budget & Timeline**:
- [ ] Budget: $[X]/month for infrastructure
- [ ] Timeline: [X] months to launch
- [ ] Team size: [X] engineers

---

## Step 2: Evaluate Tech Stack Options

### Frontend Framework

**For Web Apps**:

| Framework | Best For | Learning Curve | Hiring Pool | SEA Adoption |
|-----------|----------|----------------|-------------|--------------|
| **React** | Most flexible, huge ecosystem | Medium | Large | ⭐⭐⭐⭐⭐ |
| **Next.js** | React + SSR, SEO-critical apps | Medium | Large | ⭐⭐⭐⭐ |
| **Vue.js** | Simpler than React, progressive | Easy | Medium | ⭐⭐⭐⭐ |
| **Svelte** | Smallest bundle, fastest | Medium | Small | ⭐⭐ |
| **Angular** | Enterprise, full framework | Hard | Medium | ⭐⭐⭐ |

**Recommendation for SEA Startups**: **Next.js** (React-based, SSR for SEO, large hiring pool)

---

**For Mobile Apps**:

| Framework | Best For | Performance | Learning Curve | Hiring Pool |
|-----------|----------|-------------|----------------|-------------|
| **React Native** | Cross-platform (iOS + Android) | Good | Medium | Large |
| **Flutter** | Cross-platform, beautiful UI | Excellent | Medium | Growing |
| **Swift (iOS)** | iOS-only, best performance | Excellent | Hard | Medium |
| **Kotlin (Android)** | Android-only, best performance | Excellent | Medium | Medium |

**Recommendation**: **React Native** (SEA has large JS talent pool, ship both platforms faster)

---

### Backend Framework

| Language | Framework | Best For | Learning Curve | Performance | Hiring Pool (SEA) |
|----------|-----------|----------|----------------|-------------|-------------------|
| **JavaScript/TypeScript** | Node.js (Express, Fastify) | Full-stack JS, microservices | Easy | Good | ⭐⭐⭐⭐⭐ |
| **Python** | Django, FastAPI | Data/ML, rapid prototyping | Easy | Medium | ⭐⭐⭐⭐ |
| **Ruby** | Rails | MVPs, startups, CRUD apps | Easy | Medium | ⭐⭐⭐ |
| **Go** | Go (stdlib, Gin, Fiber) | High-performance APIs, microservices | Medium | Excellent | ⭐⭐⭐ |
| **Java** | Spring Boot | Enterprise, complex systems | Hard | Good | ⭐⭐⭐⭐ |
| **PHP** | Laravel | Traditional web apps, WordPress | Easy | Medium | ⭐⭐⭐⭐ |

**Recommendation for SEA Startups**:
- **Node.js** (huge talent pool, same language as frontend)
- **Python + FastAPI** (if doing data/ML)

---

### Database

**Relational (SQL)**:

| Database | Best For | Cost | Complexity | SEA Support |
|----------|----------|------|------------|-------------|
| **PostgreSQL** | General purpose, advanced features | Low | Medium | ⭐⭐⭐⭐⭐ |
| **MySQL** | Simple apps, WordPress, legacy | Low | Easy | ⭐⭐⭐⭐⭐ |
| **Amazon Aurora** | AWS-native, auto-scaling | Medium | Medium | ⭐⭐⭐⭐ |

**Recommendation**: **PostgreSQL** (most feature-rich, open-source, free)

---

**NoSQL**:

| Database | Best For | Cost | When to Use |
|----------|----------|------|-------------|
| **MongoDB** | Flexible schema, rapid iteration | Medium | Early-stage, changing requirements |
| **DynamoDB** | Serverless, high scale | Medium-High | AWS-native, event-driven apps |
| **Redis** | Caching, sessions, real-time | Low | Supplement to SQL (not replacement) |
| **Firebase** | Mobile apps, real-time sync | Low-Medium | Rapid prototyping, mobile-first |

**Recommendation**: Start with **PostgreSQL** (relational), add **Redis** (caching), consider **MongoDB** only if truly schema-less

---

### Cloud Provider

| Provider | Best For | Cost | SEA Presence | Recommendation |
|----------|----------|------|--------------|----------------|
| **AWS** | Most mature, all use cases | $$$ | SG, ID, TH, MY | ⭐⭐⭐⭐⭐ |
| **GCP** | Data/AI, Kubernetes | $$ | SG, ID | ⭐⭐⭐⭐ |
| **Vercel** | Next.js apps, frontend | $ | Global CDN | ⭐⭐⭐⭐ |
| **Railway** | Simple deployments, startups | $ | Global | ⭐⭐⭐ |
| **DigitalOcean** | Simple apps, low budget | $ | SG | ⭐⭐⭐ |

**Recommendation**:
- **MVP stage**: Vercel (frontend) + Railway (backend) [cheapest, easiest]
- **Growth stage**: AWS or GCP [most mature, scalable]

---

## Step 3: Common Tech Stack Patterns

### Pattern 1: Modern SaaS (B2B)

**Use case**: SaaS product for businesses (e.g., project management, CRM, analytics)

**Stack**:
- **Frontend**: Next.js (React) + TypeScript + Tailwind CSS
- **Backend**: Node.js (Express or Fastify) + TypeScript
- **Database**: PostgreSQL (Supabase or RDS) + Redis (caching)
- **Auth**: NextAuth.js or Supabase Auth
- **Payments**: Stripe
- **Hosting**: Vercel (frontend) + Railway/AWS (backend)
- **Monitoring**: Sentry (errors) + Vercel Analytics

**Cost**: $50-500/month (MVP), $500-5K/month (growth)

**Why this stack?**:
- TypeScript everywhere (type safety, fewer bugs)
- Next.js: SEO-friendly, fast, great DX
- PostgreSQL: Rock-solid, relational data
- Huge talent pool in SEA

---

### Pattern 2: Mobile-First App

**Use case**: Consumer mobile app (e.g., social, marketplace, on-demand services)

**Stack**:
- **Mobile**: React Native (iOS + Android)
- **Backend**: Node.js + TypeScript or Go
- **Database**: PostgreSQL + Redis
- **Real-time**: Socket.io or Firebase
- **Push notifications**: Firebase Cloud Messaging
- **File storage**: AWS S3 or Cloudinary
- **Hosting**: AWS or GCP
- **Auth**: Firebase Auth or custom JWT

**Cost**: $200-1K/month (MVP), $1K-10K/month (growth)

**Why this stack?**:
- React Native: Ship both iOS + Android with one codebase
- Firebase: Easy push notifications, real-time
- Large mobile dev talent pool in SEA

---

### Pattern 3: E-Commerce Platform

**Use case**: Online store selling physical or digital products

**Stack**:
- **Platform**: Shopify (easiest) or custom Next.js + Stripe
- **Frontend**: Next.js + TypeScript (if custom)
- **Backend**: Node.js or use Shopify APIs
- **Database**: PostgreSQL (if custom) or Shopify's database
- **Payments**: Stripe (global) or Xendit/2C2P (SEA-specific)
- **Inventory**: Shopify or custom ERP integration
- **Hosting**: Vercel (custom) or Shopify's hosting

**Cost**: $29-299/month (Shopify), $500-5K/month (custom)

**Recommendation**: Start with **Shopify** (fastest, proven), go custom only if you need heavy customization

---

### Pattern 4: Data/AI Platform

**Use case**: Analytics dashboard, ML model serving, data processing

**Stack**:
- **Frontend**: Next.js + React + Tailwind CSS
- **Backend**: Python (FastAPI) or Node.js
- **Database**: PostgreSQL (transactional) + BigQuery/Snowflake (analytics)
- **Data Processing**: Apache Airflow or Dagster
- **ML**: Python (scikit-learn, PyTorch, TensorFlow)
- **ML Serving**: FastAPI + Docker or AWS SageMaker
- **Hosting**: GCP (best data tools) or AWS

**Cost**: $500-5K/month (MVP), $5K-50K/month (scale)

**Why this stack?**:
- Python: Best ML ecosystem
- GCP: BigQuery is unbeatable for analytics
- FastAPI: Fast, modern Python framework

---

## Step 4: Decision Matrix

**Score each option (1-5)** on these criteria:

| Criteria | Weight | React + Node | Vue + Ruby | React Native (Mobile) |
|----------|--------|--------------|------------|----------------------|
| **Team Skills** | 30% | 5 (team knows React) | 3 (need to learn) | 4 (team knows JS) |
| **Hiring Pool** | 20% | 5 (huge in SEA) | 3 (smaller) | 5 (huge in SEA) |
| **Performance** | 15% | 4 (good enough) | 4 (good enough) | 4 (good for mobile) |
| **Cost** | 15% | 4 ($50-500/mo) | 5 (cheap hosting) | 3 ($200-1K/mo) |
| **Ecosystem** | 10% | 5 (huge) | 4 (good) | 5 (huge) |
| **Time to Market** | 10% | 5 (fast) | 4 (fast) | 3 (mobile takes longer) |
| **Weighted Score** | - | **4.5** | **3.6** | **4.1** |

**Winner**: React + Node (best for team, hiring, ecosystem)

---

## Step 5: Common Mistakes

### ❌ Mistake 1: Choosing Based on Hype

**Wrong**: "Let's use Rust because it's fast"
**Right**: "Let's use Node.js because team knows JS and we can hire easily"

**Why**: Exotic languages = hard to hire, slow development

---

### ❌ Mistake 2: Over-Engineering Early

**Wrong**: "Let's build microservices from Day 1"
**Right**: "Let's build a monolith, split later if needed"

**Why**: Microservices = 10x complexity. Only needed at scale (>50 engineers).

---

### ❌ Mistake 3: Ignoring Team Skills

**Wrong**: "Let's use Python but team only knows PHP"
**Right**: "Let's use PHP (or retrain team gradually)"

**Why**: Retraining = 3-6 months lost productivity

---

### ❌ Mistake 4: Vendor Lock-In Without Thinking

**Wrong**: "Let's use Firebase for everything"
**Right**: "Let's use open-source (PostgreSQL, Redis) with Firebase for auth"

**Why**: Firebase pricing explodes at scale. Hard to migrate off.

---

## Decision Document Template

**Project**: [Name]
**Date**: [YYYY-MM-DD]
**Decision Owner**: [CTO name]

**Requirements**:
- Type: Web app (B2B SaaS)
- Scale: 1K users (Day 1), 100K users (Year 1)
- Budget: $500/month (MVP), $5K/month (growth)
- Timeline: 3 months to MVP
- Team: 3 engineers (all know JavaScript)
- Compliance: Singapore PDPA

**Stack Decision**:
- **Frontend**: Next.js + TypeScript + Tailwind CSS
- **Backend**: Node.js + TypeScript + Express
- **Database**: PostgreSQL (Supabase) + Redis
- **Auth**: NextAuth.js
- **Payments**: Stripe
- **Hosting**: Vercel (frontend) + Railway (backend)

**Rationale**:
1. **Team knows JS**: Zero ramp-up time
2. **Huge hiring pool**: Easy to scale team in SEA
3. **TypeScript**: Type safety reduces bugs
4. **Next.js**: SEO-friendly, fast DX
5. **Low cost**: $50-200/month for MVP

**Alternatives Considered**:
- **Python + Django**: Rejected (team doesn't know Python)
- **Ruby on Rails**: Rejected (smaller hiring pool in SEA)
- **Microservices**: Rejected (over-engineering for MVP)

**Risks**:
- Node.js performance at scale (mitigate: add Redis caching, horizontal scaling)
- Vendor lock-in to Vercel (mitigate: can self-host Next.js on AWS if needed)

**Next Steps**:
1. Set up repos (frontend, backend)
2. Set up CI/CD (GitHub Actions)
3. Deploy "Hello World" to Vercel + Railway (Week 1)
4. Build MVP features (Week 2-12)

---

## Tech Stack Checklist

**Before Committing**:
- [ ] Team has skills (or can learn in <1 month)
- [ ] Hiring pool exists in your market (SEA)
- [ ] Meets performance requirements
- [ ] Fits budget ($X/month)
- [ ] Documented decision rationale
- [ ] Alternatives considered and rejected
- [ ] Risks identified with mitigations

---

## Stack by Company Stage

### Pre-Seed (MVP, 0-2 engineers)
**Goal**: Ship fast, validate idea
**Stack**: Next.js + Supabase (PostgreSQL + Auth) + Vercel
**Cost**: $0-100/month
**Why**: All-in-one, no backend code needed

### Seed (PMF, 3-8 engineers)
**Goal**: Prove scalability
**Stack**: Next.js + Node.js + PostgreSQL + Redis + AWS/Railway
**Cost**: $500-2K/month
**Why**: Separation of concerns, easier to scale

### Series A (Scale, 10-30 engineers)
**Goal**: Handle growth
**Stack**: Same as Seed, but add: Kubernetes, microservices (if needed), observability (Datadog)
**Cost**: $5K-20K/month
**Why**: Scale engineering team and infrastructure

### Series B+ (Optimize, 50+ engineers)
**Goal**: Efficiency at scale
**Stack**: Microservices, multi-region, advanced infra (service mesh, APM, etc.)
**Cost**: $50K-500K/month
**Why**: Maturity, redundancy, global scale

---

## Resources

**Learning**:
- **Frontend**: [react.dev](https://react.dev), [nextjs.org](https://nextjs.org)
- **Backend**: [nodejs.org](https://nodejs.org), [fastapi.tiangolo.com](https://fastapi.tiangolo.com)
- **Database**: [postgresql.org](https://postgresql.org), [redis.io](https://redis.io)

**Communities (SEA)**:
- Engineers.SG (Singapore)
- WebCamp (Thailand)
- Facebook: "ReactJS Indonesia", "Node.js SEA"

---

## Next Steps

1. **Define requirements** (scale, budget, compliance)
2. **Assess team skills** (what do they know?)
3. **Research options** (frontend, backend, database, cloud)
4. **Score options** (decision matrix)
5. **Document decision** (rationale, alternatives, risks)
6. **Set up MVP** (repos, CI/CD, deploy "Hello World")
7. **Iterate** (re-evaluate at each funding round)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Cloud Providers Comparison](../comparison-guides/cloud-providers-sea.md), [Annual Budget Template](./annual-budget-template.md)
