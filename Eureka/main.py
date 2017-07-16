import os
import time
from sys import *
from open_file import *
from lex import *
from parser import *

tokens=[]
symbols = {}

def run():
    data = open_file(argv[1])
    toks = lex(data)
    parser(toks , symbols)
    ###print(symbols)

run()
