CC=g++
CFLAGS=-c

all: build doczip doc clean

build: myexe

doc: doc/html

doc/html: *.cc *.h
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
	-rm -f *.txt
	-rm -rf doc/html doc/latex
doczip:
	tar cvzf Quiz2Brinson.tar.gz /home/nbrinson/quiz2/quiz2
