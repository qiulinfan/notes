#pragma once

class semaphore {
public:
    semaphore(unsigned int); 
    ~semaphore();

    void down();
    void up();

    /*
     * Disable the copy constructor and copy assignment operator.
     */
    semaphore(const semaphore&) = delete;
    semaphore& operator=(const semaphore&) = delete;

    /*
     * Move constructor and move assignment operator.
     */
    semaphore(semaphore&&);
    semaphore& operator=(semaphore&&);
};


