# Keys, Locks & Connectors: Understanding Security & Authentication

**How everything connects, authenticates, and stays secure - explained through physical security metaphors**

---

## The Problem This Guide Solves

You're following a VPS setup guide and you see:

```bash
ssh-keygen -t ed25519
chmod 600 ~/.ssh/id_ed25519
export KIMI_API_KEY="k-abc123..."
```

You type these commands. They work. But you have no idea:
- What an SSH key actually IS
- Why there are TWO key files (id_ed25519 and id_ed25519.pub)
- What `chmod 600` means or why it matters
- Why API keys are different from passwords
- How OAuth works when that browser window pops up

**This guide explains the invisible security infrastructure that holds OpenClaw together.**

If [MENTAL-MODEL.md](MENTAL-MODEL.md) explains "what is each component," this guide explains "how does security and authentication work."

---

## Table of Contents

1. [The Security Model](#1-the-security-model---how-everything-connects)
2. [House Keys - SSH Keys](#2-house-keys---ssh-keys-explained)
3. [Company Badges - API Keys](#3-company-badges---api-keys-explained)
4. [Visitor Passes - OAuth](#4-visitor-passes---oauth-explained)
5. [Room Access Levels - File Permissions](#5-room-access-levels---file-permissions-explained)
6. [Armored Trucks - Encryption & SSL](#6-armored-trucks---encryption--ssl)
7. [Double Locks - Two-Factor Authentication](#7-double-locks---two-factor-authentication)
8. [The Complete Security Chain](#8-the-complete-security-chain---how-it-all-fits-together)
9. [The Glossary - Key vs Token vs Secret](#9-the-glossary---key-vs-token-vs-secret)
10. [Quick Reference - Command Decoder](#10-quick-reference---command-decoder)

---

## 1. The Security Model - How Everything Connects

Here's the complete picture of ALL the keys, locks, and connectors in an OpenClaw deployment:

```
┌─────────────────────────────────────────────────────────────────┐
│ YOU (The CEO)                                                   │
│ Location: Your phone or laptop                                 │
└─────────────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
    [WhatsApp]         [Telegram]         [Your Browser]
    Two-way            Two-way             To VPS Dashboard
        │                   │                   │
        └───────────────────┴───────────────────┘
                            │
                    [HTTPS/SSL Encryption]
                    "Armored truck" protecting
                    messages in transit
                            │
                            ▼
        ┌───────────────────────────────────────────────┐
        │ YOUR VPS (DigitalOcean / Contabo / etc.)     │
        │                                               │
        │  Protected by:                                │
        │  🔒 FIREWALL (UFW)                           │
        │     └─ Gates: Only ports 22, 443, 18789 open│
        │                                               │
        │  You access server via:                       │
        │  🔑 SSH KEY (your private house key)         │
        │     └─ Lock: Public key on server's door    │
        │                                               │
        │  OpenClaw Dashboard protected by:             │
        │  🔐 PASSWORD + 2FA                           │
        │     └─ Double lock: Something you KNOW +     │
        │        something you HAVE                     │
        │                                               │
        │  ┌─────────────────────────────────────────┐ │
        │  │ OPENCLAW AGENT                          │ │
        │  │                                         │ │
        │  │ When message arrives:                   │ │
        │  │  1. Check: DM PAIRING                  │ │
        │  │     └─ "Is this person authorized?"     │ │
        │  │                                         │ │
        │  │  2. Access Gmail via:                   │ │
        │  │     🎫 OAUTH TOKEN                      │ │
        │  │     └─ Temporary visitor pass           │ │
        │  │        (delegated access)               │ │
        │  │                                         │ │
        │  │  3. Call Kimi brain via:                │ │
        │  │     🪪 API KEY                          │ │
        │  │     └─ Bearer token in HTTP header     │ │
        │  └─────────────────────────────────────────┘ │
        │                                               │
        │  Configuration stored in:                     │
        │  📋 CONFIG FILE (openclaw.json)              │
        │     └─ Permissions: chmod 644 (readable)    │
        │                                               │
        │  Secrets stored in:                           │
        │  🔐 .ENV FILE                                │
        │     └─ Permissions: chmod 600 (locked)      │
        │        Only you can read/write              │
        │                                               │
        │  Data stored in:                              │
        │  📁 LOCAL FILES (~/.openclaw/)               │
        │     └─ Permissions: chmod 700 (private)     │
        └───────────────────────────────────────────────┘
```

### The Three Categories

| Category | What It Does | Examples |
|----------|--------------|----------|
| **🔑 KEYS** (prove who you are) | Authenticate identity | SSH keys, API keys, OAuth tokens, passwords |
| **🔒 LOCKS** (protect things) | Control access | Firewalls, file permissions, encryption, 2FA |
| **🔌 CONNECTORS** (let things talk) | Enable communication | APIs, webhooks, SSH tunnels |

---

## 2. House Keys - SSH Keys Explained

**SSH = Secure Shell.** It's how you remote-control a computer.

### The Problem

You have a VPS (server) in Singapore. You're in Kuala Lumpur. How do you control it remotely?

**Option 1: Password**
- You SSH to the server
- Server asks: "What's the password?"
- You type it
- Server lets you in

**Problem**: Passwords can be guessed. Hackers try millions of passwords per second (brute force attacks). If your password is "OpenClaw123", they'll find it.

**Option 2: SSH Keys** ← This is what all the guides use
- You have a physical key (private key file)
- The server has a lock (public key)
- Your key fits the lock, the door opens
- **Nobody can guess your key** - it's a 256-bit random number

### How SSH Keys Work: The House Key Analogy

Imagine you're setting up a vacation rental:

**Step 1: Create a matched key + lock pair**
```bash
ssh-keygen -t ed25519
```

This creates TWO files:
- `id_ed25519` = **Your physical house key** (PRIVATE key - NEVER share this)
- `id_ed25519.pub` = **The lock that goes on the door** (PUBLIC key - safe to give to anyone)

**Step 2: Install the lock on the rental property's door**
```bash
# You give the lock (public key) to the server
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@your-server-ip
```

The server installs your lock (public key) on its door (in `~/.ssh/authorized_keys`).

**Step 3: Walk up to the door with your key**
```bash
ssh -i ~/.ssh/id_ed25519 user@your-server-ip
```

When you arrive at the server's door:
1. The server shows you the lock: "Here's the lock. Can your key open it?"
2. Your computer tries your private key
3. **If the key fits the lock** → The door opens, you're in
4. **If the key doesn't fit** → Access denied

### Public vs Private Key - The Critical Difference

| File | Type | Analogy | What You Do With It | If Someone Steals It |
|------|------|---------|---------------------|----------------------|
| `id_ed25519` | **Private key** | Your physical house key | Keep it safe on YOUR computer ONLY. NEVER email it, NEVER share it, NEVER upload it | They can enter your server as you. Game over. |
| `id_ed25519.pub` | **Public key** | The lock on the door | Give this to the server. Also safe to paste into DigitalOcean/Oracle/GitHub. It's designed to be shared | No problem. A lock without the key is useless to thieves |

**The magic**: The private key and public key are mathematically linked. Your private key fits ONLY into YOUR public lock. Nobody else's key fits. It's cryptographically impossible to derive the private key from the public key (would take billions of years with current computers).

### What Actually Happens During SSH Login

```bash
$ ssh user@your-server-ip

The authenticity of host 'your-server-ip' can't be established.
ED25519 key fingerprint is SHA256:abc123def456...
Are you sure you want to continue connecting (yes/no)?
```

**What this means**:
- This is the first time you're visiting this building
- The server is showing you its ID fingerprint (like a photo ID)
- It's asking: "Is this REALLY the server you intended to reach, or is someone pretending to be it?" (MITM attack protection)
- Type "yes" → Your computer saves this fingerprint in `~/.ssh/known_hosts` (like saving a contact)
- Next time, if the fingerprint changes, your computer will WARNING: "This doesn't match the building I visited before!"

**Then**:
1. Server: "Show me your key"
2. Your computer sends your private key (encrypted)
3. Server tries to match it with the locks (public keys) it has
4. Match found → "Welcome! You're in."
5. No match → "Access denied"

### The chmod 600 Mystery Solved

After generating your SSH key, guides tell you:

```bash
chmod 600 ~/.ssh/id_ed25519
```

**What this means**: "Set file permissions to 600."

Let's decode 600:

**File permissions are three digits**: Owner / Group / Everyone
- **First digit (6)**: What the OWNER can do
- **Second digit (0)**: What the GROUP can do
- **Third digit (0)**: What EVERYONE ELSE can do

**Each digit is a sum**:
- 4 = Read
- 2 = Write
- 1 = Execute (run as a program)

**So 600 means**:
- Owner: 6 = 4 (read) + 2 (write) = Can read and write the file
- Group: 0 = No access
- Everyone: 0 = No access

**Translation**: "This is my private house key. Only I can read it or write to it. Nobody else on this computer can even look at it."

**Why this matters**: If the permissions are too open (like 644 = everyone can read), SSH will REFUSE to use the key. It's a safety feature. SSH says: "Your private key is exposed! I won't use it until you lock it down."

**Common chmod values for SSH**:

| Permission | Meaning | Use For |
|------------|---------|---------|
| `chmod 600` | Owner: read+write. Nobody else: nothing | Private keys (`id_ed25519`) |
| `chmod 644` | Owner: read+write. Others: read only | Public keys (`id_ed25519.pub`) |
| `chmod 400` | Owner: read only. Nobody else: nothing | Downloaded .pem keys (Oracle, AWS) |
| `chmod 700` | Owner: full access. Nobody else: nothing | SSH directory (`~/.ssh/`) |

### SSH Passphrase - An Optional Second Lock

When you run `ssh-keygen`, it asks:

```
Enter passphrase (empty for no passphrase):
```

**What this is**: An additional password that encrypts your private key file.

**Analogy**: It's like putting your house key inside a locked safe. Even if someone steals your key file, they can't use it without the passphrase.

**Tradeoff**:
- ✅ **With passphrase**: More secure. If your laptop is stolen, the thief can't use your SSH keys.
- ❌ **With passphrase**: Every time you SSH, you must type the passphrase. Annoying if you SSH frequently.

**The solution: ssh-agent**
- ssh-agent is like a trusted assistant who holds your keys
- You unlock your key ONCE (type passphrase once)
- ssh-agent remembers it for the session
- You can SSH repeatedly without typing the passphrase again

**Best practice for beginners**:
- Personal laptop that never leaves your sight → No passphrase is fine
- Work laptop or shared computer → USE a passphrase
- Production servers → Always use a passphrase

### Common SSH Mistakes and Fixes

**Problem 1: "Permission denied (publickey)"**

**Cause**: Your private key doesn't match any of the public keys on the server.

**Fix**:
```bash
# Check which key you're using
ssh -v user@server-ip   # Verbose mode shows which keys are tried

# Specify the key explicitly
ssh -i ~/.ssh/id_ed25519 user@server-ip
```

---

**Problem 2: "WARNING: UNPROTECTED PRIVATE KEY FILE!"**

**Cause**: Your key file permissions are too open.

**Fix**:
```bash
chmod 600 ~/.ssh/id_ed25519
```

---

**Problem 3: "Connection refused" or "Connection timed out"**

**Cause**: The server's SSH port is closed (firewall), or you're connecting to the wrong IP.

**Fix**:
```bash
# Check the server's firewall
# On the server (if you can access it another way):
sudo ufw status   # Should show "22 ALLOW"

# Or check if SSH is listening
sudo systemctl status ssh
```

---

**Problem 4: "Host key verification failed"**

**Cause**: The server's fingerprint changed (could be legitimate server rebuild or MITM attack).

**Fix**:
```bash
# Remove the old fingerprint
ssh-keygen -R server-ip

# Then reconnect (you'll get the "authenticity" prompt again)
ssh user@server-ip
```

**WARNING**: Only do this if you KNOW the server was rebuilt. If the fingerprint changed unexpectedly, it could be an attack.

---

## 3. Company Badges - API Keys Explained

**API Key** = A unique identifier that proves "I'm allowed to use this service."

### The Problem

You sign up for Kimi AI. You want OpenClaw to call Kimi's brain on your behalf. How does Kimi know it's YOU calling, not a random stranger?

**Solution**: API keys.

### What an API Key Is

An API key looks like this:
```
k-abc123def456ghi789jkl012mno345pqr678stu901vwx234yz
```

**Components**:
- `k-` = Prefix identifying the key type (Kimi key)
- Rest = A long random string (unique to your account)

**Analogy**: It's like your company employee badge. You flash it, security checks their database, and if it's valid → you're allowed in.

### How It Works Technically

Every time OpenClaw calls Kimi's API:

```bash
curl -X POST "https://api.moonshot.ai/v1/chat/completions" \
  -H "Authorization: Bearer k-abc123..." \
  -H "Content-Type: application/json" \
  -d '{"model":"kimi-k2","messages":[{"role":"user","content":"Hello"}]}'
```

**What happens**:
1. OpenClaw sends: `Authorization: Bearer k-abc123...`
2. Kimi's server looks up: "Who owns key k-abc123?"
3. Database returns: "That's Mike's account. He has $10 credit remaining."
4. Kimi checks: "Does Mike's account allow kimi-k2 model? Yes."
5. Kimi processes the request
6. Kimi deducts $0.0005 from Mike's balance
7. Kimi sends response back to OpenClaw

**If the key is invalid**:
```json
{
  "error": "Invalid API key",
  "status": 401
}
```

Request denied.

### What "Bearer" Means

`Authorization: Bearer k-abc123...`

**Bearer** = "I am the bearer (carrier) of this credential."

**Analogy**: Like saying "I'm the bearer of this letter of introduction" when you deliver a sealed letter to someone.

It means: "I'm presenting this token. I'm authorized because I possess it."

**Security implication**: Anyone who possesses a Bearer token can use it. That's why you NEVER share your API keys - possession = access.

### API Key vs Password - The Difference

| Aspect | Password | API Key |
|--------|----------|---------|
| **Who uses it** | Humans (you log into a website) | Machines (software makes API calls) |
| **How it's used** | Interactive browser login | Sent in HTTP headers (automated) |
| **Format** | Can be anything (MyP@ssw0rd!) | Long random string (k-abc123...) |
| **Scope** | Full account access | Can be scoped (read-only, specific models, spending limits - depends on provider) |
| **Visibility** | Hidden (typed as •••••••) | Visible in code/config (must be protected) |
| **Expiration** | Never (unless you change it) | Never (unless revoked), but some providers offer expiring keys |
| **If stolen** | Attacker can log in as you | Attacker can make API calls as you (rack up charges) |

**Key insight**: API keys are for robots. Passwords are for humans. Don't confuse them.

### What Happens When an API Key Leaks

**Real scenario** (happened in early 2026 to multiple OpenClaw users):

1. User accidentally commits `.env` file to GitHub (with API key inside)
2. GitHub is public → anyone can see the file
3. Bots constantly scan GitHub for leaked API keys
4. Within 30 minutes, bot finds the key
5. Bot starts making API calls using the stolen key
6. Runs continuously for 48 hours (weekend)
7. User checks email Monday morning: **"Your bill is $2,347"**

**Why this is possible**: The API key is a Bearer token. Anyone who HAS it can USE it. The API provider (OpenAI, Kimi, etc.) doesn't know if it's you or a bot - they just see a valid key.

**Response steps** (if your key leaks):

1. **IMMEDIATELY revoke the key** (go to provider dashboard → delete the key)
2. **Generate a new key**
3. **Update your .env file** with the new key
4. **Restart OpenClaw** (so it uses the new key)
5. **Check your usage logs** (see how much damage was done)
6. **Contact support** (some providers will refund fraudulent usage if you catch it quickly)
7. **Add `.env` to `.gitignore`** (prevent future leaks)

**Timeframe matters**: If you revoke within 1 hour → damage is minimal. If you wait 48 hours → damage can be thousands of dollars.

### How to Store API Keys Securely

**❌ WRONG - Hardcoded in config file**:
```json
{
  "llm": {
    "kimi": {
      "apiKey": "k-abc123def456..."  ← DANGER
    }
  }
}
```

**Problem**: Config files get copied, emailed, committed to git, or shared with contractors. Your key is now everywhere.

---

**✅ CORRECT - Environment variable**:

**Step 1: Create `.env` file**:
```bash
# File: ~/.openclaw/.env
KIMI_API_KEY=k-abc123def456...
```

**Step 2: Reference it in config**:
```json
{
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}"  ← References the variable
    }
  }
}
```

**Step 3: Lock the .env file**:
```bash
chmod 600 ~/.openclaw/.env
```

Now:
- ✅ You can share the config file (it just says "use the variable")
- ✅ The actual key is locked in `.env` (chmod 600 = only you can read)
- ✅ `.env` is listed in `.gitignore` (never goes to GitHub)

**Analogy**: It's like putting "Employee salary: See HR Manager" in the public employee handbook, instead of writing "$150,000" where everyone can see it.

### API Key Scoping (Advanced)

Some providers let you create keys with limited permissions:

**Example: OpenAI**:
- Read-only key (can't make API calls, only view usage)
- Full-access key (can make calls, manage billing)
- Model-specific key (can only use GPT-4o, not GPT-4)

**Example: GitHub**:
- Personal Access Token with scopes: `repo`, `read:org`, `write:discussion`
- Each scope = a permission

**Best practice**: Create keys with the MINIMUM permissions needed.

If OpenClaw only needs to READ your GitHub repos, give it a read-only token. Don't give it write access "just in case."

**Principle of Least Privilege**: Only grant the minimum access needed to do the job.

### Key Rotation - Why and How

**Why rotate keys**: Even if your key hasn't leaked, it's good security hygiene to change keys periodically.

**Analogy**: Like changing your office door locks every year. Even if you haven't lost your keys, it's safer to re-key.

**How often**:
- Personal use: Every 6-12 months
- Business use: Every 3-6 months
- Production systems: Every 1-3 months

**How to rotate**:
1. Generate a NEW API key (don't delete the old one yet)
2. Update your `.env` file with the new key
3. Restart OpenClaw
4. Test that everything works
5. NOW delete the old key

**Why wait before deleting the old key**: If something breaks with the new key, you can quickly switch back to the old one. Once you've verified the new key works, delete the old one.

---

## 4. Visitor Passes - OAuth Explained

**OAuth** = Open Authorization. A system that lets you give limited, temporary access without sharing your password.

### The Problem OAuth Solves

You want OpenClaw to read your Gmail. You have two options:

**Option 1: Give OpenClaw your Google password**
- ❌ OpenClaw can access EVERYTHING (Gmail, Drive, Calendar, Photos, YouTube, delete your account)
- ❌ If OpenClaw is compromised, attacker has your full Google password
- ❌ You can't limit what OpenClaw can do
- ❌ If you change your Google password, you must update OpenClaw's config

**Option 2: Use OAuth (the right way)**
- ✅ OpenClaw NEVER sees your Google password
- ✅ You grant LIMITED access (can read emails, cannot delete your account)
- ✅ The access is TEMPORARY (expires after hours/days)
- ✅ You can REVOKE access anytime without changing your password
- ✅ If OpenClaw is compromised, attacker only gets limited access

OAuth is Option 2.

### The OAuth Dance - Step by Step

Let's walk through what actually happens when you set up Gmail integration:

**Step 1: OpenClaw says "I need access"**
```
OpenClaw: "I need to access Mike's Gmail to read his emails."
```

**Step 2: You get redirected to Google's security desk**

Instead of asking YOU for your password, OpenClaw redirects you to Google:

```
Your browser opens: https://accounts.google.com/o/oauth2/auth?client_id=...&scope=gmail.readonly
```

You're now at GOOGLE's login page (not OpenClaw's). Check the URL - it's `accounts.google.com`.

**Step 3: You log in to Google (if not already)**

You enter your Google password. **OpenClaw never sees this.** You're giving it directly to Google.

**Step 4: Google shows you the consent screen**

```
┌──────────────────────────────────────────────┐
│  OpenClaw wants to access your Google       │
│  Account                                     │
│                                              │
│  This will allow OpenClaw to:                │
│  ✓ Read your emails                         │
│  ✓ Send emails on your behalf               │
│                                              │
│  OpenClaw will NOT be able to:               │
│  ✗ Delete your Google account               │
│  ✗ Access your Google Drive                 │
│  ✗ See your YouTube history                 │
│                                              │
│  [ Cancel ]  [ Allow ]                       │
└──────────────────────────────────────────────┘
```

**These checkmarks = OAuth scopes.** You're granting specific, limited permissions.

**Step 5: You click "Allow"**

Google says: "Okay, Mike has approved OpenClaw to read his Gmail."

**Step 6: Google gives OpenClaw a temporary visitor pass**

Google redirects you back to OpenClaw with a special code:

```
http://localhost:18789/oauth/callback?code=abc123def456...
```

That `code` is like a redemption ticket.

**Step 7: OpenClaw exchanges the code for an access token**

Behind the scenes, OpenClaw makes a request to Google:

```
OpenClaw: "I have this redemption code. Give me the actual access token."
Google: "Code verified. Here's your access token: xyz789..."
```

**Step 8: OpenClaw uses the access token to access your Gmail**

Every time OpenClaw reads your email:

```bash
curl "https://gmail.googleapis.com/gmail/v1/users/me/messages" \
  -H "Authorization: Bearer xyz789..."
```

Google checks: "Is xyz789 a valid token? Does it have permission to read emails? Yes and yes." → Returns the emails.

### OAuth Tokens - Access Token vs Refresh Token

OAuth gives OpenClaw TWO tokens:

| Token Type | What It Does | Lifetime | Analogy |
|------------|--------------|----------|---------|
| **Access Token** | Used to make API calls | Short (1-2 hours) | Day visitor pass - expires at 5pm |
| **Refresh Token** | Used to get a new access token when the old one expires | Long (weeks to months) | Season pass renewal card - lets you get new day passes |

**What happens when the access token expires**:
1. OpenClaw tries to read Gmail with the old token
2. Google returns: "Token expired"
3. OpenClaw uses the refresh token: "Give me a new access token"
4. Google returns a new access token
5. OpenClaw continues working

**This happens automatically.** You don't notice.

**If the refresh token also expires**: OpenClaw will ask you to re-authorize (you'll see the consent screen again).

### Why OAuth Is More Secure Than Sharing Passwords

| Aspect | Sharing Password | OAuth |
|--------|------------------|-------|
| **Password exposure** | OpenClaw stores your password | OpenClaw NEVER sees your password |
| **Scope of access** | Full account access (can do anything) | Limited access (only what you approved) |
| **Revocation** | Must change your password (affects all apps) | Revoke token (only affects OpenClaw) |
| **Expiration** | Password never expires | Token expires (auto-refreshes or re-auth required) |
| **If OpenClaw is hacked** | Attacker gets your password (full access) | Attacker gets a token (limited, temporary access) |

**Analogy**:
- **Sharing password** = Giving someone the master key to your office building
- **OAuth** = Giving them a visitor pass that only unlocks the conference room, expires at 5pm, and you can deactivate remotely

### OAuth Scopes - The Permission List

**Scopes** = The specific permissions printed on the visitor pass.

Common Google OAuth scopes:

| Scope | What It Allows |
|-------|----------------|
| `gmail.readonly` | Read emails only, cannot send or delete |
| `gmail.send` | Send emails on your behalf |
| `gmail.modify` | Read, send, and modify emails (but not delete permanently) |
| `gmail.full` | Full access (read, send, delete, manage labels) |
| `drive.readonly` | Read files from Google Drive |
| `drive.file` | Read/write files that OpenClaw created |
| `calendar.readonly` | Read your calendar |
| `calendar.events` | Read and create calendar events |

**Best practice**: Only grant the scopes OpenClaw actually needs.

If OpenClaw only needs to READ your emails, grant `gmail.readonly`, not `gmail.full`.

### How to Review and Revoke OAuth Access

**For Google**:
1. Go to: https://myaccount.google.com/permissions
2. You'll see all apps with access to your Google Account
3. Find "OpenClaw" (or whatever you named it)
4. Click → "Remove Access"

**For GitHub**:
1. Go to: https://github.com/settings/applications
2. Find your OpenClaw integration
3. Click "Revoke"

**For Notion**:
1. Go to: https://www.notion.so/my-integrations
2. Find your integration
3. Click "Remove access"

**When to revoke**:
- You stop using OpenClaw
- You suspect your OpenClaw instance was compromised
- You want to re-authorize with different scopes

**What happens after revocation**: OpenClaw will no longer be able to access that service. If you try to use the integration, you'll get an error. You'll need to re-authorize (the OAuth dance happens again).

---

## 5. Room Access Levels - File Permissions Explained

**File permissions** = Who can read, write, or execute a file on your server.

### The Problem

You have a `.env` file with all your API keys. You have multiple users on your VPS (you, a contractor, an automated backup script). Who should be able to read the `.env` file?

**Answer**: Only you.

**How**: File permissions.

### The Three-Digit Permission Code

When you type `ls -l`, you see:

```bash
-rw-------  1 mike  staff  2048 Feb  9 14:32 .env
-rw-r--r--  1 mike  staff  1024 Feb  9 14:32 openclaw.json
-rwxr-xr-x  1 mike  staff   512 Feb  9 14:32 start.sh
```

**Breaking down** `-rw-------`:
- First character (`-`): File type (- = regular file, d = directory)
- Next 9 characters (`rw-------`): Permissions in 3 groups of 3

**The 3 groups**:
1. **Owner** (the first 3): What the owner can do
2. **Group** (the middle 3): What the group can do
3. **Everyone** (the last 3): What everyone else can do

**The 3 permissions**:
- `r` = Read (can view the file contents)
- `w` = Write (can modify the file)
- `x` = Execute (can run it as a program)
- `-` = No permission

**So** `-rw-------` means:
- Owner: `rw-` = Read + Write, no execute
- Group: `---` = No access
- Everyone: `---` = No access

### The Numeric Shorthand (chmod 600, chmod 700, etc.)

Instead of typing `chmod u=rw,g=,o=`, you can use numbers.

**Each permission has a value**:
- `r` (read) = 4
- `w` (write) = 2
- `x` (execute) = 1

**Add them up for each group**:
- `rwx` = 4 + 2 + 1 = 7 (full access)
- `rw-` = 4 + 2 + 0 = 6 (read and write)
- `r-x` = 4 + 0 + 1 = 5 (read and execute)
- `r--` = 4 + 0 + 0 = 4 (read only)
- `---` = 0 + 0 + 0 = 0 (no access)

**Three digits = Owner / Group / Everyone**:

```bash
chmod 600 .env      # Owner: 6 (rw-), Group: 0 (---), Everyone: 0 (---)
chmod 644 config    # Owner: 6 (rw-), Group: 4 (r--), Everyone: 4 (r--)
chmod 755 script.sh # Owner: 7 (rwx), Group: 5 (r-x), Everyone: 5 (r-x)
chmod 700 ~/.ssh    # Owner: 7 (rwx), Group: 0 (---), Everyone: 0 (---)
chmod 400 key.pem   # Owner: 4 (r--), Group: 0 (---), Everyone: 0 (---)
```

### Common Permission Values - What They Mean

| chmod | Owner | Group | Everyone | Use Case | Business Analogy |
|-------|-------|-------|----------|----------|------------------|
| `600` | rw- | --- | --- | Private files (`.env`, API keys) | Your personal diary - only you can read/write |
| `400` | r-- | --- | --- | Read-only secrets (downloaded .pem keys) | Museum exhibit behind glass - you can look but not touch |
| `644` | rw- | r-- | r-- | Public config files | Company handbook - you edit it, others read it |
| `755` | rwx | r-x | r-x | Executable scripts | Public restroom - everyone can enter (execute), but only janitor can lock/clean (write) |
| `700` | rwx | --- | --- | Private directories (`~/.ssh`, `~/.openclaw`) | Your private office - you have full access, nobody else can enter |
| `777` | rwx | rwx | rwx | **NEVER use this** (everyone can do everything) | Unlocked warehouse - anyone can steal anything |

### Real Examples from OpenClaw Setup

**Private SSH key**:
```bash
chmod 600 ~/.ssh/id_ed25519
# Owner: Can read and update the key
# Others: Cannot even see it exists
```

**Why**: If others can read your private key, they can impersonate you. SSH will refuse to use a key with open permissions.

---

**OpenClaw .env file**:
```bash
chmod 600 ~/.openclaw/.env
# Owner: Can read and update API keys
# Others: Blocked
```

**Why**: API keys are secrets. If a contractor or another user on the server can read your `.env`, they can steal your keys.

---

**OpenClaw directory**:
```bash
chmod 700 ~/.openclaw
# Owner: Full access (read, write, execute/enter)
# Others: Cannot enter the directory at all
```

**Why**: Prevents other users from even listing what files are in the directory.

---

**Startup script**:
```bash
chmod 755 start-openclaw.sh
# Owner: Can read, write, execute
# Others: Can read and execute (but not modify)
```

**Why**: You want the script to be executable by everyone (for automation), but only you can edit it.

### Directory Permissions - The "Execute" Bit Matters

For **directories**, the permissions work slightly differently:

| Permission | For Files | For Directories |
|------------|-----------|-----------------|
| `r` (read) | Can view file contents | Can list files in directory (`ls`) |
| `w` (write) | Can modify the file | Can create/delete files inside |
| `x` (execute) | Can run as program | Can ENTER the directory (`cd`) |

**Example**:
```bash
chmod 700 ~/.openclaw
```

- **7 (rwx) for owner**: You can list files, create files, and enter the directory
- **0 for others**: Cannot even `cd` into the directory

**If you set it to 600** (no execute bit):
```bash
chmod 600 ~/.openclaw
# Even YOU can't cd into it!
```

**Why**: Without execute permission, nobody can enter the directory, not even the owner. Always use 7 (rwx) or 5 (r-x) for directories, never 6 or 4.

### How to Check Current Permissions

```bash
ls -l ~/.openclaw/.env
```

Output:
```
-rw-------  1 mike  staff  2048 Feb  9 14:32 /Users/mike/.openclaw/.env
```

**Breaking it down**:
- `-rw-------`: Owner can read/write, nobody else can access
- `mike`: Owner's username
- `staff`: Group name
- `2048`: File size in bytes

### How to Fix Permission Errors

**Error**: "Permission denied" when trying to read a file

**Cause**: You don't have read permission.

**Fix**:
```bash
chmod 600 filename   # If it's your file and you're the owner
# or
sudo chmod 644 filename   # If you need others to read it too
```

---

**Error**: "Permission denied" when trying to run a script

**Cause**: File doesn't have execute permission.

**Fix**:
```bash
chmod +x script.sh   # Add execute permission
# or
chmod 755 script.sh  # Owner: full access, Others: read+execute
```

---

**Error**: SSH refuses to use your key: "Permissions 0644 for 'id_ed25519' are too open"

**Cause**: Private key can be read by others.

**Fix**:
```bash
chmod 600 ~/.ssh/id_ed25519
```

---

## 6. Armored Trucks - Encryption & SSL

**Encryption** = Scrambling data so only authorized parties can read it.

### The Problem

You're at a coffee shop in Singapore, connected to public Wi-Fi. You SSH into your VPS in DigitalOcean. Your API keys, your commands, your data - all of it travels through:

1. The coffee shop's router
2. The ISP's network
3. Several internet backbone routers
4. DigitalOcean's network
5. Your VPS

**Who can read your data along the way?**

**Without encryption**: Everyone. Like sending postcards - anyone handling the mail can read them.

**With encryption**: Nobody. Like sending mail in a sealed, tamper-proof armored truck.

### HTTPS vs HTTP - The Lock Icon

When you visit a website:

**HTTP** (no lock icon):
- `http://example.com`
- Data sent in plain text
- Anyone on the network can read it

**HTTPS** (🔒 lock icon):
- `https://example.com`
- Data encrypted end-to-end
- Eavesdroppers see scrambled gibberish

**For OpenClaw**:
- If your VPS dashboard is at `http://your-ip:18789` → Anyone on the coffee shop Wi-Fi can steal your API keys
- If it's at `https://your-domain.com:18789` → Safe from eavesdropping

### SSL/TLS Certificates - How HTTPS Works

**SSL** (Secure Sockets Layer) / **TLS** (Transport Layer Security) = The protocols that encrypt HTTPS traffic.

**How it works** (simplified):

1. You visit `https://openclaw.example.com`
2. Your browser asks the server: "Show me your SSL certificate"
3. Server sends its certificate (like showing an ID badge)
4. Your browser checks: "Is this certificate valid? Is it issued by a trusted authority? Does it match the domain?"
5. If yes → Your browser and server negotiate encryption keys
6. All traffic is now encrypted with those keys

**Who issues SSL certificates?**
- **Let's Encrypt** (free, automated, most common for VPS)
- **Cloudflare** (free if you use their DNS)
- **DigiCert, Sectigo** (paid, for enterprises)

**How to get a free SSL certificate** (for VPS):

```bash
# Install Certbot (Let's Encrypt client)
sudo apt update
sudo apt install certbot

# Get a certificate for your domain
sudo certbot certonly --standalone -d openclaw.example.com

# Certbot will:
# 1. Verify you own the domain
# 2. Generate a certificate
# 3. Store it in /etc/letsencrypt/live/openclaw.example.com/
```

Then configure your OpenClaw gateway to use the certificate.

**Auto-renewal**: Certbot sets up a cron job to renew certificates automatically (they expire every 90 days).

### SSH Tunnels - Private Underground Passages

**The problem**: You want to access your VPS's OpenClaw dashboard from your Mac, but you don't want to expose port 18789 to the public internet.

**Solution**: SSH tunnel.

**Command**:
```bash
ssh -L 18789:localhost:18789 user@your-vps-ip
```

**What this does**:

```
┌──────────────────────────────────────────────────────┐
│ YOUR MAC                                             │
│                                                      │
│  Your browser: http://localhost:18789                │
│        │                                             │
│        ├─ Connects to: Local port 18789             │
│        │                                             │
│        ▼                                             │
│  [SSH Tunnel - Encrypted Underground Passage]       │
│        │                                             │
│        └──────────────────────────────────────────┐  │
│                                                    │  │
└────────────────────────────────────────────────────┼──┘
                                                     │
                                    [INTERNET]       │
                                    (encrypted)      │
                                                     │
┌────────────────────────────────────────────────────┼──┐
│ YOUR VPS                                           │  │
│                                                    ▼  │
│  SSH receives encrypted traffic on port 22        │  │
│  Decrypts and forwards to: localhost:18789        │  │
│        │                                           │  │
│        ▼                                           │  │
│  OpenClaw dashboard running on port 18789         │  │
│                                                    │  │
└────────────────────────────────────────────────────┘  │
```

**In plain English**:
1. You type `http://localhost:18789` in your Mac's browser
2. Your Mac forwards that to the SSH tunnel
3. The tunnel encrypts it and sends it through the SSH connection
4. Your VPS receives it, decrypts it, and sends it to OpenClaw on localhost:18789
5. OpenClaw's response goes back through the tunnel (encrypted)
6. Your browser displays the dashboard

**From the outside**:
- Firewall only sees SSH traffic on port 22 (normal, encrypted)
- Port 18789 is NOT exposed to the internet
- Nobody can access your dashboard except via the tunnel

**Analogy**: It's like a private underground passage from your house (Mac) to your office (VPS). Outsiders can't see the passage or use it. Only you can.

### End-to-End vs Transport Encryption

| Type | What It Protects | Example | Who Can Read |
|------|------------------|---------|--------------|
| **Transport Encryption** | Data in transit between two points | HTTPS, SSH | The two endpoints (client and server) |
| **End-to-End Encryption** | Data from sender to recipient, even the servers can't read it | WhatsApp messages, Signal | Only the sender and recipient |

**For OpenClaw**:
- **Your messages to the VPS** → Transport encrypted (HTTPS/SSH)
- **VPS to Kimi API** → Transport encrypted (HTTPS)
- **WhatsApp messages** → End-to-end encrypted (Meta can't read them)

**Implication**: When OpenClaw calls Kimi's API, Kimi CAN read the message (that's the point - they need to process it). But nobody between your VPS and Kimi can eavesdrop.

---

## 7. Double Locks - Two-Factor Authentication

**2FA = Two-Factor Authentication.** Also called **MFA (Multi-Factor Authentication)**.

### The Problem

Passwords can be stolen:
- Phished (fake login page)
- Keylogged (malware on your computer)
- Leaked (provider gets hacked and passwords are exposed)
- Guessed (if weak)

**2FA solves this**: Even if someone steals your password, they ALSO need your phone.

### The Two Factors

Authentication factors are categorized:

1. **Something you KNOW**: Password, PIN, security question answer
2. **Something you HAVE**: Phone, hardware key, authenticator app
3. **Something you ARE**: Fingerprint, face scan, retina

**2FA** = Combine two of these. Most common: Password (KNOW) + Phone code (HAVE).

**Analogy**: Like a bank vault that needs both a key (HAVE) AND a combination code (KNOW). A thief who steals the key still can't get in without the code.

### How 2FA Works (Time-Based One-Time Password - TOTP)

**The most common 2FA method**: Authenticator app (Google Authenticator, Authy, 1Password).

**Setup process**:

1. You enable 2FA on Anthropic (or Moonshot, OpenAI, etc.)
2. The site shows you a QR code
3. You scan it with your authenticator app (Google Authenticator, Authy)
4. The app starts generating 6-digit codes every 30 seconds

**From then on, when you log in**:

```
1. Enter username: mike@example.com
2. Enter password: ••••••••••••
3. Enter 2FA code: [    ] ← Type the 6-digit code from your app
```

**Why the code changes every 30 seconds**:
- Based on the current time + a secret key (stored in your app)
- Even if someone intercepts a code, it's useless after 30 seconds
- The server and your app both calculate the same code independently (no internet needed for your app to work)

### Why SMS 2FA Is Weaker

**SMS 2FA**:
- Code is sent via text message to your phone
- You type the code to log in

**Vulnerability: SIM swapping**
1. Attacker calls your mobile carrier, impersonates you
2. "I lost my phone, please transfer my number to this new SIM card"
3. If carrier falls for it → Attacker now receives your SMS codes
4. Attacker can bypass your 2FA

**Authenticator apps** (Google Authenticator, Authy) are safer:
- Not linked to your phone number
- Can't be SIM-swapped
- Work offline (codes generated locally)

**Best practices**:
- ✅ Use authenticator apps (Google Authenticator, Authy, 1Password)
- ⚠️ Use SMS 2FA only if no other option exists
- ✅ Enable 2FA on: Anthropic, OpenAI, Moonshot, GitHub, Google

### How to Set Up 2FA (Step-by-Step)

**For Anthropic (Claude)**:

1. Go to: https://console.anthropic.com/settings/security
2. Click "Enable Two-Factor Authentication"
3. Scan QR code with Google Authenticator (or Authy)
4. Enter the 6-digit code to confirm
5. **CRITICAL**: Save your recovery codes (in case you lose your phone)

**For Moonshot (Kimi)**:

1. Go to: https://platform.moonshot.ai (settings/security)
2. Enable 2FA
3. Scan QR code
4. Confirm with code

**For Google (Gmail, Drive)**:

1. Go to: https://myaccount.google.com/security
2. Under "How you sign in to Google," select "2-Step Verification"
3. Follow the prompts
4. Use Authenticator app (not SMS if possible)

**For GitHub**:

1. Go to: https://github.com/settings/security
2. Click "Enable two-factor authentication"
3. Scan QR code
4. Download recovery codes

### Recovery Codes - DON'T LOSE THESE

When you enable 2FA, most services give you **recovery codes** (also called backup codes):

```
1. a1b2-c3d4-e5f6
2. g7h8-i9j0-k1l2
3. m3n4-o5p6-q7r8
...
```

**What these are**: One-time-use codes that work instead of your 2FA code.

**When you need them**:
- You lose your phone
- Your authenticator app breaks
- You get a new phone and forgot to transfer your 2FA codes

**How to store them**:
- ✅ Print them and store in a safe
- ✅ Save in password manager (1Password, Bitwarden)
- ✅ Write on paper in a locked drawer
- ❌ Store in plain text file on your computer
- ❌ Email them to yourself

**If you lose both your phone AND recovery codes**: You're locked out of your account. Some providers have manual recovery (contact support with ID proof), but it's a painful process.

---

## 8. The Complete Security Chain - How It All Fits Together

Let's trace a real message: **You send "Summarize my emails" via WhatsApp** → What happens with EVERY key, lock, and connector?

```
┌──────────────────────────────────────────────────────────────┐
│ 1. YOU (CEO in KL, on phone at coffee shop)                 │
│    Open WhatsApp, type: "Summarize my emails from today"    │
└──────────────────────────────────────────────────────────────┘
                            │
                            ├─ Message encrypted END-TO-END (WhatsApp)
                            │  🔒 Coffee shop Wi-Fi owner CANNOT read this
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 2. WHATSAPP SERVERS (Meta, USA)                             │
│    Forward encrypted message to your OpenClaw number         │
└──────────────────────────────────────────────────────────────┘
                            │
                            ├─ Delivered via internet
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 3. YOUR VPS (DigitalOcean Singapore)                        │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ FIREWALL (UFW) - The Building Gate                    │ │
│  │ • Port 22 (SSH): 🔓 Open - you need to access server  │ │
│  │ • Port 443 (HTTPS): 🔓 Open - for secure web traffic  │ │
│  │ • Port 18789 (Dashboard): 🔒 CLOSED to public         │ │
│  │ • All other ports: 🔒 CLOSED                          │ │
│  │                                                        │ │
│  │ Blocked: Port scanners, brute force attempts          │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  (Meanwhile, YOU want to check the dashboard)                │
│  You're on your Mac at home:                                 │
│                                                              │
│  $ ssh -L 18789:localhost:18789 mike@vps-ip                 │
│    🔑 SSH KEY AUTHENTICATION                                │
│    • Your private key: ~/.ssh/id_ed25519 (chmod 600)        │
│    • Server's lock: ~/.ssh/authorized_keys (your pub key)   │
│    • Key fits lock ✓ → SSH tunnel established               │
│                                                              │
│  Now you can visit: http://localhost:18789 on your Mac      │
│  Traffic goes through encrypted SSH tunnel                   │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ OPENCLAW DASHBOARD ACCESS                              │ │
│  │ You see login page: Username + Password + 2FA code    │ │
│  │                                                        │ │
│  │ 🔐 Two-Factor Auth:                                   │ │
│  │ 1. Password: Something you KNOW                       │ │
│  │ 2. Code from Google Authenticator: Something you HAVE│ │
│  │                                                        │ │
│  │ Both required → Dashboard unlocks                     │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  Back to the WhatsApp message processing:                    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ OPENCLAW GATEWAY (The Receptionist)                   │ │
│  │ Message received: "Summarize my emails from today"    │ │
│  │                                                        │ │
│  │ 🔍 DM Pairing Check:                                  │ │
│  │ • Who sent this? Phone: +60-123-456-789               │ │
│  │ • Is this number authorized? (checks pairing list)    │ │
│  │ • ✓ Yes, this is Mike (paired previously)            │ │
│  │ • If NO → Bot asks for pairing code                   │ │
│  │                                                        │ │
│  │ Route to: OpenClaw Agent                              │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ OPENCLAW AGENT (The Employee)                         │ │
│  │ Received task: "Summarize my emails from today"       │ │
│  │                                                        │ │
│  │ Check memory (chmod 700 ~/.openclaw/memory/):         │ │
│  │ • "Mike uses Gmail"                                   │ │
│  │ • "Prefers bullet points"                             │ │
│  │                                                        │ │
│  │ Need to: Fetch emails from Gmail                      │ │
│  └────────────────────────────────────────────────────────┘ │
│                            │                                 │
│                            ▼                                 │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ GMAIL INTEGRATION (OAuth Access)                      │ │
│  │                                                        │ │
│  │ 🎫 OAuth Access Token:                                │ │
│  │ • Token stored in: ~/.openclaw/.env (chmod 600)       │ │
│  │ • Token scope: gmail.readonly (read only)             │ │
│  │ • Token expiration: 1 hour (will auto-refresh)        │ │
│  │                                                        │ │
│  │ Agent makes API call to Gmail:                        │ │
│  │ GET https://gmail.googleapis.com/gmail/v1/users/me... │ │
│  │ -H "Authorization: Bearer [OAuth Token]"              │ │
│  │                                                        │ │
│  │ 🔒 HTTPS/TLS Encryption:                              │ │
│  │ • Traffic encrypted between VPS and Google            │ │
│  │ • ISP sees: VPS talking to Gmail, but can't read data│ │
│  │                                                        │ │
│  │ Google's response:                                     │ │
│  │ ✓ Token valid                                         │ │
│  │ ✓ Scope allows read                                   │ │
│  │ → Returns 12 emails from today                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                            │                                 │
│                            ▼                                 │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ AGENT: Now have 12 emails (~2,500 words)              │ │
│  │ Need brain consultant to summarize                     │ │
│  │                                                        │ │
│  │ Load API key from .env:                                │ │
│  │ • File: ~/.openclaw/.env (chmod 600 - only I can read)│ │
│  │ • Contents: KIMI_API_KEY=k-abc123...                  │ │
│  │                                                        │ │
│  │ Make API call to Kimi:                                 │ │
│  └────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
                            │
                            ├─ HTTPS to Kimi (Beijing)
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 4. KIMI AI API (Moonshot, Beijing)                          │
│                                                              │
│  Receives request:                                           │
│  POST https://api.moonshot.ai/v1/chat/completions           │
│  -H "Authorization: Bearer k-abc123..."                     │
│  -H "Content-Type: application/json"                        │
│  -d '{"model":"kimi-k2","messages":[...]}'                  │
│                                                              │
│  🪪 API KEY VERIFICATION:                                   │
│  1. Check: Is k-abc123... a valid key?                      │
│  2. Lookup: Who owns this key? → Mike's account             │
│  3. Check: Does Mike have credit? → Yes, $8.50 remaining    │
│  4. Check: Is kimi-k2 allowed? → Yes                        │
│  5. Process request                                          │
│                                                              │
│  ⚙️ GPU PROCESSING:                                         │
│  • Kimi's data center uses NVIDIA H100 GPUs                 │
│  • 70 billion parameter model runs on GPU cluster           │
│  • Input: 2,500 tokens (12 emails) → $0.001                │
│  • Output: 500 tokens (summary) → $0.0008                  │
│  • Total: $0.0018 deducted from Mike's balance             │
│                                                              │
│  Response generated: 500-word bullet-point summary          │
│  Send back to VPS over HTTPS                                 │
└──────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 5. BACK TO VPS - AGENT RECEIVES SUMMARY                     │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ OPENCLAW AGENT                                         │ │
│  │ Received summary from Kimi                             │ │
│  │                                                        │ │
│  │ 📝 Update memory (chmod 700 directory):                │ │
│  │ • "Last email summary: Feb 9, 2026"                    │ │
│  │ • Store in: ~/.openclaw/memory/conversations/          │ │
│  │                                                        │ │
│  │ 📊 Update logs (chmod 640):                            │ │
│  │ • "2026-02-09 14:35:22 - API call to Kimi: 3,000 tok" │ │
│  │ • "2026-02-09 14:35:22 - Cost: $0.0018"               │ │
│  │ • Store in: ~/.openclaw/logs/activity.log              │ │
│  │                                                        │ │
│  │ Format summary nicely, send to Gateway                 │ │
│  └────────────────────────────────────────────────────────┘ │
│                            │                                 │
│                            ▼                                 │
│  ┌────────────────────────────────────────────────────────┐ │
│  │ GATEWAY                                                │ │
│  │ Send response to: WhatsApp channel                     │ │
│  │ Recipient: +60-123-456-789 (Mike's number)            │ │
│  └────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
                            │
                            ├─ Via WhatsApp API
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 6. WHATSAPP (Encrypted delivery)                            │
│    Message delivered to your phone                           │
│    🔒 End-to-end encrypted (WhatsApp can't read it)         │
└──────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌──────────────────────────────────────────────────────────────┐
│ 7. YOU - Read summary on your phone                         │
│                                                              │
│    📧 Email Summary for Feb 9:                              │
│    • Client A confirmed Q3 meeting (Feb 15 at 2pm)          │
│    • Invoice from Supplier B (RM 4,500) - due Feb 20        │
│    • Team meeting rescheduled to Thursday 10am              │
│    • Proposal approved by Client C - next steps needed      │
│    • 8 other routine emails                                 │
│                                                              │
│    Total time: 6 seconds                                     │
│    Total cost: $0.0018 (~0.8 sen)                           │
└──────────────────────────────────────────────────────────────┘
```

### Security Layers That Protected This Transaction

| Layer | Security Mechanism | What It Protected |
|-------|-------------------|-------------------|
| **WhatsApp** | End-to-end encryption | Your message from coffee shop Wi-Fi snooping |
| **Firewall (UFW)** | Blocked ports | Server from port scanners and unauthorized access |
| **SSH Key** | Public-key cryptography | Server access from password guessing |
| **SSH Tunnel** | Encrypted channel | Dashboard traffic from eavesdropping |
| **2FA** | Two-factor auth | Dashboard from stolen password |
| **DM Pairing** | Sender verification | OpenClaw from unauthorized WhatsApp users |
| **OAuth Token** | Delegated access | Google password from being shared with OpenClaw |
| **OAuth Scopes** | Limited permissions | OpenClaw from deleting your emails or Google account |
| **API Key** | Authentication | Kimi from unauthorized API usage |
| **HTTPS/TLS** | Transport encryption | API calls from ISP snooping |
| **.env chmod 600** | File permissions | API keys from other users on VPS |
| **Directory chmod 700** | Folder permissions | Memory files from unauthorized access |

**Total**: 12 security layers protecting a single message.

---

## 9. The Glossary - Key vs Token vs Secret

These terms are used interchangeably in guides, but they mean different things. Here's the complete breakdown:

| Term | What It Is | Lifetime | Who Can See It | Revocable? | Analogy | Example |
|------|-----------|----------|----------------|------------|---------|---------|
| **SSH Private Key** | Your personal cryptographic key file | Permanent (until deleted) | ONLY you (chmod 600) | No (delete and generate new) | Your house key | `~/.ssh/id_ed25519` |
| **SSH Public Key** | The matching lock for your private key | Permanent | Anyone (designed to be shared) | N/A (harmless if shared) | The lock on your door | `~/.ssh/id_ed25519.pub` |
| **API Key** | Long-term credential for API access | Permanent (until revoked) | You + your software | Yes (via provider dashboard) | Company access badge | `k-abc123...` (Kimi), `sk-abc123...` (OpenAI) |
| **OAuth Access Token** | Short-term credential for API access | 1-2 hours (auto-expires) | The software using it | Yes (revoke OAuth app) | Day visitor pass | `ya29.a0AfB_byC...` |
| **OAuth Refresh Token** | Long-term token to get new access tokens | Days to months | The software using it | Yes (revoke OAuth app) | Season pass renewal card | Stored by OpenClaw, invisible to you |
| **Bot Token** | Telegram/Slack/Discord bot identity | Permanent (until revoked) | You + your bot | Yes (via bot creation service) | Birth certificate | `123456:ABC-DEF...` (Telegram) |
| **Password** | Shared secret for human login | Until you change it | You + the service | Yes (change password) | Combination lock code | Your Google password |
| **Passphrase** | Password protecting your SSH key | Until you change it | Only you | Yes (re-encrypt key) | Safe combination for your key | Unlocks `id_ed25519` |
| **2FA Code** | Time-based one-time password | 30 seconds | Only you (from authenticator app) | N/A (regenerates every 30s) | One-time PIN | `123456` |
| **Recovery Code** | One-time-use backup for lost 2FA | Until used | Only you (saved during setup) | N/A (single use) | Spare house key hidden under mat | `a1b2-c3d4-e5f6` |
| **.env Secret** | Any sensitive config value | Until rotated | Your server only (chmod 600) | Yes (manual rotation) | Safe combination | `KIMI_API_KEY=k-...` |
| **Client ID** | Public identifier for OAuth app | Permanent | Public (safe to share) | N/A (not secret) | Company business registration number | Your Google app client ID |
| **Client Secret** | Private credential for OAuth app | Permanent (until rotated) | ONLY you | Yes (regenerate) | Company private seal | Your Google app secret |
| **Bearer Token** | Generic term for "auth token in header" | Varies | Sent with API requests | Depends on token type | Letter of introduction | `Authorization: Bearer xyz...` |
| **JWT (JSON Web Token)** | Self-contained signed token | Varies (usually minutes to hours) | Anyone can decode (but not forge) | No (expires automatically) | Signed certificate | Used in some APIs |

### When You See Each Term

| Scenario | Term You'll See | What It Means |
|----------|----------------|---------------|
| VPS setup guide: "Generate SSH key" | SSH Private Key + Public Key | Your login credentials for the server |
| LLM provider setup: "Create API key" | API Key | Long-term credential for calling their AI |
| OAuth consent screen: "Allow access" | OAuth Tokens | Delegated, limited, temporary access |
| Telegram setup: "Get bot token from BotFather" | Bot Token | Your bot's unique identifier |
| `.env` file: "Add your secrets here" | Any sensitive value (usually API keys) | Values that must stay private |
| 2FA setup: "Scan this QR code" | TOTP Secret | Seed for generating 6-digit codes |
| SSH command: "Enter passphrase" | SSH Key Passphrase | Optional password protecting your private key |

---

## 10. Quick Reference - Command Decoder

**When you see this command, here's what it means in plain English:**

### SSH Commands

```bash
ssh-keygen -t ed25519
```
**Translation**: "Create a new matched pair of house key + lock using the ed25519 algorithm (most secure modern method)."

---

```bash
chmod 600 ~/.ssh/id_ed25519
```
**Translation**: "Lock my private house key file so only I (the owner) can read and write it. Nobody else on this computer can even look at it."

---

```bash
ssh -i ~/.ssh/id_ed25519 user@server-ip
```
**Translation**: "Use this specific key file to log into this server as 'user'. Try my key in their lock."

---

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@server-ip
```
**Translation**: "Install my lock (public key) on that server's door so my key can open it from now on."

---

```bash
ssh -L 18789:localhost:18789 user@server-ip
```
**Translation**: "Build a private encrypted tunnel from my Mac's port 18789 to the server's port 18789. Traffic goes through securely."

---

```bash
chmod 400 key.pem
```
**Translation**: "Set this file to read-only for me. I can't accidentally change it, and nobody else can even look at it."

---

### Permission Commands

```bash
chmod 700 ~/.openclaw
```
**Translation**: "I (owner) have full access to this folder (read, write, enter). Nobody else can access it at all."

---

```bash
chmod 644 config.json
```
**Translation**: "I can read and write this file. Everyone else can only read it (common for config files)."

---

```bash
chmod +x script.sh
```
**Translation**: "Add execute permission to this file (so I can run it as a program)."

---

```bash
ls -l file.txt
```
**Translation**: "Show me detailed info about this file including permissions, owner, size, and modification date."

---

### API & Environment Variable Commands

```bash
export KIMI_API_KEY="k-abc123..."
```
**Translation**: "Put this API key in my pocket for this terminal session. Programs I run can access it via $KIMI_API_KEY."

---

```bash
echo 'export KIMI_API_KEY="k-..."' >> ~/.zshrc
```
**Translation**: "Pin this API key to my jacket permanently. It will be available every time I open a new terminal."

---

```bash
source ~/.zshrc
```
**Translation**: "Reload my shell configuration now (so the new environment variables take effect without restarting terminal)."

---

```bash
echo $KIMI_API_KEY
```
**Translation**: "Show me the value of this environment variable (to verify it's set correctly)."

---

### API Request Commands

```bash
curl -X POST "https://api.moonshot.ai/v1/chat/completions" \
  -H "Authorization: Bearer $KIMI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"kimi-k2","messages":[{"role":"user","content":"Hello"}]}'
```
**Translation**: "Make an HTTP POST request to Kimi's API. Include my API key as a Bearer token in the header. Send this JSON data. I'm asking the kimi-k2 model to respond to 'Hello'."

---

### Firewall Commands

```bash
sudo ufw allow 22
```
**Translation**: "Open door #22 (SSH port) in the firewall. Allow SSH connections from anywhere."

---

```bash
sudo ufw allow 18789
```
**Translation**: "Open door #18789 (OpenClaw dashboard port). Allow connections to the dashboard."

---

```bash
sudo ufw enable
```
**Translation**: "Turn on the firewall. Start enforcing the allow/deny rules."

---

```bash
sudo ufw status
```
**Translation**: "Show me which doors (ports) are open and which are closed."

---

### SSH Connection Prompts

```
The authenticity of host '157.245.123.45' can't be established.
ED25519 key fingerprint is SHA256:abc123def456...
Are you sure you want to continue connecting (yes/no)?
```
**Translation**: "This is the first time you're visiting this building. The server is showing you its ID fingerprint (like a photo ID). Is this REALLY the server you intended to reach? Type 'yes' if you're sure, and I'll save this fingerprint so I can verify it's the same building next time."

---

```
Enter passphrase for key '/Users/mike/.ssh/id_ed25519':
```
**Translation**: "Your house key is locked in a safe. What's the safe combination (passphrase)? If you didn't set a passphrase during key generation, just press Enter."

---

```
Warning: Permanently added '157.245.123.45' (ED25519) to the list of known hosts.
```
**Translation**: "I've saved this building's fingerprint in my directory (`~/.ssh/known_hosts`). Next time you visit, I'll check if the fingerprint still matches."

---

### File Permission Errors

```
WARNING: UNPROTECTED PRIVATE KEY FILE!
Permissions 0644 for '/Users/mike/.ssh/id_ed25519' are too open.
```
**Translation**: "Your house key file can be read by other people on this computer! This is a security risk. SSH refuses to use it until you lock it down with `chmod 600`."

---

```
Permission denied (publickey).
```
**Translation**: "Your private key doesn't fit any of the locks on this server's door. Either you're using the wrong key file, or your public key isn't installed on the server."

---

## Summary - The Three Categories

Remember the framework:

### 🔑 KEYS (Prove Who You Are)

- **SSH Keys**: House keys (one-way - you open a door to your server)
- **API Keys**: Company badges (two-way - you show it, they verify it)
- **OAuth Tokens**: Visitor passes (delegated, limited, temporary)
- **Passwords**: Combination locks (both sides know the secret)

### 🔒 LOCKS (Protect Things)

- **Firewalls**: Building gates (control who enters which port/door)
- **File Permissions (chmod)**: Room access levels (owner/group/everyone)
- **SSL/HTTPS**: Armored trucks (protect data in transit)
- **2FA**: Double locks (key + code required)

### 🔌 CONNECTORS (Let Things Talk)

- **APIs**: Phone lines (two-way request/response)
- **Webhooks**: Doorbells (one-way notification trigger)
- **SSH Tunnels**: Private underground passages (secure encrypted channels)
- **OAuth Flow**: Security desk check-in procedure

---

## Where to Learn More

- **MENTAL-MODEL.md** → Understand what each OpenClaw component is (the office, the employee, the brain)
- **SECURITY.md** → Security checklists and best practices
- **VPS Setup Guides** → Step-by-step commands (now you know what they mean!)
  - [DigitalOcean Guide](guides/05-digitalocean.md)
  - [Oracle Cloud Guide](guides/04-oracle-cloud-free.md)
  - [Contabo Guide](guides/06-contabo-vps.md)

**Now you understand WHY you're typing those commands, not just WHAT to type.**
