#!/bin/bash

#############################################
# OpenClaw Health Check Script
# Verifies installation and configuration
#############################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_pass() { echo -e "${GREEN}✓ PASS${NC} $1"; }
print_fail() { echo -e "${RED}✗ FAIL${NC} $1"; }
print_warn() { echo -e "${YELLOW}⚠ WARN${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ INFO${NC} $1"; }

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  OpenClaw Health Check                 ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check 1: Node.js version
print_info "Checking Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -ge 22 ]; then
        print_pass "Node.js $(node --version)"
        ((PASS_COUNT++))
    else
        print_fail "Node.js version too old: $(node --version) (need v22+)"
        ((FAIL_COUNT++))
    fi
else
    print_fail "Node.js not installed"
    ((FAIL_COUNT++))
fi

# Check 2: OpenClaw installed
print_info "Checking OpenClaw installation..."
if command -v openclaw &> /dev/null; then
    print_pass "OpenClaw installed: $(openclaw --version)"
    ((PASS_COUNT++))
else
    print_fail "OpenClaw not installed"
    ((FAIL_COUNT++))
    echo ""
    echo "Install with: npm install -g openclaw@latest"
    exit 1
fi

# Check 3: OpenClaw running
print_info "Checking OpenClaw status..."
if openclaw status 2>&1 | grep -q "Running"; then
    print_pass "OpenClaw is running"
    ((PASS_COUNT++))
else
    print_fail "OpenClaw is not running"
    ((FAIL_COUNT++))
    echo ""
    echo "Start with: openclaw start"
fi

# Check 4: Configuration file exists
print_info "Checking configuration file..."
if [ -f ~/.openclaw/openclaw.json ]; then
    print_pass "Configuration file exists"
    ((PASS_COUNT++))
else
    print_fail "Configuration file missing: ~/.openclaw/openclaw.json"
    ((FAIL_COUNT++))
fi

# Check 5: API keys in environment
print_info "Checking API keys..."
API_KEY_FOUND=false
if [ ! -z "$KIMI_API_KEY" ]; then
    print_pass "KIMI_API_KEY is set"
    ((PASS_COUNT++))
    API_KEY_FOUND=true
elif [ ! -z "$DEEPSEEK_API_KEY" ]; then
    print_pass "DEEPSEEK_API_KEY is set"
    ((PASS_COUNT++))
    API_KEY_FOUND=true
elif [ ! -z "$ANTHROPIC_API_KEY" ]; then
    print_pass "ANTHROPIC_API_KEY is set"
    ((PASS_COUNT++))
    API_KEY_FOUND=true
elif [ ! -z "$QWEN_API_KEY" ]; then
    print_pass "QWEN_API_KEY is set"
    ((PASS_COUNT++))
    API_KEY_FOUND=true
else
    print_warn "No API key found in environment"
    ((WARN_COUNT++))
    echo "       Check your shell profile (~/.zshrc or ~/.bashrc)"
fi

# Check 6: DM Pairing enabled
print_info "Checking security settings..."
if grep -q '"dmPairing"' ~/.openclaw/openclaw.json 2>/dev/null; then
    if grep -A 1 '"dmPairing"' ~/.openclaw/openclaw.json | grep -q '"enabled": true'; then
        print_pass "DM Pairing is enabled"
        ((PASS_COUNT++))
    else
        print_warn "DM Pairing is disabled"
        ((WARN_COUNT++))
        echo "       Enable in configuration for better security"
    fi
else
    print_warn "DM Pairing configuration not found"
    ((WARN_COUNT++))
fi

# Check 7: Gateway port accessible
print_info "Checking gateway port..."
if nc -z localhost 18789 2>/dev/null; then
    print_pass "Gateway port 18789 is accessible"
    ((PASS_COUNT++))
elif command -v nc &> /dev/null; then
    print_fail "Gateway port 18789 is not accessible"
    ((FAIL_COUNT++))
else
    print_warn "Cannot test port (nc not installed)"
    ((WARN_COUNT++))
fi

# Check 8: Disk space
print_info "Checking disk space..."
AVAILABLE_GB=$(df ~ | tail -1 | awk '{print int($4/1024/1024)}')
if [ "$AVAILABLE_GB" -gt 5 ]; then
    print_pass "Sufficient disk space: ${AVAILABLE_GB}GB available"
    ((PASS_COUNT++))
elif [ "$AVAILABLE_GB" -gt 1 ]; then
    print_warn "Low disk space: ${AVAILABLE_GB}GB available"
    ((WARN_COUNT++))
else
    print_fail "Very low disk space: ${AVAILABLE_GB}GB available"
    ((FAIL_COUNT++))
fi

# Check 9: Messaging channels
print_info "Checking messaging channels..."
CHANNELS_ENABLED=0
if grep -q '"whatsapp"' ~/.openclaw/openclaw.json 2>/dev/null; then
    if grep -A 1 '"whatsapp"' ~/.openclaw/openclaw.json | grep -q '"enabled": true'; then
        print_pass "WhatsApp channel configured"
        ((CHANNELS_ENABLED++))
    fi
fi
if grep -q '"telegram"' ~/.openclaw/openclaw.json 2>/dev/null; then
    if grep -A 1 '"telegram"' ~/.openclaw/openclaw.json | grep -q '"enabled": true'; then
        print_pass "Telegram channel configured"
        ((CHANNELS_ENABLED++))
    fi
fi
if [ "$CHANNELS_ENABLED" -eq 0 ]; then
    print_warn "No messaging channels enabled"
    ((WARN_COUNT++))
    echo "       Set up WhatsApp or Telegram to use OpenClaw"
fi

# Check 10: Recent errors in logs
print_info "Checking recent logs..."
if [ -d ~/.openclaw/logs ]; then
    RECENT_ERRORS=$(grep -i "error" ~/.openclaw/logs/*.log 2>/dev/null | tail -5 | wc -l)
    if [ "$RECENT_ERRORS" -eq 0 ]; then
        print_pass "No recent errors in logs"
        ((PASS_COUNT++))
    else
        print_warn "Found $RECENT_ERRORS recent errors in logs"
        ((WARN_COUNT++))
        echo "       Check logs with: openclaw logs"
    fi
else
    print_warn "Log directory not found"
    ((WARN_COUNT++))
fi

# Summary
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Health Check Summary                  ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo -e "  ${GREEN}Passed:${NC}  $PASS_COUNT"
echo -e "  ${YELLOW}Warnings:${NC} $WARN_COUNT"
echo -e "  ${RED}Failed:${NC}  $FAIL_COUNT"
echo ""

# Overall status
TOTAL_CHECKS=$((PASS_COUNT + WARN_COUNT + FAIL_COUNT))
SUCCESS_RATE=$((PASS_COUNT * 100 / TOTAL_CHECKS))

if [ "$FAIL_COUNT" -eq 0 ] && [ "$WARN_COUNT" -eq 0 ]; then
    echo -e "${GREEN}✓ All systems operational!${NC}"
    echo ""
    echo "OpenClaw is healthy and ready to use."
    EXIT_CODE=0
elif [ "$FAIL_COUNT" -eq 0 ]; then
    echo -e "${YELLOW}⚠ Minor issues detected${NC}"
    echo ""
    echo "OpenClaw is working but has some warnings."
    echo "Review warnings above for optimization suggestions."
    EXIT_CODE=0
else
    echo -e "${RED}✗ Critical issues detected${NC}"
    echo ""
    echo "OpenClaw has problems that need attention."
    echo "Fix failed checks above before using."
    EXIT_CODE=1
fi

echo ""
echo "For detailed diagnostics, run: openclaw doctor"
echo ""

exit $EXIT_CODE
