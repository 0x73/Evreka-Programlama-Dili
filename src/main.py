import os
import time
from sys import *
from open_file import *
from lex import *
from parser import *

tokens=[]
symbols = {}

def run_shell():
    print("Eureka 2017 (C) MIT Licence \n \n")
    while True:
        data = input("<?>: ")
        toks = lex(data)
        parser(toks , symbols)
        ###print(symbols)


def run_file():
    data = open_file(argv[1])
    toks = lex(data)
    parser(toks , symbols)
    ###print(symbols)

try:
    test = argv[1]
    run_file()
except:
    run_shell()
