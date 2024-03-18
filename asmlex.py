#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
asmlex.py

Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024
'''
import re
from ply import lex

from pps4codes import PPS4Inst

# List of token names.   This is always required

class MyLexer:  

 
    directives = (
        'SETB',
        'EQU',
        )
                                                     
    comp_opcodes = (
        'ADI',
        'LDI',
        'LD',
        'EX',
        'EXD',
        'LB',
        'T',
        'TL',
        'TM',
        'TML',
        'SKBI',
        )
    opcodes = PPS4Inst.full_code.keys()
    #tokens = tuple(opcodes.values())+ (
    tokens = directives + comp_opcodes + tuple(opcodes) + (
       'HYPHEN',
       'COMMA',
       #'STRING',
       #'EQUAL',
       #'LABEL',
       'NEWLINE',
       'LABEL',
       'ADDRESS', # value of type 0xabc
       'BYTE',
       'PAGE',
       'NIBBLE',
       'THREE_BIT',
       #'BADDRESS', # value of type 0xabc but written in binary 0B0111100...
       'COMMENT',
       #'DADDRESS', # value of type 0xabc but written in standard decimal 
    )
    
    # Regular expression rules for simple tokens
    t_HYPHEN  = r':'
    #t_STRING  = r'\".*?\"'
    #t_EQUAL   = r'='
    t_COMMA   = r','
    #t_INOUT   = r'\*'



    def __init__(self):
        self.comment = ""

    #for comments
    def t_COMMENT(self, t):
        r';.*'
        return t
       
    # A regular expression rule with some action code
    #the following is new in V3.5.5
    #to handle backslashes inside strings 
    #such as "xxxxx \" yyyy \n \\"
    #implying that 
    #to display a \ you will type \\
    #to display a " you will type \"
    #to display a cr you will type \n    
    # def t_STRING(self, t):
    #     r'\"(([^\\].*?|[\\].)*?)\"'        
    #     try:
    #         t.value = re.sub(r'\"(.*)\"', r'\1', t.value)
    #         #t.value = re.sub(r'\"(.*)\"', r'\1', t.value).decode('string-escape')
    #     except:
    #         #print "trailing \ at a wrong place at line %s" % (t.lexer.lineno)
    #         self.comment += "trailing \ at a wrong place at line %s\n" % (t.lexer.lineno)
    #         t.lexer.skip(1)
    #
    #     return t
    
    def t_LABEL(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        if t.value in self.directives:
            t.type = t.value    # Check for reserved words
        if t.value in self.opcodes:
            t.type = t.value    # Check for reserved words
        if t.value in self.comp_opcodes:
            t.type = t.value    # Check for reserved words
        return t
        
    def t_ADDRESS(self, t):
        r'0X[a-fA-F0-9]{1,3}'
        t.value = int(t.value, 16)
        if t.value < 8:
            t.type = "THREE_BIT"
        elif t.value < 16:
            t.type = "NIBBLE"
        elif t.value < 64:
            t.type = "PAGE"
        elif t.value < 256:
            t.type = "BYTE"            
        return t
    

    def t_BADDRESS(self, t):
        r'0B[0|1]{1,12}'
        t.value = int(t.value, 2)
        if t.value < 8:
            t.type = "THREE_BIT"
        elif t.value < 16:
            t.type = "NIBBLE"
        elif t.value < 64:
            t.type = "PAGE"
        elif t.value < 256:
            t.type = "BYTE"
        else:
            t.type ="ADDRESS"
        return t
    
    def t_DADDRESS(self, t):
        r'\d+'
        t.value = int(t.value)
        if t.value < 8:
            t.type = "THREE_BIT"
        elif t.value < 16:
            t.type = "NIBBLE"
        elif t.value < 64:
            t.type = "PAGE"
        elif t.value < 256:
            t.type = "BYTE"
        else:
            t.type ="ADDRESS"
        return t
    
    # def t_LABEL(self, t):
    #     r'[a-zA-Z_][a-zA-Z_0-9]*'
    #     if t.value in self.opcodes:
    #         t.type = t.value
    #     return t

    # Define a rule so we can track line numbers
    def t_NEWLINE(self, t):
        r'\n+'
        t.lexer.lineno += len(t.value)
        return t
    

    # A string containing ignored characters (spaces and tabs)
    t_ignore  = ' \t'


 
    # Error handling rule
    def t_error(self, t):
        #print "Illegal character '%s' at line %s" % (t.value[0], t.lexer.lineno)
        self.comment += "Illegal character '%s' at line %s\n" % (t.value[0], t.lexer.lineno)
        t.lexer.skip(1)
    
    # Build the lexer
    def build(self,**kwargs):
        self.lexer = lex.lex(module=self, **kwargs)
 
    # Test it output
    def test(self,data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok: break
            print( tok )
    
    
    
        