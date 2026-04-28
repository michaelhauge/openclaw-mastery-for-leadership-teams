#!/bin/bash

#############################################
# OpenClaw Cost Calculator
# Estimate monthly costs for your setup
#############################################

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  OpenClaw Cost Calculator              ║"
echo "║  Monthly Cost Estimator for SEA        ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Hosting selection
echo -e "${BLUE}Step 1: Select Hosting Option${NC}"
echo ""
echo "  1) Local Mac (Existing Mac)"
echo "  2) Oracle Cloud Free Tier"
echo "  3) DigitalOcean Basic Droplet"
echo "  4) Contabo VPS S"
echo ""
read -p "Enter choice [1-4]: " hosting_choice

case $hosting_choice in
    1) hosting_name="Local Mac"; hosting_cost=5 ;;
    2) hosting_name="Oracle Cloud Free"; hosting_cost=0 ;;
    3) hosting_name="DigitalOcean Basic"; hosting_cost=6 ;;
    4) hosting_name="Contabo VPS S"; hosting_cost=5.50 ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

echo -e "${GREEN}✓${NC} Selected: $hosting_name"

# LLM selection
echo ""
echo -e "${BLUE}Step 2: Select LLM Provider${NC}"
echo ""
echo "  1) Kimi K2 (Recommended)"
echo "  2) DeepSeek"
echo "  3) Qwen 2.5 Coder"
echo "  4) Claude Pro"
echo ""
read -p "Enter choice [1-4]: " llm_choice

case $llm_choice in
    1) llm_name="Kimi K2"; llm_min=10; llm_max=20 ;;
    2) llm_name="DeepSeek"; llm_min=3; llm_max=8 ;;
    3) llm_name="Qwen Coder"; llm_min=1; llm_max=5 ;;
    4) llm_name="Claude Pro"; llm_min=20; llm_max=20 ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

echo -e "${GREEN}✓${NC} Selected: $llm_name"

# Usage level
echo ""
echo -e "${BLUE}Step 3: Select Usage Level${NC}"
echo ""
echo "  1) Light (5-10 queries/day, email summaries)"
echo "  2) Medium (20-30 queries/day, regular automation)"
echo "  3) Heavy (50+ queries/day, extensive automation)"
echo ""
read -p "Enter choice [1-3]: " usage_choice

case $usage_choice in
    1) usage_name="Light"; usage_mult=0.5 ;;
    2) usage_name="Medium"; usage_mult=1.0 ;;
    3) usage_name="Heavy"; usage_mult=1.5 ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

echo -e "${GREEN}✓${NC} Selected: $usage_name usage"

# Calculate costs
llm_cost_min=$(echo "$llm_min * $usage_mult" | bc)
llm_cost_max=$(echo "$llm_max * $usage_mult" | bc)

total_min=$(echo "$hosting_cost + $llm_cost_min" | bc)
total_max=$(echo "$hosting_cost + $llm_cost_max" | bc)

# Optional add-ons
backup_cost=0
echo ""
echo -e "${BLUE}Step 4: Optional Add-ons${NC}"
echo ""
read -p "Enable automatic backups? (+$1.50/month) [y/N]: " backup
if [[ $backup =~ ^[Yy]$ ]]; then
    backup_cost=1.50
    total_min=$(echo "$total_min + $backup_cost" | bc)
    total_max=$(echo "$total_max + $backup_cost" | bc)
    echo -e "${GREEN}✓${NC} Backups enabled"
fi

# Display results
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Cost Breakdown                        ║"
echo "╚════════════════════════════════════════╝"
echo ""

printf "%-25s %s\n" "Component" "Monthly Cost (USD)"
echo "──────────────────────────────────────────"
printf "%-25s \$%.2f\n" "Hosting ($hosting_name)" "$hosting_cost"
printf "%-25s \$%.2f - \$%.2f\n" "LLM ($llm_name)" "$llm_cost_min" "$llm_cost_max"

if (( $(echo "$backup_cost > 0" | bc -l) )); then
    printf "%-25s \$%.2f\n" "Backups" "$backup_cost"
fi

echo "──────────────────────────────────────────"
printf "%-25s \$%.2f - \$%.2f\n" "TOTAL PER MONTH" "$total_min" "$total_max"
echo ""

# Annual cost
annual_min=$(echo "$total_min * 12" | bc)
annual_max=$(echo "$total_max * 12" | bc)
printf "%-25s \$%.2f - \$%.2f\n" "TOTAL PER YEAR" "$annual_min" "$annual_max"
echo ""

# ROI Analysis
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo -e "${CYAN}ROI Analysis${NC}"
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo ""
echo "Estimated time saved per month:"
echo "  Email management:     5 hours"
echo "  Document processing:  3 hours"
echo "  Research:             4 hours"
echo "  Meeting prep:         3 hours"
echo "  ─────────────────────────────"
echo "  Total:               15 hours/month"
echo ""

# Ask for hourly rate
read -p "Your hourly rate (USD): \$" hourly_rate

if [[ $hourly_rate =~ ^[0-9]+$ ]] && [ $hourly_rate -gt 0 ]; then
    value_saved=$(echo "$hourly_rate * 15" | bc)
    roi_min=$(echo "($value_saved - $total_max) / $total_max * 100" | bc)
    roi_max=$(echo "($value_saved - $total_min) / $total_min * 100" | bc)
    payback_min=$(echo "$total_min / ($value_saved / 30)" | bc)
    payback_max=$(echo "$total_max / ($value_saved / 30)" | bc)

    echo ""
    printf "Value of time saved:    \$%.2f/month\n" "$value_saved"
    printf "Net savings:            \$%.2f - \$%.2f/month\n" "$(echo "$value_saved - $total_max" | bc)" "$(echo "$value_saved - $total_min" | bc)"
    printf "ROI:                    %d%% - %d%%\n" "$roi_min" "$roi_max"
    printf "Payback period:         %.1f - %.1f days\n" "$payback_min" "$payback_max"
    echo ""

    if (( $(echo "$value_saved > $total_max" | bc -l) )); then
        echo -e "${GREEN}✓ Strong ROI${NC} - OpenClaw pays for itself!"
    else
        echo -e "${YELLOW}⚠ Marginal ROI${NC} - Consider your use case carefully"
    fi
fi

echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Cost Optimization Tips                ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Optimization tips based on selections
if [ "$hosting_choice" != "2" ]; then
    echo -e "${YELLOW}💡 Tip:${NC} Oracle Cloud Free Tier could save you \$$(echo "$hosting_cost * 12" | bc)/year"
fi

if [ "$llm_choice" != "2" ]; then
    echo -e "${YELLOW}💡 Tip:${NC} DeepSeek is 70-90% cheaper than $llm_name"
fi

if [ "$usage_choice" == "3" ]; then
    echo -e "${YELLOW}💡 Tip:${NC} Enable caching on Kimi K2 for 75% savings on repeated queries"
fi

echo -e "${YELLOW}💡 Tip:${NC} Set spending limits at LLM provider to control costs"
echo -e "${YELLOW}💡 Tip:${NC} Start with Light usage, scale up as needed"

echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Cost Comparison                       ║"
echo "╚════════════════════════════════════════╝"
echo ""
printf "%-25s %s\n" "Service" "Monthly Cost"
echo "──────────────────────────────────────────"
printf "%-25s \$%.2f - \$%.2f\n" "Your OpenClaw Setup" "$total_min" "$total_max"
printf "%-25s \$20.00\n" "ChatGPT Plus"
printf "%-25s \$20.00\n" "Claude Pro"
printf "%-25s \$10.00\n" "GitHub Copilot"
printf "%-25s \$30.00+\n" "Zapier"
echo ""

# Save configuration
echo ""
read -p "Save this configuration for reference? [y/N]: " save_config
if [[ $save_config =~ ^[Yy]$ ]]; then
    cat > ~/openclaw-cost-estimate.txt <<EOF
OpenClaw Cost Estimate
Generated: $(date)

Hosting: $hosting_name (\$$hosting_cost/month)
LLM: $llm_name (\$$llm_cost_min - \$$llm_cost_max/month)
Usage Level: $usage_name
Backups: $([ "$backup_cost" != "0" ] && echo "Enabled (+\$$backup_cost/month)" || echo "Disabled")

Total Monthly Cost: \$$total_min - \$$total_max
Total Annual Cost: \$$annual_min - \$$annual_max

$(if [[ $hourly_rate =~ ^[0-9]+$ ]]; then
    echo "ROI Analysis:"
    echo "  Hourly rate: \$$hourly_rate"
    echo "  Monthly value: \$$value_saved"
    echo "  Net savings: \$$(echo "$value_saved - $total_max" | bc) - \$$(echo "$value_saved - $total_min" | bc)/month"
fi)
EOF
    echo -e "${GREEN}✓${NC} Configuration saved to: ~/openclaw-cost-estimate.txt"
fi

echo ""
echo -e "${GREEN}Done!${NC} Use this estimate to plan your OpenClaw deployment."
echo ""
