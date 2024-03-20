#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
pps4codes.py

Created on 7 march. 2024

@author: garzol
Copyright AA55 Consulting 2024
'''


class PPS4Inst:
    full_code = {
        'AD'    : 0x0B,
        'ADC'   : 0x0A,
        'ADSK'  : 0x09,
        'ADCSK' : 0x08,
        'DC'    : 0x65,
        'AND'   : 0x0D,
        'OR'    : 0x0F,
        'EOR'   : 0x0C,
        'COMP'  : 0x0E,
        'SC'    : 0x20,
        'RC'    : 0x24,
        'SF1'   : 0x22,
        'RF1'   : 0x26,
        'SF2'   : 0x21,
        'RF2'   : 0x25,
        'LAX'   : 0x12,
        'LXA'   : 0x1B,
        'LABL'  : 0x11,
        'LBMX'  : 0x10,
        'LBUA'  : 0x04,
        'XABL'  : 0x19,
        'XBMX'  : 0x18,
        'XAX'   : 0x1A,
        'XS'    : 0x06,
        'CYS'   : 0x6F,
        'LBL'   : 0x00,
        'INCB'  : 0x17,
        'DECB'  : 0x1F,
        'SKC'   : 0x15,
        'SKZ'   : 0x1E,
        'SKF1'  : 0x16,
        'SKF2'  : 0x14,
        'RTN'   : 0x05,
        'RTNSK' : 0x07,
        'IOL'   : 0x1C,
        'DIA'   : 0x27,
        'DIB'   : 0x23,
        'DOA'   : 0x1D,
        'SAG'   : 0x13,
        }

    birom_code = ['LBL', 'TL', 'TML', 'IOL']
    forbiddenb2pg_code = ['LBL', 'TML', 'IOL']
    
    #to be added to full_code, and remove RTN*
    forbiddenb1pg_code = ['TML', 'TL']
