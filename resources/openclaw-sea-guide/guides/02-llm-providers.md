# LLM Provider Setup Guide

**Choose and configure your AI brain for OpenClaw**

---

## Overview

OpenClaw needs an LLM (Large Language Model) to process your requests. Think of it as the "brain" that understands and responds to your messages.

This guide covers setup for:
1. **Kimi K2** (Recommended - Best balance)
2. **DeepSeek** (Cheapest option)
3. **Qwen Coder** (Best for code)
4. **Claude** (Premium quality)

---

## Quick Comparison

| Provider | Monthly Cost | Best For | Setup Difficulty |
|----------|--------------|----------|------------------|
| **Kimi K2** | $10-20 | General business use | Easy |
| **DeepSeek** | $3-8 | Budget-conscious users | Easy |
| **Qwen Coder** | $1-5 | Code/technical tasks | Medium |
| **Claude** | $20 | Premium quality, compliance | Easy |

---

## Option 1: Kimi K2 (Recommended)

### Why Kimi K2?

- **256K context window** - Can process very large documents
- **Affordable** - $10-20/month typical usage
- **Strong capabilities** - Good at general business tasks
- **Cache savings** - 75% discount on repeated queries

### Step-by-Step Setup

#### 1. Create Account

1. Visit: https://platform.moonshot.ai
2. Click "Sign Up" (top right)
3. Choose sign-up method:
   - Email
   - Phone number
   - WeChat (if you have it)
4. Complete verification

#### 2. Add Initial Credit

Minimum $1 to activate:

1. Go to: Dashboard → Billing
2. Click "Recharge"
3. Select amount: **$5 recommended**
   - You'll get a $5 bonus voucher when you reach $5
   - Effectively $10 for $5
4. Payment methods:
   - Credit card (Visa, Mastercard)
   - Alipay
   - WeChat Pay
5. Complete payment

#### 3. Create API Key

1. Go to: Dashboard → API Keys
2. Click "Create New API Key"
3. Name it: "OpenClaw" (for reference)
4. **Copy the key immediately** (shown only once)
5. Save it securely:
   ```
   KIMI_API_KEY=k-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```

#### 4. Set Spending Limit (Important!)

1. Go to: Dashboard → Settings
2. Find: "Spending Limit"
3. Set to: **$20/month** (recommended for business use)
4. Enable: "Email alerts at 80% usage"
5. Save settings

#### 5. Test API Key

Run this in Terminal:
```bash
curl -X POST "https://api.moonshot.ai/v1/chat/completions" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kimi-k2",
    "messages": [{"role": "user", "content": "Say hello"}]
  }'
```

**Expected response**: JSON with "Hello" message

**Error?** Check:
- API key copied correctly
- Account has credit
- No typos in command

### OpenClaw Configuration

Add to `~/.openclaw/openclaw.json`:

```json
{
  "agent": {
    "model": "kimi/kimi-k2"
  },
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}"
    }
  }
}
```

Set environment variable:
```bash
export KIMI_API_KEY="k-xxxxxxxxxxxxxxxxxxxxxxxx"
```

**Done!** Kimi K2 is ready to use.

---

## Option 2: DeepSeek (Cheapest)

### Why DeepSeek?

- **Extremely affordable** - $3-8/month typical usage
- **Free tier** - 5M tokens to start
- **Good quality** - Excellent for coding tasks
- **90%+ cheaper** than Claude/GPT-4

### Step-by-Step Setup

#### 1. Create Account

1. Visit: https://platform.deepseek.com
2. Click "Sign Up"
3. Enter email address
4. Verify email (check spam folder)
5. Set password
6. Complete registration

#### 2. Get Free Credits

New accounts receive:
- **5 million free tokens**
- No credit card required
- Use to test before paying

#### 3. Create API Key

1. Log in to: https://platform.deepseek.com
2. Go to: API Keys (left sidebar)
3. Click "Create API Key"
4. Name: "OpenClaw"
5. **Copy key immediately**
6. Save securely:
   ```
   DEEPSEEK_API_KEY=your-deepseek-key-here
   ```

#### 4. (Optional) Add Credit

After free tier:

1. Go to: Billing
2. Click "Recharge"
3. Minimum: $10
4. Payment methods:
   - Credit card
   - Alipay
5. Complete payment

#### 5. Set Rate Limits

1. Go to: Settings → Rate Limits
2. Set: "Maximum tokens per request: 100,000"
3. Set: "Daily spending limit: $2"
4. Enable alerts
5. Save

#### 6. Test API Key

```bash
curl -X POST "https://api.deepseek.com/v1/chat/completions" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-chat",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

**Expected**: JSON response with "Hello" message

### OpenClaw Configuration

Add to `~/.openclaw/openclaw.json`:

```json
{
  "agent": {
    "model": "deepseek/deepseek-chat"
  },
  "llm": {
    "deepseek": {
      "apiKey": "${DEEPSEEK_API_KEY}"
    }
  }
}
```

Set environment variable:
```bash
export DEEPSEEK_API_KEY="your-deepseek-api-key-here"
```

**Done!** DeepSeek is ready.

---

## Option 3: Qwen 2.5 Coder (Best for Code)

### Why Qwen Coder?

- **Ultra-cheap** - $0.03 per 1M tokens input
- **Specialized** - Built for code generation
- **Alibaba Cloud** - Strong presence in SEA
- **Batch discounts** - 50% off for batch processing

### Step-by-Step Setup

#### 1. Create Alibaba Cloud Account

1. Visit: https://www.alibabacloud.com
2. Click "Free Account"
3. Select "Singapore" as region
4. Complete registration:
   - Email
   - Phone number (Singapore/Malaysia)
   - Verification
5. Add payment method (credit card)

#### 2. Access Model Studio

1. Log in to Alibaba Cloud
2. Go to: Products → AI & Machine Learning → Model Studio
3. Click "Activate Service"
4. Accept terms

#### 3. Create API Key

1. In Model Studio, go to: API Management
2. Click "Create API Key"
3. Name: "OpenClaw"
4. **Copy and save key**:
   ```
   QWEN_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```

#### 4. Set Up Billing Alerts

1. Go to: Billing Management
2. Set up: "Alert threshold: $10"
3. Enable: Email notifications
4. Save

#### 5. Test API Key

```bash
curl -X POST "https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen2.5-coder",
    "input": {
      "messages": [{"role": "user", "content": "Write a Python hello world"}]
    }
  }'
```

### OpenClaw Configuration

Add to `~/.openclaw/openclaw.json`:

```json
{
  "agent": {
    "model": "qwen/qwen2.5-coder"
  },
  "llm": {
    "qwen": {
      "apiKey": "${QWEN_API_KEY}"
    }
  }
}
```

Set environment variable:
```bash
export QWEN_API_KEY="xxxxxxxxxxxxxxxxxxxxxxxx"
```

**Note**: Qwen configuration may require additional setup. Check [official docs](https://help.aliyun.com/zh/model-studio) if issues arise.

---

## Option 4: Claude (Premium)

### Why Claude?

- **Best quality** - Highest reasoning capability
- **SOC 2 certified** - Best for compliance
- **Use existing subscription** - If you have Claude Pro
- **OAuth support** - No API keys needed

### Method 1: OAuth (Recommended)

**If you have Claude Pro/Max subscription:**

1. OpenClaw will prompt for OAuth during setup
2. You'll authorize via browser
3. No API key needed
4. Uses your existing subscription

**Configuration**:
```json
{
  "agent": {
    "model": "anthropic/claude-opus-4-5"
  },
  "llm": {
    "anthropic": {
      "auth": "oauth"
    }
  }
}
```

### Method 2: API Key

**If buying API access separately:**

#### 1. Create Anthropic Account

1. Visit: https://console.anthropic.com
2. Sign up
3. Verify email

#### 2. Add Credits

1. Go to: Billing
2. Add credit: **$20 minimum**
3. Payment method: Credit card

#### 3. Create API Key

1. Go to: API Keys
2. Click "Create Key"
3. Name: "OpenClaw"
4. **Copy and save**:
   ```
   ANTHROPIC_API_KEY=your-anthropic-key-here
   ```

#### 4. Set Usage Limits

1. Go to: Settings → Usage Limits
2. Set: "Monthly limit: $50"
3. Enable: Email alerts at 80%
4. Save

#### 5. Test API Key

```bash
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: YOUR_API_KEY_HERE" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-5",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

### OpenClaw Configuration

```json
{
  "agent": {
    "model": "anthropic/claude-opus-4-5"
  },
  "llm": {
    "anthropic": {
      "apiKey": "${ANTHROPIC_API_KEY}"
    }
  }
}
```

Set environment variable:
```bash
export ANTHROPIC_API_KEY="your-anthropic-api-key-here"
```

---

## Using Multiple LLMs

You can configure multiple providers and switch between them:

### Configuration Example

```json
{
  "agent": {
    "model": "kimi/kimi-k2"  // Default
  },
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}"
    },
    "deepseek": {
      "apiKey": "${DEEPSEEK_API_KEY}"
    },
    "anthropic": {
      "apiKey": "${ANTHROPIC_API_KEY}"
    }
  }
}
```

### Switching Models

In OpenClaw dashboard or via message:
```
"Switch to DeepSeek for code tasks"
"Use Claude for this sensitive document"
```

---

## Security Best Practices

### 1. Never Hardcode API Keys

**Bad**:
```json
{
  "llm": {
    "kimi": {
      "apiKey": "k-1234567890abcdef"  // DON'T DO THIS
    }
  }
}
```

**Good**:
```json
{
  "llm": {
    "kimi": {
      "apiKey": "${KIMI_API_KEY}"  // References environment variable
    }
  }
}
```

### 2. Set Spending Limits

Every provider allows monthly caps. Set them!

### 3. Use Environment Variables

Add to `~/.bashrc` or `~/.zshrc`:
```bash
export KIMI_API_KEY="k-xxxxxxxxxxxxxxxx"
export DEEPSEEK_API_KEY="sk-xxxxxxxxxx"
export ANTHROPIC_API_KEY="your-anthropic-key-here"
```

Then: `source ~/.bashrc` or `source ~/.zshrc`

### 4. Rotate Keys Regularly

Every 3-6 months:
1. Create new API key
2. Update environment variables
3. Delete old key from provider dashboard

---

## Troubleshooting

### "Invalid API key"

**Check**:
- Key copied correctly (no extra spaces)
- Using correct key for correct provider
- Environment variable set properly

**Test**:
```bash
echo $KIMI_API_KEY
# Should show your key, not empty
```

### "Rate limit exceeded"

**Causes**:
- Sending too many requests too quickly
- Hit daily/hourly limit

**Solutions**:
- Wait for limit to reset
- Upgrade to higher tier
- Use different provider temporarily

### "Insufficient credits"

**Causes**:
- Account balance is $0
- Hit spending limit

**Solutions**:
- Add more credits
- Increase spending limit
- Check billing dashboard

---

## Cost Monitoring

### Weekly Checks

1. Log into LLM provider dashboard
2. Check: Usage → Last 7 days
3. Estimate monthly cost: Weekly × 4
4. Adjust if needed

### Set Up Alerts

All providers support email alerts:
- 50% of limit reached
- 80% of limit reached
- Daily usage summaries

**Enable these!** Prevents surprise bills.

---

## Next Steps

LLM provider configured! Now choose installation method:

**Local Mac Installation**:
→ [Install OpenClaw on Mac](03-local-mac.md)

**VPS Installation**:
→ [DigitalOcean Guide](05-digitalocean.md)
→ [Oracle Cloud Free Guide](04-oracle-cloud-free.md)
→ [Contabo Guide](06-contabo-vps.md)

---

## Quick Reference

### API Key Environment Variables

```bash
# Add to ~/.bashrc or ~/.zshrc
export KIMI_API_KEY="k-xxxxxxxx"
export DEEPSEEK_API_KEY="sk-xxxxxxxx"
export QWEN_API_KEY="xxxxxxxx"
export ANTHROPIC_API_KEY="your-anthropic-key-here"
```

### OpenClaw Configuration File Location

```
~/.openclaw/openclaw.json
```

### Test Commands

```bash
# Kimi
curl -X POST "https://api.moonshot.ai/v1/chat/completions" \
  -H "Authorization: Bearer $KIMI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"kimi-k2","messages":[{"role":"user","content":"Test"}]}'

# DeepSeek
curl -X POST "https://api.deepseek.com/v1/chat/completions" \
  -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"deepseek-chat","messages":[{"role":"user","content":"Test"}]}'

# Claude
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{"model":"claude-opus-4-5","max_tokens":1024,"messages":[{"role":"user","content":"Test"}]}'
```

---

**LLM configured! Ready to install OpenClaw → [Choose Installation Method](03-local-mac.md)**
