#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
asmparse.py

Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024
'''
from ply import yacc
    
import asmlex
    
from pps4codes import PPS4Inst
    
    
class MyParser:
    
    def __init__(self):
        self.comment = u""
        self.address = self.maxaddress = 0
        self.labels = {}
        self.mode = "prune"
        self.binarray = bytearray(4*1024)

    def p_program(self, p):
        '''program : program statement
                   | statement
        '''    
        if len(p) == 2 and p[1]:
            p[0] = { }
            line, stat = p[1]
            p[0][line] = stat
        elif len(p) == 3:
            p[0] = p[1]
            if not p[0]: p[0] = { }
            if p[2]:
                line, stat = p[2]
                p[0][line] = stat


    def p_program_error(self, p):
        '''program : error'''
        p[0] = None
        p.parser.error = 1
    


    def p_full_code(self, p):
        '''
        fcode :   AD
                | ADC
                | ADSK
                | ADCSK
                | DC
                | AND
                | OR
                | EOR
                | COMP
                | SC
                | RC
                | SF1
                | RF1
                | SF2
                | RF2
                | LAX
                | LXA
                | LABL
                | LBMX
                | LBUA
                | XABL
                | XBMX
                | XAX
                | XS
                | CYS
                | INCB
                | DECB
                | SKC
                | SKZ
                | SKF1
                | SKF2
                | RTN
                | RTNSK
                | DIA
                | DIB
                | DOA
                | SAG       
        '''
        p[0] = p[1]
        
        
    def p_statement_fcode(self, p):
        '''statement  :    fcode 
        '''       
        #print("full code", self.address, PPS4Inst.full_code[p[1]])
        opcode = p[1]
        self.checkPageLimit(opcode, p)
        self.binarray[self.address] = PPS4Inst.full_code[opcode]
        self.moveAddress(1)
        
    def p_statement_adi(self, p):
        '''statement :    ADI  NIBBLE   
                        | ADI  THREE_BIT 

        '''
        # ADI is 0110xxxx
        # xxxx is /param and must be different from 1111 and 0101 and 
        hopcode = 0b0110<<4
        lopcode = ~p[2] & 0xF
        if lopcode == 5 or lopcode == 0xF:
            self.comment += "ERROR ADI INVALID ARGUMENT at line %s (address 0X{0:03X})\n".format(self.address) % (p.lineno(1))
            p[0] = None
            p.parser.error = 1
            return
        
        self.checkPageLimit("ADI", p)

        opcode = hopcode+lopcode
        #print("ADI code", "0X{0:03X}".format(self.address), p[1], p[2], "0X{0:02X}".format(opcode))
        self.binarray[self.address] = opcode
        self.moveAddress(1)
        
        
    def p_statement_ldi(self, p):
        '''statement :    LDI  NIBBLE    
                        | LDI  THREE_BIT 
        '''
        # LDI is 0111xxxx
        # xxx is /param
        #print("LDI code", self.address, p[1], p[2])
        self.checkPageLimit("LDI", p)
        hopcode = 0b0111<<4
        lopcode = ~p[2] & 0xF
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_skbi(self, p):
        '''statement :    SKBI  NIBBLE    
                        | SKBI  THREE_BIT 
        '''
        # SKBI is 0100xxxx
        #print("SKBI code", self.address, p[1], p[2])
        self.checkPageLimit("SKBI", p)
        hopcode = 0b0100<<4
        lopcode = p[2] & 0xF
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_ld(self, p):
        '''statement :    LD  THREE_BIT 
        '''
        # LD is 00110xxx, param is to be encoded as /param
        #print("LD code", self.address, p[1], p[2])
        self.checkPageLimit("LD", p)
        hopcode = 0b00110<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_ex(self, p):
        '''statement :    EX  THREE_BIT 
        '''
        # EX is 00111xxx, param is to be encoded as /param
        #print("EX code", self.address, p[1], p[2])
        self.checkPageLimit("EX", p)
        hopcode = 0b00111<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_exd(self, p):
        '''statement :    EXD  THREE_BIT 
        '''
        # EXD is 00101xxx, param is to be encoded as /param
        #print("EXD code", self.address, p[1], p[2])
        self.checkPageLimit("EXD", p)
        hopcode = 0b00101<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_lbl(self, p):
        '''statement :    LBL      tbyte 
        '''
        # LBL is 0x00 OxXX, param 0xXX is to be encoded as /param
        # this is a 2-cycle instruction
        #print("LBL code", self.address, p[1], p[2])
        self.checkPageLimit("LBL", p)
        self.binarray[self.address] = 0
        self.binarray[self.address+1] = ~p[2] & 0xFF
        self.moveAddress(2)

    def p_statement_lb(self, p):
        '''statement :   LB  LPAREN tbyte RPAREN  BFEED tbyte RPAREN 
                       | LB  LPAREN tbyte RPAREN                     
        '''
        # there is a 16 indirection table where to find the
        # target data
        # LB is C0..CF  
        # C0..CF is also the table loc where to find B(8..1)      
        # this is a 2-cycle but 1-rom loc instruction
        #print("LB code", self.address, p[1], p[3])
        self.checkPageLimit("LB", p)

        opcode = p[3]

        if opcode < 0xC0 or opcode > 0xCF:
            if self.mode != "prune":
                self.comment += "ERROR LB INVALID ARGUMENT at line %s (address 0X{0:03X})\n".format(self.address) % (p.lineno(1))
                p[0] = None
                p.parser.error = 1
                return
            
            
        self.binarray[self.address] = opcode
        
        #whether we populate the table or not depends on the used source syntax
        if len(p) == 8:
            self.binarray[opcode] = ~p[6]&0XFF
            #print("LB: set table: 0X{0:02X} at address 0X{1:03X} (at line {2})".format(~p[6]&0XFF, opcode, p.lineno(1)))
        
        if opcode > self.maxaddress:
            self.maxaddress = opcode 
                       
        self.moveAddress(1)

    def p_statement_iol(self, p):
        '''statement :    IOL      tbyte 
         '''
        #print("IOL code", self.address, p[1], p[2])
        self.checkPageLimit("IOL", p)
        
        self.binarray[self.address] = 0x1C
        self.binarray[self.address+1] = p[2]
        self.moveAddress(2)
    
    def p_tptr(self, p):
        '''
           tptr :       ADDRESS
                      | BYTE
                      | PAGE
                      | NIBBLE
                      | THREE_BIT
                      | value
        '''  
        p[0] = p[1]  
        

    def p_exp_var(self, p):
        '''
           value : LABEL
        '''
        p[0] = self.labels.get(p[1], 0)
               
    def p_tbyte(self, p):
        '''
           tbyte :      BYTE
                      | PAGE
                      | NIBBLE
                      | THREE_BIT
                      | value
        '''    
        p[0] = p[1]  
        
    def p_statement_t(self, p):
        '''statement :  T tptr     
        '''
        # T is 10xxxxxx xxxxxx is the index in current page
        # so for absolute address in label as expected
        # the target value is LABEL 6 lower bits
        # provided that both are in the same page (ident 6 higher bits) or error
        # in prune mode set this param to 0
        #print("T code", self.address, p[1], p[2])
        
        #print("goto :",p[2])
        target_page_index = p[2] & 0b111111
        if p[2] & 0b111111000000 != self.address & 0b111111000000:
            if self.mode != "prune":
                self.comment += "ERROR T OFF RANGE TARGET ADDRESS at line %s (current addr. 0X{0:03X}, target addr. 0X{1:03X})\n".format(self.address, p[2]) % (p.lineno(1))
                p[0] = None
                p.parser.error = 1
                return
            
        hopcode = 0b10<<6
        lopcode = target_page_index
        opcode = hopcode+lopcode
        #print("goto :",p[2], "opcode {0:02X}".format(opcode))
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_tl(self, p):
        '''statement :  TL tptr     
        '''
        # TL is 0101yyyy xxxxxx with yyyyxxxxxxxx being the target address
        # 2 cycles
        #print("TL code", self.address, p[1], "0X{0:03X}".format(p[2]))
        
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))

        self.checkPageLimit("TL", p)
            
        hopcode = 0b0101<<4
        lopcode = (p[2] & 0b111100000000) >> 8
        opcode = hopcode+lopcode
        self.binarray[self.address]   = opcode
        self.binarray[self.address+1] = p[2] & 0xFF
        self.moveAddress(2)

    def p_statement_tml(self, p):
        '''statement :  TML tptr     
        '''
        # TML is 000000yy xxxxxxxx 
        # 2 cycles
        #print("TML code", self.address, p[1], p[2])
        
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))
        target_page = (p[2] & 0b111111000000)>>6
        if target_page < 4 or target_page > 15:
            if self.mode != "prune":
                print("ERROR TML ONLY WORKS FOR TARGET ADDRESS ON PAGE 4 TO 15 ")
        opcode = (p[2] & 0b001100000000) >> 8
        
        self.checkPageLimit("TML", p)
            
        self.binarray[self.address]   = opcode
        self.binarray[self.address+1] = p[2] & 0xFF
        self.moveAddress(2)

    def p_statement_tm(self, p):
        '''statement :   TM  LPAREN tbyte RPAREN  TFEED tptr RPAREN 
                       | TM  LPAREN tbyte RPAREN                    
        '''
        # TM is 11xx.... xx...... is the page index inside page 3
        # 2 cycles but only 1 rom word
        #print("TM code", self.address, p[1], p[2])
        #
        # the target address must be in page 4 through 7
        # target=0001xx yyyyyy
        # 
        # table is in 000011 pqzzzz pq!=00
        # 
        # target address is in p[2]
        # rank in indirect table is in p[4]
        #
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))
        #
        self.checkPageLimit("TM", p)

        opcode = p[3]

        if opcode < 0xD0 or opcode > 0xFF:
            if self.mode != "prune":
                self.comment += "ERROR TM INVALID ARGUMENT 1 0X{1:02X} at line %s - must be in range 0XD0..0XFF (address 0X{0:03X})\n".format(self.address, opcode) % (p.lineno(1))
                p[0] = None
                p.parser.error = 1
                return
            
            
        self.binarray[self.address] = opcode
        
        #whether we populate the table or not depends on the used source syntax
        if len(p) == 8:
            if p[6] > 0x1FF:
                if self.mode != "prune":
                    self.comment += "ERROR TM INVALID ARGUMENT 2 at line %s (address 0X{0:03X})\n".format(self.address) % (p.lineno(1))
                    p[0] = None
                    p.parser.error = 1
                    return
                
            self.binarray[opcode] = p[6]&0xFF
            #print("TM: set table: 0X{0:02X} at address 0X{1:03X} (at line {2})".format(p[6]&0xFF, opcode, p.lineno(1)))
            if opcode > self.maxaddress:
                self.maxaddress = opcode 
                       
        self.moveAddress(1)



    def p_statement_dec_label(self, p):
        '''statement :     LABEL HYPHEN NEWLINE'''
        self.labels[p[1]] = self.address

    def p_statement_setb(self, p):
        '''statement :    SETB      tbyte 
        '''
        #print("SETB code", self.address, p[1], p[2])
        self.binarray[self.address]   = p[2]
        self.moveAddress(1)

    def p_statement_eqx(self, p):
        '''statement :    LABEL  EQX   tbyte NEWLINE
        '''
        #print("Constant BYTE affectation", p[1], p[3])
        self.labels[p[1]] = p[3]

    def p_statement_ptr(self, p):
        '''statement :    LABEL  PTR   tptr NEWLINE
        '''
        #print("Constant BYTE affectation", p[1], p[3])
        self.labels[p[1]] = p[3]


    def p_statement_section(self,p):
        '''
        statement : SECTION tptr NEWLINE
        '''  
        self.address = p[2]    
        if self.address > self.maxaddress:
            self.maxaddress = self.address 
                         
    def p_statement_comment(self, p):
        'statement : COMMENT'
        #print("comment", p[1])
        
    # def p_statement_label(self, p):
    #     'statement : LABEL NEWLINE'
    #     print( "instance label", p[1] )
    #

    # def p_statement_ldi(self, p):
    #     'statement : LDI NUMBER '
    #     print("ldi number", p[1], p[2])
    #

    def p_statement_blank(self, p):
        '''statement :  NEWLINE'''
        #p[0] = (0, ('BLANK', int(p[1])))

    # Error rule for syntax errors
    def p_error(self, p):
        self.bparser.error = 1
        if p:
            self.comment = "Syntax error at line %s : '%s'\n" % (p.lineno, p.value)
        else:
            self.comment = "Syntax error at EOF\n"    
            
            
            
    # Build the parser
    def build(self, **kwargs):
        self.tokens = asmlex.MyLexer.tokens
        self.bparser = yacc.yacc('LALR', 0, self, write_tables=0, debugfile=None)
        # self.precedence = (
        #                     ('left', 'LPAREN'),
        #                     ('left', 'BFEED'),
        #                     ('left', 'TFEED')
        #                   )
    def parse(self, data, debug=0):
        self.bparser.error = 0
        p = self.bparser.parse(data, debug=debug)
        if self.bparser.error: return None
        return p

    def moveAddress(self, offset):
        self.address += offset
        if self.maxaddress < self.address: 
            self.maxaddress = self.address
            
    def checkPageLimit(self, mnemonic, p):
        '''
        Here we check that:
        - a 2-rom loc instruction is not straddling page frontier
        '''
        #LBL cannot be n-1, nor n-2
        #TL  cannot be n-1, but can be n-2
        #TML cannot be n-1, nor n-2
        #IOL cannot be n-1, nor n-2
        #all codes in full_code cannot be n-1, except rtn and rtnsk
        
        if (self.address & 0b111111) == 62:          
            cannotbe_b2pg  = PPS4Inst.forbiddenb2pg_code
            if mnemonic in cannotbe_b2pg and self.mode != "prune":
                self.comment += "WARNING: PAGE LIMIT just after mnemonic %s at line %s (address 0X{0:03X})\n".format(self.address) % (mnemonic, p.lineno(1))
                # p[0] = None
                # p.parser.error = 1
                return "bad n-2"
            else:
                return "good"
            
        if (self.address & 0b111111) == 63:  
            if mnemonic in ['RTN', 'RTNSK', 'T'] or self.mode == "prune":
                return "good"                    
            self.comment += "WARNING: PAGE LIMIT just after mnemonic %s at line %s (address 0X{0:03X})\n".format(self.address) % (mnemonic, p.lineno(1))
            # p[0] = None
            # p.parser.error = 1
            return "bad n-1"

        #no probs: address is neither n-1 nor n-2
        return "good"
       
        
        
        