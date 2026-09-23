#include <iostream>
#include <vector>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "semaphore.h"


int total_num_runners = 8;

semaphore ready = 0;    // how many runners have been ready
semaphore started = 0;  // how many runners have started


void runner(uintptr_t) {
    ready.up(); // 抵消掉一次 down, 
    started.down();
}

void starter(uintptr_t) {
    for (int i = 0; i < total_num_runners; i++) {
        ready.down();   // 卡 N 次, 必须等到 N 个 runners 全部 ready (call 了 N 次 runner 并运行完 ready) 才继续
    }
    std::cout << total_num_runners << " runners are ready, now starting them" << std::endl;
    for (int i = 0; i < total_num_runners; i++) {
        started.up();  // 这里有 N 个人在 call down, 每次 started.up 抵消掉一个, 最后让每个 runner 都能继续运行
    }
    std::cout << "All runners started" << std::endl;
}


void parent(uintptr_t arg)
{
    for (int i = 0; i < total_num_runners; i++) {
        new thread(runner, 0); // 创建 N 个 runner
    }
    thread* start = new thread(starter, 0);
    start->join();
}

int main()
{
    cpu::boot(parent, 0, 0);
}