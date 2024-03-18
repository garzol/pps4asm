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
        '''statement  :    fcode NEWLINE
        '''       
        #print("full code", self.address, PPS4Inst.full_code[p[1]])
        self.binarray[self.address] = PPS4Inst.full_code[p[1]]
        self.moveAddress(1)
        
    def p_statement_adi(self, p):
        '''statement :    ADI  NIBBLE   NEWLINE
                        | ADI  THREE_BIT NEWLINE

        '''
        # ADI is 0110xxxx
        # xxxx is /param and must be different from 1111 and 0101 and 
        hopcode = 0b0110<<4
        lopcode = ~p[2] & 0xF
        if lopcode == 5 or lopcode == 0xF:
            print("ERROR ADI INVALID ARGUMENT")
        opcode = hopcode+lopcode
        #print("ADI code", self.address, p[1], p[2], opcode)
        self.binarray[self.address] = opcode
        self.moveAddress(1)
        
        
    def p_statement_ldi(self, p):
        '''statement :    LDI  NIBBLE    NEWLINE
                        | LDI  THREE_BIT NEWLINE
        '''
        # LDI is 0111xxxx
        # xxx is /param
        #print("LDI code", self.address, p[1], p[2])
        hopcode = 0b0111<<4
        lopcode = ~p[2] & 0xF
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_skbi(self, p):
        '''statement :    SKBI  NIBBLE    NEWLINE
                        | SKBI  THREE_BIT NEWLINE
        '''
        # SKBI is 0100xxxx
        #print("SKBI code", self.address, p[1], p[2])
        hopcode = 0b0100<<4
        lopcode = p[2] & 0xF
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_ld(self, p):
        '''statement :    LD  THREE_BIT NEWLINE
        '''
        # LD is 00110xxx, param is to be encoded as /param
        #print("LD code", self.address, p[1], p[2])
        hopcode = 0b00110<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_ex(self, p):
        '''statement :    EX  THREE_BIT NEWLINE
        '''
        # EX is 00111xxx, param is to be encoded as /param
        #print("EX code", self.address, p[1], p[2])
        hopcode = 0b00111<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_exd(self, p):
        '''statement :    EXD  THREE_BIT NEWLINE
        '''
        # EXD is 00101xxx, param is to be encoded as /param
        #print("EXD code", self.address, p[1], p[2])
        hopcode = 0b00101<<3
        lopcode = ~p[2] & 0x7
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_lbl(self, p):
        '''statement :    LBL      BYTE NEWLINE
                        | LBL      PAGE NEWLINE
                        | LBL    NIBBLE NEWLINE
                        | LBL THREE_BIT NEWLINE
        '''
        # LBL is 0x00 OxXX, param 0xXX is to be encoded as /param
        # this is a 2-cycle instruction
        #print("LBL code", self.address, p[1], p[2])
        self.binarray[self.address] = 0
        self.binarray[self.address+1] = ~p[2] & 0xFF
        self.moveAddress(2)

    def p_statement_lb(self, p):
        '''statement :    LB   BYTE      COMMA NIBBLE    NEWLINE
                        | LB   NIBBLE    COMMA NIBBLE    NEWLINE
                        | LB   THREE_BIT COMMA NIBBLE    NEWLINE
                        | LB   BYTE      COMMA THREE_BIT NEWLINE
                        | LB   NIBBLE    COMMA THREE_BIT NEWLINE
                        | LB   THREE_BIT COMMA THREE_BIT NEWLINE
        '''
        # there is a 16 indirection table where to find the
        # target data
        # LB is C0..CF  
        # C0..CF is also the table loc where to find B(8..1)      
        # this is a 2-cycle but 1-rom loc instruction
        #print("LB code", self.address, p[1], p[2])

        ind_table_rank = p[4]
        opcode = 0b11 << 6 + ind_table_rank

        ind_target = self.labels.get(p[2], 0) & 0xFF

        self.binarray[self.address] = opcode
        self.binarray[opcode] = ind_target
        
        if opcode > self.maxaddress:
            self.maxaddress = opcode 
                       
        self.moveAddress(1)

    def p_statement_iol(self, p):
        '''statement :    IOL      BYTE NEWLINE
                        | IOL      PAGE NEWLINE
                        | IOL    NIBBLE NEWLINE
                        | IOL THREE_BIT NEWLINE
        '''
        #print("IOL code", self.address, p[1], p[2])
        self.binarray[self.address] = 0x1C
        self.binarray[self.address+1] = p[2]
        self.moveAddress(2)

    def p_statement_t(self, p):
        '''statement :  T LABEL     NEWLINE
        '''
        # T is 10xxxxxx xxxxxx is the index in current page
        # so for absolute address in label as expected
        # the target value is LABEL 6 lower bits
        # provided that both are in the same page (ident 6 higher bits) or error
        # in prune mode set this param to 0
        #print("T code", self.address, p[1], p[2])
        
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))
        target_page_index = self.labels.get(p[2], 0) & 0b111111
        if self.labels.get(p[2], 0) & 0b111111000000 != self.address & 0b111111000000:
            print("ERROR T OFF RANGE TARGET ADDRESS")
            
        hopcode = 0b10<<6
        lopcode = target_page_index
        opcode = hopcode+lopcode
        self.binarray[self.address] = opcode
        self.moveAddress(1)

    def p_statement_tl(self, p):
        '''statement :  TL LABEL     NEWLINE
        '''
        # TL is 0101yyyy xxxxxx with yyyyxxxxxxxx being the target address
        # 2 cycles
        #print("TL code", self.address, p[1], p[2])
        
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))
        target_page_index = self.labels.get(p[2], 0) & 0b111111
        if self.labels.get(p[2], 0) & 0b111111000000 != self.address & 0b111111000000:
            print("ERROR T OFF RANGE TARGET ADDRESS")
            
        hopcode = 0b0101<<4
        lopcode = (self.labels.get(p[2], 0) & 0b111100000000) >> 8
        opcode = hopcode+lopcode
        self.binarray[self.address]   = opcode
        self.binarray[self.address+1] = self.labels.get(p[2], 0) & 0xFF
        self.moveAddress(2)

    def p_statement_tml(self, p):
        '''statement :  TML LABEL     NEWLINE
        '''
        # TML is 000000yy xxxxxxxx 
        # 2 cycles
        #print("TML code", self.address, p[1], p[2])
        
        #print("goto :",self.labels.get(p[2], "UNKNOWN"))
        target_page = (self.labels.get(p[2], 0) & 0b111111000000)>>6
        if target_page < 4 or target_page > 15:
            print("ERROR TML ONLY WORKS FOR TARGET ADDRESS ON PAGE 4 TO 15 ")
        opcode = (self.labels.get(p[2], 0) & 0b001100000000) >> 8
            
        self.binarray[self.address]   = opcode
        self.binarray[self.address+1] = self.labels.get(p[2], 0) & 0xFF
        self.moveAddress(2)

    def p_statement_tm(self, p):
        '''statement :   TM ADDRESS   COMMA PAGE      NEWLINE
                       | TM ADDRESS   COMMA BYTE      NEWLINE
                       | TM ADDRESS   COMMA NIBBLE    NEWLINE
                       | TM ADDRESS   COMMA THREE_BIT NEWLINE
                       | TM PAGE      COMMA PAGE      NEWLINE
                       | TM PAGE      COMMA BYTE      NEWLINE
                       | TM PAGE      COMMA NIBBLE    NEWLINE
                       | TM PAGE      COMMA THREE_BIT NEWLINE
                       | TM BYTE      COMMA PAGE      NEWLINE
                       | TM BYTE      COMMA BYTE      NEWLINE
                       | TM BYTE       COMMA NIBBLE    NEWLINE
                       | TM BYTE      COMMA THREE_BIT NEWLINE
                       | TM NIBBLE    COMMA PAGE      NEWLINE
                       | TM NIBBLE    COMMA BYTE      NEWLINE
                       | TM NIBBLE    COMMA NIBBLE    NEWLINE
                       | TM NIBBLE    COMMA THREE_BIT NEWLINE
                       | TM THREE_BIT COMMA PAGE      NEWLINE
                       | TM THREE_BIT COMMA BYTE      NEWLINE
                       | TM THREE_BIT COMMA NIBBLE    NEWLINE
                       | TM THREE_BIT COMMA THREE_BIT NEWLINE
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
        ind_table_rank = p[4]
        opcode = 0b11 << 6 + ind_table_rank
        target_page = (self.labels.get(p[2], 0) & 0b111111000000)>>6
        if target_page < 4 or target_page > 7:
            print("ERROR TM ONLY WORKS FOR TARGET ADDRESS ON PAGE 4 TO 15 ")
        ind_target = self.labels.get(p[2], 0) & 0xFF
        if opcode < 0xD0 or opcode > 0xFF:
            print("ERROR TM ARGUMENT NOT IN TABLE RANGE")

        if opcode > self.maxaddress:
            self.maxaddress = opcode 
               
        self.binarray[self.address]   = opcode
        self.binarray[opcode]         = ind_target
        self.moveAddress(1)

    def p_statement_dec_label(self, p):
        '''statement :     LABEL HYPHEN NEWLINE'''
        self.labels[p[1]] = self.address

    def p_statement_setb(self, p):
        '''statement :    SETB      BYTE NEWLINE
                        | SETB      PAGE NEWLINE
                        | SETB    NIBBLE NEWLINE
                        | SETB THREE_BIT NEWLINE
        '''
        print("SETB code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_equ(self, p):
        '''statement :    LABEL  EQU   ADDRESS NEWLINE
                        | LABEL  EQU      BYTE NEWLINE
                        | LABEL  EQU      PAGE NEWLINE
                        | LABEL  EQU    NIBBLE NEWLINE
                        | LABEL  EQU THREE_BIT NEWLINE
        '''
        print("Constant affectation", p[1], p[3])
        self.labels[p[1]] = p[3]

                       
    def p_statement_comment(self, p):
        'statement : COMMENT'
        print("comment", p[1])
        
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
    
    def parse(self, data, debug=0):
        self.bparser.error = 0
        p = self.bparser.parse(data, debug=debug)
        if self.bparser.error: return None
        return p

    def moveAddress(self, offset):
        self.address += offset
        if self.maxaddress < self.address: 
            self.maxaddress = self.address
        