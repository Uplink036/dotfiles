#!/usr/bin/python3
import subprocess
import sys
from tempfile import TemporaryFile
with TemporaryFile() as f:
    git_process = subprocess.run(["git", "log", "--pretty=format:\"%ad\"", "--date=short"], stdout=f)
    f.seek(0)
    uniq_process = subprocess.run(["uniq", "-c"], stdin=f, stdout=subprocess.PIPE)

pipe_output = uniq_process.stdout.decode("ascii")
line_split = pipe_output.split("\n")
truncated_lines = [x.strip() for x in line_split] 

from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta
from collections import defaultdict
counts = defaultdict(int)
for item in truncated_lines[:-1]:
    parts = item.split(" ")
    count = int(parts[0])
    date = parts[1][1:-1]
    counts[date] = count

today = datetime.now()
months = []
for i in range(11, -1, -1):
    month_date = today - relativedelta(months=i)
    months.append(month_date.strftime('%Y-%m'))

monthly_counts = defaultdict(int)
for date, count in counts.items():
    month_key = date[:7]  # YYYY-MM
    monthly_counts[month_key] += count
max_count = max([monthly_counts.get(month, 0) for month in months]) or 1

help_flag = "-?" in sys.argv or "--help" in sys.argv
if help_flag:
    print("Git Status Chart - Display git commit activity")
    print()
    print("Usage: git_status.py [options]")
    print()
    print("Options:")
    print("  -v, --vertical      Show vertical table (default: horizontal chart)")
    print("  -?, --help          Show this help message")
    print()
    print("Examples:")
    print("  git_status.py       # Show horizontal chart")
    print("  git_status.py -v    # Show vertical table")
    sys.exit(0)

vertical = "--vertical" in sys.argv or "-v" in sys.argv
horizontal = not vertical 
if horizontal:
    print("Git commits per month (last 12 months):")
    print()
    chart_height = 3
    
    # Print vertical chart
    for row in range(chart_height, 0, -1):
        line = ""
        for month in months:
            count = monthly_counts.get(month, 0)
            scaled_count = int(count * chart_height / max_count)
            line += "██ " if scaled_count >= row else "   "
        print(line)
    
    # Print month names at bottom
    print("".join([f"{month[5:7]} " for month in months]))
    print(f"Max commits in a month: {max_count}")
elif vertical:
    print("Month    Commits Bar")
    print("-----    ------- ---")
    for month in months:
        count = monthly_counts.get(month, 0)
        bar = "█" * int(count * 20 / max_count)
        year = month[:4]
        print(f"{month[5:7]}/{year} {count:7d} |{bar}")
    print(f"Max commits in a month: {max_count}")

