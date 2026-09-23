#include <iostream>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "cv.h"

using std::cout;
using std::endl;

int turn;
mutex mtx;
cv cv1;


void pinger(uintptr_t) {
    int hit_pinger = 0;
    while (hit_pinger < 5) {  
        mtx.lock();
        std::cout << "ping" << std::endl;
        turn = 1;
        cv1.signal();
        while (turn != 0) {
            // unlock and wait for the ponger to finish
            cv1.wait(mtx);
            // acquire lock
        }
        hit_pinger++;
        mtx.unlock();
    }
}


void ponger(uintptr_t) {
    int hit_ponger = 0;
    while (hit_ponger < 5) {  
        mtx.lock();
        std::cout << "pong" << std::endl;
        turn = 0;
        cv1.signal();
        while (turn != 1) {
            // unlock and wait for the ponger to finish
            cv1.wait(mtx);
            // acquire lock
        }
        hit_ponger++;
        mtx.unlock();
    }
}



void parent(uintptr_t)
{
    thread* pingerthread = new thread(pinger, 0);
    thread* pongerthread = new thread(ponger, 0);
    pingerthread->join();
    pongerthread->join();
}



int main()
{
    cpu::boot(parent, 0, 1);
}