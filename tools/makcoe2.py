#!/usr/bin/python
# -*- coding: utf-8 -*-
'''


Created on 7 Apr. 2024

@author: garzol
Copyright AA55 Consulting 2024

utility for making coe files from bin files
but for base 2 files (mirror ram of hm6508 for example)
+ take care: the input bin is a byte bin file, which should only contain nibble per byte (all less or equal to F)
but the generated coe is a series of nibbles.  /!\
Changelog:
2024-04-07:
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
;********  {basefilename}  Block Memory .COE file  *********\n\
;********  {datetime.datetime.now()}  ********************\n\
;********  !!BIT VERSION!!            ********************\n\
;******************************************************************\n"
    radix = "memory_initialization_radix=2;\n"
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
            for ri in range(4):  
                if not first_item:
                    if ri == 0:
                        f.write(",\t;word 0x%03X-%d\n" % (fb.tell()-2, 3))    
                    else:
                        f.write(",\t;word 0x%03X-%d\n" % (fb.tell()-1, ri-1))    

                if int.from_bytes(b, "big")&(1<<ri) != 0:
                    f.write("1")
                else:
                    f.write("0")
                    
                first_item = False    
            b = fb.read(1)
        f.write(" \t;word 0x%03X-3\n" % (fb.tell()-1))    
    f.close()     
    print ("coe base 2 done")


if __name__ == "__main__":
    try:
        fn = sys.argv[1]
    except:
        print("Bin file argument required ...Abort.")
        
    entryPoint(fn)
    