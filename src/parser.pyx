def alDEGISKEN(varname , symbols):
    if varname in symbols:
        return symbols[varname]

def YERLESTIR(varname,varvalue,symbols):
    symbols[varname[4:]] = varvalue

def parser(toks,symbols):
    #print(toks)
    i = -1
    while(i < len(toks)):
        i+=1
        ###print(toks[i])
        if toks[i] == "EGER":
            #print(toks[i+1])
            #print(toks[i+3])
            if toks[i+1][5:] == toks[i+3][5:]:
                i += 5
                while i < len(toks):
                    if toks[i] != "YAP":
                        if toks[i] == "YAZDIR":
                            data = toks[i+1]
                            if data[0] == "\"":
                                data = data.replace("\"" , "")
                            elif data[0:4] == "SAYI":
                                data = data[5:]
                            elif data[0:4] == "OPER":
                                data = data[5:]
                                data = eval(data)
                            elif data[0:3] == "DEG":
                                ###print(data)
                                ###print(symbols)
                                data = alDEGISKEN(data[4:],symbols)
                            print(data)
                        else:
                            i+=2
                        if toks[i][0:3] == "DEG" and toks[i+1] == "ESITTIR":
                            if toks[i+2][0] == "\"":
                                data = toks[i+2].replace("\"" , "")
                                YERLESTIR(toks[i],data)
                            elif toks[i+2][0:4] == "SAYI":
                                data = toks[i+2][5:]
                                YERLESTIR(toks[i],data)
                            elif toks[i+2][0:4] == "OPER":
                                data = toks[i+2][5:]
                                data = eval(data)
                                YERLESTIR(toks[i],data)
                            elif toks[i+2][0:3] == "DEG":
                                YERLESTIR(toks[i],alDEGISKEN(toks[i+2][4:],symbols),symbols)
                            elif toks[i+2] == "GIRDI":
                                data = input(toks[i+3].replace("\"",""))
                                YERLESTIR(toks[i],data)
                        else:
                            i += 3
            else:
                while toks[i] != "YAP":
                    i+= 1
        else:
                if toks[i] == "YAZDIR":
                    data = toks[i+1]
                    if data[0] == "\"":
                        data = data.replace("\"" , "")
                    elif data[0:4] == "SAYI":
                        data = data[5:]
                    elif data[0:4] == "OPER":
                        data = data[5:]
                        data = eval(data)
                    elif data[0:3] == "DEG":
                        ###print(data)
                        ###print(symbols)
                        data = alDEGISKEN(data[4:],symbols)
                    print(data)
                    i += 2
                elif toks[i][0:3] == "DEG" and toks[i+1] == "ESITTIR":
                    if toks[i+2][0] == "\"":
                        data = toks[i+2].replace("\"" , "")
                        YERLESTIR(toks[i],data)
                    elif toks[i+2][0:4] == "SAYI":
                        data = toks[i+2][5:]
                        YERLESTIR(toks[i],data)
                    elif toks[i+2][0:4] == "OPER":
                        data = toks[i+2][5:]
                        data = eval(data)
                        YERLESTIR(toks[i],data)
                    elif toks[i+2][0:3] == "DEG":
                        YERLESTIR(toks[i],alDEGISKEN(toks[i+2][4:],symbols),symbols)
                    elif toks[i+2] == "GIRDI":
                        data = input(toks[i+3].replace("\"",""))
                        YERLESTIR(toks[i],data)
                    i += 3
                else:
                    i += 1
