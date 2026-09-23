g++ -std=c++20 -ldl -pthread race.cpp -o race libthread.o
g++ -std=c++20 -ldl -pthread race_safe.cpp -o race_safe libthread.o