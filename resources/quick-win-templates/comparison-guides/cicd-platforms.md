# CI/CD Platform Comparison

**Purpose**: Choose the right continuous integration and deployment platform
**Time to Complete**: 30-45 minutes
**Use Case**: DevOps engineers, CTOs setting up build and deployment pipelines
**Output**: CI/CD platform decision with setup guide

---

## Quick Decision Matrix

| Platform | Best For | Price (5 devs) | Setup Time | Rating |
|----------|----------|----------------|------------|--------|
| **GitHub Actions** | GitHub repos, simple workflows | Free-$50/mo | 1 hour | ⭐⭐⭐⭐⭐ |
| **GitLab CI** | GitLab repos, all-in-one DevOps | Free-$99/mo | 2 hours | ⭐⭐⭐⭐⭐ |
| **CircleCI** | Complex pipelines, performance | Free-$70/mo | 2-3 hours | ⭐⭐⭐⭐ |
| **Jenkins** | Self-hosted, full control | Free (hosting cost) | 1 day | ⭐⭐⭐ |
| **Travis CI** | Open source, simple | Free-$69/mo | 1-2 hours | ⭐⭐⭐ |
| **Bitbucket Pipelines** | Bitbucket repos, Atlassian stack | Free-$10/mo | 1 hour | ⭐⭐⭐⭐ |

---

## What is CI/CD?

**Continuous Integration (CI)**:
- Automatically test code when pushed to repository
- Catch bugs early (before merging to main branch)
- Run tests, linters, security scans

**Continuous Deployment (CD)**:
- Automatically deploy code to staging/production
- Faster releases (deploy multiple times per day)
- Less manual work (no more "deploy Friday")

**Example Workflow**:
1. Developer pushes code to GitHub
2. CI runs tests automatically
3. If tests pass, deploy to staging automatically
4. Manual approval (or automatic) to deploy to production

---

## Detailed Comparison

### GitHub Actions

**Best for**: GitHub users, simple to complex workflows

**Pricing**:
- **Free**: 2,000 minutes/month (public repos unlimited)
- **Team**: $4/user/month (3,000 minutes/user)
- **Enterprise**: Custom

**Key Features**:
- **Native GitHub integration**: Built into GitHub UI
- **Marketplace**: 10,000+ pre-built actions (deploy to AWS, send Slack notification, etc.)
- **Matrix builds**: Test across multiple OS, Node versions, etc.
- **Self-hosted runners**: Run on your own servers (unlimited minutes)
- **Secrets management**: Store API keys, tokens securely

**Pros**:
- ✅ Easiest setup (if using GitHub)
- ✅ Free tier is generous (2,000 min/month)
- ✅ Huge marketplace (10,000+ actions)
- ✅ Fast (parallel jobs, caching)
- ✅ Great documentation

**Cons**:
- ❌ Only for GitHub (not GitLab, Bitbucket)
- ❌ YAML can get complex for advanced workflows
- ❌ Limited debugging (no SSH into runner)

**When to choose**:
- You use GitHub
- You want simple setup (1 hour)
- You need fast builds (caching, parallel jobs)
- You want marketplace actions (deploy to Vercel, AWS, etc.)

**Example Workflow** (Node.js app):
```yaml
name: CI/CD
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm install
      - run: npm test
  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - run: npm run deploy
```

---

### GitLab CI

**Best for**: GitLab users, all-in-one DevOps platform

**Pricing**:
- **Free**: 400 minutes/month on shared runners
- **Premium**: $29/user/month (10,000 minutes/month)
- **Ultimate**: $99/user/month (50,000 minutes/month)

**Key Features**:
- **All-in-one**: Git hosting + CI/CD + container registry + security scanning
- **Auto DevOps**: Automatic pipelines (build, test, deploy) with zero config
- **Kubernetes integration**: Deploy to K8s clusters easily
- **Review apps**: Automatically create preview environments for merge requests
- **Security scanning**: SAST, DAST, dependency scanning built-in

**Pros**:
- ✅ All-in-one platform (Git + CI/CD + registry + security)
- ✅ Auto DevOps (zero-config pipelines)
- ✅ Kubernetes-native
- ✅ Self-hosted option (full control)
- ✅ Built-in security scanning

**Cons**:
- ❌ Only for GitLab (not GitHub, Bitbucket)
- ❌ Expensive for Premium/Ultimate tiers
- ❌ Shared runners can be slow

**When to choose**:
- You use GitLab
- You want all-in-one DevOps (Git + CI/CD + security)
- You deploy to Kubernetes
- You need security scanning (SAST, DAST)

**Example Pipeline** (Node.js app):
```yaml
stages:
  - test
  - deploy

test:
  stage: test
  image: node:18
  script:
    - npm install
    - npm test

deploy:
  stage: deploy
  script:
    - npm run deploy
  only:
    - main
```

---

### CircleCI

**Best for**: Complex pipelines, performance-critical builds

**Pricing**:
- **Free**: 6,000 minutes/month (1 concurrent job)
- **Performance**: $30/month (25,000 minutes, 5 concurrent jobs)
- **Scale**: $200/month (200,000 minutes, 25 concurrent jobs)

**Key Features**:
- **Performance**: Fast builds (SSH debugging, caching, parallelism)
- **Orbs**: Reusable config packages (deploy to AWS, Heroku, etc.)
- **Docker support**: First-class Docker support (DinD, remote Docker)
- **Insights**: Build analytics, flaky test detection
- **SSH debugging**: SSH into builds to debug failures

**Pros**:
- ✅ Fast (best-in-class performance)
- ✅ SSH debugging (debug failed builds interactively)
- ✅ Docker-native (easy Docker builds)
- ✅ Orbs marketplace (300+ reusable configs)
- ✅ Great for complex pipelines

**Cons**:
- ❌ Expensive for large teams ($200+/month for scale)
- ❌ Steeper learning curve vs GitHub Actions
- ❌ Config can get complex

**When to choose**:
- You need fast builds (performance-critical)
- You need SSH debugging
- You have complex pipelines (monorepos, microservices)
- You use Docker heavily

**Example Config** (Node.js app):
```yaml
version: 2.1
orbs:
  node: circleci/node@5.0
jobs:
  test:
    docker:
      - image: cimg/node:18.0
    steps:
      - checkout
      - node/install-packages
      - run: npm test
  deploy:
    docker:
      - image: cimg/node:18.0
    steps:
      - checkout
      - run: npm run deploy
workflows:
  test-and-deploy:
    jobs:
      - test
      - deploy:
          requires:
            - test
          filters:
            branches:
              only: main
```

---

### Jenkins

**Best for**: Self-hosted, full control, legacy systems

**Pricing**:
- **Free** (open-source)
- **Hosting cost**: $50-500/month (AWS EC2, DigitalOcean, etc.)

**Key Features**:
- **Self-hosted**: Full control over infrastructure
- **Plugin ecosystem**: 1,800+ plugins (deploy to anything)
- **Flexible**: Scriptable pipelines (Groovy, Shell)
- **Legacy support**: Integrates with old systems (SVN, CVS, etc.)

**Pros**:
- ✅ Free (open-source)
- ✅ Full control (self-hosted)
- ✅ Huge plugin ecosystem (1,800+)
- ✅ Works with any VCS (Git, SVN, CVS, etc.)
- ✅ No vendor lock-in

**Cons**:
- ❌ Complex setup (1 day to get running)
- ❌ Maintenance overhead (updates, security, backups)
- ❌ Outdated UI (clunky compared to modern tools)
- ❌ Plugin quality varies (some unmaintained)

**When to choose**:
- You need full control (self-hosted)
- You have legacy systems (SVN, old tools)
- You don't want vendor lock-in
- You have DevOps resources to maintain it

---

### Travis CI

**Best for**: Open-source projects, simple builds

**Pricing**:
- **Free**: For public repos
- **Trial**: $69/month (10,000 credits)
- **Premium**: $129/month (25,000 credits)

**Key Features**:
- **Simple setup**: `.travis.yml` in repo root
- **Open source friendly**: Free for public repos
- **Matrix builds**: Test across multiple OS, languages
- **Deployment**: Deploy to Heroku, AWS, GCP, etc.

**Pros**:
- ✅ Free for open source
- ✅ Simple setup (one YAML file)
- ✅ Good for multi-OS testing (Linux, macOS, Windows)

**Cons**:
- ❌ Slower than alternatives (limited parallelism)
- ❌ Less features vs GitHub Actions, GitLab CI
- ❌ Smaller marketplace

**When to choose**:
- You have open-source projects (free)
- You need simple CI (test + deploy)
- You test across multiple OS (Linux, macOS, Windows)

---

### Bitbucket Pipelines

**Best for**: Bitbucket users, Atlassian stack (Jira, Confluence)

**Pricing**:
- **Free**: 50 minutes/month
- **Standard**: $10/month (2,500 minutes)
- **Premium**: $100/month (unlimited)

**Key Features**:
- **Native Bitbucket integration**: Built into Bitbucket UI
- **Jira integration**: Link builds to Jira issues
- **Docker support**: Run builds in Docker containers
- **Deployments**: Deploy to AWS, GCP, Heroku, etc.

**Pros**:
- ✅ Native Bitbucket integration
- ✅ Tight Jira integration (link builds to issues)
- ✅ Simple setup (one YAML file)
- ✅ Affordable ($10/month for 2,500 min)

**Cons**:
- ❌ Only for Bitbucket (not GitHub, GitLab)
- ❌ Limited free tier (50 min/month)
- ❌ Smaller marketplace vs GitHub Actions

**When to choose**:
- You use Bitbucket
- You use Atlassian stack (Jira, Confluence)
- You want simple CI/CD (test + deploy)

---

## Side-by-Side Comparison

| Feature | GitHub Actions | GitLab CI | CircleCI | Jenkins | Travis CI | Bitbucket Pipelines |
|---------|----------------|-----------|----------|---------|-----------|---------------------|
| **Ease of Setup** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Performance** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| **Free Tier** | Generous | Limited | Generous | Free | Free (OSS) | Limited |
| **Marketplace** | 10,000+ | 500+ | 300+ | 1,800+ | 100+ | 50+ |
| **Docker Support** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Security Scanning** | Via marketplace | Built-in | Via orbs | Via plugins | Via addons | Via marketplace |
| **Self-Hosted** | ✅ | ✅ | ❌ | ✅ | ❌ | ❌ |
| **Price (Value)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## Recommendation by Use Case

### Scenario 1: Startup (5-10 developers)
**Recommendation**: **GitHub Actions** or **GitLab CI**

**Why**:
- Free or cheap ($0-50/month)
- Simple setup (1-2 hours)
- Native integration with Git platform
- Marketplace for common tasks (deploy to Vercel, AWS, etc.)

**Stack**: GitHub Actions + Vercel (frontend) + Railway (backend)
**Cost**: $0-50/month

---

### Scenario 2: Fast-Growing Startup (10-50 developers)
**Recommendation**: **CircleCI** or **GitHub Actions**

**Why**:
- Performance (fast builds, caching, parallelism)
- Scales with team (concurrent jobs, insights)
- Marketplace/Orbs for common tasks

**Stack**: CircleCI + AWS (infrastructure)
**Cost**: $200-500/month

---

### Scenario 3: Enterprise (50+ developers)
**Recommendation**: **GitLab CI** or **Jenkins** (self-hosted)

**Why**:
- All-in-one DevOps (GitLab)
- Full control (Jenkins)
- Security scanning built-in (GitLab)
- Compliance (self-hosted, audit logs)

**Stack**: GitLab CI + Kubernetes + AWS
**Cost**: $1K-5K/month

---

### Scenario 4: Open Source Project
**Recommendation**: **GitHub Actions** or **Travis CI**

**Why**:
- Free for public repos
- Simple setup
- Community-friendly

**Stack**: GitHub Actions (free)
**Cost**: $0/month

---

### Scenario 5: Complex Monorepo
**Recommendation**: **CircleCI** or **GitHub Actions**

**Why**:
- Parallel jobs (test multiple packages simultaneously)
- Caching (speed up builds)
- Matrix builds (test across multiple environments)

**Stack**: CircleCI + Nx/Turborepo (monorepo tool)
**Cost**: $200-500/month

---

## Implementation Checklist

**Week 1: Setup CI**
- [ ] Choose platform (GitHub Actions, GitLab CI, etc.)
- [ ] Create pipeline config file (`.github/workflows`, `.gitlab-ci.yml`, etc.)
- [ ] Add test stage (run unit tests, integration tests)
- [ ] Add lint stage (ESLint, Prettier, etc.)
- [ ] Add build stage (compile, bundle)

**Week 2: Setup CD**
- [ ] Add staging deployment (deploy to staging on every merge to main)
- [ ] Add production deployment (deploy to production on tag/release)
- [ ] Set up secrets (API keys, tokens)
- [ ] Test deployment (verify staging/production deploys)

**Week 3: Optimize**
- [ ] Add caching (dependencies, build artifacts)
- [ ] Parallelize jobs (test, lint, build in parallel)
- [ ] Add notifications (Slack, email on failure)
- [ ] Add badges (build status in README)

**Week 4: Monitor**
- [ ] Track build times (optimize slow builds)
- [ ] Track flaky tests (fix unreliable tests)
- [ ] Review failures (why did builds fail?)
- [ ] Iterate (improve pipeline based on feedback)

---

## Common CI/CD Patterns

### Pattern 1: Test → Build → Deploy (Basic)

```yaml
# GitHub Actions
name: CI/CD
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm install
      - run: npm test
  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm install
      - run: npm run build
  deploy:
    needs: build
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - run: npm run deploy
```

---

### Pattern 2: Matrix Builds (Test Multiple Versions)

```yaml
# GitHub Actions
name: CI
on: [push]
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        node: [16, 18, 20]
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node }}
      - run: npm install
      - run: npm test
```

---

### Pattern 3: Staging → Production (with Manual Approval)

```yaml
# GitHub Actions
name: Deploy
on:
  push:
    branches: [main]
jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    steps:
      - run: npm run deploy:staging
  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment: production  # Requires manual approval
    steps:
      - run: npm run deploy:production
```

---

## Common Mistakes

### ❌ Mistake 1: No Caching (Slow Builds)

**Wrong**: Install dependencies every time (5+ min)
**Right**: Cache dependencies (30 sec)

**Example** (GitHub Actions):
```yaml
- uses: actions/cache@v3
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
- run: npm install
```

---

### ❌ Mistake 2: Running Tests Sequentially

**Wrong**: Run tests one at a time (10 min total)
**Right**: Run tests in parallel (3 min total)

**Example** (GitHub Actions):
```yaml
jobs:
  test-frontend:
    runs-on: ubuntu-latest
    steps:
      - run: npm run test:frontend
  test-backend:
    runs-on: ubuntu-latest
    steps:
      - run: npm run test:backend
```

---

### ❌ Mistake 3: Hardcoding Secrets

**Wrong**: API keys in code (`AWS_KEY=abc123`)
**Right**: Secrets management (`${{ secrets.AWS_KEY }}`)

**Example** (GitHub Actions):
```yaml
- run: npm run deploy
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

---

### ❌ Mistake 4: No Failure Notifications

**Wrong**: Build fails, no one notices
**Right**: Send Slack notification on failure

**Example** (GitHub Actions):
```yaml
- name: Slack Notification
  if: failure()
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

---

## Cost Optimization

### Tip 1: Use Caching

**Savings**: 50-80% reduction in build time
**Example**: Cache npm dependencies (5 min → 30 sec)

---

### Tip 2: Self-Hosted Runners (GitHub Actions)

**Savings**: Free minutes on self-hosted runners
**Example**: Run on your own AWS EC2 instance ($10/month unlimited)

---

### Tip 3: Parallelize Jobs

**Savings**: 50% reduction in total time (wall-clock time)
**Example**: Run frontend + backend tests in parallel (10 min → 5 min)

---

## Next Steps

1. **Choose platform** (GitHub Actions for GitHub users, GitLab CI for GitLab users)
2. **Create basic pipeline** (test → build → deploy)
3. **Add caching** (dependencies, build artifacts)
4. **Parallelize** (run jobs in parallel)
5. **Set up CD** (deploy to staging/production)
6. **Monitor** (track build times, failures)
7. **Iterate** (optimize based on metrics)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [Tech Stack Decision](../one-page-templates/tech-stack-decision.md), [Cloud Providers Comparison](./cloud-providers-sea.md)
