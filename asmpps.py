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

AD
AD AD

LDI 8
'''

VERSION = "0.98"

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
    data = tobeParsed
    newasm = MyAsm()
    print(newasm.name)
    #print(data)
    print()
    newasm.mylex.test(data)
    print(newasm.mylex.comment)
    # print()
    newasm.mypar.parse(data)
    print(newasm.mypar.comment)

