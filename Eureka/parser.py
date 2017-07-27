symbols = {}

def alDEGISKEN(varname, symbols):
    if varname in symbols:
        return symbols[varname]


def YERLESTIR(varname, varvalue):
    global symbols
    symbols[varname[4:]] = varvalue


def parser(toks):
    i = 0
    try:
        while i < len(toks):
            if toks[i] == 'EGER':
                if toks[i + 2] == 'ESES':
                    if int(toks[i + 1][5:]) == int(toks[i + 3][5:]):
                        i += 5
                        while toks != 'YAP':
                            if toks[i] == 'YAZDIR':
                                data = toks[i + 1]
                                if data[0] == '"':
                                    data = data.replace('"', '')
                                elif data[0:4] == 'SAYI':
                                    data = data[5:]
                                elif data[0:4] == 'OPER':
                                    data = data[5:]
                                    data = eval(data)
                                elif data[0:3] == 'DEG':
                                    data = alDEGISKEN(data[4:], symbols)
                                print data
                                i += 2
                            elif toks[i][0:4] == 'DEG:' and toks[i + 1] == 'ESITTIR':
                                if toks[i + 2][0] == '"':
                                    data = toks[i + 2].replace('"', '')
                                    YERLESTIR(toks[i], data)
                                elif toks[i + 2][0:4] == 'SAYI':
                                    data = toks[i + 2][5:]
                                    YERLESTIR(toks[i], data)
                                elif toks[i + 2][0:4] == 'OPER':
                                    data = toks[i + 2][5:]
                                    data = eval(data)
                                    YERLESTIR(toks[i], data)
                                elif toks[i + 2][0:4] == 'DEG:':
                                    YERLESTIR(toks[i], alDEGISKEN(toks[i + 2][4:], symbols))
                                elif toks[i + 2] == 'GIRDI':
                                    data = input(toks[i + 3].replace('"', ''))
                                    YERLESTIR(toks[i], data)
                                i += 3
                            else:
                                i += 1

                    else:
                        i = 0
                        while toks[i] != 'YAP':
                            i += 1

            if toks[i] == 'YAZDIR':
                data = toks[i + 1]
                if data[0] == '"':
                    data = data.replace('"', '')
                elif data[0:4] == 'SAYI':
                    data = data[5:]
                elif data[0:4] == 'OPER':
                    data = data[5:]
                    data = eval(data)
                elif data[0:3] == 'DEG':
                    data = alDEGISKEN(data[4:], symbols)
                print data
                i += 2
            elif toks[i][0:4] == 'DEG:' and toks[i + 1] == 'ESITTIR':
                if toks[i + 2][0] == '"':
                    data = toks[i + 2].replace('"', '')
                    YERLESTIR(toks[i], data)
                elif toks[i + 2][0:4] == 'SAYI':
                    data = toks[i + 2][5:]
                    YERLESTIR(toks[i], data)
                elif toks[i + 2][0:4] == 'OPER':
                    data = toks[i + 2][5:]
                    data = eval(data)
                    YERLESTIR(toks[i], data)
                elif toks[i + 2][0:4] == 'DEG:':
                    YERLESTIR(toks[i], alDEGISKEN(toks[i + 2][4:], symbols))
                elif toks[i + 2] == 'GIRDI':
                    data = raw_input(toks[i + 3].replace('"', ''))
                    YERLESTIR(toks[i], data)
                i += 3
            else:
                i += 1

    except:
        print ''
