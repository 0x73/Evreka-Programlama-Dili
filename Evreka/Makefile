install:
	python2.7 setup.py build_ext --inplace
	chmod +x evreka
	sudo cp evreka /usr/bin/
	mkdir ../src
	mv *.pyx ../src
	rm -rf ./build
	sudo cp * /usr/bin/
	mkdir ./src
	mv ../src/* ./src
run:
	python2.7 setup.py build_ext --inplace
	rm -rf ./build
	chmod +x evreka
	mkdir ./src
	mv *.pyx ./src
exec:
	chmod +x evreka
uninstall:
	sudo rm /usr/bin/openfile.*
	sudo rm /usr/bin/lex.*
	sudo rm /usr/bin/parser.*
	sudo rm /usr/bin/evreka
revert:
	rm *.c
	rm *.so
	cp ./src/* ./
	rm -rf ./src
