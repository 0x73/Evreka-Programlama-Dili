# -*- coding: utf-8 -*-
def openfile(filename):
    data = open(filename, 'r').read()
    data += '<EOF>'
    return data
