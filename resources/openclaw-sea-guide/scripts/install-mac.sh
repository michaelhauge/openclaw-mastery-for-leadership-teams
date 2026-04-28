#!/bin/bash

#############################################
# OpenClaw Mac Installer
# For Southeast Asia Business Leaders
#
# This script automatically installs OpenClaw
# on your Mac with recommended settings.
#############################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored message
print_msg() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  OpenClaw Installer for Mac            ║"
echo "║  Southeast Asia Edition                ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if running on Mac
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is for macOS only."
    exit 1
fi

print_msg "Running on macOS"

# Check Node.js version
print_info "Checking Node.js version..."
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed."
    echo ""
    echo "Please install Node.js 22 or newer from:"
    echo "https://nodejs.org"
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 22 ]; then
    print_error "Node.js version 22 or higher is required."
    print_info "Current version: $(node --version)"
    echo ""
    echo "Please upgrade Node.js from:"
    echo "https://nodejs.org"
    exit 1
fi

print_msg "Node.js $(node --version) detected"

# Ask for LLM provider
echo ""
print_info "Which LLM provider will you use?"
echo "  1) Kimi K2 (Recommended - $10-20/month)"
echo "  2) DeepSeek (Cheapest - $3-8/month)"
echo "  3) Claude (Premium - $20/month)"
echo "  4) Other (configure manually later)"
echo ""
read -p "Enter choice [1-4]: " llm_choice

case $llm_choice in
    1)
        LLM_PROVIDER="kimi"
        LLM_MODEL="kimi/kimi-k2"
        print_msg "Selected: Kimi K2"
        ;;
    2)
        LLM_PROVIDER="deepseek"
        LLM_MODEL="deepseek/deepseek-chat"
        print_msg "Selected: DeepSeek"
        ;;
    3)
        LLM_PROVIDER="anthropic"
        LLM_MODEL="anthropic/claude-sonnet-4-5-20250929"
        print_msg "Selected: Claude"
        ;;
    4)
        LLM_PROVIDER="custom"
        LLM_MODEL="custom"
        print_msg "You'll need to configure manually later"
        ;;
    *)
        print_error "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Ask for API key (if not Claude OAuth)
if [ "$llm_choice" != "3" ] && [ "$llm_choice" != "4" ]; then
    echo ""
    print_info "Enter your $LLM_PROVIDER API key:"
    read -s -p "API Key: " API_KEY
    echo ""

    if [ -z "$API_KEY" ]; then
        print_error "API key cannot be empty."
        exit 1
    fi

    print_msg "API key saved"
fi

# Install OpenClaw
echo ""
print_info "Installing OpenClaw..."
if npm install -g openclaw@latest > /dev/null 2>&1; then
    print_msg "OpenClaw installed successfully"
else
    print_error "Failed to install OpenClaw"
    exit 1
fi

# Create configuration directory
print_info "Creating configuration directory..."
mkdir -p ~/.openclaw
print_msg "Directory created: ~/.openclaw"

# Create configuration file
print_info "Creating configuration file..."
cat > ~/.openclaw/openclaw.json <<EOF
{
  "agent": {
    "model": "$LLM_MODEL"
  },
  "llm": {
    "$LLM_PROVIDER": {
      "apiKey": "\${${LLM_PROVIDER^^}_API_KEY}"
    }
  },
  "gateway": {
    "host": "127.0.0.1",
    "port": 18789
  },
  "security": {
    "dmPairing": {
      "enabled": true
    }
  },
  "channels": {
    "whatsapp": {
      "enabled": false
    },
    "telegram": {
      "enabled": false
    }
  }
}
EOF
print_msg "Configuration file created"

# Add API key to shell profile
if [ -f ~/.zshrc ]; then
    SHELL_PROFILE=~/.zshrc
elif [ -f ~/.bashrc ]; then
    SHELL_PROFILE=~/.bashrc
else
    SHELL_PROFILE=~/.zshrc
fi

if [ "$llm_choice" != "3" ] && [ "$llm_choice" != "4" ]; then
    print_info "Adding API key to $SHELL_PROFILE..."

    # Remove old key if exists
    sed -i.bak "/export ${LLM_PROVIDER^^}_API_KEY=/d" "$SHELL_PROFILE"

    # Add new key
    echo "" >> "$SHELL_PROFILE"
    echo "# OpenClaw API Key" >> "$SHELL_PROFILE"
    echo "export ${LLM_PROVIDER^^}_API_KEY=\"$API_KEY\"" >> "$SHELL_PROFILE"

    print_msg "API key added to shell profile"

    # Load the key for current session
    export ${LLM_PROVIDER^^}_API_KEY="$API_KEY"
fi

# Run onboarding
echo ""
print_info "Running OpenClaw setup wizard..."
print_warning "You may be asked additional questions. Follow the prompts."
echo ""
sleep 2
openclaw onboard --install-daemon

# Start OpenClaw
echo ""
print_info "Starting OpenClaw..."
if openclaw start; then
    print_msg "OpenClaw started successfully!"
else
    print_warning "OpenClaw may not have started. Check 'openclaw status'"
fi

# Check status
sleep 2
echo ""
print_info "Checking OpenClaw status..."
openclaw status

# Print next steps
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Installation Complete!                ║"
echo "╚════════════════════════════════════════╝"
echo ""
print_msg "OpenClaw is installed and running!"
echo ""
echo "Next Steps:"
echo ""
echo "1. Open Dashboard:"
echo "   openclaw dashboard"
echo "   (Opens: http://localhost:18789)"
echo ""
echo "2. Test OpenClaw:"
echo "   Send a test message via the dashboard"
echo ""
echo "3. Connect Messaging Apps:"
echo "   - WhatsApp: See guides/07-whatsapp-setup.md"
echo "   - Telegram: See guides/08-telegram-setup.md"
echo ""
echo "4. Useful Commands:"
echo "   openclaw status   - Check if running"
echo "   openclaw logs     - View logs"
echo "   openclaw stop     - Stop OpenClaw"
echo "   openclaw restart  - Restart OpenClaw"
echo ""
echo "For help: https://docs.openclaw.ai"
echo ""
print_msg "Happy automating!"
echo ""
