![build](https://github.com/shanakaprageeth/gprof_sprof_profiling/actions/workflows/ci.yml/badge.svg?branch=master)

# Profiling Test

## Description
This project includes a test case for gprof and sprof based software or shared library profiling.

## Getting Started

Test your system for gcc, gprof, and sprof tools.
`gprof_test_program.c` contains a program that loops through two functions.
`sprof_test_program.c` contains a program that loops through two functions in `libdemo.c` program (compiled to a shared library).

### Prerequisites

Linux development environment with gcc, gprof, and sprof.

### Installing

Execute gprof flat profile

``` 
./gprof_binary.sh <binary> <output dir>

``` 

Execute sprof flat profile

``` 
./sprof_binary.sh <binary> <shared lib> <output dir>
``` 

## Running the Tests

`make all` compiles the `gprof_test_program.c` and runs it through gprof to generate the output file `analysis.out`.

`make all` compiles the `libdemo.c` as a shared library, links and compiles `sprof_test_program.c`, and runs it through sprof to generate the output file `libdemo.so.1.profile`.

Please refer to the `ci_tests.sh` script for the correct shell commands and details.

## License
[MIT](https://choosealicense.com/licenses/mit/)
