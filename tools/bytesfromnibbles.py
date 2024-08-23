'''
Created on 23 sept. 2023

@author: a030466

This utility for concatneating 2 nibbles (each one in a byte, so that it is 00..0F) into 1 byte'''

import sys
import os.path as path

def usage(progname):
    progshort = path.basename(progname)
    #print(f"usage : python {progshort} input_bin_file start_addr offset_addr")
    print(f"usage : {progshort} input_bin_file ")


    
if __name__ == '__main__':   
    #print ("Start...")
    try:
        inputfilename=sys.argv[1]
    except:
        usage(sys.argv[0])
        print("...Abort")
        sys.exit()
    
    if not path.isfile(inputfilename):
        print ( inputfilename + " not found... Abort")    
        sys.exit()
    
    with open(inputfilename, "rb") as fb:
        bn = fb.read()
    
    # print(type(bn))
    # print(bn)
    # print([b for b in bn])
    #bnr = bytes([(255-b) for b in reversed(bn) ])
    bnrl  = bn[::2]
    bnrh  = bn[1::2]
    bnr   = list(zip(bnrl, bnrh))
    bnrhl = [16*h+l for l,h in bnr]
    #sys.stdout.buffer.write(bytes(reversed(bn)))
    sys.stdout.buffer.write(bytes(bnrhl))