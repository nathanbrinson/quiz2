CC=g++
CFLAGS=-c -Wall

all: build doc

build: myexe

doc: doc

doc: *.cc *.h
	doxygen Doxyfile

myexe: collegemain.o college.o course.o
	$(CC) collegemain.o college.o course.o -o myexe

collegemain.o: collegemain.cc course.h node.h college.h
	$(CC) $(CFLAGS) collegemain.cc

college.o: college.cc college.h
	$(CC) $(CFLAGS) college.cc

course.o: course.cc course.h
	$(CC) $(CFLAGS) course.cc

clean:
	-rm -f *.o myexe
	-rm -rf doc doc
doczip:
	tar cvzf Quiz2Brinson.tar.gz .
