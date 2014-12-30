SOURCES = helloWorld.c
FORMALINESOURCES = formaline_prepare.c
TARBALLFILES=Makefile $(SOURCES) $(FORMALINESOURCES) 

all: hello

helloWorld.o: helloWorld.c
	g++ -c helloWorld.c


../src.tar.gz: $(TARBALLFILES)
	tar -czvf ../src.tar.gz $^

formaline.c: ../src.tar.gz formaline                                                                                                                                         
	./formaline < ../src.tar.gz

formaline: formaline_prepare.c
	g++ -o formaline formaline_prepare.c

formaline.o: formaline.c
	g++ -o formaline.o formaline.c

hello: helloWorld.o
	g++ formaline.o helloWorld.o -o hello

clean:
	rm -rf *o hello
	rm -rf formaline.c