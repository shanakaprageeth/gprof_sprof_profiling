#!/bin/bash
# author Shanaka Prageeth
# details about the script

DEBIAN_FRONTEND=noninteractive
PROGRAM_NAME="$(basename $0)"
BASEDIR=$(dirname $(realpath "$0"))


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $PROGRAM_NAME <binary> <output_directory>"
    exit 1
fi

BINARY=$1
OUTPUT_DIR=$2

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Run the binary to generate gmon.out
./"$BINARY"

# Run gprof on profiling data
gprof -b "$BINARY" gmon.out > "$OUTPUT_DIR/analysis.out"

#Suppress printing statically declared functions with -a option
#gprof -b -a "$BINARY" gmon.out > "$OUTPUT_DIR/analysis.out"
#Print only flat profile using -p option
#gprof -b -p "$BINARY"
#Print info related to specific function
#gprof -b -pStaticFunc "$BINARY"
#Suppress printing of flat profile using -P option
#gprof -b -P "$BINARY"
#Print only call graph using -q option
#gprof -b -q "$BINARY"
#Suppress printing of call graph using -Q option
#gprof -b -Q "$BINARY"