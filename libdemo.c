#include <unistd.h>

void consume_cpu_1(int lim){
    int j;
    for (j = 0; j < lim; j++){
        getppid();
    }
}

void lib_func_1(void){
    int j;
    for (j = 0; j < 100; j++){
        consume_cpu_1(200000);
    }
}

void consume_cpu_2(int lim){
    int j;
    for (j = 0; j < lim; j++){
        getppid();
    }
}

void lib_func_2(void){
    int j;
    for (j = 0; j < 1000; j++){
        consume_cpu_2(10000);
    }
}
