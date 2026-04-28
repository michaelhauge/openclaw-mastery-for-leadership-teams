# Cloud Cost Optimizer (Spreadsheet Calculator)

**Purpose**: Analyze AWS/GCP cloud spend and find optimization opportunities
**Time to Complete**: 2-3 hours (initial analysis), ongoing monitoring
**Use Case**: CTOs, DevOps, finance teams tracking cloud costs
**Output**: Cloud cost breakdown, optimization recommendations, potential savings

---

## Cloud Cost Optimization Formula

**Total Cloud Cost** = Compute + Storage + Data Transfer + Database + Other Services

**Optimization Potential** = (Current Cost - Optimized Cost) ÷ Current Cost × 100%

**Example**:
- Current monthly cost: $10,000
- Optimized cost (after rightsizing, reserved instances): $6,500
- **Savings**: $3,500/month (35% reduction)
- **Annual savings**: $42,000/year

---

## Cloud Cost Optimizer Spreadsheet

### Tab 1: Current Spend (Input)

**Download Cost Reports**:
- **AWS**: Cost Explorer → Download CSV
- **GCP**: Billing → Reports → Export to BigQuery or download CSV
- **Azure**: Cost Management → Cost Analysis → Download

**Import to Spreadsheet**:

| Service Category | Service Name | Current Monthly Cost | Usage (Hours/GB/TB) | Unit Cost |
|------------------|--------------|----------------------|---------------------|-----------|
| **Compute** | EC2 t3.large (10 instances) | $730 | 7,300 hours | $0.10/hour |
| **Compute** | EC2 c5.xlarge (5 instances) | $850 | 3,650 hours | $0.23/hour |
| **Storage** | S3 Standard (5 TB) | $115 | 5 TB | $0.023/GB |
| **Storage** | EBS gp3 (2 TB) | $160 | 2 TB | $0.08/GB |
| **Database** | RDS PostgreSQL db.t3.large | $292 | 730 hours | $0.40/hour |
| **Database** | DynamoDB (provisioned) | $450 | 100 WCU, 100 RCU | - |
| **Data Transfer** | Outbound to internet | $900 | 10 TB | $0.09/GB |
| **Load Balancer** | ALB (2 load balancers) | $36 | 1,460 hours | $0.025/hour |
| **Other** | CloudWatch, Route53, etc. | $267 | - | - |
| **Total** | **All Services** | **$3,800** | - | - |

**Notes**:
- Group services by category (Compute, Storage, Database, etc.)
- Break down by resource type (EC2 instance types, S3 storage classes)
- Include usage metrics (hours, GB, TB)

---

### Tab 2: Optimization Opportunities

**Optimization Categories**:

#### 1. Rightsizing (Compute)

**Problem**: Over-provisioned instances (paying for unused CPU/RAM)

**Analysis**:

| Instance | Current Type | Avg CPU | Avg RAM | Recommendation | Current Cost | Optimized Cost | Monthly Savings |
|----------|--------------|---------|---------|----------------|--------------|----------------|-----------------|
| web-01 | t3.large (2 vCPU, 8 GB RAM) | 15% | 30% | t3.medium (2 vCPU, 4 GB RAM) | $73 | $36.50 | $36.50 |
| web-02 | t3.large | 12% | 25% | t3.medium | $73 | $36.50 | $36.50 |
| api-01 | c5.xlarge (4 vCPU, 8 GB RAM) | 40% | 50% | c5.large (2 vCPU, 4 GB RAM) | $170 | $85 | $85 |
| api-02 | c5.xlarge | 35% | 45% | c5.large | $170 | $85 | $85 |

**Total Rightsizing Savings**: $243/month ($2,916/year)

**How to Identify**:
- Use AWS CloudWatch or GCP Monitoring
- Check average CPU/RAM utilization over 30 days
- If avg CPU <30% and RAM <40%, downsize instance type

---

#### 2. Reserved Instances / Savings Plans

**Problem**: Paying on-demand pricing for steady-state workloads

**Analysis**:

| Instance | Current (On-Demand) | Reserved (1-year) | Reserved (3-year) | Savings (1-year) | Savings (3-year) |
|----------|---------------------|-------------------|-------------------|------------------|------------------|
| 10× t3.large | $730/month | $511/month (30% off) | $438/month (40% off) | $219/month | $292/month |
| 5× c5.xlarge | $850/month | $595/month (30% off) | $510/month (40% off) | $255/month | $340/month |

**Total Reserved Instance Savings**:
- **1-year**: $474/month ($5,688/year)
- **3-year**: $632/month ($7,584/year)

**When to Use**:
- Use Reserved Instances for workloads running 24/7 (databases, web servers)
- Use Savings Plans for flexible compute (EC2, Lambda, Fargate)
- Don't use for dev/test environments (use on-demand or spot instances)

---

#### 3. Spot Instances (Batch Jobs, CI/CD)

**Problem**: Paying on-demand for interruptible workloads

**Analysis**:

| Workload | Current (On-Demand) | Spot Instances (70% discount) | Monthly Savings |
|----------|---------------------|-------------------------------|-----------------|
| CI/CD runners (c5.xlarge, 2,000 hours/month) | $460 | $138 | $322 |
| Data processing (r5.2xlarge, 500 hours/month) | $252 | $76 | $176 |

**Total Spot Savings**: $498/month ($5,976/year)

**When to Use**:
- Batch jobs (data processing, video rendering)
- CI/CD builds (can retry if interrupted)
- Dev/test environments
- **Don't use** for: Production databases, web servers (too risky)

---

#### 4. Storage Optimization

**Problem**: Using expensive storage for infrequently accessed data

**Analysis**:

| Data Type | Current Storage | Optimized Storage | Current Cost | Optimized Cost | Monthly Savings |
|-----------|-----------------|-------------------|--------------|----------------|-----------------|
| Logs (>90 days old) | S3 Standard (2 TB) | S3 Glacier Instant Retrieval | $46 | $8 | $38 |
| Backups (>30 days old) | S3 Standard (1 TB) | S3 Glacier Deep Archive | $23 | $2 | $21 |
| Infrequently accessed files | EBS gp3 (500 GB) | S3 Intelligent-Tiering | $40 | $10 | $30 |

**Total Storage Savings**: $89/month ($1,068/year)

**Storage Tiers** (AWS S3):
- **S3 Standard**: $0.023/GB (frequent access)
- **S3 Intelligent-Tiering**: $0.023-0.004/GB (auto-tiering)
- **S3 Infrequent Access**: $0.0125/GB (accessed <1x/month)
- **S3 Glacier Instant Retrieval**: $0.004/GB (accessed <1x/quarter, instant retrieval)
- **S3 Glacier Flexible Retrieval**: $0.0036/GB (1-5 min retrieval)
- **S3 Glacier Deep Archive**: $0.00099/GB (12 hours retrieval)

---

#### 5. Database Optimization

**Problem**: Over-provisioned database or inefficient configuration

**Analysis**:

| Database | Issue | Current Cost | Optimization | Optimized Cost | Monthly Savings |
|----------|-------|--------------|--------------|----------------|-----------------|
| RDS PostgreSQL (db.t3.large) | Over-provisioned (30% CPU) | $292 | Downsize to db.t3.medium | $146 | $146 |
| DynamoDB (provisioned) | Predictable traffic | $450 | Switch to on-demand | $270 | $180 |
| RDS Multi-AZ (dev env) | Unnecessary HA in dev | $584 | Single-AZ | $292 | $292 |

**Total Database Savings**: $618/month ($7,416/year)

**Database Best Practices**:
- Use RDS Reserved Instances for production (30-60% savings)
- Use on-demand for dev/test (cheaper, can stop when not in use)
- Use DynamoDB on-demand for unpredictable traffic
- Don't use Multi-AZ for dev/staging (overkill)

---

#### 6. Data Transfer Optimization

**Problem**: Expensive data transfer out to internet

**Analysis**:

| Data Transfer Type | Current Cost | Optimization | Optimized Cost | Monthly Savings |
|--------------------|--------------|--------------|----------------|-----------------|
| Outbound to internet (10 TB) | $900 | Use CloudFront CDN (cache static assets) | $360 | $540 |
| Cross-region transfer (5 TB) | $100 | Reduce cross-region traffic (use local replicas) | $20 | $80 |

**Total Data Transfer Savings**: $620/month ($7,440/year)

**Data Transfer Costs** (AWS):
- **Outbound to internet**: $0.09/GB (first 10 TB)
- **Cross-region**: $0.02/GB
- **CloudFront**: $0.085/GB (first 10 TB, but caching reduces origin requests by 80-90%)

---

### Tab 3: Total Savings Summary

| Optimization Category | Monthly Savings | Annual Savings | Effort |
|-----------------------|-----------------|----------------|--------|
| **Rightsizing (Compute)** | $243 | $2,916 | Low (1-2 hours) |
| **Reserved Instances (1-year)** | $474 | $5,688 | Low (1 hour) |
| **Spot Instances** | $498 | $5,976 | Medium (4-6 hours) |
| **Storage Optimization** | $89 | $1,068 | Low (2-3 hours) |
| **Database Optimization** | $618 | $7,416 | Medium (4-6 hours) |
| **Data Transfer Optimization** | $620 | $7,440 | Medium (6-8 hours) |
| **Total Savings** | **$2,542** | **$30,504** | **18-26 hours** |

**Current Monthly Cost**: $3,800
**Optimized Monthly Cost**: $1,258
**Total Savings**: $2,542/month (67% reduction)
**Annual Savings**: $30,504

**ROI**: $30,504 annual savings ÷ 26 hours effort = $1,173/hour

---

### Tab 4: Implementation Plan

**Priority Matrix** (by ROI):

| Priority | Optimization | Savings | Effort | ROI ($/hour) | Timeline |
|----------|--------------|---------|--------|--------------|----------|
| **P0** | Reserved Instances (1-year) | $474/month | 1 hour | $5,688/hour | Week 1 |
| **P0** | Database Optimization (downsize) | $618/month | 2 hours | $3,708/hour | Week 1 |
| **P1** | Data Transfer (CloudFront) | $620/month | 6 hours | $1,240/hour | Week 2 |
| **P1** | Spot Instances (CI/CD) | $498/month | 4 hours | $1,494/hour | Week 2 |
| **P2** | Rightsizing (Compute) | $243/month | 2 hours | $1,458/hour | Week 3 |
| **P2** | Storage Optimization | $89/month | 3 hours | $356/hour | Week 3 |

**Week 1** (High ROI, Low Effort):
- [ ] Purchase Reserved Instances for production workloads (1 hour)
- [ ] Downsize over-provisioned databases (2 hours)
- **Expected savings**: $1,092/month

**Week 2** (High Savings, Medium Effort):
- [ ] Set up CloudFront CDN for static assets (6 hours)
- [ ] Migrate CI/CD to Spot Instances (4 hours)
- **Expected savings**: $1,118/month

**Week 3** (Quick Wins):
- [ ] Rightsize compute instances (2 hours)
- [ ] Move old data to S3 Glacier (3 hours)
- **Expected savings**: $332/month

**Total Timeline**: 3 weeks
**Total Savings**: $2,542/month ($30,504/year)

---

### Tab 5: Ongoing Monitoring

**Monthly Cost Review Checklist**:
- [ ] Review AWS Cost Explorer / GCP Billing (30 min/month)
- [ ] Check for idle resources (stopped EC2, unattached EBS volumes)
- [ ] Review CloudWatch metrics (identify under-utilized instances)
- [ ] Check for unused Reserved Instances (sell on RI Marketplace)
- [ ] Review data transfer costs (optimize if increasing)

**Cost Alerts**:
- [ ] Set budget alert: Email if monthly cost >$4,000
- [ ] Set anomaly detection: Email if daily cost >$150 (50% increase)
- [ ] Set usage alert: Email if data transfer >15 TB/month

**Quarterly Review**:
- [ ] Re-evaluate Reserved Instances (renew expiring RIs)
- [ ] Review instance types (check for newer, cheaper options)
- [ ] Audit IAM permissions (revoke unused access)
- [ ] Check for zombie resources (forgotten EC2, RDS, EBS)

---

## Cloud Cost Optimization Strategies

### Strategy 1: Shut Down Non-Production Environments

**Savings**: 30-50% on dev/staging costs

**How**:
- [ ] Shut down dev/staging instances outside work hours (nights, weekends)
- [ ] Use Lambda to stop instances at 7pm, start at 8am (Mon-Fri)
- [ ] Snapshot databases before shutdown (for data persistence)

**Example Savings**:
- Dev environment: 10 instances × 168 hours/week → 50 hours/week (70% reduction)
- Monthly savings: $730/month × 70% = $511/month

---

### Strategy 2: Use Auto-Scaling

**Savings**: 20-40% on compute costs

**How**:
- [ ] Set up Auto Scaling Groups (ASG) for web/api servers
- [ ] Scale down during low traffic (nights, weekends)
- [ ] Scale up during high traffic (peak hours, marketing campaigns)

**Example**:
- Current: 10 instances running 24/7
- Optimized: 4 instances baseline, scale to 10 during peak (12 hours/day)
- Average: 7 instances (30% reduction)
- Monthly savings: $730 × 30% = $219/month

---

### Strategy 3: Delete Unused Resources

**Savings**: 5-15% on total cloud spend

**Common Zombie Resources**:
- [ ] Unattached EBS volumes (orphaned after EC2 termination)
- [ ] Old snapshots (>90 days, no longer needed)
- [ ] Elastic IPs not associated with instances ($3.60/month each)
- [ ] Old AMIs (Amazon Machine Images)
- [ ] Unused load balancers ($18/month each)

**How to Find**:
- Use AWS Trusted Advisor (free tier has basic recommendations)
- Run weekly script to identify unattached EBS, unused Elastic IPs
- Set up Lambda function to alert on unused resources

**Example Savings**:
- 20 unattached EBS volumes (500 GB total): $40/month
- 10 unused Elastic IPs: $36/month
- 2 unused load balancers: $36/month
- **Total**: $112/month ($1,344/year)

---

### Strategy 4: Use Savings Plans (AWS)

**Savings**: 30-60% on compute costs

**How**:
- [ ] Commit to $X/hour compute usage for 1-3 years
- [ ] Applies to EC2, Lambda, Fargate
- [ ] More flexible than Reserved Instances (any instance type, region)

**Example**:
- Current on-demand spend: $1,000/month
- 1-year Savings Plan: $700/month (30% off)
- 3-year Savings Plan: $600/month (40% off)
- **Savings**: $300-400/month

---

## Google Sheets Formula Reference

**Total Monthly Cost**:
```
=SUM(B2:B100)
```

**Savings Percentage**:
```
=(Current_Cost - Optimized_Cost) / Current_Cost
```

**Annual Savings**:
```
=Monthly_Savings * 12
```

**ROI ($ per hour)**:
```
=Annual_Savings / Implementation_Hours
```

**Cost per Instance**:
```
=Unit_Cost * Hours_per_Month
```

---

## Cloud Cost Optimization Checklist

**Before Optimization**:
- [ ] Download cost reports (AWS Cost Explorer, GCP Billing)
- [ ] Identify top 10 most expensive services (80/20 rule)
- [ ] Review CloudWatch metrics (CPU, RAM, network utilization)
- [ ] List all Reserved Instances (check expiration dates)
- [ ] Audit IAM permissions (who has access to provision resources?)

**During Optimization**:
- [ ] Rightsize over-provisioned instances (downsize)
- [ ] Purchase Reserved Instances for steady-state workloads (1-3 year)
- [ ] Migrate batch jobs to Spot Instances (70% discount)
- [ ] Move old data to cheaper storage (S3 Glacier, Infrequent Access)
- [ ] Optimize databases (downsize, switch to on-demand, remove Multi-AZ in dev)
- [ ] Set up CloudFront CDN (reduce data transfer costs)

**After Optimization**:
- [ ] Monitor costs weekly (set alerts)
- [ ] Review monthly (check for new optimization opportunities)
- [ ] Quarterly Reserved Instance review (renew expiring RIs)
- [ ] Annual architecture review (new instance types, cheaper alternatives)

---

## Common Cloud Cost Mistakes

### ❌ Mistake 1: Running Production-Sized Dev Environments

**Wrong**: Dev/staging = same size as production (identical costs)
**Right**: Dev/staging = 30-50% of production size (right-sized)

**Why**: Dev doesn't need HA, Multi-AZ, large instances. Save 50-70% on dev costs.

---

### ❌ Mistake 2: Not Using Reserved Instances

**Wrong**: Pay on-demand for 24/7 workloads (100% cost)
**Right**: Use Reserved Instances for production (30-60% savings)

**Why**: Reserved Instances pay for themselves in 9-18 months.

---

### ❌ Mistake 3: Ignoring Data Transfer Costs

**Wrong**: Don't monitor data transfer (hidden cost explosion)
**Right**: Use CloudFront CDN, minimize cross-region traffic

**Why**: Data transfer = 10-30% of cloud bill. Easy to optimize with CDN.

---

### ❌ Mistake 4: No Auto-Scaling

**Wrong**: Fixed number of instances (over-provisioned for peak)
**Right**: Auto-scale based on traffic (scale down during low traffic)

**Why**: Auto-scaling saves 20-40% on compute costs.

---

## Tools & Resources

**AWS Cost Optimization**:
- **AWS Cost Explorer**: Visualize and analyze costs (free)
- **AWS Trusted Advisor**: Optimization recommendations (free basic tier)
- **AWS Compute Optimizer**: Rightsizing recommendations (free)
- **AWS Cost Anomaly Detection**: Detect unusual spending (free)

**GCP Cost Optimization**:
- **GCP Billing Reports**: Cost analysis and visualization (free)
- **GCP Recommender**: Optimization recommendations (free)
- **GCP Active Assist**: Automated cost management (free)

**Third-Party Tools**:
- **CloudHealth** (VMware): Multi-cloud cost management ($500-2K/month)
- **CloudCheckr**: Cloud cost optimization ($500-2K/month)
- **Spot.io**: Automated spot instance management ($500-2K/month)
- **Kubecost**: Kubernetes cost optimization ($50-500/month)

---

## Next Steps

1. **Download cost reports** (AWS Cost Explorer, GCP Billing)
2. **Import to spreadsheet** (group by service category)
3. **Identify top 10 expenses** (focus on 80/20)
4. **Analyze optimization opportunities** (rightsizing, Reserved Instances, spot, storage)
5. **Calculate potential savings** (monthly, annual)
6. **Prioritize by ROI** (highest savings, lowest effort first)
7. **Implement Week 1 optimizations** (Reserved Instances, downsize databases)
8. **Implement Week 2 optimizations** (CloudFront, Spot Instances)
9. **Implement Week 3 optimizations** (rightsizing, storage)
10. **Monitor monthly** (set alerts, review costs)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [System Health Dashboard](./system-health-dashboard.md), [Security Hardening](../30-day-checklists/security-hardening.md)
