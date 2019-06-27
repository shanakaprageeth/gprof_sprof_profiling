# compile support functions in to a shared library
cc -g -fPIC -shared -Wl,-soname,libdemo.so.1 \
        -o libdemo.so.1.0.1 libdemo.c
# create symboilic links to libdemo.so
ln -sf libdemo.so.1.0.1 libdemo.so.1
ln -sf libdemo.so.1 libdemo.so
# compile executable with linked shared library
cc -g -o prog prog.c -L. -ldemo
# print linker dependancies after compilation
ldd prog
# to analyze the shared library create LD_PROFILE var toward the shared lib
export LD_PROFILE=libdemo.so.1
# define profile output location
export LD_PROFILE_OUTPUT=$(pwd)/prof_data
mkdir -p $LD_PROFILE_OUTPUT
# profile output try to append data therefore clean old profiles
rm -f $LD_PROFILE_OUTPUT/$LD_PROFILE.profile
# change library path to find the share object and execute the program
LD_LIBRARY_PATH=. ./prog
# check for output profile files
ls prof_data
# convert profile data to flat profile with -p option
sprof -p libdemo.so.1 $LD_PROFILE_OUTPUT/libdemo.so.1.profile 
