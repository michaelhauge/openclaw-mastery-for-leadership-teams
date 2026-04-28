#!/bin/bash

#############################################
# OpenClaw Ubuntu/VPS Installer
# For Southeast Asia Business Leaders
#
# Supports: Ubuntu 22.04, Debian 11+
# Use on: DigitalOcean, Oracle Cloud, Contabo
#############################################

set -e  # Exit on error

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root: sudo bash install-ubuntu.sh"
    exit 1
fi

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_msg() { echo -e "${GREEN}✓${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  OpenClaw Installer for Ubuntu/VPS     ║"
echo "║  Southeast Asia Edition                ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    print_msg "Detected: $OS $VER"
else
    print_error "Cannot detect OS. This script supports Ubuntu/Debian only."
    exit 1
fi

# Update system
print_info "Updating system packages..."
apt update && apt upgrade -y
print_msg "System updated"

# Install essential tools
print_info "Installing essential tools..."
apt install -y curl git build-essential ufw
print_msg "Essential tools installed"

# Install Node.js 22
print_info "Installing Node.js 22..."
if ! command -v node &> /dev/null || [ "$(node --version | cut -d'v' -f2 | cut -d'.' -f1)" -lt 22 ]; then
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
    apt install -y nodejs
    print_msg "Node.js $(node --version) installed"
else
    print_msg "Node.js $(node --version) already installed"
fi

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
    1) LLM_PROVIDER="kimi"; LLM_MODEL="kimi/kimi-k2"; print_msg "Selected: Kimi K2" ;;
    2) LLM_PROVIDER="deepseek"; LLM_MODEL="deepseek/deepseek-chat"; print_msg "Selected: DeepSeek" ;;
    3) LLM_PROVIDER="anthropic"; LLM_MODEL="anthropic/claude-opus-4-5"; print_msg "Selected: Claude" ;;
    4) LLM_PROVIDER="custom"; LLM_MODEL="custom"; print_msg "Manual configuration required" ;;
    *) print_error "Invalid choice"; exit 1 ;;
esac

# Get API key
if [ "$llm_choice" != "3" ] && [ "$llm_choice" != "4" ]; then
    echo ""
    print_info "Enter your $LLM_PROVIDER API key:"
    read -s -p "API Key: " API_KEY
    echo ""
    if [ -z "$API_KEY" ]; then
        print_error "API key cannot be empty"
        exit 1
    fi
    print_msg "API key saved"
fi

# Install OpenClaw
print_info "Installing OpenClaw globally..."
npm install -g openclaw@latest
print_msg "OpenClaw installed: $(openclaw --version)"

# Create config directory
print_info "Creating configuration..."
mkdir -p /root/.openclaw

# Create config file
cat > /root/.openclaw/openclaw.json <<EOF
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
    "host": "0.0.0.0",
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

# Add API key to environment
if [ "$llm_choice" != "3" ] && [ "$llm_choice" != "4" ]; then
    sed -i.bak "/export ${LLM_PROVIDER^^}_API_KEY=/d" /root/.bashrc
    echo "" >> /root/.bashrc
    echo "# OpenClaw API Key" >> /root/.bashrc
    echo "export ${LLM_PROVIDER^^}_API_KEY=\"$API_KEY\"" >> /root/.bashrc
    source /root/.bashrc
    print_msg "API key added to environment"
fi

# Set up firewall
print_info "Configuring firewall..."
ufw --force disable
ufw allow 22/tcp
ufw allow 18789/tcp
ufw --force enable
print_msg "Firewall configured (SSH and OpenClaw ports open)"

# Run onboarding
print_info "Running OpenClaw setup..."
print_warning "Follow the prompts carefully"
sleep 2
openclaw onboard --install-daemon

# Start OpenClaw
print_info "Starting OpenClaw..."
openclaw start
sleep 3

# Check status
print_info "Checking status..."
openclaw status

# Print completion message
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Installation Complete!                ║"
echo "╚════════════════════════════════════════╝"
echo ""
print_msg "OpenClaw is installed and running!"
echo ""
echo "Server IP: $(curl -s ifconfig.me)"
echo "Dashboard: http://$(curl -s ifconfig.me):18789"
echo ""
print_warning "For security, access dashboard via SSH tunnel:"
echo "ssh -L 18789:localhost:18789 root@$(curl -s ifconfig.me)"
echo "Then open: http://localhost:18789"
echo ""
echo "Next Steps:"
echo "1. Connect messaging apps (WhatsApp, Telegram)"
echo "2. Test with a simple query"
echo "3. Review security settings"
echo ""
echo "Commands:"
echo "  openclaw status   - Check if running"
echo "  openclaw logs     - View logs"
echo "  openclaw restart  - Restart service"
echo "  openclaw doctor   - Security audit"
echo ""
print_msg "Happy automating!"
echo ""
