# Payment Gateway Comparison (SEA)

**Purpose**: Choose the right payment gateway for e-commerce/SaaS in Southeast Asia
**Time to Complete**: 30-60 minutes
**Use Case**: E-commerce, SaaS, marketplaces accepting online payments in SG/MY/ID/TH/PH/VN
**Output**: Payment gateway decision with implementation plan

---

## Quick Decision Matrix

| Gateway | Best For | Countries | Transaction Fee | Our Rating |
|---------|----------|-----------|-----------------|------------|
| **Stripe** | Global SaaS, subscriptions | SG, MY, TH | 3.4% + $0.50 | ⭐⭐⭐⭐⭐ |
| **Xendit** | Indonesia-first businesses | ID (also PH, MY) | 2.9% + $0.30 | ⭐⭐⭐⭐⭐ |
| **2C2P** | Multi-country SEA presence | All 6 countries | 2.5-3.5% | ⭐⭐⭐⭐ |
| **Midtrans** | Indonesia e-commerce | ID only | 2.9% | ⭐⭐⭐⭐ |
| **PayMongo** | Philippines-focused | PH only | 3.5% + ₱15 | ⭐⭐⭐⭐ |
| **Omise** | Thailand, Japan | TH, JP, SG | 3.65% | ⭐⭐⭐⭐ |

---

## Detailed Comparison

### Stripe

**Best for**: Global SaaS companies with subscriptions, international merchants

**Coverage**:
- ✅ Singapore (full support)
- ✅ Malaysia (full support)
- ✅ Thailand (full support)
- ❌ Indonesia (limited, no local payment methods)
- ❌ Philippines (limited)
- ❌ Vietnam (not supported)

**Pricing**:
- **Singapore**: 3.4% + $0.50 per transaction
- **Malaysia**: 3.4% + MYR 2
- **Thailand**: 3.65% + THB 11
- No monthly fee, no setup fee

**Payment Methods**:
- Credit/debit cards (Visa, Mastercard, Amex)
- Apple Pay, Google Pay
- GrabPay (SG, MY only)
- PayNow (SG)
- FPX (MY)
- PromptPay (TH)
- Bank transfers (limited)

**Pros**:
- ✅ Best developer experience (excellent API, docs)
- ✅ Global reach (47 countries)
- ✅ Subscription billing (built-in recurring payments)
- ✅ Strong fraud prevention (Radar)
- ✅ Fast payouts (2-7 days to bank)
- ✅ No monthly fees (pay-as-you-go)

**Cons**:
- ❌ Limited Indonesia support (no GoPay, OVO, Dana)
- ❌ No Philippines local methods (GCash, PayMaya)
- ❌ No Vietnam support at all
- ❌ Higher fees than regional players (3.4% vs 2.9%)
- ❌ Strict KYC (business verification takes 1-3 days)

**When to choose**:
- You're a SaaS company with global customers
- You need subscription billing (monthly/annual)
- You're in Singapore, Malaysia, or Thailand
- You want the best developer experience
- You're okay paying premium for quality

**Implementation time**: 1-2 weeks

---

### Xendit

**Best for**: Indonesia-first businesses, startups in ID/PH/MY

**Coverage**:
- ✅✅ Indonesia (strongest coverage - all local methods)
- ✅ Philippines
- ✅ Malaysia
- ❌ Singapore, Thailand, Vietnam (not supported)

**Pricing**:
- **Indonesia**: 2.9% + IDR 2,000 per transaction
- **Philippines**: 3.5% + ₱15
- **Malaysia**: 2.9% + MYR 2
- No monthly fee, no setup fee

**Payment Methods (Indonesia)**:
- Credit/debit cards
- **GoPay, OVO, Dana, LinkAja** (e-wallets - critical for Indonesia)
- **Bank transfers** (BCA, Mandiri, BNI, BRI, Permata)
- **Alfamart, Indomaret** (over-the-counter payments)
- **QRIS** (Indonesia's QR code standard)
- **Kredivo, Akulaku** (buy now, pay later)

**Pros**:
- ✅ Best for Indonesia (all local payment methods)
- ✅ Lower fees than Stripe (2.9% vs 3.4%)
- ✅ Strong SEA focus (understands local needs)
- ✅ Excellent for e-commerce (one-time payments)
- ✅ Fast integration (5-7 days)
- ✅ Good dashboard (easy to use)

**Cons**:
- ❌ Limited subscription billing (basic compared to Stripe)
- ❌ Only 3 countries (ID, PH, MY)
- ❌ No Singapore, Thailand support
- ❌ Developer docs weaker than Stripe
- ❌ Payouts slower (3-7 days in Indonesia)

**When to choose**:
- You're selling in Indonesia (must-have for e-wallets)
- You need local payment methods (bank transfer, e-wallets, QRIS)
- You're okay with limited geographic coverage
- You want lower fees (2.9% vs 3.4%)

**Implementation time**: 1-2 weeks

---

### 2C2P

**Best for**: Pan-SEA businesses needing coverage across all 6 countries

**Coverage**:
- ✅ All 6 SEA countries (SG, MY, ID, TH, PH, VN)
- ✅ Also Hong Kong, China, Japan, India

**Pricing**:
- **Singapore**: 2.5-3.5% per transaction (negotiable)
- **Other countries**: 2.5-3.5% (varies by volume)
- Setup fee: $500-1,000 (waived for high volume)
- Monthly fee: $50-200 (waived for high volume)

**Payment Methods**:
- Credit/debit cards (all countries)
- E-wallets (GrabPay, TrueMoney, GCash, Momo, etc.)
- Bank transfers (all countries)
- Over-the-counter (7-Eleven, convenience stores)
- Buy now, pay later (Atome, Hoolah)

**Pros**:
- ✅ Widest coverage (all 6 SEA countries)
- ✅ Enterprise-grade (used by Lazada, Grab, AirAsia)
- ✅ Strong in Thailand (local presence)
- ✅ Good for high volume (negotiable rates)
- ✅ Multi-currency settlement

**Cons**:
- ❌ Setup fee + monthly fee (expensive for startups)
- ❌ Enterprise sales process (2-4 weeks to sign up)
- ❌ Developer experience weaker than Stripe
- ❌ Requires negotiation (no transparent pricing)
- ❌ KYC process longer (1-2 weeks)

**When to choose**:
- You need coverage across all 6 SEA countries
- You're doing high volume (>$500K/month)
- You're an established business (not early-stage startup)
- You need an enterprise SLA

**Implementation time**: 3-4 weeks

---

### Midtrans (by Gojek)

**Best for**: Indonesia e-commerce, high-volume merchants

**Coverage**:
- ✅✅ Indonesia only

**Pricing**:
- **Indonesia**: 2.9% per transaction
- No setup fee, no monthly fee
- Volume discounts available (>$100K/month)

**Payment Methods**:
- Credit/debit cards
- **GoPay** (deeply integrated - Gojek ecosystem)
- **All major e-wallets** (OVO, Dana, LinkAja, ShopeePay)
- Bank transfers (BCA, Mandiri, BNI, BRI, Permata)
- Alfamart, Indomaret
- QRIS
- **Kredivo, Akulaku** (BNPL)

**Pros**:
- ✅ Best GoPay integration (owned by Gojek)
- ✅ Lowest fees in Indonesia (2.9%)
- ✅ Trusted brand (100M+ Gojek users)
- ✅ Fast payouts (2-3 days)
- ✅ Excellent dashboard
- ✅ Strong for e-commerce

**Cons**:
- ❌ Indonesia only (no other countries)
- ❌ No subscription billing
- ❌ Developer docs in Bahasa (English available but less detailed)
- ❌ KYC requires Indonesian business entity
- ❌ Customer support mostly in Bahasa

**When to choose**:
- You're 100% focused on Indonesia
- You need GoPay (Gojek's 100M users)
- You want the lowest fees (2.9%)
- You're okay with single-country focus

**Implementation time**: 1-2 weeks

---

### PayMongo

**Best for**: Philippines startups and SMBs

**Coverage**:
- ✅✅ Philippines only

**Pricing**:
- **Philippines**: 3.5% + ₱15 per transaction
- No setup fee, no monthly fee

**Payment Methods**:
- Credit/debit cards
- **GCash, PayMaya** (most popular in Philippines)
- **GrabPay** (Philippines)
- Bank transfers (BPI, BDO, UnionBank)
- Over-the-counter (7-Eleven, Cebuana)

**Pros**:
- ✅ Best for Philippines (all local methods)
- ✅ Easiest setup (1-day KYC approval)
- ✅ Great developer experience (inspired by Stripe)
- ✅ Subscription billing (good for SaaS)
- ✅ Strong local support (PH-based team)

**Cons**:
- ❌ Philippines only (no other countries)
- ❌ Higher fees (3.5% vs 2.9%)
- ❌ Newer company (less proven at scale)
- ❌ Limited fraud tools (compared to Stripe)

**When to choose**:
- You're focused on Philippines market
- You need GCash, PayMaya (90%+ of e-wallet users)
- You want fast setup (1 day vs 1 week)
- You want Stripe-like developer experience in PH

**Implementation time**: 3-5 days

---

### Omise

**Best for**: Thailand and Japan, SaaS companies

**Coverage**:
- ✅ Thailand (strongest)
- ✅ Japan
- ✅ Singapore (limited)

**Pricing**:
- **Thailand**: 3.65% per transaction
- **Japan**: 3.6%
- **Singapore**: 3.65%
- No setup fee, no monthly fee

**Payment Methods**:
- Credit/debit cards
- **TrueMoney, Rabbit LINE Pay** (Thailand e-wallets)
- **PromptPay** (Thailand bank transfer)
- Bank transfers
- Installment payments (Thailand)

**Pros**:
- ✅ Best for Thailand (all local methods)
- ✅ Subscription billing (Stripe-like)
- ✅ Good developer experience
- ✅ Multi-currency (THB, JPY, SGD, USD)
- ✅ Strong fraud prevention

**Cons**:
- ❌ Limited to TH, JP, SG (no MY, ID, PH, VN)
- ❌ Higher fees (3.65% vs 2.9%)
- ❌ Smaller company (acquired by Opn, formerly known as Omise)
- ❌ Limited compared to Stripe globally

**When to choose**:
- You're focused on Thailand market
- You need Thai e-wallets (TrueMoney, Rabbit LINE Pay)
- You want subscription billing in Thailand
- You also need Japan support

**Implementation time**: 1-2 weeks

---

## Side-by-Side Feature Comparison

| Feature | Stripe | Xendit | 2C2P | Midtrans | PayMongo | Omise |
|---------|--------|--------|------|----------|----------|-------|
| **Countries** | SG, MY, TH | ID, PH, MY | All 6 | ID | PH | TH, JP, SG |
| **Fees** | 3.4% | 2.9% | 2.5-3.5% | 2.9% | 3.5% | 3.65% |
| **Setup Fee** | $0 | $0 | $500-1K | $0 | $0 | $0 |
| **Monthly Fee** | $0 | $0 | $50-200 | $0 | $0 | $0 |
| **Subscriptions** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **E-wallets** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Bank Transfer** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Dev Experience** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Dashboard** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Fraud Tools** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Payout Speed** | 2-7 days | 3-7 days | 3-7 days | 2-3 days | 3-5 days | 3-7 days |

---

## Decision Framework

### Step 1: Which Countries Do You Need?

| Your Markets | Recommended Gateway |
|--------------|---------------------|
| **Singapore only** | Stripe |
| **Malaysia only** | Stripe or Xendit |
| **Thailand only** | Stripe or Omise |
| **Indonesia only** | Xendit or Midtrans |
| **Philippines only** | PayMongo |
| **Vietnam only** | 2C2P (only option) |
| **All 6 SEA countries** | 2C2P or Stripe + Xendit (combo) |
| **SG + MY + TH** | Stripe |
| **ID + PH + MY** | Xendit |

---

### Step 2: What Payment Methods Do You Need?

**Credit cards only**:
→ Stripe (best experience)

**E-wallets critical** (GoPay, GCash, TrueMoney):
- Indonesia → Xendit or Midtrans
- Philippines → PayMongo
- Thailand → Omise or 2C2P
- Multi-country → 2C2P

**Bank transfers critical**:
→ Xendit, Midtrans, or 2C2P (all strong)

**Over-the-counter** (7-Eleven, Alfamart):
→ 2C2P, Xendit, or Midtrans

---

### Step 3: SaaS or E-commerce?

**SaaS (subscriptions, recurring billing)**:
- Best: Stripe (gold standard)
- Good: PayMongo, Omise
- OK: Xendit (basic subscriptions)
- Limited: Midtrans, 2C2P

**E-commerce (one-time payments)**:
- All options work well
- Indonesia: Xendit or Midtrans
- Philippines: PayMongo
- Multi-country: 2C2P

---

### Step 4: What's Your Monthly Volume?

| Volume/Month | Recommendation |
|--------------|----------------|
| <$10K | Stripe or Xendit (no monthly fees) |
| $10K-100K | Stripe, Xendit, PayMongo, Omise |
| $100K-500K | All options (negotiate rates with 2C2P) |
| $500K+ | 2C2P (enterprise), or Stripe + volume discounts |

---

## Multi-Gateway Strategy

For businesses operating across SEA, consider using **multiple gateways**:

### Example: Pan-SEA SaaS Company

**Setup**:
- **Stripe**: Singapore, Malaysia, Thailand (3.4% fee)
- **Xendit**: Indonesia (2.9% fee + local e-wallets)
- **PayMongo**: Philippines (3.5% fee + GCash/PayMaya)
- **2C2P**: Vietnam (only option)

**Implementation**:
- Payment routing logic (detect customer country, route to correct gateway)
- Unified dashboard (aggregate payments from all gateways)
- Single reconciliation process

**Pros**:
- ✅ Best gateway for each market
- ✅ Lowest fees (use cheapest in each country)
- ✅ All local payment methods

**Cons**:
- ❌ More complexity (4 integrations vs 1)
- ❌ More reconciliation work
- ❌ More KYC (4 accounts to set up)

---

## Implementation Checklist

### Week 1: Account Setup

- [ ] Sign up for gateway account
- [ ] Submit KYC documents (business registration, ID, bank statement)
- [ ] Wait for approval (1-7 days depending on gateway)
- [ ] Receive API keys (test and live)

### Week 2: Integration

- [ ] Read API docs (Stripe docs are best, others vary)
- [ ] Set up test environment
- [ ] Integrate payment form (checkout page)
- [ ] Test payment flow (end-to-end)
- [ ] Test all payment methods (cards, e-wallets, bank transfer)

### Week 3: Testing

- [ ] Test successful payment
- [ ] Test failed payment
- [ ] Test refund flow
- [ ] Test webhooks (payment notifications)
- [ ] Test edge cases (declined cards, expired cards)

### Week 4: Go Live

- [ ] Switch to live API keys
- [ ] Test with real payment (small amount)
- [ ] Monitor for errors (first 24 hours)
- [ ] Set up dashboard alerts
- [ ] Train CS team on refunds

---

## Common Issues

### Issue 1: KYC Rejection

**Problem**: Gateway rejects your business registration
**Causes**:
- Missing documents
- Business address doesn't match
- High-risk industry (crypto, gambling, adult)

**Fix**:
- Re-submit with correct documents
- Use registered business address
- Provide additional docs (website screenshots, product demo)

---

### Issue 2: High Chargeback Rate

**Problem**: Gateway flags your account for high chargebacks (>1%)
**Causes**:
- Poor customer service (customers dispute instead of requesting refund)
- Vague product descriptions (customer doesn't recognize charge)
- Subscription without clear cancellation flow

**Fix**:
- Make refunds easy (don't force customers to chargeback)
- Use clear business name on credit card statement
- Send email confirmation immediately after charge
- Implement clear cancellation flow

---

### Issue 3: Slow Payouts

**Problem**: Money takes 7-14 days to reach your bank
**Typical timeline**:
- T+2 to T+7 days (most gateways)
- Longer for first few payouts (risk management)

**Fix**:
- Choose gateway with fast payouts (Midtrans: 2-3 days)
- Get verified (complete KYC fully)
- Build transaction history (payouts speed up over time)

---

## FAQs

**Q: Can I use multiple payment gateways?**
A: Yes. Many businesses use Stripe for SG/MY/TH and Xendit for Indonesia.

**Q: Which has the lowest fees?**
A: Xendit and Midtrans (2.9%) are lowest. Stripe is highest (3.4%).

**Q: Do I need a local business entity?**
A:
- Stripe: No (can use foreign entity)
- Xendit Indonesia: Yes (need PT for full features)
- 2C2P: Depends (some countries require local entity)
- PayMongo: Yes (need Philippines SEC registration)

**Q: How long does KYC take?**
A:
- Stripe: 1-3 days
- Xendit: 3-7 days
- PayMongo: 1 day (fastest)
- 2C2P: 1-2 weeks
- Midtrans: 3-7 days

**Q: What happens if a payment fails?**
A: Gateway returns error code. Common failures:
- Insufficient funds
- Expired card
- Incorrect CVV
- Fraud detection (card blocked)

**Q: How do refunds work?**
A: Initiate refund via dashboard or API. Money returns to customer in 5-10 business days. You're charged the original fee (no refund of gateway fees).

---

## Next Steps

1. **Identify your markets** (which countries?)
2. **Choose 1-2 gateways** (use decision framework)
3. **Sign up and submit KYC** (Week 1)
4. **Integrate and test** (Week 2-3)
5. **Go live** (Week 4)

---

**Template by**: [MyEO AI](https://myeo.ai)
**Last Updated**: 2026-02-08
