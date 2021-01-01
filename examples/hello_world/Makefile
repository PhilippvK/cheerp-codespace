PRJ=hello
SRC=$(PRJ).cpp
HTML=$(PRJ).html
PORT=8123

build: $(SRC)
	/opt/cheerp/bin/clang++ -target cheerp $(SRC) -o $(PRJ).js

run: build
	nodejs $(PRJ).js

serve: build $(HTML)
	http-server -p $(PORT)

all: run

clean:
	rm -rf $(PRJ).js
