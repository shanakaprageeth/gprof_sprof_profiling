all: libdemo.so sprof_test_program gprof_test_program

libdemo.so: libdemo.so.1.0.1
	ln -sf libdemo.so.1.0.1 libdemo.so.1
	ln -sf libdemo.so.1 libdemo.so

libdemo.so.1.0.1: libdemo.c
	cc -pg -fPIC -shared -Wl,-soname,libdemo.so.1 -o libdemo.so.1.0.1 libdemo.c

sprof_test_program: sprof_test_program.c libdemo.so
	cc -pg -o sprof_test_program -L. sprof_test_program.c -ldemo -ldl

gprof_test_program: gprof_test_program.c libdemo.so
	cc -pg -o gprof_test_program -L. -ldemo gprof_test_program.c

clean:
	rm -f libdemo.so.1.0.1 libdemo.so.1 libdemo.so gprof_test_program sprof_test_program