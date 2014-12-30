CC = gcc
SOURCES = helloWorld.c
FORMALINESOURCES = formaline_prepare.c
TARBALLFILES=Makefile $(SOURCES) $(FORMALINESOURCES) 

all: hello

helloWorld.o: helloWorld.c
	$(CC) -c helloWorld.c


src.tar.gz: $(TARBALLFILES)
	tar -czvf src.tar.gz $^

formaline.c: src.tar.gz formaline
	./formaline < src.tar.gz

formaline: formaline_prepare.c
	$(CC) -o formaline formaline_prepare.c

formaline.o: formaline.c
	$(CC) -c formaline.c

hello: helloWorld.o formaline.o
	$(CC) formaline.o helloWorld.o -o hello
	rm -rf src.tar.gz

clean:
	rm -rf *o hello
	rm -rf formaline.c
	rm -rf src.tar.gz