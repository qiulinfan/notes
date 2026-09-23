#include <iostream>
#include <thread>
#include <mutex>

std::mutex x, y, c;

void child1()
{
    for (int i=0; i<1000000; i++) {
        if (!(i%100)) {
            c.lock();
            std::cout << "child1: " << i << std::endl;
            c.unlock();
        }
	x.lock();
	y.lock();
	y.unlock();
	x.unlock();
    }
}

void child2()
{
    for (int i=0; i<1000000; i++) {
        if (!(i%100)) {
            c.lock();
            std::cout << "child2: " << i << std::endl;
            c.unlock();
        }
	y.lock();
	x.lock();
	x.unlock();
	y.unlock();
    }
}

int main()
{
    std::thread t1(child1);
    std::thread t2(child2);

    t1.join();
    t2.join();
}