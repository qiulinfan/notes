#include <iostream>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "cv.h"

mutex mutex1;
cv cv1;

bool child_done = false;	// global variable; shared between the two threads

void child(uintptr_t arg)
{
    auto message = reinterpret_cast<char*>(arg);

    mutex1.lock();
    std::cout << "child called with message " << message << std::endl;
    child_done = true;
    cv1.signal();
    mutex1.unlock();
}

void parent(uintptr_t arg)
{
    mutex1.lock();
    std::cout << "parent called with arg " << arg << std::endl;
    mutex1.unlock();

    thread t1 (child, reinterpret_cast<uintptr_t>("test message"));

    mutex1.lock();
    while (!child_done) {
        std::cout << "parent waiting for child to run" << std::endl;
        cv1.wait(mutex1);
    }
    std::cout << "parent finishing" << std::endl;
    mutex1.unlock();
}

int main()
{
    cpu::boot(parent, 100, 0);
}