all: dfetch

dfetch:
	./build.sh

install: dfetch
	./build.sh -i

uninstall:
	./build.sh -u
