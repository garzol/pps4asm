

import sys

for i in range(16):
    for j in range(16):
        
        if j==0 or j==1:
            s1=i
        else:
            s1 = ((i+j)%16)//2
        
        s = s1.to_bytes(1, "big")
        sys.stdout.buffer.write(s)