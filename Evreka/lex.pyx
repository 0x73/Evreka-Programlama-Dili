# -*- coding: utf-8 -*-
def lex(filecontents):
    tok = ''
    tokens = []
    var = ''
    varstarted = 0
    state = False
    string = ''
    expr = ''
    isexpr = 0
    n = ''
    filecontents = list(filecontents)
    for char in filecontents:
        #print(tok)
        tok += char
        if tok == ' ':
            if state == False:
                tok = ''
            elif state == True:
                tok = " "
            if expr != '' and isexpr == 1:
                tokens.append('OPER:' + expr)
                expr = ''
                tok = ''
            elif expr != '' and isexpr == 0:
                tokens.append('SAYI:' + expr)
                expr = ''
                tok = ''
            elif var != '':
                tokens.append('DEG:' + var)
                var = ''
                varstarted = 0
                tok = ''
        elif tok == '\n' or tok == '<EOF>':
            if expr != '' and isexpr == 1:
                tokens.append('OPER:' + expr)
                expr = ''
            elif expr != '' and isexpr == 0:
                tokens.append('SAYI:' + expr)
                expr = ''
            elif var != '':
                tokens.append('DEG:' + var)
                var = ''
                varstarted = 0
            tok = ''
        elif tok == '\t':
            tok = ''
        elif tok == '=' and state == False:
            if expr != '' and isexpr == 0:
                tokens.append('SAYI:' + expr)
                expr = ''
            if var != '':
                tokens.append('DEG:' + var)
                var = ''
                varstarted = 0
            if tokens[-1] == 'ESITTIR':
                tokens[-1] = 'ESES'
            else:
                tokens.append('ESITTIR')
            tok = ''
        elif tok == '&' and state == False:
            varstarted = 1
            var += tok
            tok = ''
        elif varstarted == 1:
            if tok != '+' or tok == '-' or tok == '*' or tok == '/' or tok == '%':
                var += tok
                tok = ''
            else:
                varstarted = 0
                tok = ''
        elif tok == 'YAZDIR' or tok == 'yazdır':
            tokens.append('YAZDIR')
            tok = ''
        elif tok == 'EKLE' or tok == 'ekle':
            tokens.append('EKLE')
            tok = ''
        elif tok == 'EKSİLT' or tok == 'eksilt':
            tokens.append('EKSILT')
            tok = ''
        elif tok == 'ÇIK' or tok == "çık":
            tokens.append("CIK")
            tok = ""
        elif tok == 'yap' or tok == 'YAP':
            tokens.append('YAP')
            tok = ''
        elif tok == 'eğer' or tok == 'EĞER':
            tokens.append('EGER')
            tok = ''
        elif tok == 'İSE' or tok == 'ise':
            if expr != '' and isexpr == 0:
                tokens.append('SAYI:' + expr)
                expr = ''
            tokens.append('ISE')
            tok = ''
        elif tok == 'GİRDİ' or tok == 'girdi' or tok == 'GİRİŞ' or tok == 'giriş':
            tokens.append('GIRDI')
            tok = ''
        elif tok == '0' or tok == '1' or tok == '2' or tok == '3' or tok == '4' or tok == '5' or tok == '6' or tok == '7' or tok == '8' or tok == '9' or tok == '(' or tok == ')':
            expr += tok
            tok = ''
        elif tok == '+' or tok == '-' or tok == '*' or tok == '/' or tok == '%':
            expr += tok
            isexpr = 1
            tok = ''
        elif tok == '"' or tok == ' "':
            if state == False:
                state = True
            elif state == True:
                tokens.append(string + '"')
                string = ''
                state = False
                tok = ''
        elif state == True:
            string += tok
            tok = ''

    return tokens
