UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
    CC := /opt/homebrew/opt/llvm/bin/clang++
	CC += -D_XOPEN_SOURCE -Wno-deprecated-declarations
    LDFLAGS := -L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib -fuse-ld=lld
    LIBTHREAD := libthread_macos.o
else
    CC := g++
    LIBTHREAD := libthread.o
endif

CC += -g -Wall -std=c++20

# Space-separated list of source files for the program
SOURCES := pingpong.cpp

# Generate the names of the program's object files
OBJS := ${SOURCES:.cpp=.o}

all: pizza

pingpong: pingpong.cpp libthread.o
	${CC} -o $@ $^ -ldl -pthread ${LDFLAGS}
pingpong2: pingpong_instructor_sol_1.cpp libthread.o
	${CC} -o $@ $^ -ldl -pthread ${LDFLAGS}
pingpong3: pingpong_instructor_sol_2.cpp libthread.o
	${CC} -o $@ $^ -ldl -pthread ${LDFLAGS}
# Generic rules for compiling a source file to an object file
%.o: %.cpp
	${CC} -c $<
%.o: %.cc
	${CC} -c $<

clean:
	rm -f ${OBJS} pingpong
