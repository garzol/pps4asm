# pps4asm
A simple assembler for PPS-4 systems
written in python

Yet Another Rockwell pps-4 Assembler "yarp_A" PPS-4   

Unique too, since any trace of such a tool is apparently long lost.


### Usage
`python3 asmpps.py <sourcefile.as>`

If everything goes well, you'll get a binary `sourcefile.bin` in the current directory  
This file is a raw binary containing your programm coded in PPS-4 and directly executable on a PPS-4 system.      

Warnings and errors are printed to the standard output.


### Syntax

#### Introduction
The list of all authorized mnemonics with their description can be found [here](https://www.pps4.fr/dasm/instdoc/)   

An asm source file is basically made of a series of mnemnic codes, such as follows:  

``` 
COMP				
XS					
CYS					; Cycle SA register and Accumulator
LAX					; Load Accumulator from X Register
CYS					; Cycle SA register and Accumulator
LAX					; Load Accumulator from X Register
ADI	0X1				
LDI	0X7				
LDI	0XA				
CYS					; Cycle SA register and Accumulator
RTN			
```
You normally write one mnemonic per line, but multiple mnemonics on the same line is even permitted, even if it is not recommended.  

``` 
XAX CYS LDI 0XE RTN
LAX LXA
...

```

#### Lowercase/Uppercase
There is **no distinction** between lowercase and uppercase characters  
`LDI` is equivalent to `ldi` or even `lDi`  

#### Directives

##### SECTION
Mnemonics are decoded and inserted in the binary file at the current marked address. Then, this marked address is incremented by 1 or 2, depending on the mnemonic size.  
All mnmonics are encoded on a single byte except for the following list, whose size is 2-byte:  
> ['LBL', 'TL', 'TML', 'IOL']
   
To begin a routine at a specified address, use the directive `SECTION` like this:  
`SECTION 0X543`  

Then, the next instruction will be implemented at 0x543    

Any address can be specified in the range [0X000, 0XFFF]


By default, if no `SECTION` is specified the first encountered instruction is encoded at address 0x000    
The maximum size of a pps-4 binary file is 0x1000 bytes (4KB)  

> No verification of any sort is made. If not taken care of, overlaps are possible, so that code may be overwritten, leading to loss of data
>
> :exclamation: Avoid writing code in range 0X0C0..0X0FF:
> In PPS-4 systems, 0X0C0..0X0CF is a reserved 16-byte indirection table for instruction `LB`  
> In PPS-4 systems, 0X0D0..0X0FF is a reserved 32-byte indirection table for instruction `TM`



##### EQX

##### PTR

##### SETB


#### Standard encoding

#### Writing comments in an as source file
Comments can be inserted anywhere in your source. Just type a ";" and everything after it on this line will be ignored  
Example:  
`; you can write anything you want after a ';'`  
`; everything that follows, to the end of the line, will be ignored `