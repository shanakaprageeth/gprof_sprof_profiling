#!/bin/bash
# author Shanaka Prageeth
# details sprof binary

DEBIAN_FRONTEND=noninteractive
PROGRAM_NAME="$(basename $0)"
BASEDIR=$(dirname $(realpath "$0"))

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $PROGRAM_NAME <binary> <library> <output_directory>"
    exit 1
fi

BINARY=$1
LIBRARY_NAME=$2
OUTPUT_DIR=$3

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

export LD_LIBRARY_PATH=$BASEDIR:$LD_LIBRARY_PATH
# to analyze the shared library create LD_PROFILE var toward the shared lib
export LD_PROFILE=$LIBRARY_NAME
# define profile output location
export LD_PROFILE_OUTPUT=$OUTPUT_DIR
# profile output try to append data therefore clean old profiles
rm -f $OUTPUT_DIR/$LD_PROFILE.profile
# Run the binary to generate gmon.out
./"$BINARY"
# print linker dependencies after compilation
ldd $BINARY
mkdir -p $OUTPUT_DIR
# change library path to find the shared object and execute the program
LD_LIBRARY_PATH=$BASEDIR:$LD_LIBRARY_PATH ./$BINARY
# check for output profile files
ls $OUTPUT_DIR
# convert profile data to flat profile with -p option
sprof -p $LIBRARY_NAME $OUTPUT_DIR/$LIBRARY_NAME.profile
