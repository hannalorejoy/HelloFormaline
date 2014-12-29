all: hello

hello: helloWorld.o
	g++ helloWorld.o -o hello

helloWorld.o: helloWorld.c
	g++ -c helloWorld.c

clean:
	rm -rf *o hello
