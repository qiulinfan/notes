#include <iostream>
#include <vector>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "semaphore.h"


//semaphore mtx;
semaphore ping_s(0);
semaphore pong_s(0);
semaphore who_start(1);
bool first = true;


void ping(uintptr_t) {
    bool am_i_first = false;
    int hit_count = 0;

    who_start.down();
    // whoever (ping/pong?) first gets the who_start lock, is the starter
    if (first) {    // the other guy does not change it? I am the first
        am_i_first = true;
        first = false;
    }
    who_start.up();


    if (am_i_first) {
        ping_s = 1;
    }

    while (hit_count < 5) {
        ping_s.down();
        std::cout << "ping" << std::endl;
        hit_count++;
        // let pong do it
        pong_s.up();
    }
}

void pong(uintptr_t) {
    bool am_i_first = false;
    int hit_count = 0;

    who_start.down();
    // whoever (ping/pong?) first gets the who_start lock, is the starter
    if (first) {    // the other guy does not change it? I am the first
        am_i_first = true;
        first = false;
    }
    who_start.up();

    if (am_i_first) {
        pong_s = 1;
    }

    while (hit_count < 5) {
        // now we can pong
        pong_s.down();
        std::cout << "pong" << std::endl;
        hit_count++;
        // let ping do it
        ping_s.up();
    }
}

void parent(uintptr_t arg)
{
    thread* t1 = new thread(ping, 0);
    thread* t2 = new thread(pong, 0);
    t1->join();
    t2->join();
}

int main()
{
    cpu::boot(parent, 0, 0);
}