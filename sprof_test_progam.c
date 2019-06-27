#include <stdlib.h>

void lib_func_1(void);
void lib_func_2(void);

int
main(int argc, char *argv[]){
    lib_func_1();
    lib_func_2();
    exit(0);
}
