#include <iostream>
#include <ucontext.h>
#include <utility>
using namespace std;

ucontext_t ctxA, ctxB, ctxMain;


void funcA(int arg) {
    cout << arg << endl;
    swapcontext(&ctxA, &ctxB);
}
void funcB(double arg) {
    cout << arg << endl;
    swapcontext(&ctxB, &ctxMain);
}


void main() {
    // Initialize contexts
    makecontext(&ctxA, (void (*)())funcA, 1, 42);
    makecontext(&ctxB, (void (*)())funcB, 1, 3.14);
    swapcontext(&ctxMain, &ctxA);
}