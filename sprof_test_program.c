#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include "libdemo.h"

void lib_func_1(void);
void lib_func_2(void);

int
main(int argc, char *argv[]){
    printf("sprof_test_program running\n");

    // Call functions from libdemo
    lib_func_1();
    lib_func_2();

    // Attempt to dynamically load the shared library
    void *handle = dlopen("libdemo.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "Error: %s\n", dlerror());
        return 1;
    }
    
    // Close the shared library
    dlclose(handle);
    printf("sprof_test_program exiting\n");
    return 0;
}
