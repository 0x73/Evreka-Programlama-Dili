all:
	pyinstaller evreka lex.py parser.py openfile.py --onefile
	mkdir ../bin
	mv dist/evreka ../bin/
	@echo "Compilation is complete."
install:
	@sudo cp ../bin/evreka /usr/bin/
clean:
	rm -rf build/
	rm -rf dist/
	rm evreka.spec
