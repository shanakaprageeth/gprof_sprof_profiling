# Profiling test

## Description
This project includes a test case for gprof and sprof based software or shared library profiling.

## Getting Started

Test your system for gcc, gprof, and sprof tools\.
gprof_test_program.c contain a program that loop through two functions.
sprof_test_program.c contain a program that loop through two functions in libdemo.c program(compiled to shared library).

### Prerequisites

Linux development enviornemt with gcc, gprof, and sprof\.

### Installing
To test gprof
``` 
./exec_gprof.sh 
``` 
To test sprof
``` 
./exec_sprof.sh 
``` 
## Running the tests
exec_gprof.sh 
compiles the gprof_test_program.c and run it through gprof to generate output file
analysis.out

exec_sprof.sh 
compiles the libdemo.c as a shared library\. link and compile sprof_test_program.c and run it through sprof to generate output file
libdemo.so.1.profile 

Please refer to shell scripts for comments about each shell commands.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Acknowledgments

I pay my gratitute to [tutorialspoint.com](https://www.tutorialspoint.com/unix_commands/gprof.htm) for Gprof tutorial 
