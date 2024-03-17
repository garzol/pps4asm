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

 
    
                                                     
    # opcodes = {
    #         'AD'   : 'AD',
    #         'LDI'  : 'LDI'
    #
    #         }
    opcodes = PPS4Inst.full_code.keys()
    #tokens = tuple(opcodes.values())+ (
    tokens = tuple(opcodes) + (
       'HYPHEN',
       #'STRING',
       'EQUAL',
       #'LABEL',
       'NEWLINE',
       'INSTANCE',
       'COMMENT',
    )
    
    # Regular expression rules for simple tokens
    t_HYPHEN  = r':'
    #t_STRING  = r'\".*?\"'
    t_EQUAL   = r'='
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
    
    def t_INSTANCE(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        if t.value in self.opcodes:
            t.type = t.value    # Check for reserved words
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
    
    
    
        