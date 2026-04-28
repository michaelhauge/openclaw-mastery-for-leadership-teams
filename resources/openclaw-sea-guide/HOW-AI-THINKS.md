# How AI Actually Thinks: LLMs Explained for Business Leaders

**Understanding how Large Language Models work - no technical background required**

---

## The Problem This Guide Solves

You're using OpenClaw. It works. Your WhatsApp bot summarizes emails, drafts proposals, and translates documents. But you have no idea:

- What an LLM actually IS
- Why it sometimes makes things up (hallucination)
- What "7B vs 70B parameters" means when choosing models
- Why you're paying per token
- Whether you're accidentally training the AI with your company data
- How to get better results from your prompts

**This guide explains how AI actually works under the hood - using business metaphors you already understand.**

If [MENTAL-MODEL.md](MENTAL-MODEL.md) explains "what is each component," this guide explains "how does AI actually think."

---

## Table of Contents

1. [The World's Most Well-Read Associate](#1-the-worlds-most-well-read-associate---what-an-llm-actually-is)
2. [Word by Word](#2-word-by-word---how-text-generation-actually-works)
3. [Why AI Makes Things Up](#3-why-ai-makes-things-up---hallucination-explained)
4. [Small Brain vs Big Brain](#4-small-brain-vs-big-brain---model-sizes-and-parameters)
5. [The Creativity Dial](#5-the-creativity-dial---temperature-and-sampling)
6. [Teaching the AI About Your Business](#6-teaching-the-ai-about-your-business---context-vs-fine-tuning-vs-rag)
7. [What Can AI See and Hear?](#7-what-can-ai-see-and-hear---multimodal-capabilities)
8. [Why Different Models for Different Jobs](#8-why-different-models-for-different-jobs---model-selection-guide)
9. [Am I Training the AI?](#9-am-i-training-the-ai---data-privacy-and-provider-policies)
10. [The AI Vocabulary Cheat Sheet](#10-the-ai-vocabulary-cheat-sheet---30-terms-decoded)

---

## 1. The World's Most Well-Read Associate - What an LLM Actually Is

### The Core Metaphor

Imagine you hire a research associate who has read:
- Every book ever published
- Every Wikipedia article in 100+ languages
- Millions of websites, news articles, and academic papers
- Billions of conversations and social media posts

But here's the catch: **they've never left the library.** They've never tasted food, felt pain, run a business, or experienced the real world. They can only pattern-match from what they've read.

**That's an LLM (Large Language Model).**

### Training vs. Inference - Two Completely Different Phases

| Phase | Business Equivalent | What Happens | Who Pays |
|-------|---------------------|--------------|----------|
| **Training** | Sending someone to university for 4 years | The AI company (Anthropic, Moonshot, DeepSeek) feeds billions of documents into the model. This costs millions of dollars and takes months. | **The AI company pays** (not you) |
| **Inference** | Hiring that graduate to answer your questions | YOU send a question, the trained model predicts an answer word-by-word, and sends it back. This takes seconds. | **YOU pay** (per token/word) |

**Critical insight**: When you use Claude, Kimi, or DeepSeek, you are NOT training the AI. The training already happened months ago. You're just **renting thinking time** from a pre-trained model.

**Analogy**: You don't pay to educate the lawyer — their law school education already happened. You pay them by the hour to apply that education to YOUR case.

---

## 2. Word by Word - How Text Generation Actually Works

### The Autocomplete Principle

You know how your phone keyboard suggests the next word?

```
You: "See you at the..."
Phone: [meeting] [office] [restaurant]
```

**LLMs work the exact same way, but 1000x more sophisticated.**

### The Step-by-Step Process

When you ask Claude: "Write an email to reject a vendor proposal politely"

Here's what actually happens:

```
Step 1: Predict word 1 → "Dear"
Step 2: Predict word 2 (given "Dear") → "Vendor"
Step 3: Predict word 3 (given "Dear Vendor") → "Team"
Step 4: Predict word 4 (given "Dear Vendor Team") → ","
...continues until complete email
```

**Each word is predicted based on:**
- All the words that came before it in THIS conversation
- Everything the model learned during training
- Probability calculations (what word is most likely to come next?)

### Why This Explains Streaming Responses

When you see text appearing word-by-word on your screen, that's not a visual effect. The AI genuinely generates one token at a time and sends it immediately. It doesn't "think of the whole answer first" — it's predicting each word as it goes.

**Implication**: The AI doesn't know how the sentence will end when it starts writing it. Just like a human speaker doesn't always know the last word of their sentence when they begin talking.

---

## 3. Why AI Makes Things Up - Hallucination Explained

### The Pattern-Matching Trap

Remember: The AI has never experienced reality. It only knows patterns from text.

**Real example from the Singapore accounting firm case study:**

**Prompt**: "What's the current GST rate in Singapore?"

**DeepSeek's response** (March 2024): "The GST rate in Singapore is 7%."

**Correct answer**: 8% (since Jan 2023), and scheduled to increase to 9% (Jan 2024).

**Why did it hallucinate?** The model was trained on data up to mid-2023, when 7% was correct. It pattern-matched "Singapore GST" → "7%" from millions of documents. It didn't CHECK — it predicted the most common historical answer.

### Hallucination is NOT Lying

| Human Lying | AI Hallucination |
|-------------|------------------|
| Knows the truth, intentionally deceives | Has no concept of truth, only pattern probabilities |
| Can be caught and confronted | Cannot "know" it's wrong unless corrected |
| Feels guilt (usually) | No self-awareness at all |

**Better metaphor**: An eager new employee who gives confident answers even when they should say "I don't know." They're not malicious — they're just pattern-matching from training and don't realize they're wrong.

### How to Detect Hallucinations

**High-risk hallucination scenarios**:
- Specific numbers (prices, dates, statistics) - AI often makes these up
- Rare or niche topics - Less training data = more guessing
- Recent events - Model training data has a cutoff date
- Proper names - AI might invent company names, people, products
- Citations - AI will fabricate academic papers or URLs

**Example of obvious hallucination**:

**Prompt**: "Who is the CEO of MyEO AI?"

**Claude's response**: "John Tan founded MyEO AI in 2018 and serves as CEO."

**Reality**: This is completely made up. Claude doesn't know, so it generated a plausible-sounding name and founding date.

### How to Reduce Hallucinations

| Strategy | Why It Works | Example |
|----------|--------------|---------|
| **Provide context** | AI can reference YOUR documents instead of guessing | Attach the contract PDF before asking questions about it |
| **Ask for sources** | Forces AI to cite where info came from | "List sources for each claim" |
| **Use better models** | Claude/GPT-4o hallucinate less than DeepSeek/Qwen | For critical tasks, pay for accuracy |
| **Break down complex questions** | Simpler questions = less room for creative guessing | Ask "List all clients" THEN "Which clients owe invoices" |
| **Verify critical claims** | Human review for anything important | ALWAYS verify numbers, regulations, client-facing content |

**Golden rule**: AI is a **drafting tool**, not a fact-checking tool. Always verify claims that matter.

---

## 4. Small Brain vs Big Brain - Model Sizes and Parameters

### What Are Parameters?

**Non-technical explanation**: Parameters are like the number of neural connections in the AI's "brain." More parameters = more pattern-recognition ability = better at complex tasks (but slower and more expensive).

**Business metaphor**:

| Model Size | Business Equivalent | Best For | Speed | Cost |
|------------|---------------------|----------|-------|------|
| **7B parameters** | Junior assistant (fresh graduate) | Simple tasks: email triage, basic summaries, translation | Fast (1-2 sec) | Cheap ($3-8/month) |
| **70B parameters** | Senior associate (5+ years experience) | Complex analysis, long documents, nuanced writing | Medium (3-5 sec) | Moderate ($10-20/month) |
| **405B parameters** | Senior partner (20+ years expertise) | Strategic advice, legal review, financial modeling | Slow (6-10 sec) | Expensive ($30-60/month) |

### Real Example: DeepSeek's Model Lineup

- **DeepSeek-R1-Lite** (7B) - $0.14 per 1M tokens - Great for: Summarizing emails, basic translation, simple Q&A
- **DeepSeek-V3** (70B) - $0.27 per 1M tokens - Great for: Contract review, competitor research, meeting prep
- **DeepSeek-R1** (671B) - $2.19 per 1M tokens - Great for: Strategic planning, complex code, financial modeling

**The right-size wrench principle**: Don't use a senior partner for photocopying, and don't use a junior assistant for merger negotiations. Match the model to the task complexity.

### How to Choose Model Size

**Decision flowchart**:

```
Is the task life-or-death critical? (Legal, financial, medical)
├─ YES → Use largest model (Claude Opus 4, GPT-4o, DeepSeek-R1)
└─ NO → Continue...

Does the task require deep reasoning or nuance?
├─ YES → Use medium model (Claude Sonnet 4.5, Kimi K2, DeepSeek-V3)
└─ NO → Continue...

Is it a simple, repetitive task?
└─ YES → Use small model (DeepSeek-R1-Lite, Qwen Coder)
```

**Cost optimization strategy**: Start with the smallest model that can handle the task. Only scale up when quality suffers.

---

## 5. The Creativity Dial - Temperature and Sampling

### What is Temperature?

**Temperature** controls how "creative" vs "safe" the AI's word predictions are.

**Business metaphor**: Imagine asking an employee for restaurant recommendations.

| Temperature | Behavior | Example Response | When to Use |
|-------------|----------|------------------|-------------|
| **0.0** (Deterministic) | Always picks the most probable answer. Zero creativity. | "I recommend Din Tai Fung." (Same answer every time) | Legal documents, financial data, factual summaries |
| **0.3-0.5** (Low) | Mostly safe, with slight variation | "Din Tai Fung or Paradise Dynasty." | Business emails, client proposals, translations |
| **0.7-0.8** (Medium) | Balanced creativity and reliability | "Din Tai Fung for xiaolongbao, or try the new fusion place on Orchard Road." | Marketing copy, brainstorming, creative writing |
| **1.0+** (High) | Wild creativity, high unpredictability | "Have you considered Uzbek cuisine? There's a place in Geylang..." | Fiction writing, wild brainstorms, experimental ideas |

### Real Example: Email Drafting

**Prompt**: "Draft a polite rejection to a vendor proposal"

**Temperature 0.0** (always the same):
```
Subject: Re: Proposal for IT Services

Dear Vendor Team,

Thank you for your proposal. After careful review, we have decided to proceed
with another vendor whose services better align with our current needs.

We appreciate your time and will keep your information on file for future
opportunities.

Best regards,
[Your name]
```

**Temperature 0.8** (creative variation):
```
Subject: Appreciating Your Proposal - Moving in a Different Direction

Hi [Vendor name],

Thanks for putting together such a detailed proposal! We were impressed by
your approach, especially the SLA guarantees.

After discussion with our team, we've decided to go with a solution that
integrates more closely with our existing Microsoft stack. It's purely a
technical fit decision - your pricing was competitive.

We'd love to stay in touch for future projects where your expertise might
be a better match.

Warm regards,
[Your name]
```

**When temperature goes wrong** (too high for the task):

**Temperature 1.5** for a legal document:
```
"The party of the first part (hereinafter referred to as 'The Cool Cats')
shall vibe-check all deliverables..."
```

**Problem**: Legal writing requires precision, not creativity. High temperature introduces risk.

### How OpenClaw Sets Temperature

Most OpenClaw users never touch this setting - the default (0.7) works fine for general business use.

**To adjust** (advanced users):
- Edit OpenClaw's LLM provider config
- Lower to 0.2-0.3 for financial/legal work
- Raise to 0.9-1.0 for marketing/creative brainstorming

**Rule of thumb**: If you don't know what temperature is, leave it at default. It's a power-user setting.

---

## 6. Teaching the AI About Your Business - Context vs Fine-Tuning vs RAG

### The Three Ways to Give AI Business Knowledge

**Scenario**: You want the AI to know about your company's products, clients, and internal processes.

| Method | Business Metaphor | How It Works | Cost | When to Use |
|--------|-------------------|--------------|------|-------------|
| **Context** | Handing the consultant a folder before the meeting | You paste/upload documents into each conversation. AI reads them as part of the prompt. | Free (just token costs) | 95% of business users - this is what you want |
| **RAG** (Retrieval-Augmented Generation) | Giving them access to your company's filing room | System automatically searches your knowledge base and pulls relevant docs into the prompt. | Medium (storage + retrieval system) | Large teams with 100+ company docs |
| **Fine-Tuning** | Sending them back to school to specialize in your industry | Retraining the model on your custom dataset. Creates a new model version. | Very high ($5000-50000+) | Almost NEVER needed for business use |

### Context (What 95% of OpenClaw Users Should Use)

**Example**: You want AI to draft an email using your company's tone.

**Instead of**:
```
Prompt: "Draft a professional email to a client about a delay"
```

**Do this**:
```
Prompt: "Draft an email to a client about a project delay. Use this tone:

[Paste 2-3 examples of past client emails]

Key points to cover:
- Delay is 2 weeks due to supplier issue
- We're absorbing extra costs
- No impact on final quality
"
```

**Why this works**: AI sees YOUR company voice and mimics it. No special setup required.

### RAG (For Larger Organizations)

**What it is**: A system that automatically searches your company knowledge base and feeds relevant documents to the AI.

**Example workflow**:
1. You ask: "What's our refund policy for enterprise clients?"
2. RAG system searches your internal wiki, finds the policy doc
3. Automatically includes that doc in the prompt to the AI
4. AI answers based on YOUR actual policy

**When you need RAG**:
- 50+ employees using OpenClaw
- Hundreds of company documents (policies, product specs, client history)
- Frequent questions about internal processes

**When you DON'T need RAG**:
- Small team (< 20 people)
- Can just paste relevant docs into prompts manually
- Only using AI for external tasks (email, research, translation)

**Cost**: Requires additional services like Pinecone, Weaviate, or Qdrant for vector storage. Adds $20-100/month depending on scale.

### Fine-Tuning (Almost Never Worth It)

**What it is**: Retraining the entire model on your company's specific data.

**Example**: A Malaysian law firm wants an AI that "speaks" like a Malaysian legal expert - using local case law, Malaysian English, and Sharia law nuances.

**Why it's almost never worth it**:
- Costs $5,000-50,000+ per training run
- Requires 10,000+ high-quality examples
- Must retrain from scratch whenever base model updates
- Context/RAG achieve 90% of the same result for 1% of the cost

**When fine-tuning MIGHT make sense**:
- Large bank with 100,000+ proprietary transactions to learn from
- Telco with highly specialized technical jargon
- You have an AI team and $50k+ budget

**For 99% of SEA SMEs**: Just use context. It's free and works great.

---

## 7. What Can AI See and Hear? - Multimodal Capabilities

### The Evolution: Text → Vision → Voice → Video

**Multimodal** = AI that can process multiple types of input (text, images, audio, video).

| Capability | What It Means | Example Use Cases | Models That Support It |
|------------|---------------|-------------------|------------------------|
| **Text** | Read and write text | Everything: emails, docs, code | All LLMs (Claude, Kimi, DeepSeek, etc.) |
| **Vision** | Analyze images and PDFs | OCR receipts, review product photos, analyze charts | Claude, GPT-4o, Gemini 2.0 |
| **Voice** | Transcribe audio, generate speech | Transcribe meetings, voice memos | Whisper (transcription), ElevenLabs (speech) |
| **Video** | Understand video content | Analyze product demos, meeting recordings | GPT-4o, Gemini 2.0 (limited) |

### Vision: What It Can (and Can't) Do

**What works well**:
- OCR (extracting text from images) - "Read this scanned contract and summarize key terms"
- Chart analysis - "What are the trends in this sales graph?"
- Product photos - "Describe this product defect from the photo"
- Screenshot troubleshooting - "What error is shown in this screenshot?"

**What works poorly**:
- Small text in images (< 12pt font)
- Handwritten notes (unless very neat)
- Complex diagrams with many overlapping elements
- Photos taken in low light

**Real SEA example**: Malaysian restaurant owner uploads photo of handwritten catering order.

**Prompt**: "Transcribe this order form"

**Claude's response**: Gets 80% right, but misreads "50 pax" as "30 pax" and "sotong" as "satay"

**Lesson**: Vision AI is helpful but not perfect. Always verify critical details like quantities and prices.

### Voice: Transcription vs. Generation

**Transcription** (audio → text):
- Tool: OpenAI Whisper (free, open-source)
- Use case: Transcribe client calls, voice memos, meeting recordings
- Accuracy: 90-95% for clear English audio; 70-80% for Singlish/Manglish with heavy accents

**Generation** (text → audio):
- Tool: ElevenLabs, OpenAI TTS
- Use case: Generate voiceovers for training videos, automated phone responses
- Cost: $5-30/month depending on volume

**OpenClaw integration**: Some setups support voice notes (WhatsApp voice → transcribe → AI response). Requires Whisper integration (advanced setup).

### Video: Still Experimental

**Current state** (Feb 2025):
- GPT-4o and Gemini 2.0 can analyze video
- Mostly used for: Analyzing meeting recordings, product demos, tutorial videos
- Limitations: Expensive, slow, not yet widely adopted

**Practical SEA use case**: Not yet common for SME business operations. Wait 6-12 months for this to mature.

### What OpenClaw Supports Out-of-the-Box

**Standard setup**:
- ✅ Text (all models)
- ✅ Vision (Claude 4, GPT-4o, Gemini - if configured)
- ❌ Voice (requires Whisper plugin)
- ❌ Video (not yet supported)

**To add vision support**: Choose a vision-capable model (Claude Sonnet 4.5, GPT-4o) in your LLM provider config. No other changes needed.

---

## 8. Why Different Models for Different Jobs - Model Selection Guide

### The Model Landscape (Feb 2025)

**Southeast Asia business context**: You can access both Western and Chinese models. Chinese models are generally cheaper and faster, but Western models (Claude, GPT) often handle English nuance better.

| Model | Strengths | Weaknesses | Best For | Cost |
|-------|-----------|------------|----------|------|
| **Claude Sonnet 4.5** (Anthropic) | Best at long documents, nuanced writing, code | Expensive | Legal/financial analysis, complex writing | $3-4 per 1M tokens |
| **Kimi K2** (Moonshot) | Fast, cheap, great for SEA languages | Sometimes over-confident, hallucinations | Email, summaries, translation (EN/CN/Malay) | $0.30 per 1M tokens |
| **DeepSeek-V3** (DeepSeek) | Cheapest, surprisingly capable | Hallucinations, less nuanced | High-volume tasks, experimentation | $0.27 per 1M tokens |
| **Qwen Coder** (Alibaba) | Best for code generation | Weak at business writing | Software development tasks | $0.12 per 1M tokens |
| **GPT-4o** (OpenAI) | Best multimodal (vision/voice), reliable | Expensive, slower | Image analysis, critical decisions | $2.50 per 1M tokens |
| **Gemini 2.0** (Google) | Great for Google Workspace integration | Less proven for business writing | If you live in Google Docs/Sheets | $1.25 per 1M tokens |

### The Multi-Model Strategy

**Most cost-effective approach**: Don't use one model for everything. Use the right tool for each job.

**Example: Malaysian marketing agency setup**:

```
OpenClaw configuration:

Default model: Kimi K2 (cheap, fast)
├─ Use for: Email summaries, basic Q&A, scheduling
│
Fallback to Claude Sonnet for:
├─ Client proposals (quality matters)
├─ Contract review (accuracy critical)
└─ Complex competitor analysis
│
Fallback to Qwen Coder for:
└─ Website code changes, technical tasks
```

**Cost impact**:
- Using Kimi K2 for everything: $12/month
- Using Claude for everything: $45/month
- **Using right model for each task**: $18/month (saves 60% vs. Claude-only)

### How to Choose a Model

**Quick decision tree**:

```
1. Is accuracy life-or-death critical?
   ├─ YES → Claude Sonnet or GPT-4o
   └─ NO → Continue...

2. Does it involve images/vision?
   ├─ YES → GPT-4o or Claude Sonnet (with vision)
   └─ NO → Continue...

3. Is it code-heavy?
   ├─ YES → Qwen Coder or DeepSeek-V3
   └─ NO → Continue...

4. Is it high-volume, repetitive?
   └─ YES → DeepSeek-V3 or Kimi K2 (cheapest)
```

### Language Considerations for SEA

**English business writing**:
- Best: Claude Sonnet (natural, professional tone)
- Good: GPT-4o, Kimi K2
- Okay: DeepSeek-V3 (functional but sometimes awkward)

**Bahasa Malaysia / Bahasa Indonesia**:
- Best: Kimi K2 (trained on SEA languages)
- Good: GPT-4o
- Weak: Claude (limited Malay training data), DeepSeek

**Chinese (Simplified/Traditional)**:
- Best: Kimi K2, DeepSeek-V3 (native Chinese models)
- Good: GPT-4o
- Okay: Claude

**Singlish / Manglish**:
- All models struggle with heavy Singlish/Manglish
- Best bet: Kimi K2 (some SEA training) or GPT-4o
- Expect 70-80% accuracy for colloquial phrases

---

## 9. Am I Training the AI? - Data Privacy and Provider Policies

### The Big Question: Is My Data Used for Training?

**Short answer**: It depends on the provider. But for most business use, NO.

### Training vs. Inference (Again, Because This Confuses Everyone)

| What You're Doing | What It's Called | Does Your Data Train the Model? |
|-------------------|------------------|---------------------------------|
| Sending messages to Claude/Kimi/DeepSeek via OpenClaw | **Inference** (using the model) | **NO** (for most providers) |
| Uploading company docs to create a custom GPT model | **Fine-tuning** | **YES** (you're explicitly training) |

**Key insight**: When you use OpenClaw with an API key, you're doing **inference only**. Your prompts and responses are NOT automatically used to retrain the model.

### Provider-by-Provider Breakdown

| Provider | Uses Your Data for Training? | Data Retention | Can Admins See Your Data? | PDPA/GDPR Compliant? |
|----------|------------------------------|----------------|---------------------------|----------------------|
| **Anthropic (Claude)** | NO (unless you opt in) | 30 days (then deleted) | Only with legal warrant | YES |
| **Moonshot (Kimi)** | NO | 30 days (encrypted) | NO (zero-access encryption) | YES (HQ in China, but complies with SG law) |
| **DeepSeek** | NO | 90 days | NO | Partial (check Terms of Service) |
| **OpenAI (GPT)** | NO (for API usage) | 30 days | Only if abuse detected | YES |
| **Alibaba (Qwen)** | NO (for commercial API) | 30 days | NO | Partial (China-based, check ToS) |

**Important**: These policies are for **API usage** (how OpenClaw connects). If you use the web interface (chat.openai.com, claude.ai), different rules may apply.

### What Data Does Get Sent to the LLM Provider?

When you send a message via OpenClaw:

**What the provider receives**:
- Your prompt (the message you sent)
- Any attached documents/images (if supported)
- Conversation history (last N messages for context)
- API key (to verify you're authorized)

**What the provider does NOT receive**:
- Your name (API key is anonymous)
- Your company name (unless you mention it in prompts)
- Your IP address (if routed through VPS)
- Other conversations (each session is isolated)

### PDPA Compliance for Singapore/Malaysia

**Singapore PDPA considerations**:
- Using Claude/GPT-4o: Generally compliant (US-based, but GDPR-compliant which is stricter than PDPA)
- Using Kimi/DeepSeek: China-based providers - check your company's data policy
- **Recommendation**: Don't send client NRIC, financial account numbers, or medical data in prompts

**Malaysia PDPA considerations**:
- Same as Singapore guidance
- Especially critical for financial services, healthcare, legal industries

**Safe practices**:
1. Sanitize prompts - remove client names, NRIC/MyKad, account numbers
2. Use generic examples - "A client" instead of "TechCorp Sdn Bhd"
3. For regulated industries: Use Claude (US-based, strong privacy policy)
4. Document your AI usage policy and train staff

### The "Zero Data Retention" Option

**Anthropic's policy** (Claude):
- Enterprise customers can opt for "zero data retention"
- Your data is processed but NOT stored after the API response
- Costs extra ($30/month minimum)

**When you need this**:
- Law firms, accounting firms, healthcare providers
- Handling highly sensitive client data
- PDPA/compliance requirements mandate it

**For most SMEs**: Standard 30-day retention is fine. Just sanitize sensitive details from prompts.

---

## 10. The AI Vocabulary Cheat Sheet - 30+ Terms Decoded

### Core Concepts

| Term | Simple Definition | Business Equivalent |
|------|-------------------|---------------------|
| **LLM** (Large Language Model) | The AI brain that predicts text | The consultant you're calling for advice |
| **Inference** | Using a trained model to get answers | Asking the consultant questions (you pay for this) |
| **Training** | Teaching the model from billions of documents | The consultant's university education (already happened) |
| **Token** | A chunk of text (≈ 0.75 words in English) | The billing unit (like lawyers charge per hour, LLMs charge per token) |
| **Context window** | How much text the AI can "see" at once | The size of the folder you hand to the consultant |
| **Hallucination** | AI making up false information | The consultant confidently guessing when they should say "I don't know" |

### Model Types

| Term | Simple Definition | Example |
|------|-------------------|---------|
| **GPT** (Generative Pre-trained Transformer) | The architecture most LLMs use | GPT-4o (OpenAI), GPT-3.5 |
| **Claude** | Anthropic's LLM family | Claude Sonnet 4.5, Claude Opus 4 |
| **Gemini** | Google's LLM family | Gemini 2.0 Flash, Gemini 2.0 Pro |
| **Open-source model** | Anyone can download and run it | Llama 3, Qwen, DeepSeek |
| **Closed-source model** | Only available via API (you can't download it) | Claude, GPT-4o |

### Technical Settings

| Term | Simple Definition | What It Controls |
|------|-------------------|------------------|
| **Temperature** | Creativity dial (0 = safe, 1 = creative) | How predictable vs. creative responses are |
| **Top-p** (nucleus sampling) | Alternative creativity control | Similar to temperature, less commonly adjusted |
| **Max tokens** | Response length limit | How long the AI's answer can be |
| **System prompt** | The AI's "job description" | How the AI behaves (formal? casual? concise?) |

### Advanced Techniques

| Term | Simple Definition | When You'd Use It |
|------|-------------------|-------------------|
| **RAG** (Retrieval-Augmented Generation) | Auto-searching your docs before answering | When you have 100+ company documents |
| **Fine-tuning** | Retraining the model on your data | Almost never (costs $5k-50k+) |
| **Few-shot prompting** | Giving 2-3 examples in your prompt | "Here are 3 examples of our tone. Now draft an email in the same style." |
| **Chain-of-thought** | Asking AI to "think step by step" | Complex reasoning tasks (financial modeling, legal analysis) |

### Model Evaluation

| Term | Simple Definition | What It Measures |
|------|-------------------|------------------|
| **Benchmark** | Standardized test for AI models | How well a model performs on specific tasks |
| **MMLU** | Test of general knowledge across 57 subjects | How "smart" the model is overall |
| **HumanEval** | Test of code-writing ability | How well the model writes code |
| **Perplexity** | How "surprised" the model is by text | Lower = better at predicting text |

### Data & Privacy

| Term | Simple Definition | Example |
|------|-------------------|---------|
| **API key** | Your unique ID badge to access the LLM | Like a password, but for machines |
| **Bearer token** | An access pass that expires | Temporary permission to use an API |
| **OAuth** | Delegated access (like giving valet car keys) | Granting OpenClaw access to Gmail without sharing your password |
| **Zero-shot** | Asking AI with no examples | "Translate this to Malay" (no examples given) |
| **One-shot** | Giving one example | "Here's a good summary. Now summarize this other document the same way." |

### Common Acronyms

| Acronym | Stands For | What It Is |
|---------|-----------|------------|
| **NLP** | Natural Language Processing | The field of AI that handles text |
| **AGI** | Artificial General Intelligence | Hypothetical "human-level AI" (doesn't exist yet) |
| **RLHF** | Reinforcement Learning from Human Feedback | How models learn to be helpful (trainers rate responses) |
| **SFT** | Supervised Fine-Tuning | Training a model on labeled examples |

### Multimodal Terms

| Term | Simple Definition | Example |
|------|-------------------|---------|
| **Multimodal** | AI that handles multiple input types (text, images, voice) | GPT-4o can read text AND analyze images |
| **OCR** | Optical Character Recognition (extracting text from images) | Scanning a receipt to pull out the total |
| **TTS** | Text-to-Speech | AI reading text aloud (ElevenLabs, OpenAI TTS) |
| **STT** | Speech-to-Text | Transcribing audio (Whisper) |

---

## Quick Reference Card

**Print this and keep it at your desk:**

### The 5 Things Every Business Leader Should Know About AI

1. **Inference ≠ Training**
   - You're RENTING brain-time, not training the AI
   - Your data is NOT used to train the model (for most providers)

2. **Hallucination is Normal**
   - AI makes things up when it doesn't know
   - ALWAYS verify numbers, dates, regulations, client-facing content

3. **Match Model to Task**
   - Don't use a senior partner (Claude Opus) for photocopying (email summaries)
   - Don't use a junior assistant (DeepSeek-Lite) for merger negotiations

4. **Temperature = Creativity Dial**
   - 0.0 = Deterministic (same answer every time)
   - 0.7 = Balanced (default)
   - 1.0+ = Creative chaos

5. **Context > Fine-Tuning**
   - Just paste relevant docs into prompts (free)
   - Fine-tuning costs $5k-50k+ (almost never worth it)

---

## What to Read Next

- **[Prompting Guide](PROMPTING-GUIDE.md)** - How to write better prompts and get better results
- **[Your Data, Your Rules](YOUR-DATA-YOUR-RULES.md)** - Deep dive on data privacy and PDPA compliance
- **[Mental Model](MENTAL-MODEL.md)** - Understanding OpenClaw's architecture through business metaphors
- **[Pricing Guide](PRICING.md)** - Complete cost breakdown and calculator

---

**Questions or feedback?** Open an issue on GitHub or join the OpenClaw Discord community.
