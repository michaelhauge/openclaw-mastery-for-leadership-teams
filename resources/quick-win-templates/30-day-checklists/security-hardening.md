# Security Hardening (30 Days)

**Purpose**: Secure infrastructure and applications against common attacks
**Time Investment**: 30-40 hours over 30 days
**Team Size**: 1-2 people (CTO, DevOps, security engineer)
**Output**: Hardened infrastructure, security policies, incident response plan

---

## Security Hardening Strategy

**Why Security Matters**:
- **Data breaches = customer trust lost**: Average breach costs $4M+ (IBM 2025)
- **Compliance requirements**: GDPR, PDPA, SOC 2, ISO 27001
- **Ransomware attacks**: Growing in SEA ($100K-$1M+ ransom demands)
- **Customer requirements**: B2B customers demand security audits

**Reality Check**:
- Perfect security doesn't exist (defense in depth)
- Security is ongoing (not one-time project)
- Focus on high-impact, low-effort wins first (80/20 rule)

---

## Week 1: Assessment & Quick Wins (Days 1-7)

**Theme**: Identify vulnerabilities, fix low-hanging fruit

### Day 1-2: Security Audit

**Run security scans**:
- [ ] **Web application**: OWASP ZAP, Burp Suite (scan for XSS, SQL injection, CSRF)
- [ ] **Infrastructure**: Nmap, Shodan (scan for open ports, exposed services)
- [ ] **Dependencies**: npm audit, pip-audit, Snyk (find vulnerable packages)
- [ ] **Secrets**: TruffleHog, GitGuardian (scan git history for leaked keys)

**Checklist**:
- [ ] Scan public-facing web applications
- [ ] Scan infrastructure (servers, databases, load balancers)
- [ ] Scan code repositories for secrets
- [ ] Document findings (categorize by severity: Critical, High, Medium, Low)

**Output**: Security audit report with prioritized vulnerabilities

---

### Day 3-4: Quick Wins (Fix Critical Issues)

**Fix critical vulnerabilities immediately**:

#### 1. Remove Exposed Secrets
- [ ] Rotate any exposed API keys, passwords, tokens
- [ ] Remove secrets from git history (git-filter-repo or BFG)
- [ ] Move secrets to environment variables or secret managers (AWS Secrets Manager, HashiCorp Vault)

#### 2. Update Vulnerable Dependencies
```bash
# Node.js
npm audit fix --force

# Python
pip-audit --fix

# Ruby
bundle audit check --update
```

#### 3. Close Unnecessary Open Ports
- [ ] Review open ports: `nmap -p- yourdomain.com`
- [ ] Close ports not in use (SSH 22, MySQL 3306, PostgreSQL 5432 should NOT be public)
- [ ] Use security groups (AWS) or firewall rules (GCP, DigitalOcean)

#### 4. Enable HTTPS Everywhere
- [ ] Use Let's Encrypt (free SSL certificates)
- [ ] Force HTTPS redirect (301 redirect from HTTP → HTTPS)
- [ ] Enable HSTS (HTTP Strict Transport Security) headers

**Deliverable**: Critical vulnerabilities fixed (P0 issues resolved)

---

### Day 5-6: Enable Basic Security Features

**Enable MFA (Multi-Factor Authentication)**:
- [ ] AWS Console: Enable MFA for root account + all IAM users
- [ ] GitHub: Enable 2FA for all team members
- [ ] Google Workspace: Enforce 2FA for all users
- [ ] Production servers: Require MFA for SSH access (Google Authenticator, Authy)

**Enable Logging**:
- [ ] AWS CloudTrail: Log all API calls
- [ ] Application logs: Log authentication attempts, failed logins, errors
- [ ] Web server logs: Enable access logs (Nginx, Apache)
- [ ] Database logs: Enable query logs, connection logs

**Set Up Alerts**:
- [ ] Failed login attempts (>5 in 10 minutes)
- [ ] Unusual API activity (sudden spike in requests)
- [ ] New IAM user created (AWS, GCP)
- [ ] SSL certificate expiring (<30 days)

**Deliverable**: MFA enabled, logging configured, alerts set up

---

### Day 7: Week 1 Retrospective

- [ ] Critical vulnerabilities fixed (secrets, open ports, vulnerable dependencies)
- [ ] MFA enabled across all critical accounts
- [ ] Logging and alerts configured
- [ ] Security audit report documented

**Deliverable**: Week 1 summary + remaining vulnerabilities list

---

## Week 2: Authentication & Authorization (Days 8-14)

**Theme**: Secure user access, implement least privilege

### Day 8-9: Password Policy & Authentication

**Strengthen Password Requirements**:
- [ ] Minimum 12 characters (not 8)
- [ ] Require uppercase, lowercase, numbers, special characters
- [ ] Block common passwords (use have-i-been-pwned API)
- [ ] Enforce password expiry (optional, controversial—consider passkeys instead)

**Implement Rate Limiting**:
- [ ] Limit login attempts: 5 attempts per 15 minutes
- [ ] Limit API requests: 100 requests per minute per user
- [ ] Block brute force attacks (Fail2ban, CloudFlare Rate Limiting)

**Add Session Management**:
- [ ] Use secure session cookies (HttpOnly, Secure, SameSite flags)
- [ ] Set session timeout (15-30 minutes for sensitive apps, 7 days for low-risk)
- [ ] Implement logout on all devices feature
- [ ] Revoke sessions on password change

**Deliverable**: Strong password policy, rate limiting, secure sessions

---

### Day 10-11: Implement Least Privilege (IAM)

**AWS IAM Best Practices**:
- [ ] Remove root access keys (use IAM users instead)
- [ ] Create IAM roles for services (EC2, Lambda, etc.)
- [ ] Use IAM policies (deny by default, grant minimum permissions)
- [ ] Enable IAM Access Analyzer (find overly permissive policies)

**Database Access**:
- [ ] Create read-only database users (for reporting, analytics)
- [ ] Grant write access only to application user
- [ ] Revoke admin access for day-to-day operations
- [ ] Use database audit logs (track who accessed what)

**SSH Access**:
- [ ] Disable root SSH login (`PermitRootLogin no` in sshd_config)
- [ ] Use SSH keys (disable password authentication)
- [ ] Limit SSH access by IP (whitelist office IPs)
- [ ] Use bastion hosts (jump servers) for production access

**Deliverable**: Least privilege implemented (IAM, database, SSH)

---

### Day 12-13: Implement Role-Based Access Control (RBAC)

**Define Roles**:
- [ ] **Admin**: Full access (founders, CTO)
- [ ] **Developer**: Read/write code, read logs, no production deploy
- [ ] **Support**: Read customer data, no write access
- [ ] **Finance**: Read billing, no infrastructure access

**Implement RBAC in Application**:
```javascript
// Example: Express.js middleware
function requireRole(role) {
  return (req, res, next) => {
    if (!req.user || !req.user.roles.includes(role)) {
      return res.status(403).json({ error: 'Forbidden' });
    }
    next();
  };
}

// Usage
app.post('/admin/users', requireRole('admin'), createUser);
app.get('/reports', requireRole('finance'), getReports);
```

**Audit Access**:
- [ ] Review who has access to what (spreadsheet or tool)
- [ ] Remove access for ex-employees (offboarding checklist)
- [ ] Quarterly access review (every 3 months)

**Deliverable**: RBAC implemented, access audit complete

---

### Day 14: Week 2 Retrospective

- [ ] Password policy strengthened
- [ ] Rate limiting enabled
- [ ] Least privilege implemented (IAM, database, SSH)
- [ ] RBAC roles defined and implemented

**Deliverable**: Week 2 summary + access control documentation

---

## Week 3: Infrastructure & Network Security (Days 15-21)

**Theme**: Secure servers, databases, network

### Day 15-16: Database Security

**PostgreSQL Security**:
- [ ] Use strong passwords (16+ characters, random)
- [ ] Disable public access (listen only on localhost or private IP)
- [ ] Enable SSL/TLS for connections (`ssl = on` in postgresql.conf)
- [ ] Use connection pooling (PgBouncer) instead of direct connections
- [ ] Enable query logging (log slow queries, failed connections)

**MongoDB Security**:
- [ ] Enable authentication (`mongod --auth`)
- [ ] Create users with specific database access (not admin for app)
- [ ] Disable public access (bind to private IP only)
- [ ] Enable encryption at rest (WiredTiger encryption)

**MySQL/MariaDB Security**:
- [ ] Remove default users (`DELETE FROM mysql.user WHERE User=''`)
- [ ] Use strong root password
- [ ] Disable remote root login
- [ ] Enable SSL for connections

**Backup & Recovery**:
- [ ] Automated daily backups (pg_dump, mongodump, mysqldump)
- [ ] Store backups off-site (S3, Google Cloud Storage)
- [ ] Encrypt backups (gpg, AWS S3 encryption)
- [ ] Test restore process (quarterly)

**Deliverable**: Databases secured, backups automated

---

### Day 17-18: Server Hardening

**Linux Server Security**:
- [ ] Keep system updated: `apt update && apt upgrade -y`
- [ ] Enable automatic security updates (unattended-upgrades)
- [ ] Configure firewall (ufw, iptables): allow only necessary ports
- [ ] Disable unnecessary services (`systemctl disable <service>`)
- [ ] Install fail2ban (block brute force SSH attempts)

**SSH Hardening** (/etc/ssh/sshd_config):
```bash
# Disable root login
PermitRootLogin no

# Disable password authentication (use SSH keys only)
PasswordAuthentication no

# Change default port (optional, security through obscurity)
Port 2222

# Allow only specific users
AllowUsers deploy engineer1 engineer2

# Limit authentication attempts
MaxAuthTries 3
```

**Docker Security** (if using containers):
- [ ] Run containers as non-root user (`USER node` in Dockerfile)
- [ ] Scan images for vulnerabilities (Trivy, Snyk)
- [ ] Limit container resources (CPU, memory)
- [ ] Use read-only filesystems where possible
- [ ] Update base images regularly (alpine, node, python)

**Deliverable**: Servers hardened, SSH secured, Docker containers secured

---

### Day 19-20: Network Security

**Use VPC (Virtual Private Cloud)**:
- [ ] Separate public and private subnets
- [ ] Place databases in private subnet (no internet access)
- [ ] Use NAT gateway for outbound traffic from private subnet
- [ ] Use security groups (firewall rules per service)

**Set Up WAF (Web Application Firewall)**:
- [ ] CloudFlare WAF (free tier available)
- [ ] AWS WAF (for applications on AWS)
- [ ] Block common attacks (SQL injection, XSS, DDoS)
- [ ] Geo-blocking (block traffic from high-risk countries)

**Enable DDoS Protection**:
- [ ] CloudFlare (free DDoS protection)
- [ ] AWS Shield Standard (free, basic protection)
- [ ] Rate limiting (block IPs exceeding 1,000 requests/minute)

**Deliverable**: VPC configured, WAF enabled, DDoS protection active

---

### Day 21: Week 3 Retrospective

- [ ] Databases secured (SSL, authentication, backups)
- [ ] Servers hardened (firewall, SSH, automatic updates)
- [ ] Network secured (VPC, WAF, DDoS protection)

**Deliverable**: Week 3 summary + infrastructure security documentation

---

## Week 4: Application Security & Incident Response (Days 22-30)

**Theme**: Secure code, prepare for incidents

### Day 22-24: Application Security

**Input Validation**:
- [ ] Validate all user inputs (length, format, type)
- [ ] Sanitize inputs (prevent XSS): use libraries (DOMPurify, bleach)
- [ ] Use parameterized queries (prevent SQL injection)
- [ ] Whitelist allowed characters (don't rely on blacklist)

**Example (SQL Injection Prevention)**:
```javascript
// ❌ WRONG: String concatenation (vulnerable to SQL injection)
const query = `SELECT * FROM users WHERE email = '${email}'`;

// ✅ RIGHT: Parameterized query (safe)
const query = 'SELECT * FROM users WHERE email = ?';
db.query(query, [email]);
```

**Output Encoding**:
- [ ] Encode HTML output (prevent XSS)
- [ ] Set Content-Security-Policy header (block inline scripts)
- [ ] Set X-Frame-Options header (prevent clickjacking)
- [ ] Set X-Content-Type-Options header (prevent MIME sniffing)

**CSRF Protection**:
- [ ] Use CSRF tokens for state-changing requests (POST, PUT, DELETE)
- [ ] Set SameSite cookie attribute (`SameSite=Lax` or `SameSite=Strict`)
- [ ] Verify Origin/Referer headers

**Deliverable**: Application secured (input validation, CSRF, XSS prevention)

---

### Day 25-26: Secrets Management

**Move Secrets to Secret Manager**:
- [ ] Use AWS Secrets Manager, GCP Secret Manager, or HashiCorp Vault
- [ ] Never commit secrets to git (add .env to .gitignore)
- [ ] Rotate secrets regularly (quarterly for API keys, annually for passwords)
- [ ] Use different secrets for dev, staging, production

**Environment Variables**:
```bash
# ❌ WRONG: Hardcoded secrets
const apiKey = 'sk-abc123xyz789';

# ✅ RIGHT: Environment variables
const apiKey = process.env.API_KEY;
```

**Audit Secrets Usage**:
- [ ] List all secrets (API keys, database passwords, tokens)
- [ ] Document who has access to each secret
- [ ] Revoke unused secrets
- [ ] Set up alerts for secret access (CloudTrail, Vault audit logs)

**Deliverable**: Secrets moved to secret manager, rotation policy defined

---

### Day 27-28: Incident Response Plan

**Create Incident Response Plan**:

**1. Detection**:
- [ ] Set up monitoring (Sentry, DataDog, CloudWatch)
- [ ] Alert on suspicious activity (failed logins, unusual API calls)
- [ ] Define severity levels (P0: data breach, P1: service down, P2: degraded, P3: minor)

**2. Response Team**:
- [ ] Assign roles: Incident Commander, Technical Lead, Communications Lead
- [ ] Create on-call rotation (PagerDuty, OpsGenie)
- [ ] Define escalation process (P0 → notify CEO, P1 → notify CTO, etc.)

**3. Playbooks**:
- [ ] **Data breach**: Steps to contain, assess impact, notify customers
- [ ] **DDoS attack**: Enable CloudFlare, block IPs, scale infrastructure
- [ ] **Compromised account**: Revoke tokens, reset password, audit actions
- [ ] **Service outage**: Restore from backup, investigate root cause

**4. Communication**:
- [ ] Notify affected customers (email, status page)
- [ ] Post incident report (within 48 hours)
- [ ] Comply with regulations (GDPR requires breach notification within 72 hours)

**Deliverable**: Incident response plan documented, team roles assigned

---

### Day 29: Security Training

**Train Team on Security Best Practices**:
- [ ] **Phishing awareness**: Teach how to recognize phishing emails
- [ ] **Password hygiene**: Use password manager (1Password, Bitwarden)
- [ ] **Secure coding**: OWASP Top 10, input validation, parameterized queries
- [ ] **Incident response**: What to do if they suspect a breach

**Resources**:
- [ ] OWASP Top 10: https://owasp.org/www-project-top-ten/
- [ ] Google's Security Basics: https://www.google.com/safetycenter/
- [ ] Internal security wiki (create in Notion or Confluence)

**Deliverable**: Team trained, security documentation created

---

### Day 30: Month 1 Retrospective & Next Steps

**Month 1 Results**:
- [ ] Security audit completed (vulnerabilities documented)
- [ ] Critical vulnerabilities fixed (P0 issues)
- [ ] MFA enabled across all accounts
- [ ] Databases secured (SSL, authentication, backups)
- [ ] Servers hardened (firewall, SSH, automatic updates)
- [ ] Application secured (input validation, CSRF, XSS prevention)
- [ ] Incident response plan created

**Security Scorecard**:
- [ ] SSL/TLS enabled: ✅
- [ ] MFA enabled: ✅
- [ ] Vulnerable dependencies fixed: ✅
- [ ] Secrets removed from git: ✅
- [ ] Database backups automated: ✅
- [ ] Logging and alerts configured: ✅
- [ ] Incident response plan documented: ✅

**Month 2 Plan**:
- [ ] Run penetration test (hire security firm or bug bounty program)
- [ ] Implement security monitoring (SIEM: Splunk, ELK, DataDog)
- [ ] Achieve SOC 2 Type 1 compliance (if B2B SaaS)
- [ ] Quarterly vulnerability scanning (automated)

**Deliverable**: Month 1 summary + Month 2 action plan

---

## Security Checklist (OWASP Top 10)

**OWASP Top 10 (2021)**:

1. **Broken Access Control**
   - [ ] Implement RBAC (role-based access control)
   - [ ] Deny by default (whitelist, not blacklist)
   - [ ] Log failed access attempts

2. **Cryptographic Failures**
   - [ ] Use HTTPS everywhere (TLS 1.2+)
   - [ ] Hash passwords (bcrypt, Argon2, not MD5/SHA1)
   - [ ] Encrypt sensitive data at rest (AES-256)

3. **Injection**
   - [ ] Use parameterized queries (prevent SQL injection)
   - [ ] Validate inputs (whitelist allowed characters)
   - [ ] Use ORM (Sequelize, SQLAlchemy, not raw SQL)

4. **Insecure Design**
   - [ ] Threat modeling (identify attack vectors)
   - [ ] Security requirements (define in specs)
   - [ ] Secure development lifecycle (security review before deploy)

5. **Security Misconfiguration**
   - [ ] Disable default credentials (admin/admin)
   - [ ] Remove unnecessary features (unused endpoints)
   - [ ] Keep software updated (dependencies, OS)

6. **Vulnerable and Outdated Components**
   - [ ] Run npm audit, pip-audit weekly
   - [ ] Update dependencies quarterly
   - [ ] Monitor CVEs (Common Vulnerabilities and Exposures)

7. **Identification and Authentication Failures**
   - [ ] Enforce strong passwords (12+ characters)
   - [ ] Implement MFA (multi-factor authentication)
   - [ ] Use secure session management (HttpOnly cookies)

8. **Software and Data Integrity Failures**
   - [ ] Use CI/CD with security checks (linting, SAST)
   - [ ] Verify package integrity (npm, pip checksums)
   - [ ] Sign releases (git tag signing)

9. **Security Logging and Monitoring Failures**
   - [ ] Log authentication events (login, logout, failed attempts)
   - [ ] Monitor for anomalies (unusual API calls, spikes)
   - [ ] Set up alerts (failed logins, new users, privilege escalation)

10. **Server-Side Request Forgery (SSRF)**
    - [ ] Validate URLs (whitelist allowed domains)
    - [ ] Block private IP ranges (prevent internal network access)
    - [ ] Use network segmentation (isolate services)

---

## Tools & Resources

**Security Scanning**:
- **OWASP ZAP**: Web application scanner (free)
- **Burp Suite**: Penetration testing (free community edition)
- **Nmap**: Network scanner (free)
- **Trivy**: Container vulnerability scanner (free)
- **Snyk**: Dependency scanner (free tier)

**Secrets Management**:
- **AWS Secrets Manager**: $0.40/secret/month
- **GCP Secret Manager**: $0.06/secret/month
- **HashiCorp Vault**: Free (self-hosted) or $0.03/hour (cloud)

**Monitoring & Alerts**:
- **Sentry**: Error tracking (free tier)
- **DataDog**: Infrastructure monitoring ($15/host/month)
- **CloudWatch**: AWS monitoring (pay-as-you-go)

**Compliance**:
- **Vanta**: SOC 2 automation ($3,000-10,000/year)
- **Drata**: SOC 2 automation ($2,000-8,000/year)
- **Secureframe**: SOC 2 automation ($1,500-6,000/year)

---

## Common Mistakes

### ❌ Mistake 1: Hardcoding Secrets

**Wrong**: `const apiKey = 'sk-abc123xyz789';`
**Right**: `const apiKey = process.env.API_KEY;`

**Why**: Hardcoded secrets → git history → data breach

---

### ❌ Mistake 2: Allowing Public Database Access

**Wrong**: PostgreSQL listens on 0.0.0.0:5432 (public)
**Right**: PostgreSQL listens on 127.0.0.1:5432 (localhost only)

**Why**: Public database → brute force attacks → breach

---

### ❌ Mistake 3: Not Updating Dependencies

**Wrong**: Never run `npm audit` or `pip-audit`
**Right**: Run weekly, fix critical vulnerabilities immediately

**Why**: Vulnerable dependencies → known exploits → breach

---

### ❌ Mistake 4: No Backup Strategy

**Wrong**: No database backups
**Right**: Automated daily backups, stored off-site, encrypted

**Why**: Ransomware attack → data loss → business failure

---

## Next Steps

1. **Run security audit** (OWASP ZAP, npm audit, Nmap)
2. **Fix critical issues** (secrets, open ports, vulnerable dependencies)
3. **Enable MFA** (AWS, GitHub, Google Workspace)
4. **Implement RBAC** (define roles, enforce least privilege)
5. **Harden infrastructure** (firewalls, SSH, database security)
6. **Secure application** (input validation, CSRF, XSS prevention)
7. **Create incident response plan** (playbooks, team roles)
8. **Train team** (phishing, password hygiene, secure coding)
9. **Monitor continuously** (logs, alerts, quarterly scans)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [System Health Dashboard](../spreadsheet-calculators/system-health-dashboard.md), [Cloud Cost Optimizer](../spreadsheet-calculators/cloud-cost-optimizer.md)
