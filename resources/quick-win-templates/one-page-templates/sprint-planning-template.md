# Sprint Planning Template (1-Page)

**Purpose**: Plan 2-week sprints for engineering teams
**Time to Complete**: 2-3 hours (sprint planning meeting)
**Use Case**: Product managers, engineering leads running agile sprints
**Output**: Sprint backlog with tasks, story points, commitments

---

## Sprint Planning Overview

**What is a Sprint?**
A fixed time period (typically 2 weeks) where a team completes a set of work

**Sprint Planning Goals**:
1. **Decide what to build** (product priorities)
2. **Estimate effort** (story points)
3. **Commit to work** (team capacity)
4. **Break into tasks** (actionable work items)

**Who Attends?**
- Product Manager (owns priorities)
- Engineering Lead (owns estimates, technical decisions)
- Engineers (estimate work, commit)
- Designer (if design work needed)

---

## Sprint Planning Template

**Sprint**: [Sprint #X]
**Dates**: [Start Date] - [End Date] (14 days)
**Team**: [Team Name, X engineers]
**Sprint Goal**: [1-sentence goal, e.g., "Ship user authentication and onboarding"]

---

## Step 1: Review Last Sprint

**Duration**: 15 minutes

**Retrospective Questions**:
- [ ] What went well?
- [ ] What didn't go well?
- [ ] What should we change?

**Metrics from Last Sprint**:
- **Planned**: [X] story points
- **Completed**: [Y] story points
- **Velocity**: [Y] points (what we actually delivered)
- **Completion rate**: [Y/X × 100]%

**Example**:
- Planned: 40 points
- Completed: 32 points
- Velocity: 32 points
- Completion rate: 80%

**Action Items from Retro**:
- [ ] Reduce meeting time (too many interruptions)
- [ ] Improve ticket clarity (engineers confused on requirements)
- [ ] Add automated tests (caught bugs late)

---

## Step 2: Set Sprint Goal

**Duration**: 10 minutes

**Sprint Goal** = One-sentence description of what we'll achieve

**Good Sprint Goals**:
- ✅ "Ship user authentication (signup, login, password reset)"
- ✅ "Complete checkout flow (cart → payment → confirmation)"
- ✅ "Fix top 10 bugs from production"

**Bad Sprint Goals**:
- ❌ "Work on various tasks" (too vague)
- ❌ "Build the entire product" (too ambitious)
- ❌ "Improve performance" (not specific)

**This Sprint Goal**: [1-sentence goal]

---

## Step 3: Review Product Backlog

**Duration**: 20 minutes

**Product Backlog** = Prioritized list of features/bugs to build

**Prioritization Criteria**:
1. **Impact**: How much value does this create for users?
2. **Effort**: How much work is required? (story points)
3. **Urgency**: When is this needed?
4. **Dependencies**: Does anything block this?

**Prioritization Framework (RICE)**:
- **Reach**: How many users affected? (1-10)
- **Impact**: How much does it help? (0.25-3)
- **Confidence**: How sure are we? (0-100%)
- **Effort**: How many person-weeks? (0.5-10)
- **Score**: (Reach × Impact × Confidence) ÷ Effort

**Example**:

| Feature | Reach | Impact | Confidence | Effort | RICE Score | Priority |
|---------|-------|--------|------------|--------|------------|----------|
| **User authentication** | 10 | 3 | 100% | 2 | 15 | P0 |
| **Social login** | 8 | 1 | 80% | 1 | 6.4 | P1 |
| **Email notifications** | 10 | 1 | 90% | 1 | 9 | P1 |
| **Dark mode** | 5 | 0.25 | 80% | 1 | 1 | P2 |

**Top 10 Backlog Items** (for this sprint):

| # | User Story | Business Value | Story Points | Priority |
|---|------------|----------------|--------------|----------|
| 1 | As a user, I can sign up with email/password | Enable user accounts | 8 | P0 |
| 2 | As a user, I can log in | Enable user accounts | 5 | P0 |
| 3 | As a user, I can reset my password | Reduce support tickets | 5 | P0 |
| 4 | As a user, I can log in with Google | Reduce friction | 8 | P1 |
| 5 | As a user, I receive email confirmation | Trust & security | 3 | P1 |
| 6 | As a user, I can see my profile | User management | 5 | P1 |
| 7 | Fix: Login fails on mobile Safari | Production bug | 3 | P0 |
| 8 | Fix: Slow dashboard load (>3s) | Performance issue | 5 | P1 |
| 9 | Tech debt: Refactor auth service | Code quality | 5 | P2 |
| 10 | Docs: Update API documentation | Developer experience | 2 | P2 |

---

## Step 4: Estimate Story Points

**Duration**: 30-45 minutes

**Story Points** = Relative measure of effort (not time)

**Fibonacci Scale**: 1, 2, 3, 5, 8, 13, 21
- **1 point**: Trivial (30 min - 1 hour)
- **2 points**: Simple (2-4 hours)
- **3 points**: Moderate (half day)
- **5 points**: Complex (1 day)
- **8 points**: Very complex (2-3 days)
- **13 points**: Epic (1 week, should be broken down)
- **21 points**: Too big (break into smaller stories)

**Estimation Technique**: Planning Poker
1. PM reads user story
2. Engineers ask clarifying questions
3. Everyone estimates privately (cards face down)
4. Reveal simultaneously
5. Discuss differences (why did you estimate X?)
6. Re-estimate until consensus

**Example Estimation**:

**User Story**: "As a user, I can sign up with email/password"

**Tasks**:
- Frontend: Build signup form (React component) → 2 points
- Frontend: Form validation (email format, password strength) → 1 point
- Backend: Create user endpoint (POST /users) → 2 points
- Backend: Hash passwords (bcrypt) → 1 point
- Database: Create users table → 1 point
- Testing: Write unit + integration tests → 1 point
- **Total**: 8 points

---

## Step 5: Calculate Team Capacity

**Duration**: 10 minutes

**Team Capacity** = How many story points can we complete?

**Formula**: Capacity = (Engineers × Days × Focus Factor)

**Focus Factor**:
- **0.6-0.7**: Realistic (60-70% of time is focused work)
- Accounts for: Meetings, email, code review, support, distractions

**Example**:
- **Engineers**: 5
- **Sprint days**: 10 (2 weeks, exclude weekends)
- **Focus factor**: 0.6
- **Velocity (last sprint)**: 32 points
- **Capacity this sprint**: 32 points (use velocity, not theoretical capacity)

**Adjustments**:
- [ ] PTO: Engineer A on vacation (Days 5-10) → Reduce capacity by 5 engineer-days
- [ ] New hire: Engineer B onboarding → Reduce capacity by 50%
- [ ] Holidays: National holiday on Day 7 → Reduce capacity by 1 day

**Adjusted Capacity**: 32 - 8 (PTO) - 4 (new hire) - 3 (holiday) = **27 points**

---

## Step 6: Commit to Sprint Backlog

**Duration**: 20 minutes

**Sprint Backlog** = Stories we commit to completing this sprint

**Selection Criteria**:
1. **Fits capacity**: Total points ≤ team capacity (27 points)
2. **Aligns with goal**: Supports sprint goal
3. **Not blocked**: No dependencies on other teams

**Sprint Backlog**:

| # | User Story | Story Points | Owner | Status |
|---|------------|--------------|-------|--------|
| 1 | As a user, I can sign up with email/password | 8 | Team | Todo |
| 2 | As a user, I can log in | 5 | Team | Todo |
| 3 | As a user, I can reset my password | 5 | Team | Todo |
| 4 | Fix: Login fails on mobile Safari | 3 | Engineer C | Todo |
| 5 | As a user, I receive email confirmation | 3 | Engineer D | Todo |
| 6 | As a user, I can see my profile | 5 | Team | Stretch |
| **Total Committed** | **24 points** | - | - |
| **Stretch Goals** | **5 points** | (only if ahead) | - |

**Stretch Goals** = Nice-to-have if we finish early (don't count against capacity)

---

## Step 7: Break Into Tasks

**Duration**: 30 minutes

**Task Breakdown** = Break each story into actionable tasks (2-4 hours each)

**Example**: "As a user, I can sign up with email/password"

**Tasks**:
- [ ] **Frontend**: Create SignupForm component (2h) - Engineer A
- [ ] **Frontend**: Add form validation (email, password) (2h) - Engineer A
- [ ] **Frontend**: Connect to /users API endpoint (1h) - Engineer A
- [ ] **Backend**: Create POST /users endpoint (2h) - Engineer B
- [ ] **Backend**: Hash passwords with bcrypt (1h) - Engineer B
- [ ] **Backend**: Validate input (email format, password strength) (1h) - Engineer B
- [ ] **Database**: Create users table migration (1h) - Engineer B
- [ ] **Testing**: Write frontend unit tests (2h) - Engineer A
- [ ] **Testing**: Write backend integration tests (2h) - Engineer B
- [ ] **Code Review**: Review PRs (2h) - Team
- [ ] **QA**: Test signup flow manually (1h) - Engineer C

**Total**: 15 hours (~2 days of work for 2 engineers)

---

## Sprint Execution

### Daily Standup (15 min)

**Every morning**, each engineer answers:
1. **Yesterday**: What did I complete?
2. **Today**: What will I work on?
3. **Blockers**: Am I blocked on anything?

**Example**:
- **Engineer A**: "Yesterday: Finished SignupForm component. Today: Adding form validation. Blockers: None."
- **Engineer B**: "Yesterday: Created users table. Today: Building POST /users endpoint. Blockers: Waiting for PM to clarify password requirements."

---

### Mid-Sprint Check-in (30 min, Day 7)

**Review progress**:
- [ ] Are we on track to complete committed stories?
- [ ] Any stories at risk? (missing deadline, blocked)
- [ ] Any scope changes? (new bugs, changes to requirements)

**Burndown Chart**:

| Day | Remaining Points | Target |
|-----|------------------|--------|
| 0 | 24 | 24 |
| 2 | 22 | 21.6 |
| 4 | 18 | 19.2 |
| 6 | 15 | 16.8 |
| 8 | 10 | 14.4 |
| 10 | 5 | 12 |
| 12 | 2 | 9.6 |
| 14 | 0 | 0 |

**If ahead of target**: Pull in stretch goals
**If behind target**: Remove lowest-priority stories

---

### Sprint Review (1 hour, end of sprint)

**Demo completed work to stakeholders**:
- [ ] Show working features (live demo, not slides)
- [ ] Collect feedback (what worked? what didn't?)
- [ ] Update product backlog (based on feedback)

**Metrics**:
- **Committed**: 24 points
- **Completed**: 22 points
- **Completion rate**: 92%
- **Velocity**: 22 points (use for next sprint capacity)

---

## Sprint Retrospective (1 hour, end of sprint)

**What went well?**
- ✅ Good collaboration between frontend/backend
- ✅ Completed P0 stories (signup, login, password reset)
- ✅ No major production bugs

**What didn't go well?**
- ❌ Unclear requirements on password reset (wasted 1 day)
- ❌ Mobile Safari bug took longer than expected (3 points → 5 points)
- ❌ Too many meetings (lost 2 hours/day)

**Action items for next sprint**:
- [ ] PM to write more detailed acceptance criteria
- [ ] Add mobile testing to QA checklist
- [ ] Reduce meeting time (no-meeting Wednesdays)

---

## Sprint Metrics to Track

**Velocity**:
- **Definition**: Story points completed per sprint
- **Target**: Stable velocity (±10% variance)
- **Example**: Sprint 1: 28 points, Sprint 2: 32 points, Sprint 3: 30 points (avg: 30 points)

**Completion Rate**:
- **Definition**: % of committed stories completed
- **Target**: 80-100%
- **Example**: Committed 24 points, completed 22 points → 92%

**Predictability**:
- **Definition**: How often does team hit commitments?
- **Target**: 80%+ of sprints hit committed work
- **Example**: 8 out of 10 sprints completed all committed work → 80%

**Cycle Time**:
- **Definition**: Days from "To Do" → "Done"
- **Target**: <5 days per story
- **Example**: Story started Day 2, completed Day 6 → 4 days

**Bug Rate**:
- **Definition**: # of bugs found in production after release
- **Target**: <5 bugs per sprint
- **Example**: Sprint 5 shipped, 2 bugs found in production → 2 bugs

---

## Common Sprint Planning Mistakes

### ❌ Mistake 1: Overcommitting

**Wrong**: "Let's commit to 50 points (we did 30 last sprint)"
**Right**: "Let's commit to 30 points (our velocity)"

**Why**: Teams consistently overestimate capacity. Use velocity, not wishful thinking.

---

### ❌ Mistake 2: Vague Stories

**Wrong**: "Improve performance" (no acceptance criteria)
**Right**: "Reduce dashboard load time from 3s to <1s" (specific, measurable)

**Why**: Vague stories → wasted time, scope creep, never "done"

---

### ❌ Mistake 3: No Task Breakdown

**Wrong**: "Build user authentication (8 points)" (no tasks)
**Right**: Break into 10-15 tasks (2-4 hours each)

**Why**: Large stories = unclear work, hard to track progress

---

### ❌ Mistake 4: Ignoring Blockers

**Wrong**: Engineer mentions blocker in standup, team does nothing
**Right**: Immediately address blocker (unblock engineer or reassign work)

**Why**: Blockers = wasted time, missed deadlines

---

## Sprint Planning Checklist

**Before Sprint Planning**:
- [ ] Product backlog is prioritized (PM)
- [ ] Stories have acceptance criteria (PM)
- [ ] Technical debt / bugs are in backlog (Eng Lead)
- [ ] Team knows last sprint's velocity

**During Sprint Planning**:
- [ ] Review last sprint (15 min)
- [ ] Set sprint goal (10 min)
- [ ] Estimate stories (30-45 min)
- [ ] Calculate team capacity (10 min)
- [ ] Commit to sprint backlog (20 min)
- [ ] Break into tasks (30 min)

**After Sprint Planning**:
- [ ] Sprint backlog in Jira/Linear/Asana
- [ ] Tasks assigned to engineers
- [ ] Sprint goal communicated to company
- [ ] Schedule daily standups

---

## Tools

**Project Management**:
- **Jira** (enterprise, complex)
- **Linear** (modern, fast)
- **Asana** (simple, collaborative)
- **Trello** (kanban, visual)
- **GitHub Projects** (free, integrated with code)

**Estimation**:
- **Planning Poker Online** (planningpokeronline.com)
- **Scrum Poker** (scrumpoker.online)
- **Miro** (virtual whiteboard)

---

## Next Steps

1. **Schedule sprint planning** (2-3 hours, beginning of sprint)
2. **Prepare product backlog** (PM prioritizes top 20 stories)
3. **Review last sprint** (velocity, completion rate)
4. **Set sprint goal** (1-sentence description)
5. **Estimate stories** (planning poker, 30-45 min)
6. **Commit to backlog** (based on velocity, not wishful thinking)
7. **Break into tasks** (2-4 hour tasks)
8. **Execute sprint** (daily standups, mid-sprint check-in)
9. **Review & retro** (end of sprint)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
**Related**: [OKR Framework](./okr-framework.md), [Hiring Scorecard](./hiring-scorecard.md)
