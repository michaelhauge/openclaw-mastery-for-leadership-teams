#!/usr/bin/env python3
"""
AI ROI Calculator

Calculates return on investment for AI tools based on time savings and costs.
Generates CSV report that can be opened in Excel or Google Sheets.

Usage:
    python roi-calculator.py --users 10 --tool-cost 20 --time-saved 5
    python roi-calculator.py --config roi-config.json
    python roi-calculator.py --interactive

Requirements:
    Python 3.7+
    No external dependencies (uses standard library only)
"""

import argparse
import json
import csv
import sys
from datetime import datetime
from pathlib import Path


class AIROICalculator:
    """Calculate ROI for AI tool implementation"""

    def __init__(self, num_users, monthly_tool_cost_per_user, hours_saved_per_week_per_user,
                 hourly_rate=50, weeks_per_year=52, implementation_hours=0, training_hours_per_user=3):
        """
        Initialize calculator with parameters

        Args:
            num_users: Number of employees using AI tools
            monthly_tool_cost_per_user: Cost per user per month (e.g., $20 for ChatGPT Plus)
            hours_saved_per_week_per_user: Average hours saved per week per person
            hourly_rate: Average employee hourly rate (for calculating value of time)
            weeks_per_year: Weeks per year (default 52)
            implementation_hours: One-time setup/implementation hours
            training_hours_per_user: Hours spent training each user initially
        """
        self.num_users = num_users
        self.monthly_tool_cost_per_user = monthly_tool_cost_per_user
        self.hours_saved_per_week_per_user = hours_saved_per_week_per_user
        self.hourly_rate = hourly_rate
        self.weeks_per_year = weeks_per_year
        self.implementation_hours = implementation_hours
        self.training_hours_per_user = training_hours_per_user

    def calculate_annual_costs(self):
        """Calculate total annual costs"""
        tool_cost = self.monthly_tool_cost_per_user * self.num_users * 12
        implementation_cost = self.implementation_hours * self.hourly_rate
        training_cost = self.training_hours_per_user * self.num_users * self.hourly_rate
        total_cost = tool_cost + implementation_cost + training_cost

        return {
            'tool_cost_annual': tool_cost,
            'implementation_cost_one_time': implementation_cost,
            'training_cost_one_time': training_cost,
            'total_year_1': total_cost,
            'total_year_2_plus': tool_cost  # Only ongoing tool costs
        }

    def calculate_annual_benefits(self):
        """Calculate total annual benefits from time savings"""
        hours_saved_per_user_per_year = self.hours_saved_per_week_per_user * self.weeks_per_year
        total_hours_saved = hours_saved_per_user_per_year * self.num_users
        value_of_time_saved = total_hours_saved * self.hourly_rate

        return {
            'hours_saved_per_user_per_week': self.hours_saved_per_week_per_user,
            'hours_saved_per_user_per_year': hours_saved_per_user_per_year,
            'total_hours_saved_per_year': total_hours_saved,
            'value_of_time_saved_annual': value_of_time_saved
        }

    def calculate_roi(self):
        """Calculate ROI metrics"""
        costs = self.calculate_annual_costs()
        benefits = self.calculate_annual_benefits()

        # Year 1 ROI (includes one-time costs)
        net_benefit_year_1 = benefits['value_of_time_saved_annual'] - costs['total_year_1']
        roi_year_1 = (net_benefit_year_1 / costs['total_year_1']) * 100 if costs['total_year_1'] > 0 else 0
        roi_multiple_year_1 = benefits['value_of_time_saved_annual'] / costs['total_year_1'] if costs['total_year_1'] > 0 else 0

        # Year 2+ ROI (only ongoing costs)
        net_benefit_year_2_plus = benefits['value_of_time_saved_annual'] - costs['total_year_2_plus']
        roi_year_2_plus = (net_benefit_year_2_plus / costs['total_year_2_plus']) * 100 if costs['total_year_2_plus'] > 0 else 0
        roi_multiple_year_2_plus = benefits['value_of_time_saved_annual'] / costs['total_year_2_plus'] if costs['total_year_2_plus'] > 0 else 0

        # Payback period (months to break even)
        monthly_benefit = benefits['value_of_time_saved_annual'] / 12
        monthly_cost = costs['total_year_2_plus'] / 12
        net_monthly = monthly_benefit - monthly_cost

        if net_monthly > 0:
            payback_months = costs['implementation_cost_one_time'] + costs['training_cost_one_time']
            payback_months = payback_months / net_monthly
        else:
            payback_months = float('inf')

        return {
            'year_1': {
                'total_cost': costs['total_year_1'],
                'total_benefit': benefits['value_of_time_saved_annual'],
                'net_benefit': net_benefit_year_1,
                'roi_percentage': roi_year_1,
                'roi_multiple': roi_multiple_year_1
            },
            'year_2_plus': {
                'annual_cost': costs['total_year_2_plus'],
                'annual_benefit': benefits['value_of_time_saved_annual'],
                'net_benefit': net_benefit_year_2_plus,
                'roi_percentage': roi_year_2_plus,
                'roi_multiple': roi_multiple_year_2_plus
            },
            'payback_period_months': payback_months
        }

    def generate_report(self):
        """Generate complete ROI report"""
        costs = self.calculate_annual_costs()
        benefits = self.calculate_annual_benefits()
        roi = self.calculate_roi()

        return {
            'metadata': {
                'generated_at': datetime.now().isoformat(),
                'num_users': self.num_users,
                'monthly_cost_per_user': self.monthly_tool_cost_per_user,
                'hourly_rate': self.hourly_rate,
                'hours_saved_per_week_per_user': self.hours_saved_per_week_per_user
            },
            'costs': costs,
            'benefits': benefits,
            'roi': roi
        }


def print_report(report):
    """Print formatted report to console"""
    print("\n" + "="*70)
    print("AI TOOL ROI ANALYSIS REPORT")
    print("="*70)

    meta = report['metadata']
    print(f"\nGenerated: {meta['generated_at']}")
    print(f"Number of Users: {meta['num_users']}")
    print(f"Tool Cost: ${meta['monthly_cost_per_user']}/user/month")
    print(f"Average Hourly Rate: ${meta['hourly_rate']}/hour")
    print(f"Time Saved: {meta['hours_saved_per_week_per_user']} hours/week/user")

    print("\n" + "-"*70)
    print("ANNUAL COSTS")
    print("-"*70)
    costs = report['costs']
    print(f"AI Tool Licenses:        ${costs['tool_cost_annual']:>12,.2f}/year")
    print(f"Implementation (one-time): ${costs['implementation_cost_one_time']:>10,.2f}")
    print(f"Training (one-time):     ${costs['training_cost_one_time']:>12,.2f}")
    print(f"Year 1 Total:            ${costs['total_year_1']:>12,.2f}")
    print(f"Year 2+ Annual:          ${costs['total_year_2_plus']:>12,.2f}")

    print("\n" + "-"*70)
    print("ANNUAL BENEFITS")
    print("-"*70)
    benefits = report['benefits']
    print(f"Hours Saved/User/Week:   {benefits['hours_saved_per_user_per_week']:>12.1f}")
    print(f"Hours Saved/User/Year:   {benefits['hours_saved_per_user_per_year']:>12.0f}")
    print(f"Total Hours Saved/Year:  {benefits['total_hours_saved_per_year']:>12.0f}")
    print(f"Value of Time Saved:     ${benefits['value_of_time_saved_annual']:>12,.2f}/year")

    print("\n" + "-"*70)
    print("RETURN ON INVESTMENT")
    print("-"*70)
    roi = report['roi']

    print("\nYear 1 (includes one-time costs):")
    print(f"  Investment:            ${roi['year_1']['total_cost']:>12,.2f}")
    print(f"  Benefit:               ${roi['year_1']['total_benefit']:>12,.2f}")
    print(f"  Net Benefit:           ${roi['year_1']['net_benefit']:>12,.2f}")
    print(f"  ROI:                   {roi['year_1']['roi_percentage']:>12,.0f}%")
    print(f"  ROI Multiple:          {roi['year_1']['roi_multiple']:>12.1f}x")

    print("\nYear 2+ (ongoing costs only):")
    print(f"  Annual Cost:           ${roi['year_2_plus']['annual_cost']:>12,.2f}")
    print(f"  Annual Benefit:        ${roi['year_2_plus']['annual_benefit']:>12,.2f}")
    print(f"  Net Benefit:           ${roi['year_2_plus']['net_benefit']:>12,.2f}")
    print(f"  ROI:                   {roi['year_2_plus']['roi_percentage']:>12,.0f}%")
    print(f"  ROI Multiple:          {roi['year_2_plus']['roi_multiple']:>12.1f}x")

    payback = roi['payback_period_months']
    if payback < float('inf'):
        print(f"\nPayback Period:          {payback:>12.1f} months")
    else:
        print(f"\nPayback Period:          Never (costs exceed benefits)")

    print("\n" + "="*70)
    print()


def save_to_csv(report, filename='ai-roi-analysis.csv'):
    """Save report to CSV file"""
    filepath = Path(filename)

    with open(filepath, 'w', newline='') as f:
        writer = csv.writer(f)

        # Metadata
        writer.writerow(['AI Tool ROI Analysis'])
        writer.writerow(['Generated', report['metadata']['generated_at']])
        writer.writerow([''])

        # Input Parameters
        writer.writerow(['INPUT PARAMETERS'])
        writer.writerow(['Number of Users', report['metadata']['num_users']])
        writer.writerow(['Monthly Cost per User', f"${report['metadata']['monthly_cost_per_user']}"])
        writer.writerow(['Hours Saved per Week per User', report['metadata']['hours_saved_per_week_per_user']])
        writer.writerow(['Average Hourly Rate', f"${report['metadata']['hourly_rate']}"])
        writer.writerow([''])

        # Costs
        writer.writerow(['ANNUAL COSTS'])
        costs = report['costs']
        writer.writerow(['AI Tool Licenses (annual)', f"${costs['tool_cost_annual']:,.2f}"])
        writer.writerow(['Implementation Cost (one-time)', f"${costs['implementation_cost_one_time']:,.2f}"])
        writer.writerow(['Training Cost (one-time)', f"${costs['training_cost_one_time']:,.2f}"])
        writer.writerow(['Total Year 1 Cost', f"${costs['total_year_1']:,.2f}"])
        writer.writerow(['Total Year 2+ Annual Cost', f"${costs['total_year_2_plus']:,.2f}"])
        writer.writerow([''])

        # Benefits
        writer.writerow(['ANNUAL BENEFITS'])
        benefits = report['benefits']
        writer.writerow(['Hours Saved per User per Week', benefits['hours_saved_per_user_per_week']])
        writer.writerow(['Hours Saved per User per Year', benefits['hours_saved_per_user_per_year']])
        writer.writerow(['Total Hours Saved per Year', benefits['total_hours_saved_per_year']])
        writer.writerow(['Value of Time Saved (annual)', f"${benefits['value_of_time_saved_annual']:,.2f}"])
        writer.writerow([''])

        # ROI
        writer.writerow(['RETURN ON INVESTMENT'])
        roi = report['roi']

        writer.writerow(['Year 1 (with one-time costs)'])
        writer.writerow(['  Total Cost', f"${roi['year_1']['total_cost']:,.2f}"])
        writer.writerow(['  Total Benefit', f"${roi['year_1']['total_benefit']:,.2f}"])
        writer.writerow(['  Net Benefit', f"${roi['year_1']['net_benefit']:,.2f}"])
        writer.writerow(['  ROI Percentage', f"{roi['year_1']['roi_percentage']:.0f}%"])
        writer.writerow(['  ROI Multiple', f"{roi['year_1']['roi_multiple']:.1f}x"])
        writer.writerow([''])

        writer.writerow(['Year 2+ (ongoing costs only)'])
        writer.writerow(['  Annual Cost', f"${roi['year_2_plus']['annual_cost']:,.2f}"])
        writer.writerow(['  Annual Benefit', f"${roi['year_2_plus']['annual_benefit']:,.2f}"])
        writer.writerow(['  Net Benefit', f"${roi['year_2_plus']['net_benefit']:,.2f}"])
        writer.writerow(['  ROI Percentage', f"{roi['year_2_plus']['roi_percentage']:.0f}%"])
        writer.writerow(['  ROI Multiple', f"{roi['year_2_plus']['roi_multiple']:.1f}x"])
        writer.writerow([''])

        payback = roi['payback_period_months']
        if payback < float('inf'):
            writer.writerow(['Payback Period (months)', f"{payback:.1f}"])
        else:
            writer.writerow(['Payback Period', 'Never'])

    print(f"✅ Report saved to: {filepath.absolute()}")


def interactive_mode():
    """Run calculator in interactive mode"""
    print("\n" + "="*70)
    print("AI ROI CALCULATOR - Interactive Mode")
    print("="*70)
    print("\nAnswer the following questions to calculate your AI tool ROI:\n")

    # Get inputs
    while True:
        try:
            num_users = int(input("Number of employees who will use AI tools: "))
            if num_users > 0:
                break
            print("Please enter a positive number.")
        except ValueError:
            print("Please enter a valid number.")

    while True:
        try:
            monthly_cost = float(input("Monthly cost per user (e.g., 20 for ChatGPT Plus): $"))
            if monthly_cost >= 0:
                break
            print("Please enter a non-negative number.")
        except ValueError:
            print("Please enter a valid number.")

    while True:
        try:
            hours_saved = float(input("Estimated hours saved per week per user (e.g., 3-5): "))
            if hours_saved >= 0:
                break
            print("Please enter a non-negative number.")
        except ValueError:
            print("Please enter a valid number.")

    while True:
        try:
            hourly_rate = float(input("Average employee hourly rate (e.g., 50): $"))
            if hourly_rate > 0:
                break
            print("Please enter a positive number.")
        except ValueError:
            print("Please enter a valid number.")

    # Optional advanced inputs
    advanced = input("\nInclude implementation and training costs? (y/n): ").lower().strip() == 'y'

    if advanced:
        while True:
            try:
                impl_hours = float(input("Implementation hours (setup, configuration): "))
                if impl_hours >= 0:
                    break
                print("Please enter a non-negative number.")
            except ValueError:
                print("Please enter a valid number.")

        while True:
            try:
                training_hours = float(input("Training hours per user (e.g., 3 for 3-hour training): "))
                if training_hours >= 0:
                    break
                print("Please enter a non-negative number.")
            except ValueError:
                print("Please enter a valid number.")
    else:
        impl_hours = 0
        training_hours = 3  # Default

    # Calculate and display
    calc = AIROICalculator(
        num_users=num_users,
        monthly_tool_cost_per_user=monthly_cost,
        hours_saved_per_week_per_user=hours_saved,
        hourly_rate=hourly_rate,
        implementation_hours=impl_hours,
        training_hours_per_user=training_hours
    )

    report = calc.generate_report()
    print_report(report)

    # Save option
    save = input("Save report to CSV? (y/n): ").lower().strip()
    if save == 'y':
        filename = input("Filename (default: ai-roi-analysis.csv): ").strip()
        if not filename:
            filename = 'ai-roi-analysis.csv'
        save_to_csv(report, filename)


def main():
    parser = argparse.ArgumentParser(
        description='Calculate ROI for AI tool implementation',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --users 10 --tool-cost 20 --time-saved 5
  %(prog)s --users 50 --tool-cost 20 --time-saved 3 --hourly-rate 60
  %(prog)s --interactive
  %(prog)s --config roi-config.json
        """
    )

    parser.add_argument('--users', type=int, help='Number of users')
    parser.add_argument('--tool-cost', type=float, help='Monthly cost per user')
    parser.add_argument('--time-saved', type=float, help='Hours saved per week per user')
    parser.add_argument('--hourly-rate', type=float, default=50, help='Hourly rate (default: $50)')
    parser.add_argument('--implementation-hours', type=float, default=0, help='Implementation hours (default: 0)')
    parser.add_argument('--training-hours', type=float, default=3, help='Training hours per user (default: 3)')
    parser.add_argument('--output', help='Output CSV filename')
    parser.add_argument('--interactive', action='store_true', help='Run in interactive mode')
    parser.add_argument('--config', help='Load parameters from JSON config file')

    args = parser.parse_args()

    # Interactive mode
    if args.interactive:
        interactive_mode()
        return

    # Config file mode
    if args.config:
        try:
            with open(args.config, 'r') as f:
                config = json.load(f)

            calc = AIROICalculator(
                num_users=config['num_users'],
                monthly_tool_cost_per_user=config['monthly_cost_per_user'],
                hours_saved_per_week_per_user=config['hours_saved_per_week_per_user'],
                hourly_rate=config.get('hourly_rate', 50),
                implementation_hours=config.get('implementation_hours', 0),
                training_hours_per_user=config.get('training_hours_per_user', 3)
            )
        except FileNotFoundError:
            print(f"Error: Config file '{args.config}' not found")
            sys.exit(1)
        except json.JSONDecodeError:
            print(f"Error: Config file '{args.config}' is not valid JSON")
            sys.exit(1)
        except KeyError as e:
            print(f"Error: Config file missing required key: {e}")
            sys.exit(1)

    # Command line mode
    elif args.users and args.tool_cost and args.time_saved:
        calc = AIROICalculator(
            num_users=args.users,
            monthly_tool_cost_per_user=args.tool_cost,
            hours_saved_per_week_per_user=args.time_saved,
            hourly_rate=args.hourly_rate,
            implementation_hours=args.implementation_hours,
            training_hours_per_user=args.training_hours
        )
    else:
        print("Error: Must provide --users, --tool-cost, and --time-saved, OR use --interactive, OR use --config")
        parser.print_help()
        sys.exit(1)

    # Generate and print report
    report = calc.generate_report()
    print_report(report)

    # Save to CSV if requested
    if args.output:
        save_to_csv(report, args.output)


if __name__ == '__main__':
    main()
