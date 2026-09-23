import re
import matplotlib.pyplot as plt

# 读取 results.txt
with open("results.txt", "r") as f:
    lines = f.readlines()

# 初始化存储
threads = []
throughput = []
response_time = []

# 正则提取数字
for i in range(len(lines)):
    if lines[i].startswith("Threads:"):
        t = int(re.search(r"Threads: (\d+)", lines[i]).group(1))
        tp = float(re.search(r"Throughput: ([\d.]+)", lines[i+1]).group(1))
        rt = float(re.search(r"Avg response time: ([\d.]+)", lines[i+2]).group(1))
        threads.append(t)
        throughput.append(tp)
        response_time.append(rt)

# 打印提取确认
for t, tp, rt in zip(threads, throughput, response_time):
    print(f"{t} threads -> {tp:.2f} jobs/sec, {rt:.4f} sec")

# 画图
plt.plot(throughput, response_time, marker='o')
plt.xlabel("Throughput (jobs/sec)")
plt.ylabel("Avg Response Time (sec)")
plt.title("Response Time vs Throughput")
plt.grid(True)
plt.gca().invert_xaxis()
plt.tight_layout()

# ✅ 保存图像
plt.savefig("response_vs_throughput.png", dpi=300)
print("✅ 图像已保存到当前工作目录: response_vs_throughput.png")

f.close()






# 读取 results.txt
with open("results.txt", "r") as f:
    lines = f.readlines()

# 提取数据
threads = []
response_times = []

for i in range(len(lines)):
    if lines[i].startswith("Threads:"):
        t = int(re.search(r"Threads: (\d+)", lines[i]).group(1))
        rt = float(re.search(r"Avg response time: ([\d.]+)", lines[i+2]).group(1))
        threads.append(t)
        response_times.append(rt)

# 打印提取确认
for t, rt in zip(threads, response_times):
    print(f"{t} threads -> Avg response time: {rt:.4f} sec")

# 画图
plt.figure(figsize=(8, 5))
plt.plot(threads, response_times, marker='o')
plt.xlabel("Number of Threads")
plt.ylabel("Avg Response Time (sec)")
plt.title("Avg Response Time vs Number of Threads")
plt.grid(True)
plt.tight_layout()

# 保存图像
plt.savefig("threads_vs_response_time.png", dpi=300)
print("✅ 图像已保存为 threads_vs_response_time.png")






