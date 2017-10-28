cls
@echo Bu kurulum kodu sadece eger pyinstaller kurulu ise calisacaktir.
@echo Eger bu programin kurulu oldugundan emin degilseniz lutfen internetten pyinstallerin
@echo nasil kurulacagi hakkindaki kaynaklara goz atiniz.

@pyinstaller evreka lex.py openfile.py parser.py --onefile

@mkdir ../bin/

@copy dist/evreka ../bin/

@del evreka.spec
@rmdir /S /Q dist
@rmdir /S /Q build
