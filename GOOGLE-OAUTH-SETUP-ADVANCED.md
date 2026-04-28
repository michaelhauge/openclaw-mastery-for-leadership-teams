# Connecting Google Workspace — Advanced Setup (Own Google Cloud Project)

> **Adapted from** [Connect Google to OpenClaw](https://www.digitalocean.com/community/tutorials/connect-google-to-openclaw) by DigitalOcean, licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). The original article includes screenshots for every step — refer to it for visual guidance at each stage.

This guide covers the **hard path**: creating your own Google Cloud project and OAuth credentials so your bot uses a private API quota instead of any shared credentials. It takes about 30–45 minutes but gives you full ownership of the connection.

**If you just want to quickly connect Gmail/Calendar/Drive** using the simpler device-flow method, see [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md) instead.

---

## When to use this guide

Use this advanced setup when:
- You want your own private Google Cloud project (not shared credentials)
- You're running OpenClaw on a VPS you control long-term
- You want to connect a real work Gmail account (not a throwaway)
- You need higher API quotas or want to enable additional Google services

---

## Prerequisites

Before you start:

- ✅ OpenClaw is installed and running on your VPS
- ✅ You can SSH into your server
- ✅ You have a Google account (this can be an existing Gmail or a new one you create for the bot)
- ✅ You have a browser open on your laptop or desktop
- ✅ `gogcli` is installed on your server (see Step 4)

---

## Step 1 — Create your OpenClaw server (if not already done)

If you already have OpenClaw running on a VPS, skip to Step 2.

If you're starting from scratch, SSH into your server and run the OpenClaw install script:

```bash
curl -fsSL https://get.openclaw.ai/install.sh | bash
```

Follow the on-screen prompts to complete setup. When done, OpenClaw should be running and responding to WhatsApp messages.

> 📸 **See the original article** for a screenshot of a successful OpenClaw installation.

---

## Step 2 — Create a dedicated Gmail account (recommended)

You can connect any Google account, but it's a good practice to create a dedicated Gmail account for your bot — something like `yourname-assistant@gmail.com`. This keeps your bot's Google activity separate from your personal email and makes it easier to revoke access later if needed.

If you'd rather connect your existing Gmail directly, skip to Step 3.

**Create a new Gmail account:**
1. Go to [accounts.google.com](https://accounts.google.com) and click **Create account**
2. Choose **For my personal use**
3. Fill in a name and username (e.g., `yourname.ai.assistant`)
4. Complete the sign-up flow

Keep the password handy — you'll need it to approve the OAuth connection in Step 5.

---

## Step 3 — Set up Google Cloud Console

This is the most involved step. You'll create a Google Cloud project, enable the APIs you need, and generate OAuth credentials.

### 3a — Create a Google Cloud project

1. Open [console.cloud.google.com](https://console.cloud.google.com) in your browser
2. Click the project selector dropdown at the top of the page (it may say "Select a project")
3. Click **New Project**
4. Give your project a name (e.g., `OpenClaw Bot`) and click **Create**
5. Wait a few seconds for the project to be created, then select it from the dropdown

> 📸 **See the original article** for a screenshot of the New Project dialog.

### 3b — Enable the Google APIs

With your project selected, enable the three APIs your bot will use:

**Enable Gmail API:**
1. In the left sidebar, go to **APIs & Services → Library**
2. Search for "Gmail API"
3. Click on it and click **Enable**

**Enable Google Calendar API:**
1. Return to the API Library
2. Search for "Google Calendar API"
3. Click on it and click **Enable**

**Enable Google Drive API:**
1. Return to the API Library
2. Search for "Google Drive API"
3. Click on it and click **Enable**

> 📸 **See the original article** for a screenshot of the API Library with Gmail API shown.

### 3c — Configure the OAuth consent screen

Before creating credentials, you need to configure how the Google permission screen looks when you authorise your bot.

1. In the left sidebar, go to **APIs & Services → OAuth consent screen**
2. Select **External** as the user type (this allows any Google account to authorise, not just accounts in a specific organisation)
3. Click **Create**
4. Fill in the required fields:
   - **App name**: `OpenClaw Bot` (or whatever you'd like)
   - **User support email**: your own email address
   - **Developer contact information**: your own email address
5. Click **Save and Continue** through the Scopes and Test Users screens (you don't need to add scopes or test users here)
6. On the Summary screen, click **Back to Dashboard**
7. **Important**: Click **Publish App** to set the status to "In production". If you leave it in "Testing" mode, tokens expire after 7 days and you'll need to re-authenticate repeatedly.

> 📸 **See the original article** for a screenshot of the OAuth consent screen configuration.

### 3d — Create OAuth Client ID credentials

1. In the left sidebar, go to **APIs & Services → Credentials**
2. Click **+ Create Credentials → OAuth client ID**
3. For **Application type**, choose **Desktop app**
4. Give it a name (e.g., `OpenClaw gogcli`)
5. Click **Create**
6. A popup appears with your Client ID and Client Secret — click **Download JSON** to save the credentials file

> 📸 **See the original article** for a screenshot of the OAuth client ID creation dialog.

The downloaded file will be named something like `client_secret_XXXXXXX.apps.googleusercontent.com.json`. Rename it to something simpler:

```bash
mv ~/Downloads/client_secret_*.json ~/Downloads/credentials.json
```

---

## Step 4 — Transfer credentials to your server and install gogcli

### 4a — Copy the credentials file to your VPS

From your local machine, use `scp` to transfer the credentials file to your server. Replace `your-server-ip` with your VPS IP address:

```bash
scp ~/Downloads/credentials.json root@your-server-ip:~/.openclaw/gog-credentials.json
```

If your server uses a non-root user or a custom SSH port:

```bash
scp -P 2222 ~/Downloads/credentials.json youruser@your-server-ip:~/.openclaw/gog-credentials.json
```

### 4b — Install gogcli

SSH into your server and install `gogcli`, the command-line tool used to authenticate with Google:

```bash
ssh root@your-server-ip
```

Then install gogcli:

```bash
npm install -g @openclaw/gogcli
```

Or if you're using the OpenClaw plugin system:

```bash
openclaw plugin install gog
```

Verify the installation:

```bash
gogcli --version
```

---

## Step 5 — Authenticate with Google via SSH tunnel

Because your VPS has no browser, you can't do a standard OAuth flow. Instead, `gogcli` starts a local authentication server and you create an SSH tunnel to access it from your laptop's browser.

### 5a — Start the authentication flow

On your server, run:

```bash
gog auth add email --services gmail,calendar,drive --credentials ~/.openclaw/gog-credentials.json
```

The command will output a message like:

```
Starting auth server on port 8080...
Open the following URL in your browser: http://localhost:8080/auth
Waiting for authentication to complete...
```

Note the port number (e.g., `8080`). You'll need it in the next step.

### 5b — Create an SSH tunnel

On your **local machine** (in a new terminal window), create an SSH tunnel that forwards a local port to the auth server on your VPS. Replace `8080` with the actual port number and `your-server-ip` with your VPS IP:

```bash
ssh -N -L 8080:localhost:8080 root@your-server-ip
```

Leave this tunnel running in the background.

### 5c — Complete authentication in your browser

On your laptop, open a browser and go to:

```
http://localhost:8080/auth
```

This will redirect you to Google's authorisation page. Sign in to the Google account you want to connect, review the permissions (Gmail, Calendar, Drive), and click **Allow**.

After you allow access, the browser will show a success message and the terminal on your server will confirm authentication is complete.

### 5d — Set a passphrase for the keyring

The authenticated tokens are stored in an encrypted keyring on your server. You'll be prompted to set a passphrase:

```
Enter a passphrase to protect your credentials (leave blank to skip):
```

It's strongly recommended to set a passphrase. You'll need it in Step 6.

---

## Step 6 — Configure OpenClaw to use your credentials

OpenClaw needs to know the keyring passphrase so it can unlock the stored tokens when it starts up.

### 6a — Add the passphrase to your environment

Open your OpenClaw environment file:

```bash
nano ~/.openclaw/.env
```

Add this line (replace `your-passphrase` with the passphrase you set in Step 5d):

```
GOG_KEYRING_PASSWORD=your-passphrase
```

Save and close the file.

### 6b — Update the systemd service (if applicable)

If OpenClaw runs as a systemd service, it needs the environment variable injected at startup. Edit the service file:

```bash
systemctl edit openclaw
```

Add the following in the override editor:

```ini
[Service]
Environment="GOG_KEYRING_PASSWORD=your-passphrase"
```

Save, then reload and restart:

```bash
systemctl daemon-reload
systemctl restart openclaw
```

> 📸 **See the original article** for a screenshot of the systemd service override configuration.

---

## Step 7 — Verify the connection

### 7a — Test via the OpenClaw TUI

SSH into your server and open the OpenClaw terminal interface:

```bash
openclaw tui
```

In the chat input, type:

```
What was my most recent email?
```

OpenClaw should respond with a summary of your latest email. If it does, the Google integration is working.

> 📸 **See the original article** for a screenshot of a successful email query in the OpenClaw TUI.

### 7b — Test via WhatsApp

Send these messages to your bot on WhatsApp to verify each service:

| Test message | What to expect |
|---|---|
| *"Summarise my last 5 unread emails."* | Short summary of recent emails |
| *"What's on my calendar today?"* | Today's event list |
| *"Search my Drive for files about [topic]."* | File names and links |

---

## Troubleshooting

### `gog auth add` fails immediately

Make sure `gogcli` is installed and the credentials file path is correct:

```bash
ls -la ~/.openclaw/gog-credentials.json
gogcli --version
```

### SSH tunnel drops and authentication stalls

The tunnel needs to stay open for the entire browser auth flow. If it drops, restart it and retry the auth command from Step 5a.

### Tokens expire after 7 days

This happens when the OAuth consent screen is in "Testing" mode. Go back to [Google Cloud Console → OAuth consent screen](https://console.cloud.google.com/apis/credentials/consent) and click **Publish App**. Then re-run the auth flow.

### Bot says "no Gmail tools" or similar

```bash
openclaw plugin list
```

Make sure the `gog` plugin shows as enabled. If not:

```bash
openclaw plugin enable gog
openclaw restart
```

### The credentials JSON doesn't work

Double-check you selected **Desktop app** (not Web application) when creating the OAuth Client ID. Web application credentials use a different redirect URI flow and won't work with gogcli's approach.

---

## Revoking access

To disconnect your Google account from the bot:

1. Go to [myaccount.google.com/permissions](https://myaccount.google.com/permissions)
2. Find "OpenClaw" or "OpenClaw Bot" in the list
3. Click **Remove access**

The stored tokens on your server will also become invalid. To reconnect, run the auth flow from Step 5 again.

---

## What's next

- **Simpler connection method** → See [GOOGLE-OAUTH-SETUP.md](GOOGLE-OAUTH-SETUP.md) for the device-flow approach (no SSH tunnel needed)
- **Install more plugins** → See [SKILLS-GUIDE.md](SKILLS-GUIDE.md) for a full review of useful plugins
- **Try AI-powered workflows** → See [resources/ai-gtm-playbook/](resources/ai-gtm-playbook/) for 25 copy-paste workflows
