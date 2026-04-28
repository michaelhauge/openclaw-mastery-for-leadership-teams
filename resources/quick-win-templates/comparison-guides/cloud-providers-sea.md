# Cloud Provider Comparison (SEA)

**Purpose**: Choose the right cloud provider for your business in Southeast Asia
**Time to Complete**: 45-60 minutes
**Use Case**: CTOs, DevOps teams selecting cloud infrastructure
**Output**: Provider decision with setup checklist

---

## Quick Decision Matrix

| Provider | Best For | Price (100 vCPU, 400GB RAM) | SEA Support | SEA Data Centers | Rating |
|----------|----------|------------------------------|-------------|-------------------|--------|
| **AWS** | Enterprise, all use cases | ~$2,500-3,500/mo | ⭐⭐⭐⭐⭐ | SG, ID, TH, MY | ⭐⭐⭐⭐⭐ |
| **GCP** | Data/AI, Kubernetes | ~$2,000-3,000/mo | ⭐⭐⭐⭐ | SG, ID, TH | ⭐⭐⭐⭐ |
| **Azure** | Microsoft stack, enterprise | ~$2,200-3,200/mo | ⭐⭐⭐⭐ | SG, MY, ID | ⭐⭐⭐⭐ |
| **Alibaba Cloud** | China business, e-commerce | ~$1,800-2,800/mo | ⭐⭐⭐ | SG, ID, MY, PH | ⭐⭐⭐⭐ |
| **DigitalOcean** | Startups, simple apps | ~$1,200-1,800/mo | ⭐⭐ | SG only | ⭐⭐⭐ |

---

## Detailed Comparison

### AWS (Amazon Web Services)

**Best for**: Enterprise, mature startups, all use cases (most comprehensive)

**SEA Presence**:
- **Data centers**: Singapore (ap-southeast-1), Jakarta (ap-southeast-3), Bangkok (ap-southeast-2), Malaysia (ap-southeast-5, launching 2026)
- **Edge locations**: 40+ in SEA (CloudFront CDN)
- **Local support**: 24/7 in English, Bahasa Indonesia, Thai, Mandarin
- **Compliance**: PDPA (Singapore), GDPR-ready, ISO 27001, SOC 2

**Pricing Example** (Singapore region):
- **t3.xlarge** (4 vCPU, 16GB RAM): $0.2368/hour = ~$170/month
- **r6i.2xlarge** (8 vCPU, 64GB RAM): $0.5376/hour = ~$390/month
- **Database (RDS PostgreSQL db.t3.medium)**: $0.082/hour = ~$60/month
- **Storage (EBS gp3)**: $0.096/GB-month
- **Data transfer**: $0.12/GB (out to internet, first 10TB)

**Typical startup stack** ($500-2,000/month):
- 2-4 EC2 instances (app servers)
- 1 RDS instance (database)
- 1 ElastiCache (Redis)
- S3 (file storage)
- CloudFront (CDN)
- Load Balancer

**Pros**:
- ✅ Most mature, comprehensive service catalog (200+ services)
- ✅ Best documentation and community support
- ✅ Strongest SEA presence (most data centers)
- ✅ Free tier (12 months: t2.micro, 750 hours/month)
- ✅ Pay-as-you-go, no upfront commitment
- ✅ Startup credits ($5K-100K via AWS Activate program)

**Cons**:
- ❌ Complex pricing (hard to estimate costs)
- ❌ Steeper learning curve vs alternatives
- ❌ Can get expensive if not optimized
- ❌ UI less intuitive than GCP

**When to choose**:
- You need comprehensive services (Lambda, SageMaker, etc.)
- You're building for enterprise customers (AWS = industry standard)
- You need multi-region deployment in SEA
- You value stability and mature ecosystem over cost

---

### GCP (Google Cloud Platform)

**Best for**: Data/AI workloads, Kubernetes, modern cloud-native apps

**SEA Presence**:
- **Data centers**: Singapore (asia-southeast1), Jakarta (asia-southeast2), Bangkok (asia-southeast3, launching 2026)
- **Edge locations**: 30+ in SEA
- **Local support**: 24/7 in English, limited local languages
- **Compliance**: PDPA, ISO 27001, SOC 2

**Pricing Example** (Singapore region):
- **n2-standard-4** (4 vCPU, 16GB RAM): $0.194/hour = ~$140/month
- **n2-highmem-8** (8 vCPU, 64GB RAM): $0.582/hour = ~$425/month
- **Cloud SQL (PostgreSQL db-n1-standard-1)**: $0.0738/hour = ~$54/month
- **Storage (Persistent Disk)**: $0.085/GB-month
- **Data transfer**: $0.12/GB (out to internet)

**Typical startup stack** ($400-1,500/month):
- 2-4 Compute Engine instances
- 1 Cloud SQL instance
- 1 Memorystore (Redis)
- Cloud Storage (files)
- Cloud CDN
- Load Balancer

**Pros**:
- ✅ 20-30% cheaper than AWS for compute/storage
- ✅ Best for Kubernetes (GKE is industry-leading)
- ✅ Excellent data/AI tools (BigQuery, Vertex AI, Dataflow)
- ✅ Simpler pricing (sustained use discounts automatic)
- ✅ Clean, intuitive UI
- ✅ Per-second billing (vs AWS per-hour on some services)
- ✅ Startup credits ($2K-100K via Google for Startups)

**Cons**:
- ❌ Smaller service catalog vs AWS
- ❌ Less mature in SEA (fewer data centers)
- ❌ Smaller community/fewer tutorials
- ❌ Limited local language support

**When to choose**:
- You're heavily using Kubernetes (GKE)
- You need data analytics/ML (BigQuery, Vertex AI)
- You want simpler pricing and lower costs
- Your team prefers Google's developer experience

---

### Azure (Microsoft)

**Best for**: Microsoft stack (.NET, Windows Server), enterprises with Microsoft contracts

**SEA Presence**:
- **Data centers**: Singapore (Southeast Asia), Malaysia (azure-apac-sea, launching 2026), Jakarta (planned 2027)
- **Edge locations**: 25+ in SEA
- **Local support**: 24/7 in English, limited local languages
- **Compliance**: PDPA, ISO 27001, SOC 2

**Pricing Example** (Singapore region):
- **D4s v3** (4 vCPU, 16GB RAM): $0.192/hour = ~$140/month
- **E8s v3** (8 vCPU, 64GB RAM): $0.504/hour = ~$368/month
- **Azure SQL Database (S3)**: ~$74/month
- **Storage (Premium SSD)**: $0.136/GB-month
- **Data transfer**: $0.138/GB (out to internet)

**Typical startup stack** ($400-1,800/month):
- 2-4 Virtual Machines
- 1 Azure SQL Database
- 1 Azure Cache for Redis
- Azure Blob Storage
- Azure CDN
- Load Balancer

**Pros**:
- ✅ Best for Microsoft stack (.NET, SQL Server, Windows)
- ✅ Strong enterprise integrations (Active Directory, Office 365)
- ✅ Hybrid cloud (on-premises + cloud)
- ✅ Good for companies already using Microsoft products
- ✅ Startup credits ($1K-150K via Microsoft for Startups)

**Cons**:
- ❌ Less mature in SEA vs AWS/GCP
- ❌ Complex pricing structure
- ❌ Smaller developer community in SEA
- ❌ Documentation less comprehensive vs AWS

**When to choose**:
- Your stack is .NET/Windows-based
- You have existing Microsoft enterprise agreement
- You need hybrid cloud (on-premises + cloud)
- Your enterprise customers prefer Azure

---

### Alibaba Cloud

**Best for**: China business, e-commerce in SEA

**SEA Presence**:
- **Data centers**: Singapore, Jakarta, Malaysia, Manila (Philippines)
- **China data centers**: Beijing, Shanghai, Hangzhou, Shenzhen (critical for China market)
- **Local support**: English, Mandarin, Bahasa Indonesia, Thai
- **Compliance**: PDPA, Chinese regulations (for China deployment)

**Pricing Example** (Singapore region):
- **ecs.c6.xlarge** (4 vCPU, 8GB RAM): ~$0.17/hour = ~$125/month
- **ecs.r6.2xlarge** (8 vCPU, 64GB RAM): ~$0.54/hour = ~$395/month
- **ApsaraDB RDS (PostgreSQL 2C4G)**: ~$80/month
- **Storage (ESSD)**: $0.10/GB-month
- **Data transfer**: $0.12/GB

**Typical startup stack** ($350-1,200/month):
- 2-4 ECS instances
- 1 RDS instance
- 1 Redis (ApsaraDB)
- OSS (Object Storage)
- CDN
- SLB (Load Balancer)

**Pros**:
- ✅ Best for China market access (only option if you need China deployment)
- ✅ Strong e-commerce tools (built for Alibaba/Taobao scale)
- ✅ Competitive pricing in SEA
- ✅ Good SEA coverage (SG, ID, MY, PH)
- ✅ Local payment methods (Alipay, WeChat Pay integration)

**Cons**:
- ❌ Less known/trusted outside China-focused businesses
- ❌ Documentation quality varies (translations)
- ❌ Smaller ecosystem vs AWS/GCP/Azure
- ❌ Limited third-party integrations

**When to choose**:
- You're targeting China market (requires China data center)
- You're building e-commerce platform
- You need Chinese language support
- You want competitive pricing in SEA

---

### DigitalOcean

**Best for**: Startups, simple web apps, non-critical workloads

**SEA Presence**:
- **Data centers**: Singapore only (sgp1)
- **Edge locations**: N/A (uses Cloudflare for CDN)
- **Local support**: Email only, English
- **Compliance**: Basic (no local compliance certifications)

**Pricing Example** (Singapore region):
- **Droplet (Basic 4 vCPU, 8GB RAM)**: $48/month
- **Droplet (General Purpose 8 vCPU, 32GB RAM)**: $168/month
- **Managed Database (PostgreSQL 2 vCPU, 4GB RAM)**: $60/month
- **Spaces (S3-compatible storage)**: $5/month (250GB)
- **Data transfer**: 5TB included, $0.01/GB overage

**Typical startup stack** ($100-400/month):
- 1-2 Droplets
- 1 Managed Database
- 1 Spaces (storage)
- Optional: Load Balancer ($12/mo), CDN (Cloudflare free)

**Pros**:
- ✅ Simplest pricing (flat monthly rates)
- ✅ Easiest to use (beginner-friendly UI)
- ✅ Cheapest for basic workloads
- ✅ Great documentation/tutorials
- ✅ Generous free credits for startups

**Cons**:
- ❌ Limited services (no AI/ML, no serverless)
- ❌ Only 1 SEA data center (Singapore)
- ❌ No enterprise features (no VPC, limited networking)
- ❌ Basic support (email only, no phone)
- ❌ Not suitable for regulated industries

**When to choose**:
- You're a startup with simple app (web server + database)
- You want predictable, low costs
- You don't need advanced services
- Singapore-only deployment is acceptable

---

## Side-by-Side Comparison

| Feature | AWS | GCP | Azure | Alibaba | DigitalOcean |
|---------|-----|-----|-------|---------|--------------|
| **SEA Data Centers** | 4 (SG, ID, TH, MY) | 2 (SG, ID) | 2 (SG, MY) | 4 (SG, ID, MY, PH) | 1 (SG) |
| **Service Catalog** | 200+ | 100+ | 150+ | 80+ | 20+ |
| **Pricing Transparency** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Ease of Use** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Documentation** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **24/7 Support** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| **Startup Credits** | $5K-100K | $2K-100K | $1K-150K | Varies | $200-500 |
| **Free Tier** | 12 months | 90 days + always-free | 12 months | 1 month | $200 credit |
| **Kubernetes** | ⭐⭐⭐⭐ (EKS) | ⭐⭐⭐⭐⭐ (GKE) | ⭐⭐⭐⭐ (AKS) | ⭐⭐⭐ (ACK) | ⭐⭐⭐ (DOKS) |
| **Data/ML Tools** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| **Cost (Compute)** | $$$ | $$ | $$ | $$ | $ |

---

## Recommendation by Use Case

### Scenario 1: B2B SaaS Startup (5-20 people)
**Recommendation**: **AWS** or **GCP**

**Why**:
- Comprehensive services (you'll need them as you scale)
- Startup credits ($5K-100K) offset initial costs
- Enterprise customers expect AWS/GCP/Azure
- Strong SEA presence

**Stack**:
- Compute: EC2/Compute Engine
- Database: RDS/Cloud SQL (PostgreSQL)
- Cache: ElastiCache/Memorystore (Redis)
- Storage: S3/Cloud Storage
- CDN: CloudFront/Cloud CDN

**Cost**: $800-2,500/month

---

### Scenario 2: Simple Web App (MVP)
**Recommendation**: **DigitalOcean**

**Why**:
- Easiest to use (non-technical founders can manage)
- Cheapest ($100-400/month)
- Predictable pricing
- Enough for MVP validation

**Stack**:
- 1-2 Droplets (app servers)
- 1 Managed Database
- Spaces (storage)
- Cloudflare (free CDN)

**Cost**: $100-400/month

---

### Scenario 3: E-commerce Platform (SEA-focused)
**Recommendation**: **Alibaba Cloud** or **AWS**

**Why Alibaba**:
- Built for e-commerce scale
- Best for China + SEA expansion
- Competitive pricing
- Strong SEA coverage

**Why AWS**:
- More mature, reliable
- Better third-party integrations (Shopify, Stripe, etc.)
- Stronger ecosystem

**Cost**: $1,000-5,000/month

---

### Scenario 4: Data/AI Startup
**Recommendation**: **GCP**

**Why**:
- Best data tools (BigQuery, Dataflow, Vertex AI)
- Cheaper for data processing
- Better Kubernetes (GKE)

**Stack**:
- GKE (Kubernetes)
- BigQuery (data warehouse)
- Cloud Storage (data lake)
- Vertex AI (ML)

**Cost**: $1,500-5,000/month

---

### Scenario 5: Enterprise B2B (Microsoft Stack)
**Recommendation**: **Azure**

**Why**:
- Best .NET/Windows support
- Active Directory integration
- Hybrid cloud (on-premises + cloud)
- Enterprise customers may prefer Azure

**Cost**: $2,000-8,000/month

---

## SEA-Specific Considerations

### Data Residency

**Singapore PDPA** (Personal Data Protection Act):
- Customer data of Singapore residents must stay in Singapore (or approved countries)
- AWS/GCP/Azure all have Singapore data centers

**Indonesia**:
- Regulation 71/2019: Certain data types must stay in Indonesia
- AWS (Jakarta), GCP (Jakarta), Alibaba (Jakarta) available

**Malaysia PDPA**:
- No strict data residency yet, but recommended to keep in-country
- AWS launching Malaysia region 2026

**Thailand PDPA**:
- Similar to EU GDPR, no strict residency yet
- AWS (Bangkok), GCP (Bangkok planned 2026)

---

### Latency by Country

**Target latency**: <50ms for good user experience

| User Location | AWS SG | GCP SG | Azure SG | Alibaba SG | DO SG |
|---------------|--------|--------|----------|------------|-------|
| **Singapore** | 5-10ms | 5-10ms | 5-10ms | 5-10ms | 5-10ms |
| **Malaysia** | 10-20ms | 10-20ms | 10-20ms | 10-20ms | 10-20ms |
| **Indonesia** | 20-40ms | 20-40ms | 20-40ms | 15-30ms | 20-40ms |
| **Thailand** | 30-50ms | 30-50ms | 30-50ms | 25-45ms | 30-50ms |
| **Philippines** | 40-60ms | 40-60ms | 40-60ms | 30-50ms | 40-60ms |
| **Vietnam** | 50-70ms | 50-70ms | 50-70ms | 40-60ms | 50-70ms |

**Recommendation**: If targeting multiple SEA countries, use multi-region deployment or CDN.

---

### Payment Methods

**AWS**:
- Credit card (all major: Visa, Mastercard, Amex)
- Bank transfer (for enterprise accounts)
- AWS Marketplace (for third-party services)

**GCP**:
- Credit card
- Bank transfer (for enterprise)
- Invoicing (for $2,500+/month)

**DigitalOcean**:
- Credit card only
- PayPal

**Alibaba Cloud**:
- Credit card
- Alipay, WeChat Pay (for China accounts)
- Bank transfer

---

## Migration Checklist

**Week 1: Planning**
- [ ] Audit current infrastructure
- [ ] Choose provider based on use case
- [ ] Apply for startup credits
- [ ] Set up account with multi-factor auth
- [ ] Set up billing alerts

**Week 2: Setup**
- [ ] Create VPC/network (isolate resources)
- [ ] Set up identity/access management (IAM)
- [ ] Launch test instances
- [ ] Configure monitoring (CloudWatch, Stackdriver, etc.)
- [ ] Set up backups

**Week 3: Migration**
- [ ] Migrate databases (use native tools or AWS DMS/GCP Database Migration)
- [ ] Migrate application code
- [ ] Migrate storage (S3/Cloud Storage)
- [ ] Set up load balancers
- [ ] Configure DNS

**Week 4: Testing & Cutover**
- [ ] Load testing
- [ ] Security audit
- [ ] Update DNS (point to new infrastructure)
- [ ] Monitor for 48-72 hours
- [ ] Decommission old infrastructure

---

## Cost Optimization Tips

### Tip 1: Reserved Instances / Committed Use Discounts

**AWS Reserved Instances**: 40-60% discount for 1-3 year commitment
**GCP Committed Use**: 25-55% discount
**Azure Reserved VM Instances**: 40-60% discount

**When to use**: Predictable workloads (databases, always-on services)

---

### Tip 2: Spot/Preemptible Instances

**AWS Spot Instances**: 70-90% discount (can be terminated anytime)
**GCP Preemptible VMs**: 70-91% discount
**Azure Spot VMs**: 70-90% discount

**When to use**: Batch jobs, CI/CD, non-critical workloads

---

### Tip 3: Auto-scaling

**Scale down during off-hours** (nights, weekends)

**Example**:
- Dev/staging: Scale to 0 at night (save 50%)
- Production: Scale based on traffic (save 20-30%)

---

### Tip 4: Use Free Tiers

**AWS Free Tier** (12 months):
- 750 hours/month t2.micro (1 vCPU, 1GB RAM)
- 5GB S3 storage
- 750 hours RDS (20GB)

**GCP Always Free**:
- 1 f1-micro instance (0.2 vCPU, 0.6GB RAM)
- 30GB storage
- 1GB Cloud Functions

---

## Next Steps

1. **Identify your use case** (SaaS, e-commerce, data/AI, etc.)
2. **Choose 2-3 providers** to evaluate
3. **Sign up for free tier** or startup credits
4. **Deploy test workload** (measure performance, cost)
5. **Evaluate** (cost, ease of use, support)
6. **Commit** to one provider (or multi-cloud for critical apps)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Tech Stack Decision Framework](../one-page-templates/tech-stack-decision.md), [Burn Rate Calculator](../spreadsheet-calculators/burn-rate-calculator.md)
