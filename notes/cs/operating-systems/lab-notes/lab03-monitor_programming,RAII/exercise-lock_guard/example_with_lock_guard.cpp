#include <iostream>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "cv.h"

mutex mutex1;
cv cv1;


class lock_guard {
    mutex* mptr = nullptr;
public:
    // reference semantics: since we are operating on that existing mutex,
    // not lock copying it.
    lock_guard(mutex& m) : mptr(&m) {
        mptr->lock();
    }
    ~lock_guard() {
        if (mptr) mptr->unlock();
    }       
    
    // disallow copies, otherwise we would have to lock the mutex twice
    lock_guard(lock_guard const&) = delete;
    lock_guard& operator=(lock_guard const&) = delete;


    // allow move semantics, so we can pass it to a thread

    lock_guard(lock_guard&& other) noexcept
            : mptr { other.mptr } {
        // leaves other guard in a safe state
        other.mptr = nullptr;
        }
    lock_guard& operator=(lock_guard&& other) noexcept {
        if (this != &other) {
            mptr = other.mptr;
            other.mptr = nullptr;
        }
        return *this;
    }
};


bool child_done = false;	// global variable; shared between the two threads

void child(uintptr_t arg)
{
    auto message = reinterpret_cast<char*>(arg);
    lock_guard lg(mutex1);  // lock_guard will lock mutex1 on construction and unlock it on destruction
    std::cout << "child called with message " << message << std::endl;
    child_done = true;
    cv1.signal();
}

void parent(uintptr_t arg)
{
    {  
        lock_guard lg(mutex1);  // lock_guard will lock mutex1 on construction and unlock it on destruction
        std::cout << "parent called with arg " << arg << std::endl;
    }
    

    thread t1 (child, reinterpret_cast<uintptr_t>("test message"));
    
    {
        lock_guard lg(mutex1);  // lock_guard will lock mutex1 on construction and unlock it on destruction
        while (!child_done) {
            std::cout << "parent waiting for child to run" << std::endl;
            cv1.wait(mutex1);
        }
        std::cout << "parent finishing" << std::endl;
    }
}

int main()
{
    cpu::boot(parent, 100, 0);
}