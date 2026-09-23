#include <boost/asio.hpp>
#include <boost/thread.hpp>
#include <iostream>

boost::mutex my_mutex;

int main() {
    my_mutex.lock();
    std::cout << "Mutex is locked. Performing critical section operations..." << std::endl;

    my_mutex.unlock();
    std::cout << "Mutex is unlocked. Exiting program." << std::endl;
    
    return 0;
}