UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
    CC := clang++
    CC += -D_XOPEN_SOURCE
    LIBTHREAD := libthread_macos.o
else
    CC := g++
    LIBTHREAD := libthread.o
endif

CC += -g -Wall -std=c++20

# Space-separated list of source files for the program
PIZZA_SOURCES := pizza.cpp

# Generate the names of the program's object files
PIZZA_OBJS := ${PIZZA_SOURCES:.cpp=.o}

all: pizza

# Compile the program and tag this compilation
pizza: ${PIZZA_OBJS} ${LIBTHREAD}
	@ PIZZA_HEADERS=$$(${CC} -E -H ${PIZZA_SOURCES} 2>&1 > /dev/null | grep '^\.\.* [^/]' | sed 's/^\.* //' | sort -u) ; \
	./autotag.sh ${PIZZA_SOURCES} $${PIZZA_HEADERS} push
	${CC} -o $@ $^ -ldl -pthread

# Generic rules for compiling a source file to an object file
%.o: %.cpp
	${CC} -c $<
%.o: %.cc
	${CC} -c $<

clean:
	rm -f ${PIZZA_OBJS} pizza
