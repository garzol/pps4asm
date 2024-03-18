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
tobeParsed ='''
ad
ad
T pipo
adi 0x1
pipo:
'''
tobeParsed2  = u"AD\nAD AD\n;tytyyt\nLDI 8"
tobeParsed3 = ''';programme interne d'essai
LDI 0B1010
adi 8
adi 0xA
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
Pipo equ 244
POPO equ 0xC0
PUpu equ 0B10110000
bibi equ 0x898
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
        '''
        fn is the name of the bin file to be generated
        '''
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
    #newasm.mylex.test(data)
    print(newasm.mylex.comment)
    # print()

    #first pass before we have all the label values    
    newasm.mypar.parse(data)
    print(newasm.mypar.comment)
    print(newasm.mypar.labels)
    print(newasm.mypar.address)
    
    #second pass once we have the labels
    newasm.mypar.mode = "make_bin"
    newasm.mypar.address = 0
    newasm.mypar.parse(data)
    print(newasm.mypar.comment)
    print(newasm.mypar.labels)
    print(newasm.mypar.address)
    print(newasm.mypar.maxaddress)
    print(newasm.mypar.binarray)

    try:
        ofnl = sys.argv[1].split('.')
        output_file = '.'.join(ofnl[:-1])+'.bin'
    except:
        output_file = "pipogarzolpps4.bin"
        
    fd = open(output_file, "wb")
    fd.write(newasm.mypar.binarray[:newasm.mypar.maxaddress])
    fd.close()
    
    
    