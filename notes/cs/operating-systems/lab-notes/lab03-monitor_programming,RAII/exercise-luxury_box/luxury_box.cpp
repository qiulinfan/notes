#include <fstream>
#include <iostream>
#include <string>
#include <type_traits>
#include <vector>
#include <cassert>
#include <map>
#include "cpu.h"
#include "thread.h"
#include "mutex.h"
#include "cv.h"

using std::cout;
using std::endl;


cv pac12CV;
cv big10CV;
mutex box_lock;

int active_big10 = 0;
int active_pac12 = 0;

void pac12_wants_enter(uintptr_t) {
    box_lock.lock();
    while (active_big10 > 0) {
        std::cout << "PAC12 waiting, active BIG10: " << active_big10 << std::endl;
        pac12CV.wait(box_lock);
    }
    active_pac12++;
    std::cout << "PAC12 enters, active PAC12: " << active_pac12 << std::endl;
    box_lock.unlock();
}


void pac12_leave(uintptr_t) {
    box_lock.lock();
    active_pac12--;
    std::cout << "PAC12 leaves, active PAC12: " << active_pac12 << std::endl;
    if (active_pac12 == 0) {
        big10CV.broadcast();
    }
    box_lock.unlock();
}




void big10_wants_enter(uintptr_t) {
    box_lock.lock();
    while (active_pac12 > 0) {
        std::cout << "BIG10 waiting, active PAC12: " << active_pac12 << std::endl;
        big10CV.wait(box_lock);
    }
    active_big10++;
    std::cout << "BIG10 enters, active BIG10: " << active_big10 << std::endl;
    box_lock.unlock();
}


void big10_leave(uintptr_t) {
    box_lock.lock();
    active_big10--;
    std::cout << "BIG10 leaves, active BIG10: " << active_big10 << std::endl;
    if (active_big10 == 0) {
        pac12CV.broadcast();
    }
    box_lock.unlock();
}


void parent(uintptr_t) {
    // normal: big10 +2 -2

    thread* t1 = new thread(big10_wants_enter, 0);
    thread* t2 = new thread(big10_wants_enter, 0);
    thread* t3 = new thread(big10_leave, 0);
    thread* t4 = new thread(big10_leave, 0);

    // pac12 +3 -1
    thread* t5 = new thread(pac12_wants_enter, 0);
    thread* t6 = new thread(pac12_wants_enter, 0);
    thread* t7 = new thread(pac12_wants_enter, 0);
    thread* t8 = new thread(pac12_leave, 0);


    // here: box has 2 pac12 people 
    // big10 wants to enter, but no
    thread* t9 = new thread(big10_wants_enter, 0);
    thread* t10 = new thread(big10_wants_enter, 0);


    // finally, pac12 leaves
    // and big10 can enter
    thread* t11 = new thread(pac12_leave, 0);
    thread* t12 = new thread(pac12_leave, 0);
    thread* t13 = new thread(big10_wants_enter, 0);

    // here: we have 3 big10 people in the box
    // and 0 pac12 people
    // but a pac12 person wants to enter
    // but no.
    thread* t14 = new thread(pac12_wants_enter, 0);


    t1->join();
    t2->join();
    t3->join();
    t4->join();
    t5->join();
    t6->join();
    t7->join();
    t8->join();
    t9->join();
    t10->join();
    t11->join();
    t12->join();
    t13->join();
    t14->join();
}


int main() {
    cpu::boot(parent, 0, 0);
}