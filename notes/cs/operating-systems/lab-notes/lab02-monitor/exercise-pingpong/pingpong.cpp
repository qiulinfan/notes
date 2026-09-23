// congrats on being correct!
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
    int hit = 0;
    mtx.lock();
    while (hit < 5) {  
        // pinger turn
        turn = 1;
        hit++;
        std::cout << "Ping!" << std::endl;
        cv1.signal();
        if (turn != 0) {
            // unlock and wait for the ponger to finish
            cv1.wait(mtx);
            // acquire lock
        }
    }
    mtx.unlock();
}


void ponger(uintptr_t) {
    int hit = 0;
    mtx.lock();
    while (hit < 5) {
        // ponger turn
        turn = 0;
        hit++;
        std::cout << "Pong!" << std::endl;
        cv1.signal();
        if (turn != 1) {
            cv1.wait(mtx);
        }
    }
    mtx.unlock();
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
    cpu::boot(parent, 0, 0);
}