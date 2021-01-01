PRJ=cheerpj_tutorial.html
JAR=TextDemo.jar
HTML=$(PRJ).html
PORT=8123
CHEERPJ=~/cheerpj_2.1/cheerpjfy.py

build:
	$(CHEERPJ) $(JAR)

serve:
	echo "Hosting minimal web server on `npx -q codespaces-port $(PORT)`"
	http-server -p $(PORT)

clean:
	rm -rf $(JAR).js

