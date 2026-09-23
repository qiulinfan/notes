import subprocess
from collections import defaultdict

testname = ""
output_counts = defaultdict(int)
num_runs = 100
result_file = "result_test" + testname + "_single.txt"

for i in range(num_runs):
    try:
        result = subprocess.run(
            ["./pingpong" + testname],
            capture_output=True,
            text=True,
            timeout=5
        )
        output = result.stdout.strip()
    except subprocess.TimeoutExpired as e:
        # Decode stdout/stderr safely if they are bytes
        stdout = e.stdout.decode().strip() if e.stdout else ""
        stderr = e.stderr.decode().strip() if e.stderr else ""
        combined = (stdout + "\n" + stderr).strip()
        if combined:
            output = f"[TIMEOUT]\n{combined}"
        else:
            output = "[TIMEOUT with no output]"
    except Exception as e:
        output = f"[ERROR: {e}]"
    
    output_counts[output] += 1

# 写入统计结果到文件
with open(result_file, "w") as f:
    f.write(f"--- Summary after {num_runs} runs ---\n\n")
    for output, count in sorted(output_counts.items(), key=lambda x: -x[1]):
        f.write(f"Count: {count} times\nOutput:\n{output}\n{'-'*40}\n")

print(f"\n✅ Finished. Results saved to {result_file}")
