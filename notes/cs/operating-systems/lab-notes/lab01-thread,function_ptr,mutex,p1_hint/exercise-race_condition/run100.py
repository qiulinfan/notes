import subprocess
from collections import Counter

num_runs = 5
results = []

for i in range(num_runs):
    try:
        output = subprocess.check_output(["./race_safe"], text=True).strip()
        results.append(output)
    except subprocess.CalledProcessError as e:
        print(f"Run {i+1}: Error occurred:\n{e}")

# 统计出现频率
counter = Counter(results)

# 写入文件
with open("run100_safe.result", "w") as f:
    f.write(f"== Result summary after {num_runs} runs ==\n")
    for result, count in counter.items():
        f.write(f"{result}: {count} times\n")

print("✅ Result saved to run100_safe.result")
