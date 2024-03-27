#!/usr/bin/python
# -*- coding: utf-8 -*-
'''


Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024

utility for making coe files from bin files

Changelog:
2024-03-24:
creation 

'''


import sys
import datetime
import os.path as path


def entryPoint(fn):   
    print ("Start...")
    inputfilename=fn
    
    if not path.isfile(inputfilename):
        print ( inputfilename + " not found... Abort")    
        sys.exit()
    
    basefilename = path.splitext(inputfilename)[0]
    if path.exists(basefilename+".coe"):
        print ("one or more output files already exist.")
        print ("Will be replaced.")
        reps = 'n'
        while (reps != 'y'):
            reps=input("Press y to continue or n to abort:")
            if reps == 'n':
                print("Abort.")
                sys.exit()
        
    print (f"Will generate {basefilename}.coe")   
    title =f";******************************************************************\n\
;********  {basefilename} ROM Block Memory .COE file  *********\n\
;********  {datetime.datetime.now()}  ********************\n\
;******************************************************************\n"
    radix = "memory_initialization_radix=16;\n"
    head  = "memory_initialization_vector=\n"
#     f = open("testbin.bin", "w+b")
#     byte_arr = [i%256 for i in range(2048)]
#     binary_format = bytearray(byte_arr)
#     f.write(binary_format)
#     f.close()        
    f = open(basefilename+".coe", "w")
    f.write(title)
    f.write(radix)
    f.write(head)
    i=0
    with open(inputfilename, "rb") as fb:
        b = fb.read(1)
        first_item = True 
        while b != b"":
            # Do stuff with byte.
            if not first_item:
                f.write(",\n")    
            first_item = False    
            f.write(b.hex())       
            b = fb.read(1)
        f.write(";\n")    
    f.close()     
    print ("coe done")


if __name__ == "__main__":
    try:
        fn = sys.argv[1]
    except:
        print("Bin file argument required ...Abort.")
        
    entryPoint(fn)
    