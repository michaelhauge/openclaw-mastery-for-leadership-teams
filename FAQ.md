# Frequently Asked Questions

**Reading time:** ~5 minutes (or scan for the questions that matter to you)

---

## Privacy and security

**1. Is my data private? Does anyone see my conversations?**

Your conversations travel from your device to your VPS (the server you control), and from there to the LLM provider — for example, Moonshot or Anthropic — to generate a response. No third party aggregates or monitors your messages in between. The LLM provider does receive the text you send, because it needs to read your message to answer it, but under standard API terms they do not use API traffic to train their models. This is different from free consumer products like the ChatGPT website, which may use your conversations for training. Your conversation history is stored only on your own server — not in any shared database.

**2. Is it safe to connect my Gmail and Google Calendar?**

Yes. The `gog` plugin uses standard OAuth 2.0, which is the same authorisation mechanism you use when you click "Sign in with Google" on any website. You are not sharing your Google password with OpenClaw — you are granting specific, named permissions through Google's own login page. You can see exactly which permissions were granted and revoke them at any time from your Google account settings at myaccount.google.com under Security, then Third-party apps with account access. Revoking access immediately cuts off the connection.

**3. Who has access to my server?**

Only you — via the browser terminal provided during the workshop — and your table captain, who can access the workshop server through Tailscale, a private VPN used solely for troubleshooting. Tailscale access to workshop servers is removed after the event ends. Once you move to a permanent server you set up yourself, nobody has access unless you explicitly grant it. Your VPS provider (for example, Hetzner) has physical access to the hardware but not to your application data.

**4. Could my conversations be used to train an AI model?**

Not by the workshop infrastructure — your conversations are stored only on your server and are not sent anywhere other than to the LLM provider for processing. API-tier terms for providers such as Moonshot, Anthropic, and OpenAI explicitly exclude API traffic from being used as training data. This is one of the main reasons developers and businesses use the API rather than the consumer products: the data handling terms are more clearly defined. If this matters to your organisation, read the data processing agreement for whichever provider you choose — they are publicly available.

---

## Cost and pricing

**5. What does it cost per month after the workshop?**

Typically $6–16 per month in total. A Hetzner CX22 VPS costs approximately $4–6 per month. LLM API usage at typical leadership usage — roughly 50 to 200 messages per day — costs approximately $2–10 per month depending on which model you choose. This compares favourably to ChatGPT Plus ($20/month) or Claude Pro ($20/month), and you get a more capable and customisable setup that you fully control. See [WHY-SELF-HOSTED.md](WHY-SELF-HOSTED.md) for the full cost breakdown with worked examples.

**6. What happens to the workshop server after 7 days?**

It gets destroyed. Your conversations, cron jobs, and skills are lost unless you migrate them first. Before the 7-day window closes, follow [SETUP-GUIDE.md Part 8 (Taking it home)](SETUP-GUIDE.md#part-8-taking-it-home) to either set up your own permanent server or export your configuration. Do not leave this to the last day — the migration takes about an hour under normal conditions and is significantly harder when you are rushed or the deadline is close.

**7. Is there a cheaper option than the Hetzner setup?**

Yes. Oracle Cloud has a permanently free VPS tier that runs OpenClaw well, bringing your monthly server cost to zero. The setup is more involved — you need an Oracle account and some comfort with slightly more technical steps — but once running there are no ongoing server charges. See [resources/openclaw-sea-guide/guides/04-oracle-cloud-free.md](resources/openclaw-sea-guide/guides/04-oracle-cloud-free.md) for the walkthrough. You can also run OpenClaw on your own Mac laptop at no hosting cost, though the bot will only be active while your laptop is on and awake.

**8. What if the LLM provider I chose raises its prices?**

Switch providers in a two-minute conversation with your bot. Your skills, cron jobs, memory, and plugins all stay exactly as they are — only the model changes. This is one of the genuine advantages of self-hosted AI: you are never locked into a single company's pricing, model decisions, or business continuity. If a provider shuts down or doubles their rates, you can be on a different provider the same day.

---

## Using your bot

**9. Can my team use my bot, or is it just for me?**

It is personal by default. The bot is paired to your WhatsApp number, so messages come from you and responses go back to you. You can share your server login with an executive assistant who works in your name, but the design intent is one bot per person. If you want a team deployment where each person has their own bot, ask the workshop facilitator — it is a well-understood setup and the additional cost is modest, roughly the same per-person as your own setup.

**10. Can I use it from my phone?**

Yes — that is the design. OpenClaw connects to WhatsApp, so every message you send to your bot goes through the WhatsApp app you already use on your phone. It works from anywhere with a data connection: your office, the airport, a client meeting, or across borders on roaming. You do not need to open any special app, remember any URL, or log in to anything. If you already use WhatsApp, you are already set up.

**11. What if I tell the bot something wrong — will it remember it forever?**

Only if you have the `memory-lancedb` plugin installed and it wrote that information to memory. Without the memory plugin, each conversation is independent — the bot starts fresh each session, though your skills and cron jobs always persist regardless. With the memory plugin installed, you can correct it directly: tell the bot "forget that" or "update what you know about X" and it will revise its memory. You can also inspect and delete memory entries directly on your server.

**12. What if I lose access to my server or forget the browser terminal password?**

Your workshop password is printed on your name tag and saved in the workshop provisioning system. If you lose it, message your table captain or the workshop facilitator and they can retrieve it for you. For a permanent server you set up yourself after the workshop, you control the credentials — store them in a password manager such as 1Password or Bitwarden and you will never need to recover them.

---

## Technical questions

**13. Do I need to keep my laptop on for the bot to work?**

No. The bot runs entirely on your VPS, which is a server in a data centre that stays on around the clock. Your laptop or phone is just the interface you use to send messages — the VPS handles all the processing whether your devices are on, off, asleep, or halfway around the world. The only thing that stops your bot working is if the VPS itself goes down, which for reputable providers like Hetzner happens very rarely.

**14. What if my bot stops replying?**

There are three common causes: the LLM API key has hit a quota or billing issue, the WhatsApp connection has dropped and needs re-linking, or the Docker container has crashed and needs a restart. See [SETUP-GUIDE.md Part 7 (Troubleshooting)](SETUP-GUIDE.md#part-7-troubleshooting) for the step-by-step diagnosis for each scenario. During the workshop, flag your table captain before spending time diagnosing it yourself — most issues are resolved in under two minutes with the right access.

**15. Is self-hosted AI legal in Malaysia, Singapore, or Indonesia?**

Generally yes. Running an AI assistant on a private server for personal and business productivity sits in the same category as using any cloud software or SaaS tool. The bot itself is not subject to specific AI regulations in most Southeast Asian jurisdictions as of 2026, though the regulatory environment is evolving. You remain responsible for how you use it — do not use the bot in ways that would be unlawful if done manually, such as fraud, defamation, or unlicensed financial advice. If your organisation has an AI usage policy, review it before connecting company accounts.

**16. What happens if OpenClaw (the open-source project) stops being maintained?**

Your bot keeps running. It is already installed on your server — you are not dependent on an ongoing subscription, a cloud service staying online, or a company remaining in business. If the project is abandoned, the software continues to work exactly as it did; it simply stops receiving new features and security patches. This is the fundamental advantage of self-hosted software: once deployed, it belongs to you. For context, OpenClaw currently has over 150,000 GitHub stars and an active development community, so abandonment in the near term is not a realistic concern.

---

## What's next

- Full setup guide: [SETUP-GUIDE.md](SETUP-GUIDE.md)
- Why self-hosted vs ChatGPT or Claude: [WHY-SELF-HOSTED.md](WHY-SELF-HOSTED.md)
- Your first 7 days: [FIRST-WEEK.md](FIRST-WEEK.md)
- Have a question not answered here? Open an issue on this repo or message the workshop facilitator directly.
