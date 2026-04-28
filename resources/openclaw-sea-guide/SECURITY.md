# Security Guide: Is OpenClaw Safe?

**A comprehensive security analysis for business leaders in Southeast Asia**

---

## Executive Summary

**Yes, OpenClaw is safe when configured properly.**

OpenClaw is open-source software with 150,000+ GitHub stars, created by Peter Steinberger (founder of PSPDFKit). It has been audited by thousands of developers worldwide.

This guide addresses every security concern we've heard from business leaders in Malaysia and Singapore.

---

## Common Security Concerns

### 1. "Someone will steal my data"

**Reality**: OpenClaw is local-first. Your data stays on YOUR machine.

#### How It Works

- OpenClaw runs **on your computer** (Mac, VPS, or cloud server)
- All memory is stored as **local Markdown files** in `~/.openclaw/memory/`
- No data is sent to external servers (except your chosen LLM for processing requests)
- You have complete control over what information OpenClaw can access

#### What Gets Sent to LLM Providers?

When you ask OpenClaw a question:
1. Your message is sent to your chosen LLM (Kimi, DeepSeek, Claude, etc.)
2. The LLM processes it and returns a response
3. Response is stored locally on your machine

**Example**: If you ask "Summarize my emails", only the email text you explicitly share goes to the LLM. Your full inbox is never uploaded.

#### Data Privacy by Hosting Option

| Hosting Type | Data Location | Privacy Level |
|--------------|---------------|---------------|
| **Local Mac** | Only on your Mac | Maximum - nothing leaves your machine except to LLM |
| **Oracle/VPS** | On your VPS | High - you control the server |
| **DigitalOcean** | On your DO droplet | High - you control the server |

---

### 2. "Someone will get my API keys"

**Reality**: OpenClaw uses OAuth tokens, not raw API keys. Even if someone accessed your machine, they can't easily steal credentials.

#### How Authentication Works

| Provider | Authentication Method | Security |
|----------|----------------------|----------|
| **Anthropic (Claude)** | OAuth 2.0 | Same security as logging into websites |
| **OpenAI** | OAuth 2.0 | Tokens expire and can be revoked |
| **Kimi/DeepSeek** | API Keys in .env file | Stored with restricted file permissions |

#### Best Practices

1. **Never share your `~/.openclaw/` folder**
   - This folder contains your configuration and tokens
   - Set permissions: `chmod 700 ~/.openclaw`

2. **Use environment variables for API keys**
   ```bash
   export KIMI_API_KEY="your-key-here"
   ```
   Never hardcode keys in configuration files.

3. **Run security audit regularly**
   ```bash
   openclaw doctor
   ```
   This command checks for security misconfigurations.

4. **Set spending limits**
   - Kimi: Set monthly budget in dashboard
   - DeepSeek: Set max tokens per request
   - Claude: Use existing Pro/Max subscription limits

---

### 3. "Someone will access my credit card"

**Reality**: OpenClaw has **ZERO access** to payment systems.

#### How Billing Works

```
┌─────────────┐
│ You         │
│ (Browser)   │
└──────┬──────┘
       │
       │ Create account & add payment method
       │
       ▼
┌─────────────┐
│ LLM Provider│  ← You manage this directly
│ (Kimi/etc)  │     OpenClaw never sees it
└──────┬──────┘
       │
       │ Provides API access
       │
       ▼
┌─────────────┐
│ OpenClaw    │  ← Only receives API access
│ (Your Mac)  │     No payment info ever
└─────────────┘
```

#### How to Protect Yourself

1. **Set spending caps** at the LLM provider level:
   - Kimi: Dashboard → Settings → Spending Limit → $20/month
   - DeepSeek: API Settings → Rate Limits
   - Claude: Already limited by subscription tier

2. **Monitor usage weekly**:
   - Check your LLM provider dashboard
   - Set up email alerts for unusual spending

3. **Use virtual credit cards** (optional):
   - Wise, Revolut, or Privacy.com
   - Set monthly limits at card level

---

### 4. "I heard people on podcasts say it's dangerous"

**Reality**: Early concerns were about **misconfiguration**, not the software itself.

#### Common Misconfigurations (and How to Avoid Them)

| Risk | How to Avoid |
|------|--------------|
| **No DM Pairing** | Always enable DM pairing (default in new installs) |
| **Full System Access** | Start with Sandbox Mode, expand only as needed |
| **Exposed Dashboard** | Never expose dashboard to public internet without authentication |
| **No Rate Limiting** | Set rate limits in LLM provider dashboard |

#### What Changed Since Early Days?

OpenClaw has added significant security features:

- **DM Pairing** (April 2025): Unknown senders must be approved
- **Sandbox Mode** (May 2025): Restricted environment by default
- **Security Doctor** (June 2025): `openclaw doctor` command
- **OAuth by Default** (July 2025): No more raw API keys

---

## Security Features in OpenClaw

### 1. DM Pairing

When someone unknown messages your OpenClaw, they receive a pairing code request:

```
Unknown Sender: "Hey, can you help me?"

OpenClaw: "I don't recognize you. Please provide the pairing code to continue."
```

**You must explicitly approve each sender.**

### 2. Sandbox Mode

Sandbox Mode restricts OpenClaw from:
- Deleting files
- Accessing certain directories
- Running privileged commands
- Exposing sensitive environment variables

**Enable Sandbox Mode** (add to `~/.openclaw/openclaw.json`):
```json
{
  "sandbox": {
    "enabled": true,
    "allowedPaths": ["/Users/yourusername/Documents/Safe-Folder"],
    "blockedCommands": ["rm", "sudo", "curl"]
  }
}
```

### 3. Security Doctor

Run regular security audits:

```bash
openclaw doctor
```

This checks for:
- Exposed API keys in config files
- Insecure file permissions
- Public dashboard exposure
- Missing DM pairing configuration

### 4. Local-First Architecture

```
Data Flow:
┌─────────────────┐
│ Your Documents  │
│ (Local Files)   │
└────────┬────────┘
         │
         │ Read only when you request
         │
         ▼
┌─────────────────┐
│ OpenClaw        │
│ (Your Machine)  │
└────────┬────────┘
         │
         │ Send only necessary context
         │
         ▼
┌─────────────────┐
│ LLM Provider    │  ← Process & return result
│ (Kimi/DeepSeek) │
└─────────────────┘
```

---

## Security Checklist

### Initial Setup

- [ ] Enable DM Pairing
- [ ] Set up Sandbox Mode
- [ ] Use environment variables for API keys
- [ ] Set file permissions: `chmod 700 ~/.openclaw`
- [ ] Run `openclaw doctor` to verify

### LLM Provider Setup

- [ ] Set monthly spending limit ($20 recommended)
- [ ] Enable email alerts for spending
- [ ] Save emergency contact for provider support
- [ ] Test with small requests first

### Regular Maintenance

- [ ] Run `openclaw doctor` weekly
- [ ] Check LLM usage monthly
- [ ] Review approved senders quarterly
- [ ] Update OpenClaw when new versions release

### For VPS/Cloud Hosting

- [ ] Use SSH key authentication (no passwords)
- [ ] Set up firewall (UFW on Ubuntu)
- [ ] Enable fail2ban for brute force protection
- [ ] Never expose dashboard port to public internet
- [ ] Use Tailscale or VPN for remote access

---

## Compliance Considerations for Malaysia & Singapore

### PDPA (Personal Data Protection Act)

**Singapore PDPA Compliance:**
- OpenClaw processes data locally (you are the data controller)
- No third-party data sharing beyond your chosen LLM
- You control data retention (delete `~/.openclaw/memory/` anytime)

**Malaysia PDPA Compliance:**
- Same as Singapore - local processing
- Document your LLM provider choice for compliance records
- Ensure LLM provider has appropriate certifications

### Recommended LLM Providers for Compliance

| Provider | Data Location | Certifications |
|----------|---------------|----------------|
| **Claude (Anthropic)** | US (AWS) | SOC 2 Type II |
| **Kimi (Moonshot)** | China | Check with provider |
| **DeepSeek** | China | Check with provider |

**Recommendation**: For sensitive business data, use Claude (Anthropic) which has stronger compliance certifications.

---

## Red Flags to Watch For

### NEVER Do This

1. ❌ Share your `~/.openclaw/` folder publicly
2. ❌ Commit API keys to GitHub
3. ❌ Disable DM Pairing without understanding risks
4. ❌ Give OpenClaw access to sensitive directories unnecessarily
5. ❌ Ignore spending alerts from LLM providers

### Safe Practices

1. ✅ Start with Sandbox Mode enabled
2. ✅ Set spending limits at LLM provider level
3. ✅ Use strong passwords for LLM provider accounts
4. ✅ Enable 2FA on LLM provider accounts
5. ✅ Run `openclaw doctor` regularly

---

## What If Something Goes Wrong?

### API Key Leaked?

1. **Revoke immediately** at LLM provider dashboard
2. Generate new key
3. Update `.env` file
4. Restart OpenClaw
5. Check billing for unauthorized usage

### Unusual Spending?

1. **Check LLM provider dashboard** for recent requests
2. Review approved senders in OpenClaw
3. Disable OpenClaw temporarily: `openclaw stop`
4. Contact LLM provider support
5. Request refund if fraud detected

### Unauthorized Access?

1. **Stop OpenClaw**: `openclaw stop`
2. Review logs: `cat ~/.openclaw/logs/gateway.log`
3. Change all passwords and API keys
4. Re-enable DM Pairing
5. Run `openclaw doctor`

---

## Comparison with Other AI Tools

| Tool | Data Location | Open Source | Cost |
|------|---------------|-------------|------|
| **OpenClaw** | Your machine | ✅ Yes | $5-25/mo |
| **ChatGPT** | OpenAI servers | ❌ No | $20/mo |
| **Claude** | Anthropic servers | ❌ No | $20/mo |
| **GitHub Copilot** | GitHub servers | ❌ No | $10/mo |

**OpenClaw's advantage**: You control where your data goes.

---

## Additional Resources

- [OpenClaw Security Documentation](https://docs.openclaw.ai/security)
- [Anthropic Security](https://www.anthropic.com/security)
- [Singapore PDPA Guidelines](https://www.pdpc.gov.sg/)
- [Malaysia PDPA Overview](https://www.pdp.gov.my/)

---

## Questions?

See our [FAQ](FAQ.md) or join the [OpenClaw Discord community](https://discord.gg/openclaw).

---

**Ready to install securely? → [Prerequisites Guide](guides/01-prerequisites.md)**
