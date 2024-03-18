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
    def __init__(self, fp):
        self.comment = u""
        self.address = 0
        self.labels = {}
        
        self.fp = fp

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
        '''
        p[0] = p[1]
        
        
    def p_statement_fcode(self, p):
        '''statement  :    fcode NEWLINE
        '''       
        print("full code", self.address, PPS4Inst.full_code[p[1]])
        self.address += 1

    def p_statement_adi(self, p):
        '''statement :    ADI  NIBBLE   NEWLINE
                        | ADI  THREE_BIT NEWLINE

        '''
        print("ADI code", self.address, p[1], p[2])
        self.address += 1
        
    def p_statement_ldi(self, p):
        '''statement :    LDI  NIBBLE    NEWLINE
                        | LDI  THREE_BIT NEWLINE
        '''
        print("LDI code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_skbi(self, p):
        '''statement :    SKBI  NIBBLE    NEWLINE
                        | SKBI  THREE_BIT NEWLINE
        '''
        print("SKBI code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_ld(self, p):
        '''statement :    LD  THREE_BIT NEWLINE
        '''
        print("LD code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_ex(self, p):
        '''statement :    EX  THREE_BIT NEWLINE
        '''
        print("EX code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_exd(self, p):
        '''statement :    EXD  THREE_BIT NEWLINE
        '''
        print("EXD code", self.address, p[1], p[2])
        self.address += 1

    def p_statement_lbl(self, p):
        '''statement :    LBL      BYTE NEWLINE
                        | LBL      PAGE NEWLINE
                        | LBL    NIBBLE NEWLINE
                        | LBL THREE_BIT NEWLINE
        '''
        print("LBL code", self.address, p[1], p[2])
        self.address += 2

    def p_statement_iol(self, p):
        '''statement :    IOL      BYTE NEWLINE
                        | IOL      PAGE NEWLINE
                        | IOL    NIBBLE NEWLINE
                        | IOL THREE_BIT NEWLINE
        '''
        print("IOL code", self.address, p[1], p[2])
        self.address += 2

    def p_statement_t(self, p):
        '''statement :  T LABEL     NEWLINE
        '''
        print("T code", self.address, p[1], p[2])
        
        print("goto :",self.labels.get(p[2], "UNKNOWN"))
        self.address += 1

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
