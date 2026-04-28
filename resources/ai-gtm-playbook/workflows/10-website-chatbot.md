# 10. Website AI Chatbot Setup

**Funnel Stage**: INTEREST
**Time Saved**: 5–15 hours/month in manual lead qualification
**Tools**: Tidio / Intercom / Landbot / Claude API (for custom builds)
**Difficulty**: Intermediate

---

## What This Workflow Does

A website chatbot qualifies incoming visitors 24/7 — answering common questions, identifying decision-makers vs. researchers, capturing contact details, and routing hot leads to a booking link or WhatsApp. Instead of losing visitors who won't fill out a contact form, the chatbot starts a conversation immediately. This workflow covers both the chatbot configuration logic AND the AI-generated script/FAQ content that powers it.

---

## The Prompt Template

Use this prompt to generate your chatbot's full conversation script, FAQ answers, and qualification logic — then paste the outputs into your chatbot tool of choice.

```
You are a B2B sales assistant for [COMPANY NAME]. I need you to create a complete website chatbot script and FAQ knowledge base.

COMPANY DETAILS:
- Company name: [INSERT]
- What we do (one sentence): [INSERT]
- Primary service/product: [INSERT]
- Target customer: [INSERT: e.g., SME owners in Malaysia with 20-200 staff]
- Average deal size: [INSERT: e.g., RM 15,000–50,000]
- Main competitors: [INSERT]
- Top 3 reasons customers choose us: [INSERT]
- CTA we want visitors to take: [INSERT: e.g., book a free demo / WhatsApp us / download a guide]
- Sales team availability: [INSERT: e.g., Mon–Fri, 9am–6pm MYT]

Please generate:

---

## PART 1: WELCOME MESSAGE & OPENING FLOW

Write a warm, professional opening message (2-3 sentences max) that:
- Acknowledges the visitor
- States one key benefit
- Asks the visitor a qualifying question to start the conversation

Then write a branching menu with 4 options:
1. I want to learn about [SERVICE]
2. I'd like to see pricing
3. I want to book a demo / consultation
4. Something else

---

## PART 2: QUALIFICATION FLOW

For visitors who select option 1 or 2, create a 3-question qualification sequence:
- Question 1: Company size (to gauge fit and deal size)
- Question 2: Current situation / pain point (open-ended)
- Question 3: Timeline (to gauge urgency)

After the 3 questions, write two responses:
- HOT LEAD response (company is right size, has clear pain, wants to move in < 3 months) — push to book a call
- NURTURE response (smaller company or longer timeline) — offer a free resource download and email capture

---

## PART 3: FAQ ANSWERS (for the chatbot knowledge base)

Write clear, helpful answers (2–4 sentences each) to these 10 common questions:
1. What does [COMPANY NAME] do?
2. How is [COMPANY NAME] different from [COMPETITOR]?
3. How much does it cost?
4. How long does it take to get started?
5. Do you work with small businesses?
6. Can I see a case study or example?
7. Is there a free trial or demo available?
8. What industries do you serve?
9. How do I contact a real person?
10. What happens after I submit my details?

---

## PART 4: OUT-OF-HOURS MESSAGE

Write a message for when the sales team is offline (after 6pm or weekends) that:
- Acknowledges the timing
- Captures their name, email, and enquiry
- Sets expectation for response time
- Offers WhatsApp as an alternative

---

Write in a warm, professional tone. Do not sound robotic. Use short sentences. If relevant, acknowledge the Malaysian business context.
```

---

## How to Use It

1. Fill in the COMPANY DETAILS block and run the prompt in Claude.
2. Use the outputs to configure your chatbot tool:
   - **Tidio**: Use the "Flows" builder — map each branch of the conversation script to a flow step. Paste FAQ answers into the Knowledge Base section.
   - **Landbot**: Build the conversation as a bot flow using the "Buttons" and "Question" blocks. Connect to WhatsApp easily.
   - **Intercom**: Use the "Fin AI" agent — paste FAQ answers as Help Centre articles, and build the opening flow in the Workflows editor.
3. Connect your chatbot to your CRM (HubSpot/Pipedrive) to auto-create contacts when leads are captured.
4. Set up a WhatsApp notification to your phone or sales team when a HOT LEAD is qualified (most chatbot tools support this via Zapier/Make.com).
5. Review chatbot transcripts weekly for the first month — add any new FAQ answers that keep coming up.

---

## Example Input

```
COMPANY NAME: Syarikat Automasi Visiontech Sdn Bhd
WHAT WE DO: We help Malaysian manufacturers automate their production line reporting using IoT sensors and a simple dashboard
PRIMARY SERVICE: IoT factory monitoring system (hardware + software subscription)
TARGET CUSTOMER: Operations Directors and Factory Managers at Tier 1 and Tier 2 automotive parts manufacturers in Shah Alam and Nilai
AVERAGE DEAL SIZE: RM 40,000–120,000 first year
MAIN COMPETITORS: Manual Excel reporting, basic SCADA systems, Singapore-based vendors with high implementation costs
TOP 3 REASONS CUSTOMERS CHOOSE US:
1. Local team — we install and train on-site in Bahasa Malaysia or English
2. No expensive custom development — plug-and-play sensors + ready dashboard
3. ROI visible within 30 days or we refund the setup fee
CTA: Book a free 45-minute on-site assessment
SALES TEAM AVAILABILITY: Monday–Friday, 8:30am–5:30pm MYT
```

---

## Example Output

**Welcome message:**
> "Hi! Welcome to Visiontech. We help manufacturers in Shah Alam and Nilai eliminate manual production reporting — most clients see live factory data within 2 weeks. Quick question: what brings you here today?"
>
> [Learn about our system] [See pricing] [Book a free on-site assessment] [Something else]

**FAQ Answer — "How is Visiontech different from competitors?":**
> "Unlike Singapore-based vendors, our team is based locally and conducts all installations and training in-person. We don't charge for custom development — our plug-and-play sensors connect to your existing machines without an IT project. And our pricing is transparent, with no hidden integration fees."

**HOT LEAD response:**
> "It sounds like you're a great fit for what we do. Our next step is a free 45-minute on-site assessment where our engineer visits your facility, maps your current reporting workflow, and gives you a custom proposal. There's no obligation and no sales pressure. Want to pick a time this week? [Book here]"

---

## Malaysia-Specific Tips

- **WhatsApp is non-negotiable**: Malaysian SME buyers strongly prefer WhatsApp over email for first contact. Configure your chatbot to offer "Chat with us on WhatsApp" as an option — Tidio and Landbot both support WhatsApp Business API integration.
- **Language**: Set your default chatbot language to English but include a "Boleh berbahasa Melayu" option for GLC-adjacent buyers or government-linked companies.
- **Trust signals in chatbot**: Malaysian buyers are cautious about new vendors. Have the chatbot proactively mention your SSM registration number or industry certifications (SIRIM, MPC, etc.) when asked about credibility.
- **Tidio is the best starting point**: It has a free plan, is easy to set up without a developer, and integrates with WhatsApp Business. Available and widely used in Malaysia.
- **PDPA compliance**: Your chatbot must include a consent checkbox before capturing any personal data. Add: "By submitting your details, you agree to our Privacy Policy in accordance with Malaysia's PDPA 2010."
- **Response time expectations**: Malaysian buyers expect same-day responses during business hours. Set the out-of-hours message to promise a response by "10am the next business day" — not just "soon."

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Tidio | Free / USD 29/mo | Easiest setup, good WhatsApp integration |
| Landbot | Free / USD 40/mo | Highly visual flow builder, great for WhatsApp |
| Intercom (Fin AI) | USD 39/mo+ | Best for companies with large existing support volume |
| Freshchat | Free / USD 15/mo | Good value for SMEs, regional support |
| Claude API (custom) | Pay per use | Build a fully custom chatbot on your own site |
| Zapier / Make.com | Free / USD 9/mo | Connect chatbot lead capture to CRM |

---

## Expected Results

- **Time saved**: 5–15 hours/month in manual enquiry handling and lead qualification
- **Lead capture rate**: Chatbots typically capture 3–5x more leads than contact forms alone (visitors who wouldn't fill out a form will chat)
- **After-hours coverage**: Captures leads 24/7 — particularly valuable for leads browsing outside 9–5 MYT
- **ROI estimate**: If you close 1 additional deal per month from chatbot-captured leads at an average deal size of RM 30,000, the chatbot pays for itself 750x over
- **Quality vs manual**: AI-generated FAQ content is typically ready to use with minimal editing — update quarterly as your offerings change
