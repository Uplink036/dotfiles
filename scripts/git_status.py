#!/usr/bin/python3
import subprocess
#result = subprocess.run(["git", "log", "--pretty=format:\"%ad\"", "--date=short"], stdout=subprocess.PIPE)
from tempfile import TemporaryFile
with TemporaryFile() as f:
    git_process = subprocess.run(["git", "log", "--pretty=format:\"%ad\"", "--date=short"], stdout=f)
    f.seek(0)
    uniq_process = subprocess.run(
        ["uniq", "-c"], stdin=f, stdout=subprocess.PIPE
    )
pipe_output = uniq_process.stdout.decode("ascii")
line_split = pipe_output.split("\n")
truncated_lines = [x.strip() for x in line_split] 

from datetime import datetime, timedelta
from collections import defaultdict
counts = defaultdict(int)
for item in truncated_lines[:-1]:
    parts = item.split(" ")
    count = int(parts[0])
    date = parts[1][1:-1]
    counts[date] = count

today = datetime.now()
dates = [(today - timedelta(days=i)).strftime('%Y-%m-%d') for i in range(23, -1, -1)]

print(counts)
max_count = 10
for date in dates:
    count = counts.get(date, 0)
    bar = '|' * int(count*20/ max_count)
    print(f"{date} {count:2d} | {bar}")

