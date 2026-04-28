# System Health Dashboard (Spreadsheet)

**Purpose**: Monitor production system health and key infrastructure metrics
**Time to Complete**: 3-4 hours (initial setup), automated updates
**Use Case**: CTOs, DevOps, SRE teams monitoring production systems
**Output**: Real-time health dashboard with alerts for issues

---

## System Health Score Formula

**System Health Score** = Average of (Uptime Score + Performance Score + Error Rate Score + Cost Efficiency Score)

**Example**:
- Uptime: 99.9% (Score: 10/10)
- Performance (API latency): 150ms (Score: 8/10)
- Error rate: 0.5% (Score: 9/10)
- Cost efficiency: $5K/month (Score: 7/10)
- **Overall Health Score**: (10 + 8 + 9 + 7) ÷ 4 = **8.5/10** (Healthy)

---

## System Health Dashboard Spreadsheet

### Tab 1: Health Overview (Dashboard)

**System Health Score** (0-10 scale):

| Metric Category | Current Value | Target | Score (0-10) | Status | Trend (7 days) |
|-----------------|---------------|--------|--------------|--------|----------------|
| **Uptime** | 99.9% | 99.9% | 10/10 | ✅ Healthy | ↗ Improving |
| **Performance (API)** | 150ms avg | <200ms | 8/10 | ✅ Healthy | → Stable |
| **Error Rate** | 0.5% | <1% | 9/10 | ✅ Healthy | ↘ Degrading |
| **Incident Count** | 2 (this month) | <5 | 9/10 | ✅ Healthy | → Stable |
| **Cost Efficiency** | $5K/month | <$6K | 7/10 | ⚠️ Warning | ↗ Improving |
| **Security** | 0 vulnerabilities | 0 | 10/10 | ✅ Healthy | → Stable |
| **Overall Health** | - | - | **8.8/10** | ✅ Healthy | → Stable |

**Health Score Interpretation**:
- **9-10/10**: Excellent (green)
- **7-8/10**: Good (yellow)
- **5-6/10**: Warning (orange)
- **<5/10**: Critical (red)

---

### Tab 2: Uptime & Availability

**Uptime Tracking** (99.9% = "three nines" = 43 minutes downtime/month):

| Service | Uptime (30 days) | Target | Downtime (minutes) | Status | Last Incident |
|---------|------------------|--------|---------------------|--------|---------------|
| **Web Application** | 99.95% | 99.9% | 22 min | ✅ Healthy | 7 days ago (5 min) |
| **API** | 99.98% | 99.9% | 9 min | ✅ Healthy | 14 days ago (3 min) |
| **Database** | 99.99% | 99.9% | 4 min | ✅ Healthy | 30 days ago (2 min) |
| **Payment Processing** | 99.85% | 99.9% | 65 min | ⚠️ Warning | 2 days ago (30 min) |
| **Overall** | **99.9%** | 99.9% | **43 min** | ✅ Healthy | - |

**Uptime Benchmarks** (SaaS):
- **99.5%** ("two nines"): 3.6 hours downtime/month (acceptable for free tier)
- **99.9%** ("three nines"): 43 minutes downtime/month (standard for paid plans)
- **99.95%**: 22 minutes downtime/month (premium SaaS)
- **99.99%** ("four nines"): 4 minutes downtime/month (enterprise SLA)
- **99.999%** ("five nines"): 26 seconds downtime/month (mission-critical)

**Incident Log**:

| Date | Service | Duration | Impact | Root Cause | Resolution |
|------|---------|----------|--------|------------|------------|
| 2026-02-01 | Payment | 30 min | 100% payment failures | Stripe API timeout | Retry logic added |
| 2026-01-25 | Web App | 5 min | Slow page loads | Database connection pool exhausted | Increased pool size |
| 2026-01-20 | API | 3 min | 500 errors | Memory leak in Node.js | Patched memory leak |

---

### Tab 3: Performance Metrics

**API Performance** (Latency):

| Endpoint | Avg Latency (ms) | P95 Latency (ms) | P99 Latency (ms) | Target | Status |
|----------|------------------|------------------|------------------|--------|--------|
| **GET /api/users** | 50ms | 100ms | 200ms | <200ms | ✅ Healthy |
| **POST /api/orders** | 150ms | 300ms | 500ms | <200ms | ⚠️ Warning |
| **GET /api/reports** | 800ms | 2,000ms | 5,000ms | <1,000ms | 🔴 Critical |
| **Overall** | **150ms** | **300ms** | **600ms** | <200ms | ⚠️ Warning |

**Performance Targets**:
- **Fast**: <100ms (P95)
- **Good**: 100-200ms (P95)
- **Acceptable**: 200-500ms (P95)
- **Slow**: >500ms (P95)

**Page Load Performance**:

| Page | Avg Load Time | LCP (Largest Contentful Paint) | FID (First Input Delay) | CLS (Cumulative Layout Shift) | Status |
|------|---------------|-------------------------------|-------------------------|------------------------------|--------|
| **Homepage** | 1.2s | 1.5s | 50ms | 0.05 | ✅ Good |
| **Dashboard** | 2.8s | 3.2s | 80ms | 0.1 | ⚠️ Needs Improvement |
| **Reports** | 5.5s | 6.0s | 120ms | 0.15 | 🔴 Poor |

**Web Vitals Targets** (Google Core Web Vitals):
- **LCP**: <2.5s (good), 2.5-4s (needs improvement), >4s (poor)
- **FID**: <100ms (good), 100-300ms (needs improvement), >300ms (poor)
- **CLS**: <0.1 (good), 0.1-0.25 (needs improvement), >0.25 (poor)

---

### Tab 4: Error Rate & Monitoring

**Error Tracking**:

| Error Type | Count (30 days) | % of Requests | Trend (7 days) | Status | Top Errors |
|------------|-----------------|---------------|----------------|--------|------------|
| **4xx (Client Errors)** | 5,000 | 2% | ↗ Increasing | ⚠️ Warning | 404 Not Found (3K), 401 Unauthorized (1.5K) |
| **5xx (Server Errors)** | 500 | 0.2% | → Stable | ✅ Healthy | 500 Internal Error (300), 503 Service Unavailable (150) |
| **Timeout Errors** | 200 | 0.08% | ↘ Decreasing | ✅ Healthy | Database timeout (150), API timeout (50) |
| **Total Errors** | 5,700 | 2.28% | ↗ Increasing | ⚠️ Warning | - |

**Error Rate Targets**:
- **Excellent**: <0.5% error rate
- **Good**: 0.5-1% error rate
- **Acceptable**: 1-2% error rate
- **Poor**: >2% error rate

**Top 10 Errors** (Last 30 days):

| Error | Count | % of Total | Impact | Fix Priority |
|-------|-------|------------|--------|--------------|
| 404 Not Found (missing images) | 3,000 | 53% | Low | P2 (fix broken links) |
| 401 Unauthorized (expired tokens) | 1,500 | 26% | Medium | P1 (extend token TTL) |
| 500 Internal Error (null pointer) | 300 | 5% | High | P0 (fix code bug) |
| 503 Service Unavailable (rate limit) | 150 | 3% | High | P0 (increase rate limit) |

---

### Tab 5: Infrastructure Metrics

**Server Utilization**:

| Server | CPU (Avg %) | CPU (Peak %) | RAM (Avg %) | RAM (Peak %) | Disk (%) | Network (Gbps) | Status |
|--------|-------------|--------------|-------------|--------------|----------|----------------|--------|
| **web-01** | 45% | 80% | 60% | 85% | 50% | 0.5 | ✅ Healthy |
| **web-02** | 40% | 75% | 55% | 80% | 45% | 0.4 | ✅ Healthy |
| **api-01** | 60% | 90% | 70% | 95% | 40% | 1.2 | ⚠️ Warning |
| **db-01** | 30% | 50% | 80% | 90% | 75% | 0.8 | ⚠️ Warning |

**Utilization Targets**:
- **CPU**: <70% avg (good), 70-85% (acceptable), >85% (over-provisioned)
- **RAM**: <75% avg (good), 75-90% (acceptable), >90% (risk of OOM)
- **Disk**: <80% (good), 80-90% (warning), >90% (critical)

**Database Performance**:

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| **Connection Pool Utilization** | 60% | <80% | ✅ Healthy |
| **Query Latency (P95)** | 50ms | <100ms | ✅ Healthy |
| **Slow Queries (>1s)** | 5/hour | <10/hour | ✅ Healthy |
| **Deadlocks** | 0/day | <1/day | ✅ Healthy |
| **Replication Lag** | 0s | <5s | ✅ Healthy |

---

### Tab 6: Incident Response

**Incident History** (Last 90 days):

| Month | P0 (Critical) | P1 (High) | P2 (Medium) | P3 (Low) | Total | MTTR (Mean Time to Resolve) |
|-------|---------------|-----------|-------------|----------|-------|----------------------------|
| **Jan 2026** | 1 | 3 | 5 | 10 | 19 | 45 min |
| **Dec 2025** | 0 | 2 | 8 | 12 | 22 | 30 min |
| **Nov 2025** | 2 | 4 | 6 | 8 | 20 | 60 min |

**Incident Severity**:
- **P0 (Critical)**: Complete outage, >50% users affected, revenue loss
- **P1 (High)**: Major feature down, 10-50% users affected
- **P2 (Medium)**: Minor feature down, <10% users affected
- **P3 (Low)**: Bug, cosmetic issue, no user impact

**MTTR Targets** (Mean Time to Resolve):
- **P0**: <1 hour
- **P1**: <4 hours
- **P2**: <24 hours
- **P3**: <7 days

**On-Call Schedule**:

| Week | Primary | Secondary | Escalation |
|------|---------|-----------|------------|
| **Week 1** | Engineer A | Engineer B | CTO |
| **Week 2** | Engineer B | Engineer C | CTO |
| **Week 3** | Engineer C | Engineer A | CTO |
| **Week 4** | Engineer A | Engineer B | CTO |

---

### Tab 7: Cost Efficiency

**Monthly Cloud Cost Breakdown**:

| Service | Current Month | Last Month | Change | % of Total | Status |
|---------|---------------|------------|--------|------------|--------|
| **Compute (EC2, Lambda)** | $2,500 | $2,400 | +4% | 50% | → Stable |
| **Storage (S3, EBS)** | $500 | $480 | +4% | 10% | → Stable |
| **Database (RDS, DynamoDB)** | $800 | $750 | +7% | 16% | ↗ Increasing |
| **Data Transfer** | $600 | $550 | +9% | 12% | ↗ Increasing |
| **Other** | $600 | $600 | 0% | 12% | → Stable |
| **Total** | **$5,000** | **$4,780** | **+5%** | 100% | ↗ Increasing |

**Cost per Customer**:
- **Total cost**: $5,000/month
- **Customers**: 1,000
- **Cost per customer**: $5/month

**Cost Efficiency Targets**:
- **Excellent**: <$3/customer/month
- **Good**: $3-7/customer/month
- **Acceptable**: $7-15/customer/month
- **Poor**: >$15/customer/month

**Cost Optimization Opportunities**:
- [ ] Rightsize over-provisioned instances (save $500/month)
- [ ] Use Reserved Instances for production (save $750/month)
- [ ] Move old logs to S3 Glacier (save $100/month)
- [ ] Set up CloudFront CDN (save $200/month data transfer)
- **Total potential savings**: $1,550/month (31% reduction)

---

### Tab 8: Security & Compliance

**Security Metrics**:

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| **Critical Vulnerabilities** | 0 | 0 | ✅ Healthy |
| **High Vulnerabilities** | 2 | <5 | ✅ Healthy |
| **Failed Login Attempts** | 150/day | <500/day | ✅ Healthy |
| **SSL Certificate Expiry** | 45 days | >30 days | ✅ Healthy |
| **MFA Enabled (Team)** | 100% | 100% | ✅ Healthy |
| **Last Security Audit** | 30 days ago | <90 days | ✅ Healthy |

**Compliance Status**:
- [ ] **SOC 2 Type 1**: Completed (Jan 2026)
- [ ] **SOC 2 Type 2**: In progress (due: Jul 2026)
- [ ] **GDPR**: Compliant (data residency in EU/SEA)
- [ ] **PDPA (Singapore)**: Compliant
- [ ] **PCI DSS**: N/A (use Stripe for payments)

**Vulnerability Scan Results** (Last 30 days):

| Severity | Count | Top Issues |
|----------|-------|------------|
| **Critical** | 0 | None |
| **High** | 2 | Outdated Node.js version (v14, EOL), Weak SSL cipher |
| **Medium** | 5 | Missing security headers, CORS misconfiguration |
| **Low** | 10 | Informational (e.g., server version exposed) |

---

### Tab 9: Alerts & Notifications

**Alert Configuration**:

| Alert | Threshold | Current | Status | Last Triggered |
|-------|-----------|---------|--------|----------------|
| **Uptime < 99.9%** | <99.9% uptime | 99.95% | ✅ Healthy | 7 days ago |
| **API Latency > 500ms** | P95 > 500ms | 300ms | ✅ Healthy | 14 days ago |
| **Error Rate > 2%** | >2% errors | 2.28% | 🔔 Triggered | Now (investigating) |
| **CPU > 85%** | >85% avg | 60% | ✅ Healthy | 30 days ago |
| **Disk > 90%** | >90% full | 75% | ✅ Healthy | Never |
| **SSL Expiry < 30 days** | <30 days | 45 days | ✅ Healthy | Never |
| **Cost > $6K/month** | >$6K | $5K | ✅ Healthy | Never |

**Alert Channels**:
- **PagerDuty**: P0 incidents (SMS, phone call)
- **Slack**: P1-P3 incidents (channel alert)
- **Email**: Daily digest, weekly summary

**On-Call Rotation**:
- **Primary**: Responds within 15 minutes (P0), 1 hour (P1)
- **Secondary**: Escalation if primary doesn't respond in 30 min
- **Escalation**: CTO notified if unresolved after 2 hours

---

### Tab 10: SLO & SLA Tracking

**Service Level Objectives (SLO)** (Internal targets):

| Service | SLO | Current (30 days) | Error Budget Remaining | Status |
|---------|-----|-------------------|------------------------|--------|
| **API Uptime** | 99.9% | 99.98% | 95% | ✅ Healthy |
| **API Latency (P95)** | <200ms | 150ms | N/A | ✅ Healthy |
| **Error Rate** | <1% | 0.5% | 50% | ✅ Healthy |
| **Page Load Time** | <3s | 2.5s | N/A | ✅ Healthy |

**Service Level Agreements (SLA)** (Customer contracts):

| Tier | SLA | Penalty (if violated) | Current (30 days) | Status |
|------|-----|----------------------|-------------------|--------|
| **Free** | 99.5% | None | 99.9% | ✅ Met |
| **Pro** | 99.9% | 10% monthly credit | 99.95% | ✅ Met |
| **Enterprise** | 99.95% | 25% monthly credit | 99.98% | ✅ Met |

**Error Budget**:
- **Monthly error budget**: 0.1% (43 minutes downtime allowed)
- **Used**: 0.02% (9 minutes downtime)
- **Remaining**: 0.08% (34 minutes)
- **Status**: ✅ Healthy (78% error budget remaining)

---

## Google Sheets Formula Reference

**System Health Score**:
```
=(Uptime_Score + Performance_Score + Error_Rate_Score + Cost_Score) / 4
```

**Uptime Percentage**:
```
=1 - (Downtime_Minutes / Total_Minutes_In_Month)
```

**Error Rate**:
```
=Error_Count / Total_Requests * 100
```

**Cost per Customer**:
```
=Total_Monthly_Cost / Customer_Count
```

**MTTR (Mean Time to Resolve)**:
```
=SUM(Incident_Durations) / COUNT(Incidents)
```

**Error Budget Remaining**:
```
=(SLO - Actual_Uptime) / (100% - SLO)
```

---

## System Health Checklist

**Daily**:
- [ ] Check System Health Dashboard (5 min)
- [ ] Review overnight alerts (Slack, PagerDuty)
- [ ] Check error rate (any spikes?)
- [ ] Check API latency (P95, P99)

**Weekly**:
- [ ] Review incident log (what went wrong? root cause?)
- [ ] Check cost trends (any unexpected increases?)
- [ ] Review slow queries (database performance)
- [ ] Update on-call schedule

**Monthly**:
- [ ] Calculate uptime percentage (did we meet SLA?)
- [ ] Review error budget (how much remaining?)
- [ ] Security scan (npm audit, vulnerability scan)
- [ ] Cost optimization review (any opportunities?)

**Quarterly**:
- [ ] Review SLO/SLA targets (should we adjust?)
- [ ] Capacity planning (do we need to scale?)
- [ ] Incident retrospectives (what patterns? how to prevent?)
- [ ] Security audit (pen test, compliance review)

---

## Common System Health Mistakes

### ❌ Mistake 1: No Monitoring

**Wrong**: No monitoring, find out about issues from customers
**Right**: Proactive monitoring with alerts (know before customers do)

**Why**: Monitoring = catch issues early, fix before customer impact

---

### ❌ Mistake 2: Alert Fatigue

**Wrong**: 50 alerts/day (everything is an alert)
**Right**: 1-5 alerts/day (only critical issues)

**Why**: Too many alerts = ignore all alerts = miss real issues

---

### ❌ Mistake 3: No Error Budgets

**Wrong**: "We must have 100% uptime!" (unrealistic)
**Right**: "We aim for 99.9% uptime" (99.9% = 43 min downtime/month allowed)

**Why**: Error budgets = balance reliability with velocity

---

### ❌ Mistake 4: No Incident Retrospectives

**Wrong**: Fix issue, move on (don't learn from incidents)
**Right**: Hold retrospective after every P0/P1 incident (what went wrong? how to prevent?)

**Why**: Retrospectives = learn from mistakes, prevent recurrence

---

## Tools & Resources

**Monitoring & Alerting**:
- **DataDog** ($15-31/host/month): Full-stack monitoring
- **New Relic** ($25-99/user/month): APM, infrastructure monitoring
- **Prometheus + Grafana** (Free, self-hosted): Open-source monitoring
- **CloudWatch** (AWS): Native AWS monitoring (pay-as-you-go)

**Error Tracking**:
- **Sentry** ($26-80/month): Error tracking for apps
- **Rollbar** ($25-200/month): Error tracking
- **Bugsnag** ($59-599/month): Error tracking

**Incident Management**:
- **PagerDuty** ($21-41/user/month): On-call scheduling, alerting
- **Opsgenie** ($9-29/user/month): Incident management
- **VictorOps** ($9-49/user/month): Incident management

**Uptime Monitoring**:
- **Pingdom** ($10-72/month): Uptime monitoring
- **UptimeRobot** (Free-$18/month): Simple uptime checks
- **StatusCake** ($0-150/month): Uptime, performance monitoring

---

## Next Steps

1. **Set up monitoring** (DataDog, New Relic, CloudWatch)
2. **Define SLO/SLA targets** (uptime, latency, error rate)
3. **Configure alerts** (uptime, latency, error rate, cost)
4. **Create System Health Dashboard** (Google Sheets or Grafana)
5. **Set up on-call rotation** (PagerDuty, Opsgenie)
6. **Review weekly** (incidents, performance, costs)
7. **Hold retrospectives** (after every P0/P1 incident)
8. **Optimize quarterly** (cost, performance, reliability)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Cloud Cost Optimizer](./cloud-cost-optimizer.md), [Security Hardening](../30-day-checklists/security-hardening.md)
