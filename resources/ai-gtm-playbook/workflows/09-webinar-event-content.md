# 09. Webinar & Event Content Generator

**Funnel Stage**: INTEREST
**Time Saved**: 6–10 hours per event
**Tools**: Claude + Gamma / Google Slides + Mailchimp / Instantly / Brevo
**Difficulty**: Intermediate

---

## What This Workflow Does

You provide the webinar topic, target audience, and 3–5 key talking points. AI generates a complete event content package: a structured script with speaker notes, a slide deck outline ready to drop into Gamma or Google Slides, a high-converting registration page copy block, and a 4-part email sequence (pre-event reminder series + post-event follow-up). This replaces a full day of content creation with about 30 minutes of prompting and editing.

---

## The Prompt Template

```
You are an expert B2B event marketer and copywriter. I am running a [FORMAT: webinar / workshop / roundtable / lunch-and-learn] for [COMPANY NAME].

EVENT DETAILS:
- Topic: [INSERT TOPIC]
- Target audience: [INSERT: e.g., HR Directors at manufacturing companies with 200-500 staff]
- Date and time: [INSERT]
- Duration: [INSERT: e.g., 60 minutes]
- Key talking points (3-5 bullets): [INSERT]
- Speaker name(s) and title(s): [INSERT]
- One big promise / outcome for attendees: [INSERT]
- CTA after the event: [INSERT: e.g., book a free 30-min strategy call]

Please generate ALL of the following:

---

## 1. WEBINAR SCRIPT (with speaker notes)
- Opening hook (first 60 seconds — must grab attention)
- Agenda slide talking points
- Body sections for each talking point (2-3 min each)
- Transition phrases between sections
- Q&A intro
- Closing CTA with urgency

---

## 2. SLIDE DECK OUTLINE
Format as: Slide Number | Slide Title | Key Visual Idea | Speaker Note (1-2 sentences)
Include: title slide, agenda, 3-5 content slides, social proof/case study slide, CTA slide

---

## 3. REGISTRATION PAGE COPY
- Headline (benefit-led, max 12 words)
- Sub-headline (who this is for + what they'll learn)
- 3 bullet points (what attendees will walk away with)
- Speaker bio (2-3 sentences, credibility-focused)
- Urgency element (e.g., limited spots, bonus for early registrants)
- Registration button text

---

## 4. EMAIL SEQUENCE (5 emails total)

Email 1 — Registration Confirmation (send immediately)
Email 2 — Value Teaser (send 5 days before)
Email 3 — Day-Before Reminder (send 24 hours before)
Email 4 — Day-Of Reminder (send 1 hour before)
Email 5 — Post-Event Follow-Up (send within 24 hours after)

For each email include: Subject line, Preview text, Full body copy, CTA

---

Write in a professional but conversational tone. Avoid jargon. Make the copy specific to the Malaysian/Southeast Asian business context where relevant.
```

---

## How to Use It

1. Fill in all fields in the EVENT DETAILS block — the more specific you are, the better the output.
2. Paste the full prompt into Claude (claude.ai or the API).
3. Copy the slide deck outline directly into Gamma (gamma.app) — paste as bullet points and let Gamma auto-generate the deck.
4. Copy the email sequence into Mailchimp, Brevo, or Instantly as a 5-step automation.
5. Copy the registration page copy into your event landing page (use Eventbrite, Peatix, or your website).
6. Review the script for brand voice — adjust 2–3 phrases to sound like you.

---

## Example Input

```
FORMAT: Webinar
COMPANY NAME: TalentEdge HR Solutions
TOPIC: "How to Reduce Staff Turnover by 40% Without Increasing Salary Budgets"
TARGET AUDIENCE: HR Directors and Managers at manufacturing companies in Shah Alam and Klang Valley with 200–800 employees
DATE AND TIME: Thursday, 24 April 2026, 11:00 AM – 12:00 PM MYT
DURATION: 60 minutes
KEY TALKING POINTS:
- Why salary alone doesn't retain Gen Z and Millennial workers in Malaysia
- The 3 hidden turnover drivers in manufacturing (shift scheduling, recognition gaps, career visibility)
- A 5-step retention framework used by 3 Klang Valley manufacturers
- How to build a RM0 recognition programme that actually works
- Tools to measure employee sentiment without annual surveys
SPEAKER: Priya Ramasamy, Chief People Officer, TalentEdge HR Solutions
ONE BIG PROMISE: Attendees will leave with a ready-to-implement retention action plan for their factory floor
CTA AFTER EVENT: Book a free 30-minute Retention Audit call
```

---

## Example Output

The AI produces a full ~2,500-word content package including:

**Script opening hook example:**
> "Show of hands — how many of you have lost a trained machine operator in the last 6 months, only to spend the next 3 months finding and training someone new? That cost your company somewhere between RM 15,000 and RM 40,000. And the worst part? Most of them didn't leave because of salary. They left because they felt invisible. Today I'm going to show you exactly how to fix that..."

**Slide 4 outline example:**
> Slide 4 | The 3 Hidden Turnover Drivers | Split image: shift schedule board, empty locker room, org chart | "Walk them through each driver with one real example — keep it under 3 minutes"

**Registration headline example:**
> "Cut Staff Turnover by 40% — Without Touching Your Salary Budget"

**Email 2 subject line example:**
> "The real reason your operators keep leaving (it's not what you think)"

---

## Malaysia-Specific Tips

- **Platform for registration**: Use Peatix (popular in Malaysia, free tier available) or simply a Google Form + Calendly combo. Eventbrite works but is less familiar to local SME audiences.
- **Timing**: Thursday 11 AM MYT is consistently the highest-open-rate slot for B2B webinars in Malaysia. Avoid Friday afternoons (Jumu'ah prayers) and Monday mornings.
- **Language mix**: If targeting both Malay and Chinese SME owners, consider bilingual subject lines (English primary, short BM phrase as trust signal). For corporate HR, English-only is fine.
- **WhatsApp reminder**: Add a WhatsApp message reminder step — Malaysian business audiences have significantly higher open rates on WhatsApp than email for event reminders.
- **Recording culture**: Always mention "the recording will be shared with all registrants" — this dramatically increases registration rates among busy KL professionals who worry about missing it live.
- **Zoom vs Teams**: Most Malaysian SMEs default to Zoom. If targeting MNCs or GLC-linked companies, offer a Microsoft Teams option.

---

## Recommended Tools

| Tool | Cost | Best For |
|------|------|----------|
| Claude (claude.ai) | Free / USD 20/mo Pro | Generating all copy |
| Gamma (gamma.app) | Free / USD 10/mo | Auto-generating slide deck from outline |
| Google Slides | Free | Manual slide creation with more control |
| Peatix | Free (5% ticket fee for paid events) | Registration page in Malaysia |
| Brevo (formerly Sendinblue) | Free up to 300 emails/day | Email automation sequences |
| Mailchimp | Free up to 500 contacts | Email sequences if you have a larger list |
| Zoom | Free (40-min limit) / USD 14.99/mo | Hosting the webinar |

---

## Expected Results

- **Time saved**: 6–10 hours per event (script: 3h, slides: 2h, registration copy: 1h, emails: 2h)
- **Quality vs manual**: AI-generated first draft is typically 75–80% final quality — you'll spend 30–60 minutes refining tone and adding real examples
- **ROI estimate**: If your time is worth RM 150/hour and you run 2 webinars/month, this workflow saves approximately RM 3,600–6,000/month in content creation time
- **Compounding benefit**: Once you have one strong template, reusing it for the next webinar takes under 15 minutes
