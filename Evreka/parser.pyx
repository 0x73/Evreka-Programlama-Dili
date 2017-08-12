# -*- coding: utf-8 -*-
symbols = {}


def alDEGISKEN(varname, symbols):
    if varname in symbols:
        return symbols[varname]


def YERLESTIR(varname, varvalue):
    global symbols
    symbols[varname[4:]] = varvalue


def parser(toks,i):
    try:
        while i < len(toks):
            if toks[i] == 'EGER':
                if toks[i + 2] == 'ESES':
                    if toks[i + 1][0:4] == "OPER":
                        toks[i + 1] = "SAYI:" + str(eval(toks[i + 1][5:]))
                    if toks[i + 3][0:4] == "OPER":
                        toks[i + 3] = "SAYI:" + str(eval(toks[i + 3][5:]))
                    if toks[i + 1][0:4] == "DEG:":
                        toks[i + 1] = alDEGISKEN(toks[i + 1][4:],symbols)
                    if toks[i + 3][0:4] == "DEG:":
                        toks[i + 3] = alDEGISKEN(toks[i + 3][4:],symbols)
                    if toks[i + 1] == toks[i + 3]:
                        i += 5
                        a = i
                        while toks[a] != 'YAP':
                            a += 1
                        while toks[i] != 'YAP' and i < len(toks):
                            parser(toks[0:a+i],i)
                            i += 1
                    else:
                        while toks[i] != 'YAP':
                            i += 1
            elif toks[i] == 'IKEN':
                _i = 0
                if toks[i - 2] == 'ESES':
                    if toks[i - 1][0:4] == "OPER":
                        toks[i - 1] = "SAYI:" + str(eval(toks[i - 1][5:]))
                    if toks[i - 3][0:4] == "OPER":
                        toks[i - 3] = "SAYI:" + str(eval(toks[i - 3][5:]))
                    if toks[i - 1][0:4] == "DEG:":
                        pram_a_is_var = True
                        pram_a_name = toks[i - 1][4:]
                        toks[i - 1] = alDEGISKEN(toks[i - 1][4:],symbols)
                    if toks[i - 3][0:4] == "DEG:":
                        pram_b_is_var = True
                        pram_b_name = toks[i - 3][4:]
                        toks[i - 3] = alDEGISKEN(toks[i - 3][4:],symbols)
                    if toks[i - 1] == toks[i - 3]:
                        i += 1
                        a = i
                        while toks[a] != 'TEKRARLA':
                            a += 1
                        while toks[i] != 'TEKRARLA' and i < len(toks) and alDEGISKEN(pram_a_name,symbols) == alDEGISKEN(pram_b_name,symbols):
                            parser(toks[0:a+i],i)
                    else:
                        while toks[i] != 'TEKRARLA':
                            i += 1
                if toks[i - 2] == 'ESES':
                    if toks[i - 1][0:4] == "OPER":
                        toks[i - 1] = "SAYI:" + str(eval(toks[i - 1][5:]))
                    if toks[i - 3][0:4] == "OPER":
                        toks[i - 3] = "SAYI:" + str(eval(toks[i - 3][5:]))
                    if toks[i - 1][0:4] == "DEG:":
                        toks[i - 1] = alDEGISKEN(toks[i - 1][4:],symbols)
                    if toks[i - 3][0:4] == "DEG:":
                        toks[i - 3] = alDEGISKEN(toks[i - 3][4:],symbols)
                    while toks[(i - 3) -_i] == toks[(i - 3) - _i]:
                        while toks[i] != 'TEKRARLA':
                            parser(toks)
            elif toks[i] == 'YAZDIR':
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
            elif toks[i] == "CIK":
                exit()
            elif toks[i] == 'EKLE':
                if toks[i + 2][0:4] == 'OPER':
                    data = eval(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data + data))

                    i += 3
                elif toks[i + 2][0:4] == 'SAYI':
                    data = int(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data + data))

                    i += 3
                elif  toks[i + 2][0:4] == 'DEG:':
                    data =  int(alDEGISKEN(toks[i + 2][4:],symbols))
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data + data))

                    i += 3
                else:
                    i += 3
            elif toks[i] == 'CARP':
                if toks[i + 2][0:4] == 'OPER':
                    data = eval(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data * data))

                    i += 3
                elif toks[i + 2][0:4] == 'SAYI':
                    data = int(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data * data))

                    i += 3
                elif  toks[i + 2][0:4] == 'DEG:':
                    data =  int(alDEGISKEN(toks[i + 2][4:],symbols))
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data * data))

                    i += 3
                else:
                    i += 3
            elif toks[i] == 'BOL':
                if toks[i + 2][0:4] == 'OPER':
                    data = eval(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data / data))

                    i += 3
                elif toks[i + 2][0:4] == 'SAYI':
                    data = int(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data / data))

                    i += 3
                elif  toks[i + 2][0:4] == 'DEG:':
                    data =  int(alDEGISKEN(toks[i + 2][4:],symbols))
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data / data))

                    i += 3
                else:
                    i += 3
            elif toks[i] == 'EKSILT':
                if toks[i + 2][0:4] == 'OPER':
                    data = eval(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data - data))

                    i += 3
                elif toks[i + 2][0:4] == 'SAYI':
                    data = int(toks[i + 2][5:])
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data - data))

                    i += 3
                elif  toks[i + 2][0:4] == 'DEG:':
                    data =  int(alDEGISKEN(toks[i + 2][4:],symbols))
                    var_data = int(alDEGISKEN(toks[i + 1][4:],symbols))
                    YERLESTIR(toks[i + 1],str(var_data - data))

                    i += 3


            else:
                i += 1


    except Exception as e:
        if str(e) == "list index out of range":
            pass
        else:
            print(e)
