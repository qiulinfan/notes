## throughput v.s. responsiveness

Definitions

Throughput: The number of jobs done per timeframe

- The number of HTTP requests per second
- The number of SQL queries per second
- The number of tokens/words given by an LLM per second



Responsiveness: Time to completion for each job

- Time the client waits for website to load
- Time the server waits for SQL queries to process
- Time the user waits for ChatGPT to finish responding



A response throughput graph plots the response time against the throughput, useful to determine the optimal performance point of the system。





[pre-lab] A. Write a function `job` in C++ that is computationally expensive (e.g., sum the integers from 0 to 100000000). Measure the response time of `job` by calling `gettimeofday` at the beginning and end of the function. Compute the average response time of `job` by summing the response time of each execution of `job`, then dividing by the number of times `job` was called. `job` will be invoked by multiple threads, so make it thread safe (use C++ threading facilities).

[pre-lab] B. Write a program that calls `job` 64 times in a single thread. Measure the running time of the program, then print out the throughput of the program (number of jobs / running time of the program), and average response time for each job.

[in-lab] C. Speed up your program by using concurrency. Your program should still call `job` a total of 64 times, but it should do so in a configurable number of threads. Run the program with different numbers of threads (1, 2, 4, 8, 16, 32, 64), and graph the average response time versus throughput as you vary the number of threads. What concurrency level produces the best (lowest) response time? What concurrency level produces the best (highest) throughput? What level of concurrency would you recommend running on this machine?



简单而言：

- Create some arbitrary task
  - Ex. Sum up 1 to 100000000
  - Run some variable number of threads at once
- Record the time 

- Store (jobs/ time , avg response time) for each run
- Bonus: Graph it 



见 exer1 文件夹







## socket

socket 教程笔记见 `on_socket.md`



prelab2:

Write a simple client and server, where the client sends a string to the server and the server outputs the string using cout.



见 exer2

