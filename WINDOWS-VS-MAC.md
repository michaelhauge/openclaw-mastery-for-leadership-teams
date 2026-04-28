# Windows vs Mac — Terminal & Command Line

**Reading time:** ~4 minutes

If you've ever seen someone type commands into a black screen and wondered "what is that, and do I need it?" — this guide is for you.

---

## The short answer

**For this workshop, it doesn't matter whether you're on Windows or Mac.**

Your OpenClaw server runs in the cloud. You access it through a **browser terminal** — a webpage that looks like a command-line screen but opens in Chrome, Safari, Edge, or Firefox like any other tab. There's nothing to install. Your laptop's operating system is irrelevant.

---

## What is a terminal, anyway?

A terminal (also called a command line, command prompt, or shell) is a text-based way to control a computer. Instead of clicking icons, you type instructions.

- On **Mac**: the app is called **Terminal** (or iTerm2 if someone installed it). You can find it in Applications → Utilities → Terminal.
- On **Windows**: you have **Command Prompt** (cmd), **PowerShell**, or the newer **Windows Terminal**. Search for any of these in the Start menu.

They look different and use slightly different commands, but for the purposes of this workshop you'll almost never be using your local terminal — you'll be using the browser terminal on your server.

---

## The browser terminal (what we use in the workshop)

When your captain gave you a URL to open (something like `https://terminal-XXXX.workshop.openclaw.ai`), that opened a terminal running *on your cloud server*, not on your laptop.

| What you're seeing | What it actually is |
|---|---|
| Black screen with a blinking cursor | A Linux terminal on your Hetzner VPS in Frankfurt |
| Text commands you type | Instructions running on your server, not your laptop |
| Your laptop | Just the window — like a remote control |

**This works identically on Windows, Mac, iPhone, and Android.** As long as you have a browser, you're in.

---

## Copy and paste in the browser terminal

This is the one area where things behave slightly differently:

| Action | Mac | Windows |
|---|---|---|
| Copy text | `Cmd + C` (or select text — it auto-copies in most terminals) | `Ctrl + C` (note: in some terminals, Ctrl+C cancels a command instead of copying — right-click and choose Copy instead) |
| Paste text | `Cmd + V` | `Ctrl + V` (or right-click → Paste if that doesn't work) |

> **Tip for Windows users:** If `Ctrl + V` doesn't paste in the browser terminal, try right-clicking inside the terminal window and selecting **Paste**. This is the most reliable method across all browsers and operating systems.

---

## If you want to SSH into your server (optional, post-workshop)

During the workshop you use the browser terminal. After the workshop, if you want to connect to your server from your own computer, here's how:

### Mac
Mac has SSH built in. Open Terminal and type:
```
ssh root@YOUR-SERVER-IP
```
Replace `YOUR-SERVER-IP` with the IP address on your name tag or in your setup confirmation email.

### Windows
Windows 10 and 11 also have SSH built in. Open **Windows Terminal** or **PowerShell** and type:
```
ssh root@YOUR-SERVER-IP
```

If that doesn't work on older Windows, download **PuTTY** (free, from putty.org) — it's a simple SSH client for Windows that has been the standard for years.

> **Note:** During the workshop, table captains connect to your server using **Tailscale** — a private VPN tool — so they don't need your password. You don't need to set this up yourself.

---

## Commands that look different on Windows vs Mac/Linux

Your OpenClaw server runs **Linux**. The commands in this workshop (in `SETUP-GUIDE.md` and elsewhere) are Linux commands. They run on your server — not on your laptop — so your laptop's OS doesn't change anything.

For reference, here are a few common differences if you ever need to run something locally:

| Task | Mac/Linux terminal | Windows Command Prompt |
|---|---|---|
| List files | `ls` | `dir` |
| Change directory | `cd foldername` | `cd foldername` (same) |
| Show current location | `pwd` | `cd` (no path) |
| Clear the screen | `clear` | `cls` |

Again — you won't need any of these for the workshop. Everything happens on the Linux server via the browser terminal.

---

## Summary

- **Browser terminal = works on everything.** Chrome, Edge, Safari, Firefox — Mac or Windows.
- **Copy/paste:** Use `Cmd+V` on Mac, `Ctrl+V` or right-click → Paste on Windows.
- **SSH post-workshop:** Built into both Mac and Windows 10/11. PuTTY is the fallback for older Windows.
- **Linux commands in the guides** run on your server, not your laptop — so the OS you're sitting in front of doesn't matter.

If anything in the browser terminal isn't working as expected, raise your hand and your captain can diagnose it in seconds.

---

## What's next

- **Ready to start?** → [SETUP-GUIDE.md](SETUP-GUIDE.md) — walk through setting up your bot
- **New to the terminology?** → [GLOSSARY.md](GLOSSARY.md) — plain-English definitions for every term
