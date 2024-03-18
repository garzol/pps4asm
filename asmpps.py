#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
main program .py

Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024
'''

import sys

import asmlex
import asmparse

tobeParsed2  = u"AD\nAD AD\n;tytyyt\nLDI 8"
tobeParsed = ''';programme interne d'essai
LDI 0B1010

Ad
Label01:
LDI 0X0F
LDI 0X1
'''

VERSION = "0.58"

def loadSrc(fn):
    f = open(fn, "r")
    return (f.read()) 
    
class MyAsm:
    def __init__(self):
        self.name = "pps-4 asm. "+"version: "+VERSION
        self.mylex = asmlex.MyLexer()
        self.mylex.build()
        self.mypar = asmparse.MyParser()
        self.mypar.build()

        
if __name__ == "__main__":
    try:
        data = loadSrc(sys.argv[1])
    except:
        print ("must specify a file arg. Taking example")
    data = tobeParsed.upper()
    newasm = MyAsm()
    print(newasm.name)
    #print(data)
    print()
    newasm.mylex.test(data)
    print(newasm.mylex.comment)
    # print()
    newasm.mypar.parse(data)
    print(newasm.mypar.comment)
    print(newasm.mypar.labels)

