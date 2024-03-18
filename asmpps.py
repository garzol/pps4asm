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
T    Label01
Ad
Label01:
ADI 0X0F
T    Label01
LDI 0X1
LD 0B101
EX 0x3
EXD 0
LBL 0XCF

IOL 0xDE
IOL 23
IOL 1
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
    print(newasm.mypar.address)

    #second pass once we have the labels
    newasm.mypar.parse(data)
    print(newasm.mypar.comment)
    print(newasm.mypar.labels)
    print(newasm.mypar.address)

