#include <iostream>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "cv.h"
#include <cassert>

using std::cout;
using std::endl;

int turn = 0;
mutex mtx;
cv cv1;


void player(uintptr_t arg) {
    while (true) {
        mtx.lock();
        if (arg%2) {
            std::cout << "pong" << std::endl;
        } else {
            std::cout << "ping" << std::endl;
        }
        turn++;
        cv1.signal();
        while (turn%2 != arg) {
            cv1.wait(mtx);
        }
        if (turn > 9) {
            break;
        }
        mtx.unlock();
    }
}


void parent(uintptr_t)
{
    thread* pingerthread = new thread(player, 0);
    thread* pongerthread = new thread(player, 1);
    pingerthread->join();
    pongerthread->join();
}



int main() {
    cpu::boot(parent, 0, 0);
}