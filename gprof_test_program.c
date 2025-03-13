#include<stdio.h>

void test_function();
static void static_function();

void test_function(){
    int i = 0;
    printf("test_function\n");
    for (i=0; i<100; i++){
        static_function();
    }
}

static void static_function(){
    int i = 0;
    printf("static_function\n");
    for (i=0; i<10; i++){

    }
}

int main(void){
    printf("gprof_test_program starting\n");
    test_function();
    printf("gprof_test_program exiting\n");
    return 0;
}
