PRJ=hello
SRC=$(PRJ).cpp
HTML=$(PRJ).html
PORT=8123

build: $(SRC)
	/opt/cheerp/bin/clang++ -target cheerp $(SRC) -o $(PRJ).js

run: build
	node $(PRJ).js

serve: build $(HTML)
	echo "Hosting minimal web server on `npx -q codespaces-port $(PORT)`"
	http-server -p $(PORT)

all: run

clean:
	rm -rf $(PRJ).js
