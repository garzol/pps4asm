#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
main program .py

Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024
'''

import sys
import os 

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

VERSION = "0.61"
DATE    = "2024-03-20"
def loadSrc(fn):
    f = open(fn, "r")
    return (f.read()) 
    
class MyAsm:
    def __init__(self):
        '''
        fn is the name of the bin file to be generated
        '''
        self.name = "pps-4 asm. "+"version: "+VERSION+"("+DATE+")"
        self.mylex = asmlex.MyLexer()
        self.mylex.build()

        self.mypar = asmparse.MyParser()
        self.mypar.build()

        
if __name__ == "__main__":
    try:
        data = loadSrc(sys.argv[1])
        print ("Assembling %s... " % sys.argv[1])
    except Exception as ex:
        print ("must specify a valid file arg. Taking integrated example.", ex)
        data = tobeParsed.upper()
 
    data = data.upper()
    newasm = MyAsm()
    print(newasm.name)
    #print(data)
    #print()
    #newasm.mylex.test(data)
    if newasm.mylex.comment:
        print(newasm.mylex.comment)
    # print()

    #first pass before we have all the label values    
    newasm.mypar.parse(data)
    if newasm.mypar.comment:
        print(newasm.mypar.comment)
        
    #print(newasm.mypar.labels)
    #print(newasm.mypar.address)
    
    #second pass once we have the labels
    #we build a second parser to have the line numbers reset 
    # newasm2 = MyAsm()
    # newasm2.mypar.mode = "make_bin"
    # newasm2.mypar.labels = newasm.mypar.labels
    # newasm2.mypar.address = 0
    # newasm2.mypar.parse(data)
    # if newasm2.mypar.comment:
    #      print(newasm2.mypar.comment)
    # print(newasm.mypar.labels)
    #print(newasm.mypar.address)
    #print(newasm.mypar.maxaddress)
    #print(newasm.mypar.binarray)

    try:
        ofnl = sys.argv[1].split('.')
        output_file = '.'.join(ofnl[:-1])+'.bin'
    except:
        output_file = "pipogarzolpps4.bin"
    if os.path.exists(output_file):
        #ask if we want to garzoler le fichier
        ans = input("File {0} already exists. Overwrite? (y/n)".format(output_file))
        if not ans or ans.lower().startswith("n"):
            print("OK. Aborting.")
            exit(0)
    try:    
        fd = open(output_file, "wb")
    except Exception as ex:
        print("can't open file", ex)
    try:
        fd.write(newasm.mypar.binarray[:newasm.mypar.maxaddress])
        print("Binary File %s created" % (output_file))
    except Exception as ex:
        print("can't write file", ex)
    finally:
        fd.close()
    
    
    