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


/* given helper functions and variables */
enum class Note : uintptr_t { Na = 0, Do = 1, Re = 2, Mi = 3, Fa = 4, So = 5, La = 6, Ti = 7 };
std::vector<std::string> notes_str{"empty", "do", "re", "mi", "fa", "sol", "la", "ti"};

/* Overload extraction operator so that we can read directly into a Note variable */
std::ifstream &operator>>(std::ifstream &stream, Note &note) {
    std::underlying_type_t<Note> temp{};
    stream >> temp;
    note = static_cast<Note>(temp);
    return stream;
}

void play(Note note) {
    assert(note != Note::Na);
    cout << notes_str[static_cast<size_t>(note)] << endl;
}

/* Add global variables and helper functions here */
mutex mtx;
cv ConductorWait;
std::map<Note, cv> pianoCVs;
Note currentNote = Note::Na;



void conductor(uintptr_t arg) {
    Note tmp;
    std::ifstream infile("input.txt");
    while (infile >> tmp) {
        mtx.lock();
        while (currentNote != Note::Na) {
            // Wait for the piano keys to finish playing the current note
            ConductorWait.wait(mtx);
        }
        // Now note is Na and we have lock: this means that we can conduct! 
        // set and wake up the corresponding piano key
        currentNote = tmp;
        pianoCVs[currentNote].signal();
        // give up the lock and let the corresponding key run
        mtx.unlock();
    }
}

// keep on playing the same key it is assigned.
void pianoKey(uintptr_t arg) {
    auto mynote = static_cast<Note>(arg);
    while (true) {
        mtx.lock();
        // if not my note: give up the lock and sleep
        while (mynote != currentNote) {
            pianoCVs[mynote].wait(mtx);
        }
        // now conductor has conducted and signaled me, and I grabbed the lock
        // because it is my note and my turn to play
        play(currentNote);
        currentNote = Note::Na;
        ConductorWait.signal();
        mtx.unlock();
    }
}

void manageThreads(uintptr_t arg) {
    for (uintptr_t i = 1; i <= 7; ++i) {
        thread pianoKeyThread(pianoKey, i);
    }
    thread conductorThread(conductor, 0);
}

int main(int argc, char **argv) {
    for (int i = 1 ; i < 8; i++) {
        pianoCVs[Note(i)] = cv();
    }
    cpu::boot(manageThreads, 0, 0);
}