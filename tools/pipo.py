

import sys


def pattern4():
    for i in range(16):
        for j in range(16):
            
            if j==0 or j==1:
                s1=i
            else:
                s1 = ((i+j)%16)//2
            
            s = s1.to_bytes(1, "big")
            sys.stdout.buffer.write(s)


def pattern555():
    s5 = 5
    for i in range(16):
        for j in range(16):
            s = s5.to_bytes(1, "big")
            sys.stdout.buffer.write(s)

def patternAAA():
    sx = 10
    for i in range(16):
        for j in range(16):
            s = sx.to_bytes(1, "big")
            sys.stdout.buffer.write(s)


if __name__ == "__main__":
    # try:
    #     fn = sys.argv[1]
    # except:
    #     print("Bin file argument required ...Abort.")
        
    patternAAA()

            
            
            
