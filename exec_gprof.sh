#compile with gp option for profiling
gcc -pg -o gprof_test_program gprof_test_program.c
# run the program to generate gmon.out
./gprof_test_program
# Run gprof on profiling data
gprof -b gprof_test_program gmon.out >analysis.out
#Suppress printing statically declared functions with -a option
#gprof -b -a gprof_test_program gmon.out > analysis.out
#Print only flat profile using -p option
#gprof -b -p gprof_test_program
#Print info related to specific function
#gprof -b -pStaticFunc gprof_test_program
#Suppress printing of flat profile using -P option
#gprof -b -P gprof_test_program
#Print only call graph using -q option
#gprof -b -q gprof_test_program
#Suppress printing of call graph using -Q option
#gprof -b -Q gprof_test_program
