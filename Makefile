all: dfetch

dfetch: src/main.c
	./build.sh

install: dfetch
	./build.sh -i

uninstall:
	./build.sh -u
