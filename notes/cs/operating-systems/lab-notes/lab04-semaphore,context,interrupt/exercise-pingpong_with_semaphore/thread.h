/*
 * thread.h -- interface to the thread library
 *
 * This file should be included by the thread library and by application
 * programs that use the thread library.
 */
#pragma once

#include <cstdint>

#if !defined(__cplusplus) || __cplusplus < 202000L
#error Please configure your compiler to use C++20 or higher
#endif

#if !defined(__clang__) && defined(__GNUC__) && __GNUC__ < 13
#error Please use g++ version 13 or higher
#endif

static constexpr unsigned int STACK_SIZE=262144;// size of each thread's stack

using thread_startfunc_t = void (*)(uintptr_t);

class thread {
public:
    thread(thread_startfunc_t func, uintptr_t arg); // create a new thread
    ~thread();

    void join();                                // wait for this thread to finish

    /*
     * Disable the copy constructor and copy assignment operator.
     */
    thread(const thread&) = delete;
    thread& operator=(const thread&) = delete;

    /*
     * Move constructor and move assignment operator.
     */
    thread(thread&&);
    thread& operator=(thread&&);
};
