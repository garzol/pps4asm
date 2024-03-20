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

A line containing the `section` directive does not support any other information, not even a comment.

By default, if no `SECTION` is specified the first encountered instruction is encoded at address 0x000    
The maximum size of a pps-4 binary file is 0x1000 bytes (4KB)  

> No verification of any sort is made. If not taken care of, overlaps are possible, so that code may be overwritten, leading to loss of data
>
> :exclamation: Avoid writing code in range 0X0C0..0X0FF:  
> In PPS-4 systems, 0X0C0..0X0CF is a reserved 16-byte indirection table for instruction `LB`  
> In PPS-4 systems, 0X0D0..0X0FF is a reserved 32-byte indirection table for instruction `TM`



##### LABELs
Labels and variables may be use for code clarity. For example, instead of writing:  

```
IOL	0XFE
```
You might prefer:  

```
...
KLA	EQX	0XFE
...
IOL KLA
```

A variable is determined by its name, which can be any combination of any number of alphanumeric characters, and the underscore character '_'. Can't begin by a number.



##### EQX
Use `EQX` to assign a variable to a byte.  

```
KLA	EQX	0XFE

```

##### PTR
Use `PTR` to assign a label to a specific address (12 bits).  

```
EntryPoint	PTR	0x100

```

Then `ENTRYPOINT` may be used to make reference to address `0X100` such as:  

```
EntryPoint  PTR 0x100

SECTION EntryPoint

T	0X101			; Transfer
RF1				; Reset FF1
RF2				; Reset FF2
TL	EntryPoint		; Transfer Long
```

##### SETB
`SETB` will set the byte at the current address to the specified value, and increment the address pointer. Variables can be used. Example:  

```
GARZOL		EQX		0X5A
...
SETB		0x01
SETB		0X02
...
SETB		GARZOL
```


#### Numeric encoding
For numeric values, 3 numeric encoding can be used, and mixed in the same source:  
1. Decimal. 
That's the ordinary way of writing number: 1, 2, 3, 192, 255, 654, etc... But not always very natural to programmers  
2. Hexadecimal. 
Use the prefix '0X' to define hexadecimal numbers: 0X1, 0x02, 0x5A, 0X6F0, 0X800, etc... Note that 0X5 and 5 are exactly the same thing. They are interchangeable.     
The number of leading zeros is not significant. For example 0x001 does not necessarily mean we are dealing with a pointer. Depends on the context.  
3. Binary.
Use the prefix '0B' to define binary numbers: 0B01, 0B1010, 0B111111000000, etc...


Syntax such as C6, though unambiguous, is not allowed to avoid potential typos. Always prefix 0X required for hexas.    
Negative numbers such as -7 or -0X23 are not allowed.    
Highest usable hex is 0XFFF  
Highest usable bin is 0B111111111111 (12 ones)  

Depending on the context, highest hex may be 0XFF, or 0XF (resp. bin 0B11111111 or 0B1111)

#### Jumps
To express a target address in a branch instruction (T, TL, TM, TML), 3 solutions are available:  
1. Absolute addressing by value  
With T, this is not very useful, because the programmers usually don't exactly know where they are nor what is the destination address value. They might break the rule of the page frontier without noticing it making the code inoperant. This situation would be signaled by the assembler, through an error message.  

```
T	0X022				; Transfer
EX	1					; Exchange Accumulator and Memory
LD	0X2				; Load Accumulator from Memory
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X026				; Transfer
LD	0X2				; Load Accumulator from Memory
LD	0X3				; Load Accumulator from Memory
LD	0X2				; Load Accumulator from Memory
EXD	1					; Exchange Accumulator and Memory and decrement BL
T	0X00D				; Transfer
TL	0X080				; Transfer Long

```
For example it is impossible to say where is 0X022 actually... Nevertheless, that syntax might be useful for reassembling something coming from a disassembler for example.  

2. Use of labels  
That's the preferred way and most natural:  

```
EntryPoint:
	...
	T	label22
	EX	1	
	LD	2				
	EOR	
	SKZ				
	T	label20
	LD	2

label20:
	LD	3	
	LD	2	
label22:
	EXD	1				
	T	EntryPoint

```
  
3. Use of variables  
Variables can also be used:  

```

EntryPoint	PTR	0x100

	...
	T	label22
	EX	1	
	LD	2				
	EOR	
	SKZ				
	LD	2	
label22:
	EXD	1				
	T	EntryPoint		;will jump at address 0x100, provided that in the same page as here
	TL	EntryPoint		;will jump at address 0x100,

```


#### Specific instruction syntaxes.
##### TM
48 consecutive locations on ROM page 3 contains pointer data which identify subroutine entry addresses. These subroutine entry addresses are limited to pages 4 through 7. This TM instruction will save the address of the next ROM word in the SA register after loading the original contents of SA into SB. A transfer then occurs to one of the subroutine entry addresses. This instruction occupies one ROM word but takes two cycles for execution.  

What is to be understood there, is that this instruction at assembly time potentially specifies 2 things:  
1. Specify a jump to target address 
2. Write the target address in the table of indirection located at 0X0D0..0X0FF  

Depending oh the situation a programmer may want to do both 1. and 2. or only 1. leaving 2. because it's defined elsewhere in the process, and they don't want to overwrite data which is already there.

To handle both situations, there are 2 available syntaxes:  

```
TM	(0XD1)	(@<=0X118)				; Transfer and Mark Indirect

```
In this case, the assembler will encode the instruction in the binary file (0XD1), **AND** will write 0x18 at address 0XD1 (table feeding). There is no check that the location is free or not, etc...  

The other accepted syntax is:  

```
TM	(0XD1)
```
In this case, the assembler will encode the instruction in the binary file (0XD1), but won't write in the table

##### LB
Sixteen consecutive locations on ROM page 3 (I2) contain data which can be loaded into the eight least significant bits of the B register by use of any LB instruction. The four most significant bits of B register will be loaded with zeroes. The contents of the SB register will be destroyed. This instruction takes two cycles to execute but occupies only one ROM word. (Automatic return)  

What is to be understood there, is that this instruction at assembly time potentially specifies 2 things:  
1. Specify a load B register
2. Write the target value in the table of indirection located at 0X0C0..0X0CF  

Depending oh the situation a programmer may want to do both 1. and 2. or only 1. leaving 2. because it's defined elsewhere in the process, and they don't want to overwrite data which is already there.

To handle both situations, there are 2 available syntaxes:  

```
LB	(C4)	(B<=041)

```
In this case, the assembler will encode the instruction in the binary file (0XC4), **AND** will write |0x41| (complement) at address 0XC4 (table feeding). There is no check that the location was previously free or not, etc...  

The other accepted syntax is:  

```
LB	(C4)
```
In this case, the assembler will encode the instruction in the binary file (0XC4), but won't write in the table


#### Writing comments in an as source file
Comments can be inserted anywhere in your source (except on the same line as any directive). Just type a ";" and everything after it on this line will be ignored  
Example:  
`; you can write anything you want after a ';'`  
`; everything that follows, to the end of the line, will be ignored `


#### Miscellaneous
##### Inverting instruction.
Instruction ADI, LD, EX, EXD, LDI, LB and LBL have a numeric value coded as part of the instruction in the immediate field. This numeric value must be in the complementary form on the bus. It goes without saying that this assembler takes care of the inversion for you.

#### Questions and Bugs
Please, ask questions or report bugs to <bugs@pps4.fr>



