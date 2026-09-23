#!/bin/bash

# 设置源文件和目标程序名
SRC="job.cpp"
OUT="job_exec"

# 编译，启用 C++11/17，链接 pthread
echo "[*] Compiling $SRC ..."
g++ -std=c++17 -O2 -pthread "$SRC" -o "$OUT"
if [ $? -ne 0 ]; then
    echo "[!] Compilation failed."
    exit 1
fi

# 线程数量列表
THREAD_COUNTS=(1 2 4 8 16 32 64)

# 清空旧结果
echo "[*] Running experiments..."
echo "# Threads | Throughput (jobs/sec) | Avg Response Time (sec)" > results.txt

# 依次运行不同线程数
for n in "${THREAD_COUNTS[@]}"; do
    echo -e "\n[*] Running with $n thread(s):"
    ./job_exec "$n" | tee -a results.txt
done

echo -e "\n[+] Done. Results saved to results.txt"
