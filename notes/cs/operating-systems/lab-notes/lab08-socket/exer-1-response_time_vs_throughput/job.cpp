#include <sys/time.h>
#include <cstdint>
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>


// A compute-heavy job: summing from 1 to 100,000,000
void job() {
    volatile uint64_t sum = 0;
    for (uint64_t i = 1; i <= 100000000; ++i) {
        sum += i;
    }
}


// timed job
double timed_job() {
    struct timeval start, end;
    gettimeofday(&start, nullptr);

    job();  // 你实际做的任务

    gettimeofday(&end, nullptr);
    double seconds = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1e6;
    return seconds;
}




std::mutex mtx;
double total_response_time = 0;

void worker(int jobs_per_thread) {
    double local_total = 0;
    for (int i = 0; i < jobs_per_thread; ++i) {
        local_total += timed_job();  // 每次 job 的耗时（单位秒）
    }

    std::lock_guard<std::mutex> lock(mtx);
    total_response_time += local_total;
}
int main(int argc, char** argv) {
    int num_threads = std::stoi(argv[1]);
    int total_jobs = 64;
    int jobs_per_thread = total_jobs / num_threads;

    std::vector<std::thread> threads;

    struct timeval start, end;
    gettimeofday(&start, nullptr);

    for (int i = 0; i < num_threads; ++i) {
        threads.emplace_back(worker, jobs_per_thread);
    }
    for (auto& t : threads) t.join();

    gettimeofday(&end, nullptr);
    double total_time = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1e6;

    std::cout << "Threads: " << num_threads << "\n";
    std::cout << "Throughput: " << total_jobs / total_time << " jobs/sec\n";
    std::cout << "Avg response time: " << total_response_time / total_jobs << " sec\n";
}