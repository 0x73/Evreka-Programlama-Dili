def openfile(filename):
    data = open(filename, 'r').read()
    data += '<EOF>'
    return data
