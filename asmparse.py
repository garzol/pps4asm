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
    
    
    
class MyParser:
    def __init__(self):
        self.comment = u""

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




    def p_statement_AD(self, p):
        '''statement  :    AD NEWLINE
                        '''
        print("AD command", p[1])

       
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
