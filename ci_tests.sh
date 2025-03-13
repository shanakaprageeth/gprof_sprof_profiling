#!/bin/bash
# author Shanaka Prageeth
# details about the script

DEBIAN_FRONTEND=noninteractive
PROGRAM_NAME="$(basename $0)"
BASEDIR=$(dirname $(realpath "$0"))
set -e
make all
./gprof_binary.sh gprof_test_program out
cat out/analysis.out
set +e
./sprof_binary.sh sprof_test_program libdemo.so.1 out
make clean
