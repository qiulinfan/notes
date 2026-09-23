#include <iostream>
#include <vector>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"

//const int NUM_THREADS = 2;
//const int NUM_ITER = 100000;
const int NUM_THREADS = 5;
const int NUM_ITER = 10000000;

int counter = 0;
mutex counter_mutex;

void child(uintptr_t arg)
{
    for (int i=0; i < NUM_ITER; i++) {
        // counter_mutex.lock();
        counter++;
        // counter_mutex.unlock();
    }
}

void parent(uintptr_t arg)
{
    std::vector<thread> threads;

    for (int i = 0; i < NUM_THREADS; i++) {
        threads.push_back(thread(child, 0));
    }

    for (auto &t : threads) {
        t.join();
    }

    std::cout << "counter = " << counter << std::endl;
}

int main()
{
    cpu::boot(parent, 0, 0);
}