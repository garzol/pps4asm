'''
Created on 4 déc. 2023

@author: garzol
'''


#spaced every 4KB
games = {
    0x00000 : ("ordin1K.bin", "ordin.bin", 0xDE5D),     #for tests
    0x01000 : ("A1762-13_1K.bin", "al.bin", 0x0000),    #alaska
    0x02000 : ("bmA1762.bin", "bmgame.bin", 0x1065),    #black magic 1p
    0x03000 : ("b4A1762.bin", "b4game.bin", 0x1066),    #black magic 4p
    0x04000 : ("A1762-13_1K.bin", "ca.bin", 0x1062),    #cavalier
    0x05000 : ("crA1762.bin", "crgame.bin", 0x1054),    #crazy race
    0x06000 : ("A1762-13_1K.bin", "fa.bin", 0x1053),    #fair-fight
    0x07000 : ("A1762-13_1K.bin", "hc.bin", 0x0000),    #hot&cold
    0x08000 : ("flA1762.bin", "flgame.bin", 0x0000),    #the flipper game
    0x09000 : ("A1762-13_1K.bin", "md.bin", 0x1060),    #mr doom
    0x0A000 : ("A1762-13_1K.bin", "me.bin", 0x1055),    #mr evil
    0x0B000 : ("A1762-13_1K.bin", "pokerplus_BA65.BIN", 0x1051),    #pokerplus
    0x0C000 : ("A1762-13_1K.bin", "qu.bin", 0x1063),    #quijote
    0x0D000 : ("A1762-13_1K.bin", "sc_1_1702.bin", 0x2004),    #screech
    0x0E000 : ("A1762-13_1K.bin", "sw.bin", 0x1061),    #swashbuckler
    0x0F000 : ("A1762-13_1K.bin", "to.bin", 0x1056),    #swashbuckler
    0x10000 : ("ordin1K.bin", "ordin1K.bin", 0xDE5D),   #for tests
    
    }

def main():
    print("coucou")

    #create rom 1MB  
    f = open("genroms/data.bin", "wb")
    for _ in range (0, 0x100000):
        f.write(b'\xff')
    
    f.seek(0)
    
    basedir = "rsys3roms/"
    
    for k,v in games.items():
        try:
            fp = open(basedir+"A1762/"+v[0], "rb")
        except:
            print(basedir+"A1762/"+v[0], "not found... Exit")
            exit(0)
        data1 = fp.read()
        try:
            fp = open(basedir+"games/"+v[1], "rb")
        except:
            print(basedir+"games/"+v[1], "not found... Exit")
            exit(0)
        data2 = fp.read()
        #print("len gamei", type(data2), len(data2))
        if len(data2)>0x400:
            print(f"file size error... Exit (file:{v[1]})")
            exit(0)
        data2 = data2+(0x400 - len(data2))*b'\x81'     #on complète à 1K avec des 0x81
        #print("len gamei after", type(data2), len(data2))
        f.seek(k)
        f.write(data1)
        f.write(data2)
        
            
    f.close()   
    print("Done")
  
            
if __name__ == '__main__':
    main()