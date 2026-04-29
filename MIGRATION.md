# Taking Your OpenClaw Server Home

After the workshop, your OpenClaw server can be transferred into your own Hetzner account so you own and control it permanently. This guide covers how to access your server terminal, how to prepare for the transfer, and how to log in on your own after handover.

---

## Part 1 — How to Access Your Server Terminal

Your server has a Linux command line interface (terminal). This is where you run all commands to manage OpenClaw.

### Option A: Web Terminal (During the Workshop)

During the workshop, your terminal is available directly in your browser — no installation needed.

**Open your terminal:**

Go to: `https://claimopenclaw.pertamapartners.com/terminal/p[YOUR NUMBER]`

Replace `[YOUR NUMBER]` with your workshop server number (e.g. `p01`, `p02`, `p05`).

You will see a black screen with a prompt like:

```
pertama@workshop-05:~$
```

You are now inside your server. Type commands here and press Enter to run them.

**To navigate to the OpenClaw folder** (required before most commands):

```bash
cd /opt/pertama
```

Your prompt will change to:

```
pertama@workshop-05:/opt/pertama$
```

---

### Option B: SSH from Your Own Computer (Mac or Windows)

SSH lets you connect to your server directly from the Terminal or Command Prompt on your own computer. This is how you will log in after the server is transferred to your account.

#### Mac — Using Terminal

1. Open **Terminal** (search for it in Spotlight with `Cmd + Space`, type "Terminal")

2. Connect to your server:

```bash
ssh root@YOUR_SERVER_IP
```

Replace `YOUR_SERVER_IP` with your server's IP address (see Step 3 below to find it).

3. Type `yes` if asked to confirm the connection, then press Enter.

4. You should see a prompt like `root@workshop-05:~#` — you are now inside your server.

#### Windows — Using PowerShell or Command Prompt

Windows 10 and 11 include SSH built in.

1. Press `Windows + R`, type `powershell`, press Enter

2. Connect to your server:

```
ssh root@YOUR_SERVER_IP
```

3. Type `yes` if asked to confirm, then press Enter.

4. You should see a prompt like `root@workshop-05:~#` — you are now inside your server.

> If SSH is not found, install it via **Settings → Apps → Optional Features → OpenSSH Client**.

---

## Part 2 — Prepare for the Transfer (Do This During the Workshop)

Before the server is transferred to your Hetzner account, you need to do two things while you still have browser terminal access.

---

### Step 1 — Find Your Server Number and IP

In your web terminal, run:

```bash
hostname && curl -s ifconfig.me
```

You will see two lines — your server name (e.g. `workshop-05`) and your server's IP address (e.g. `5.223.87.187`).

**Save both of these.** You will need them later.

---

### Step 2 — Add Your SSH Public Key to the Server

This lets you log in via SSH after the transfer. Skip this now and you will be locked out.

**First, get your SSH public key from your own computer.**

#### Mac:

1. Open Terminal on your Mac
2. Check if you already have a key:
```bash
cat ~/.ssh/id_ed25519.pub
```
3. If you see a line starting with `ssh-ed25519`, that's your key — copy the whole line.
4. If you get "No such file", generate one first:
```bash
ssh-keygen -t ed25519 -C "your@email.com"
```
Press Enter three times to accept defaults. Then run `cat ~/.ssh/id_ed25519.pub` again to see it.

#### Windows:

1. Open PowerShell
2. Check if you already have a key:
```
type $env:USERPROFILE\.ssh\id_ed25519.pub
```
3. If you see a line starting with `ssh-ed25519`, copy the whole line.
4. If you get an error, generate one:
```
ssh-keygen -t ed25519 -C "your@email.com"
```
Press Enter three times to accept defaults. Then run the `type` command again.

---

**Now add your key to the server.**

In your **web terminal**, run this command — replace everything inside the quotes with YOUR key:

```bash
echo "ssh-ed25519 AAAA...your full key here... your@email.com" >> /root/.ssh/authorized_keys
```

Verify it was added:

```bash
cat /root/.ssh/authorized_keys
```

Your key should appear in the list.

---

### Step 3 — Request the Server Transfer

Send this message to your workshop administrator:

---

> **Subject:** Workshop Server Transfer Request
>
> Hi Mike,
>
> I'd like to take ownership of my OpenClaw server. Here are my details:
>
> - **My name:** [Your Name]
> - **My workshop server:** workshop-0X *(your prompt shows `pertama@workshop-0X`)*
> - **My Hetzner account email:** [the email you signed up with at hetzner.com]
>
> I have added my SSH key and noted my server IP.
>
> Thanks!

---

The administrator will initiate the transfer from the Hetzner Cloud Console. You will receive an **email from Hetzner** with a link to accept — click it to complete the handover.

> Your server and bot stay running during the transfer.

---

## Part 3 — Log In After the Transfer

Once the server is in your Hetzner account, you own it completely. Log in via SSH:

**Mac:**
```bash
ssh root@YOUR_SERVER_IP
```

**Windows (PowerShell):**
```
ssh root@YOUR_SERVER_IP
```

You should see:
```
root@workshop-05:~#
```

Then navigate to OpenClaw:
```bash
cd /opt/pertama
```

---

## Part 4 — Everyday Server Management

From inside `/opt/pertama`:

| What you want to do | Command |
|---|---|
| Check if bot is running | `docker compose ps` |
| View recent logs | `docker compose logs openclaw --tail 30` |
| Restart the bot | `docker compose restart openclaw` |
| Stop everything | `docker compose down` |
| Start everything | `docker compose up -d` |

OpenClaw should always show `Up (healthy)` in `docker compose ps`.

---

## Part 5 — Create a Hetzner Account (If You Haven't Yet)

Sign up at [hetzner.com](https://www.hetzner.com/) before requesting the transfer. The free account is enough to receive and own a server.

---

## If the Bot Stops Responding After Transfer

The most common cause is the WhatsApp pairing session expiring. Open [RESCUE.md](RESCUE.md) and follow the pairing steps from your terminal.

---

## Emergency: Lost SSH Access

If you can no longer SSH in, log into [console.hetzner.com](https://console.hetzner.com), find your server, and click **Console** to get browser-based terminal access. From there you can add a new SSH key or troubleshoot firewall issues.
