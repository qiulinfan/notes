/*
 * cpu.h -- interface to the simulated CPU
 *
 * This interface is used mainly by the thread library.
 * The only part that is used by application programs is cpu::boot().
 */
#pragma once

#if !defined(__cplusplus) || __cplusplus < 202000L
#error Please configure your compiler to use C++20 or higher
#endif

#if !defined(__clang__) && defined(__GNUC__) && __GNUC__ < 13
#error Please use g++ version 13 or higher
#endif

#include <atomic>
#include <cstddef>
#include <cstdint>
#include <source_location>
#include <ucontext.h>

using interrupt_handler_t = void (*)();
using thread_startfunc_t = void (*)(uintptr_t);

class cpu {
public:
    /*
     * cpu::boot() starts the thread library and creates the initial
     * thread, which is initialized to call the function pointed to by
     * func with the single argument arg.  A user program should call
     * cpu::boot() exactly once (before calling any other thread functions).
     * On success, cpu::boot() does not return.
     *
     * "deterministic" specifies if the thread library should be deterministic
     * or not.  Setting deterministic to zero makes the scheduling of threads
     * non-deterministic, i.e., different runs may generate different results.
     * Setting deterministic to a non-zero value forces the scheduling of
     * threads to be deterministic, i.e., a program will generate the same
     * results if it is run with the same value for deterministic (different
     * non-zero values for deterministic will lead to different results).
     */
    static void boot(thread_startfunc_t func, uintptr_t arg,
                     unsigned int deterministic);

    /*
     * interrupt_disable() disables interrupts on the executing CPU.
     *
     * interrupt_enable() and interrupt_enable_suspend() enable interrupts
     * on the executing CPU.
     *
     * interrupt_enable_suspend() atomically enables interrupts and suspends
     * the executing CPU until it receives an interrupt from another CPU.
     * The CPU will ignore timer interrupts while suspended.
     *
     * These functions should only be called by the thread library (not by
     * an application).  They are static member functions because they always
     * operate on the executing CPU.
     *
     * Each CPU starts with interrupts disabled.
     */
    static void interrupt_disable();
    static void interrupt_enable();
    static void interrupt_enable_suspend();

    /*
     * interrupt_send() sends an inter-processor interrupt to the specified CPU.
     * E.g., c_ptr->interrupt_send() sends an IPI to the CPU pointed to by c_ptr.
     */
    void interrupt_send();

    /*
     * The interrupt vector table specifies the functions that will be called
     * for each type of interrupt.  There are two interrupt types: TIMER and
     * IPI.
     */
    static constexpr unsigned int TIMER = 0;
    static constexpr unsigned int IPI = 1;
    interrupt_handler_t interrupt_vector_table[IPI+1];

    static cpu* self();                 // returns pointer to the cpu that
                                        // the calling thread is running on

    /*
     * The infrastructure provides an atomic guard variable, which thread
     * libraries should use to provide mutual exclusion on multiprocessors.
     * The switch invariant for multiprocessors specifies that this guard variable
     * must be true when calling swapcontext.  guard is initialized to false.
     */
    static std::atomic<bool> guard;

    /*
     * Disable the default copy constructor, copy assignment operator,
     * move constructor, and move assignment operator.
     */
    cpu(const cpu&) = delete;
    cpu& operator=(const cpu&) = delete;
    cpu(cpu&&) = delete;
    cpu& operator=(cpu&&) = delete;

    /*
     * The cpu constructor initializes a CPU.  It is provided by the thread
     * library and called by the infrastructure.  After a CPU is initialized, it
     * should run user threads as they become available.  If func is not
     * nullptr, cpu::cpu() also creates a user thread that executes func(arg).
     *
     * On success, cpu::cpu() should not return to the caller.
     */
    cpu(thread_startfunc_t func, uintptr_t arg);
};
static_assert(sizeof(cpu) <= 2048);
static_assert(std::is_standard_layout<cpu>::value);
static_assert(offsetof(cpu, interrupt_vector_table) == 0);

/*
 * The thread library uses a customized version of makecontext, which (1) allows
 * callers to not initialize the context with getcontext, (2) allows callers to
 * pass pointers, and (3) hides the internal members of uc_stack.
 */
void makecontext(ucontext_t* ucp, char* stack, unsigned int stack_size, void (*func)(), int argc, ...);

/*
 * assert_interrupts_disabled() and assert_interrupts_enabled() can be used
 * as error checks inside the thread library.  They will assert (i.e. abort
 * the program and dump core) if the condition they test for is not met.
 */
#define assert_interrupts_disabled()                                             \
                assert_interrupts_private(true, std::source_location::current())
#define assert_interrupts_enabled()                                              \
                assert_interrupts_private(false, std::source_location::current())

/*
 * assert_interrupts_private() is a private function for the interrupt
 * functions.  Your thread library should not call it directly.
 */
void assert_interrupts_private(bool, std::source_location);
