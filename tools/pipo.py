

import sys

for i in range(0,256):    
    s1 = i&0x0F
        
    s = s1.to_bytes(1, "big")
    sys.stdout.buffer.write(s)