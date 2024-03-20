;2024-03-20
;file obtained from PPS4Emul with recel_screech.bin
;for assembler test

;put zone C0..FF into comment
;replace LBL at line 182 with 2 SETB
; add directive SECTION 0x100 at line 182
; ;;     ;

;not necessary, but test...
SECTION 0x000


T	0X001				; Transfer
RF1					; Reset FF1
RF2					; Reset FF2
TL	0X6C0				; Transfer Long
LBL	0X089				; Load B Long
LDI	0X0				; Load Accumulator Immediate
EX	1					; Exchange Accumulator and Memory
LDI	0XA				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LBL	0X0C9				; Load B Long
LABL				; Load Accumulator with BL
DOA					; Discrete Output
TL	0X8F8				; Transfer Long
DIA					; Discrete Input Group A
EX	0					; Exchange Accumulator and Memory
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X020				; Transfer
LD	0X1				; Load Accumulator from Memory
LDI	0X1				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
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
COMP				; Complement
AND					; Logical AND
EX	2					; Exchange Accumulator and Memory
COMP				; Complement
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X02E				; Transfer
T	0X020				; Transfer
EX	0					; Exchange Accumulator and Memory
LXA					; Load X Register from Accumulator
LDI	0X8				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X03D				; Transfer
LDI	0X4				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X03D				; Transfer
LDI	0X2				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X03D				; Transfer
LDI	0X1				; Load Accumulator Immediate
TL	0X040				; Transfer Long
T	0X011				; Transfer
XAX					; Exchange Accumulator and X
EX	2					; Exchange Accumulator and Memory
LABL				; Load Accumulator with BL
ADI	0X8				; Add Immediate and skip on carry-out
T	0X046				; Transfer
T	0X04B				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X049				; Transfer
T	0X04B				; Transfer
ADI	0X2				; Add Immediate and skip on carry-out
T	0X079				; Transfer
LAX					; Load Accumulator from X Register
OR					; Logical OR
EX	2					; Exchange Accumulator and Memory
LAX					; Load Accumulator from X Register
COMP				; Complement
ADI	0X4				; Add Immediate and skip on carry-out
ADI	0X1				; Add Immediate and skip on carry-out
T	0X053				; Transfer
ADI	0X8				; Add Immediate and skip on carry-out
ADI	0XD				; Add Immediate and skip on carry-out
T	0X056				; Transfer
LXA					; Load X Register from Accumulator
XABL					; Exchange Accumulator and BL
LBL	0X00F				; Load B Long
EX	0					; Exchange Accumulator and Memory
LD	0X0				; Load Accumulator from Memory
ADSK				; Add and skip on carry-out
T	0X06C				; Transfer
XAX					; Exchange Accumulator and X
EX	0					; Exchange Accumulator and Memory
LD	0X0				; Load Accumulator from Memory
AD					; Add
EX	0					; Exchange Accumulator and Memory
XAX					; Exchange Accumulator and X
SKZ					; Skip on Accumulator Zero
LDI	0X0				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
AD					; Add
XAX					; Exchange Accumulator and X
LDI	0XF				; Load Accumulator Immediate
XAX					; Exchange Accumulator and X
T	0X06E				; Transfer
SKF2				; Skip if FF2 Equals 1
T	0X07B				; Transfer
COMP				; Complement
XS					; Exchange SA and SB
CYS					; Cycle SA register and Accumulator
LAX					; Load Accumulator from X Register
CYS					; Cycle SA register and Accumulator
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
LDI	0X7				; Load Accumulator Immediate
LDI	0XA				; Load Accumulator Immediate
CYS					; Cycle SA register and Accumulator
RTN					; Return
TL	0X01F				; Transfer Long
TL	0X00B				; Transfer Long
T	0X07E				; Transfer
TL	0X011				; Transfer Long
LDI	0X1				; Load Accumulator Immediate
LBL	0X089				; Load B Long
ADSK				; Add and skip on carry-out
T	0X094				; Transfer
EX	1					; Exchange Accumulator and Memory
LDI	0X1				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X094				; Transfer
LDI	0XA				; Load Accumulator Immediate
EX	3					; Exchange Accumulator and Memory
LDI	0X1				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X091				; Transfer
EX	1					; Exchange Accumulator and Memory
LDI	0X1				; Load Accumulator Immediate
AD					; Add
EX	0					; Exchange Accumulator and Memory
TL	0X676				; Transfer Long
EX	0					; Exchange Accumulator and Memory
LBL	0X089				; Load B Long
LD	0X1				; Load Accumulator from Memory
SKZ					; Skip on Accumulator Zero
T	0X0BA				; Transfer
LDI	0X3				; Load Accumulator Immediate
AD					; Add
SKZ					; Skip on Accumulator Zero
T	0X0BA				; Transfer
LDI	0X0				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
IOL	0XDB				; Input/Output Long
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X09F				; Transfer
SKF2				; Skip if FF2 Equals 1
T	0X0AE				; Transfer
LBL	0X049				; Load B Long
LDI	0X7				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
DC					; Decimal Correction
EX	0					; Exchange Accumulator and Memory
T	0X0BC				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X0B1				; Transfer
T	0X0BC				; Transfer
LBL	0X042				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X0B8				; Transfer
T	0X0AD				; Transfer
TL	0X487				; Transfer Long
TL	0X00B				; Transfer Long
TL	0X614				; Transfer Long
;LBL	0X0FF				; Load B Long
SETB 0
SETB 0

;
;T	0X0F7				; Transfer
;SKF1				; Skip if FF1 Equals 1
;T	0X0EE				; Transfer
;T	0X0FF				; Transfer
;T	0X0FE				; Transfer
;SKBI	0XE					; Skip if BL equals to Immediate.
;TM	(0XEA)	(@<=0X163)				; Transfer and Mark Indirect
;DECB					; Decrement BL
;T	0X0FD				; Transfer
;T	0X0F5				; Transfer
;T	0X0E5				; Transfer
;T	0X0ED				; Transfer
;SKBI	0X6					; Skip if BL equals to Immediate.
;T	0X0E6				; Transfer
;TM	(0XE9)	(@<=0X162)				; Transfer and Mark Indirect
;TM	(0XE8)	(@<=0X161)				; Transfer and Mark Indirect
;INCB					; Increment BL
;XBMX				; Exchange BM and X
;SF1					; Set FF1
;DIB					; Discrete Input Group B
;EXD	2					; Exchange Accumulator and Memory and decrement BL
;EXD	1					; Exchange Accumulator and Memory and decrement BL
;LDI	0X4				; Load Accumulator Immediate
;TL	0XC40				; Transfer Long
;SKBI	0X1					; Skip if BL equals to Immediate.
;SKBI	0X2					; Skip if BL equals to Immediate.
;SKBI	0X3					; Skip if BL equals to Immediate.
;SKBI	0X9					; Skip if BL equals to Immediate.
;SKBI	0XA					; Skip if BL equals to Immediate.
;SKBI	0XB					; Skip if BL equals to Immediate.
;SKBI	0XC					; Skip if BL equals to Immediate.
;T	0X0C0				; Transfer
;T	0X0C1				; Transfer
;T	0X0C2				; Transfer
;T	0X0C3				; Transfer
;TL	0X152				; Transfer Long
;TL	0X354				; Transfer Long
;ADI	0XE				; Add Immediate and skip on carry-out
;ADI	0XD				; Add Immediate and skip on carry-out
;ADI	0XC				; Add Immediate and skip on carry-out
;ADI	0XB				; Add Immediate and skip on carry-out
;ADI	0X6				; Add Immediate and skip on carry-out
;ADI	0X5				; Add Immediate and skip on carry-out
;ADI	0X4				; Add Immediate and skip on carry-out
;ADI	0X3				; Add Immediate and skip on carry-out
;LDI	0XE				; Load Accumulator Immediate
;LDI	0XD				; Load Accumulator Immediate
;LDI	0XC				; Load Accumulator Immediate
;LDI	0XB				; Load Accumulator Immediate
;T	0X0D1				; Transfer
;T	0X0D2				; Transfer
;T	0X0D3				; Transfer
;T	0X0D4				; Transfer
;T	0X0D9				; Transfer
;T	0X0F5				; Transfer
;T	0X0F7				; Transfer
;T	0X0EC				; Transfer
;T	0X0DD				; Transfer
;T	0X0F9				; Transfer
;T	0X0FB				; Transfer
;T	0X0EE				; Transfer
;

SECTION 0x100 

SF1					; Set FF1
TL	0X005				; Transfer Long
RF1					; Reset FF1
T	0X101				; Transfer
LB	(0XC0)	(B<=0X048)				; Load B Indirect
OR					; Logical OR
EX	0					; Exchange Accumulator and Memory
RF2					; Reset FF2
LB	(0XCF)	(B<=0X017)				; Load B Indirect
LB	(0XC0)	(B<=0X048)				; Load B Indirect
LDI	0X7				; Load Accumulator Immediate
AND					; Logical AND
EX	0					; Exchange Accumulator and Memory
TML	0X100				; Transfer and Mark Long
T	0X10E				; Transfer
LB	(0XCF)	(B<=0X017)				; Load B Indirect
LDI	0X8				; Load Accumulator Immediate
OR					; Logical OR
EX	0					; Exchange Accumulator and Memory
SF2					; Set FF2
T	0X10A				; Transfer
LDI	0X1				; Load Accumulator Immediate
RC					; Reset Carry flip-flop
SKF1				; Skip if FF1 Equals 1
RTN					; Return
AD					; Add
EX	0					; Exchange Accumulator and Memory
SKC					; Skip on Carry flip-flop
RTN					; Return
LDI	0XF				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
RTNSK				; Return and Skip
LDI	0X1				; Load Accumulator Immediate
RC					; Reset Carry flip-flop
SKF1				; Skip if FF1 Equals 1
T	0X126				; Transfer
ADI	0X6				; Add Immediate and skip on carry-out
ADSK				; Add and skip on carry-out
DC					; Decimal Correction
EX	0					; Exchange Accumulator and Memory
SKC					; Skip on Carry flip-flop
RTN					; Return
RTNSK				; Return and Skip
LDI	0X1				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
RC					; Reset Carry flip-flop
ADI	0X6				; Add Immediate and skip on carry-out
ADSK				; Add and skip on carry-out
DC					; Decimal Correction
EX	0					; Exchange Accumulator and Memory
SKC					; Skip on Carry flip-flop
T	0X13C				; Transfer
LDI	0X1				; Load Accumulator Immediate
INCB					; Increment BL
T	0X13A				; Transfer
T	0X13C				; Transfer
SKBI	0X8					; Skip if BL equals to Immediate.
T	0X12F				; Transfer
LAX					; Load Accumulator from X Register
RTN					; Return
TL	0X5B1				; Transfer Long
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
RTN					; Return
OR					; Logical OR
EX	0					; Exchange Accumulator and Memory
RTN					; Return
LDI	0XE				; Load Accumulator Immediate
LDI	0XD				; Load Accumulator Immediate
LDI	0XB				; Load Accumulator Immediate
LDI	0X7				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
RTN					; Return
AND					; Logical AND
T	0X147				; Transfer
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
RTN					; Return
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
RTN					; Return
RF1					; Reset FF1
RTN					; Return
SKF1				; Skip if FF1 Equals 1
T	0X15F				; Transfer
T	0X15A				; Transfer
SF1					; Set FF1
RTN					; Return
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X15F				; Transfer
RTN					; Return
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
RTN					; Return
T	0X15F				; Transfer
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
RTN					; Return
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X15A				; Transfer
RTN					; Return
LDI	0XF				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
RTNSK				; Return and Skip
T	0X147				; Transfer
SETB 	0X00				; Load B Long
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
RTN					; Return
LXA					; Load X Register from Accumulator
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X18E				; Transfer
XAX					; Exchange Accumulator and X
AD					; Add
EX	0					; Exchange Accumulator and Memory
RTN					; Return
COMP				; Complement
AND					; Logical AND
T	0X18C				; Transfer
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
RTNSK				; Return and Skip
RTN					; Return
LD	0X0				; Load Accumulator from Memory
SKZ					; Skip on Accumulator Zero
RTN					; Return
RTNSK				; Return and Skip
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X1A2				; Transfer
RTN					; Return
IOL	0XD6				; Input/Output Long
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
EX	0					; Exchange Accumulator and Memory
INCB					; Increment BL
LAX					; Load Accumulator from X Register
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
RTN					; Return
LBL	0X069				; Load B Long
LBL	0X068				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AD					; Add
EX	0					; Exchange Accumulator and Memory
TL	0X103				; Transfer Long
TL	0X200				; Transfer Long
TL	0X4E2				; Transfer Long
TL	0X8D0				; Transfer Long
TL	0X8E0				; Transfer Long
LBL	0X0AA				; Load B Long
T	0X1B2				; Transfer
SAG					; Special Address Generation
LD	0X0				; Load Accumulator from Memory
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
RTNSK				; Return and Skip
INCB					; Increment BL
LAX					; Load Accumulator from X Register
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
RTNSK				; Return and Skip
RTN					; Return
LBL	0X0E9				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
RTN					; Return
RTNSK				; Return and Skip
LDI	0X0				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
INCB					; Increment BL
LDI	0X7				; Load Accumulator Immediate
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
LDI	0X0				; Load Accumulator Immediate
T	0X1DC				; Transfer
ADI	0X1				; Add Immediate and skip on carry-out
T	0X1DB				; Transfer
INCB					; Increment BL
T	0X1DA				; Transfer
INCB					; Increment BL
RC					; Reset Carry flip-flop
LDI	0X1				; Load Accumulator Immediate
SAG					; Special Address Generation
AD					; Add
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
SKC					; Skip on Carry flip-flop
T	0X1DA				; Transfer
DECB					; Decrement BL
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
XABL					; Exchange Accumulator and BL
RTN					; Return
XBMX				; Exchange BM and X
EX	0					; Exchange Accumulator and Memory
LDI	0X0				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
IOL	0XDB				; Input/Output Long
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X1F1				; Transfer
LDI	0X1				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
LD	0X0				; Load Accumulator from Memory
XBMX				; Exchange BM and X
TL	0X772				; Transfer Long
LBL	0X0FF				; Load B Long
SETB 	0X00				; Load B Long
LB	(0XCD)	(B<=0X059)				; Load B Indirect
EX	0					; Exchange Accumulator and Memory
LDI	0X3				; Load Accumulator Immediate
AND					; Logical AND
ADI	0X1				; Add Immediate and skip on carry-out
EXD	0					; Exchange Accumulator and Memory and decrement BL
EX	0					; Exchange Accumulator and Memory
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
ADI	0X7				; Add Immediate and skip on carry-out
ADI	0X3				; Add Immediate and skip on carry-out
T	0X20C				; Transfer
ADI	0X7				; Add Immediate and skip on carry-out
ADI	0X9				; Add Immediate and skip on carry-out
T	0X20F				; Transfer
EX	0					; Exchange Accumulator and Memory
SKF1				; Skip if FF1 Equals 1
RTN					; Return
SF1					; Set FF1
LBL	0X058				; Load B Long
LD	0X0				; Load Accumulator from Memory
ADI	0XF				; Add Immediate and skip on carry-out
RTN					; Return
EX	0					; Exchange Accumulator and Memory
INCB					; Increment BL
LD	0X0				; Load Accumulator from Memory
LXA					; Load X Register from Accumulator
TL	0X8FE				; Transfer Long
LB	(0XC8)	(B<=0X042)				; Load B Indirect
LB	(0XCB)	(B<=0X052)				; Load B Indirect
LDI	0X2				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X230				; Transfer
SKBI	0X2					; Skip if BL equals to Immediate.
T	0X22A				; Transfer
LABL				; Load Accumulator with BL
ADI	0X8				; Add Immediate and skip on carry-out
XABL					; Exchange Accumulator and BL
T	0X221				; Transfer
XBMX				; Exchange BM and X
LAX					; Load Accumulator from X Register
XBMX				; Exchange BM and X
ADI	0XB				; Add Immediate and skip on carry-out
T	0X21F				; Transfer
RTN					; Return
XABL					; Exchange Accumulator and BL
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
LAX					; Load Accumulator from X Register
SAG					; Special Address Generation
AD					; Add
XABL					; Exchange Accumulator and BL
LAX					; Load Accumulator from X Register
ADI	0XF				; Add Immediate and skip on carry-out
T	0X23A				; Transfer
TL	0X242				; Transfer Long
TL	0X8E0				; Transfer Long
TL	0X5B0				; Transfer Long
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
LXA					; Load X Register from Accumulator
IOL	0XD6				; Input/Output Long
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X253				; Transfer
INCB					; Increment BL
T	0X24A				; Transfer
T	0X24C				; Transfer
SKBI	0X8					; Skip if BL equals to Immediate.
T	0X240				; Transfer
LABL				; Load Accumulator with BL
DC					; Decimal Correction
XABL					; Exchange Accumulator and BL
LDI	0XF				; Load Accumulator Immediate
IOL	0XD3				; Input/Output Long
TM	(0XDA)	(@<=0X142)				; Transfer and Mark Indirect
LABL				; Load Accumulator with BL
ADI	0X2				; Add Immediate and skip on carry-out
T	0X258				; Transfer
LDI	0XE				; Load Accumulator Immediate
T	0X25E				; Transfer
ADI	0X6				; Add Immediate and skip on carry-out
T	0X25B				; Transfer
T	0X260				; Transfer
ADI	0X2				; Add Immediate and skip on carry-out
T	0X260				; Transfer
LDI	0X6				; Load Accumulator Immediate
TL	0X2A2				; Transfer Long
XABL					; Exchange Accumulator and BL
ADI	0X8				; Add Immediate and skip on carry-out
LDI	0X2				; Load Accumulator Immediate
LDI	0XA				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
LD	0X0				; Load Accumulator from Memory
ADI	0X8				; Add Immediate and skip on carry-out
T	0X26A				; Transfer
TL	0X285				; Transfer Long
ADI	0X4				; Add Immediate and skip on carry-out
T	0X27A				; Transfer
XABL					; Exchange Accumulator and BL
ADI	0X5				; Add Immediate and skip on carry-out
XABL					; Exchange Accumulator and BL
LD	0X2				; Load Accumulator from Memory
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X27C				; Transfer
EX	0					; Exchange Accumulator and Memory
EXD	2					; Exchange Accumulator and Memory and decrement BL
SKBI	0X2					; Skip if BL equals to Immediate.
T	0X278				; Transfer
T	0X27A				; Transfer
SKBI	0XA					; Skip if BL equals to Immediate.
T	0X26F				; Transfer
TL	0X103				; Transfer Long
TL	0X280				; Transfer Long
TL	0X538				; Transfer Long
LD	0X2				; Load Accumulator from Memory
COMP				; Complement
ADSK				; Add and skip on carry-out
T	0X2A0				; Transfer
RF2					; Reset FF2
XABL					; Exchange Accumulator and BL
ADI	0X8				; Add Immediate and skip on carry-out
LDI	0X2				; Load Accumulator Immediate
LDI	0XA				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
IOL	0XD3				; Input/Output Long
TM	(0XDB)	(@<=0X143)				; Transfer and Mark Indirect
XABL					; Exchange Accumulator and BL
ADI	0X5				; Add Immediate and skip on carry-out
XABL					; Exchange Accumulator and BL
LD	0X2				; Load Accumulator from Memory
EXD	2					; Exchange Accumulator and Memory and decrement BL
SKBI	0X2					; Skip if BL equals to Immediate.
T	0X295				; Transfer
T	0X297				; Transfer
SKBI	0XA					; Skip if BL equals to Immediate.
T	0X290				; Transfer
SKF2				; Skip if FF2 Equals 1
T	0X29A				; Transfer
T	0X2A0				; Transfer
SF2					; Set FF2
LBL	0X069				; Load B Long
LDI	0X3				; Load Accumulator Immediate
LDI	0X1				; Load Accumulator Immediate
TM	(0XD1)	(@<=0X118)				; Transfer and Mark Indirect
TL	0X103				; Transfer Long
XABL					; Exchange Accumulator and BL
LD	0X0				; Load Accumulator from Memory
LXA					; Load X Register from Accumulator
INCB					; Increment BL
LD	0X0				; Load Accumulator from Memory
LBL	0X000				; Load B Long
EX	6					; Exchange Accumulator and Memory
TML	0X1C0				; Transfer and Mark Long
T	0X2B9				; Transfer
LBL	0X070				; Load B Long
TML	0X1C0				; Transfer and Mark Long
T	0X2B9				; Transfer
LBL	0X080				; Load B Long
TML	0X1C0				; Transfer and Mark Long
T	0X2BB				; Transfer
TL	0X2DF				; Transfer Long
LBL	0X069				; Load B Long
LBL	0X068				; Load B Long
T	0X29E				; Transfer
TL	0X8C0				; Transfer Long
XAX					; Exchange Accumulator and X
IOL	0X21				; Input/Output Long
INCB					; Increment BL
T	0X2CD				; Transfer
LBL	0X015				; Load B Long
LD	0X1				; Load Accumulator from Memory
EX	1					; Exchange Accumulator and Memory
COMP				; Complement
EXD	0					; Exchange Accumulator and Memory and decrement BL
T	0X2C7				; Transfer
TL	0X313				; Transfer Long
TL	0X693				; Transfer Long
LB	(0XC8)	(B<=0X042)				; Load B Indirect
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
EX	1					; Exchange Accumulator and Memory
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
EX	0					; Exchange Accumulator and Memory
SKBI	0XA					; Skip if BL equals to Immediate.
T	0X2D1				; Transfer
LDI	0XF				; Load Accumulator Immediate
LDI	0X7				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
TL	0X105				; Transfer Long
LB	(0XC8)	(B<=0X042)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X2E3				; Transfer
T	0X2EC				; Transfer
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X2E7				; Transfer
T	0X2EC				; Transfer
LB	(0XCA)	(B<=0X05A)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X2EB				; Transfer
T	0X2EC				; Transfer
LB	(0XCB)	(B<=0X052)				; Load B Indirect
INCB					; Increment BL
TL	0X260				; Transfer Long
LDI	0X8				; Load Accumulator Immediate
IOL	0XD2				; Input/Output Long
TL	0X3C7				; Transfer Long
LBL	0X005				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X003				; Load B Long
LDI	0X0				; Load Accumulator Immediate
EXD	0					; Exchange Accumulator and Memory and decrement BL
LDI	0X0				; Load Accumulator Immediate
TL	0X5C0				; Transfer Long
SKF1				; Skip if FF1 Equals 1
T	0X317				; Transfer
LBL	0X042				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X30A				; Transfer
TL	0X8FC				; Transfer Long
LB	(0XC7)	(B<=0X0E0)				; Load B Indirect
TM	(0XF4)	(@<=0X191)				; Transfer and Mark Indirect
T	0X30F				; Transfer
TL	0X800				; Transfer Long
TL	0X8FA				; Transfer Long
TL	0X212				; Transfer Long
SKF2				; Skip if FF2 Equals 1
T	0X300				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X311				; Transfer
LBL	0X069				; Load B Long
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X320				; Transfer
LBL	0X068				; Load B Long
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X338				; Transfer
T	0X33A				; Transfer
LBL	0X078				; Load B Long
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X334				; Transfer
LB	(0XC3)	(B<=0X040)				; Load B Indirect
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X32A				; Transfer
LDI	0X9				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
T	0X31B				; Transfer
LBL	0X0AB				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LBL	0X0B3				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LDI	0X6				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
T	0X31B				; Transfer
LB	(0XC5)	(B<=0X0B1)				; Load B Indirect
TM	(0XF6)	(@<=0X193)				; Transfer and Mark Indirect
T	0X31B				; Transfer
T	0X324				; Transfer
TL	0X340				; Transfer Long
LB	(0XC8)	(B<=0X042)				; Load B Indirect
TM	(0XF4)	(@<=0X191)				; Transfer and Mark Indirect
T	0X33E				; Transfer
T	0X30F				; Transfer
TL	0X4AF				; Transfer Long
T	0X341				; Transfer
T	0X342				; Transfer
LB	(0XC5)	(B<=0X0B1)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X346				; Transfer
T	0X351				; Transfer
RF1					; Reset FF1
TM	(0XF4)	(@<=0X191)				; Transfer and Mark Indirect
T	0X34D				; Transfer
LB	(0XC4)	(B<=0X041)				; Load B Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X363				; Transfer
T	0X351				; Transfer
LB	(0XCF)	(B<=0X017)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X351				; Transfer
T	0X363				; Transfer
LB	(0XC4)	(B<=0X041)				; Load B Indirect
LDI	0X0				; Load Accumulator Immediate
SKF1				; Skip if FF1 Equals 1
EX	0					; Exchange Accumulator and Memory
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X35A				; Transfer
LDI	0X9				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
T	0X363				; Transfer
LB	(0XCF)	(B<=0X017)				; Load B Indirect
SF1					; Set FF1
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
LBL	0X0A3				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LDI	0X6				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
TL	0X10E				; Transfer Long
LBL	0X0AA				; Load B Long
EXD	7					; Exchange Accumulator and Memory and decrement BL
TL	0X580				; Transfer Long
TL	0X78D				; Transfer Long
TL	0X778				; Transfer Long
TL	0X7EA				; Transfer Long
LBL	0X0E9				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
LBL	0X079				; Load B Long
SKZ					; Skip on Accumulator Zero
T	0X37C				; Transfer
LDI	0X4				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
TL	0X380				; Transfer Long
AD					; Add
EX	0					; Exchange Accumulator and Memory
TL	0X00B				; Transfer Long
LB	(0XC0)	(B<=0X048)				; Load B Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X386				; Transfer
LB	(0XCB)	(B<=0X052)				; Load B Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X390				; Transfer
SF1					; Set FF1
LB	(0XC2)	(B<=0X051)				; Load B Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X395				; Transfer
DECB					; Decrement BL
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X392				; Transfer
LB	(0XC3)	(B<=0X040)				; Load B Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X396				; Transfer
TL	0X10E				; Transfer Long
INCB					; Increment BL
LDI	0X9				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LDI	0X0				; Load Accumulator Immediate
LDI	0XF				; Load Accumulator Immediate
LBL	0X078				; Load B Long
EX	0					; Exchange Accumulator and Memory
LBL	0X0A1				; Load B Long
TM	(0XDE)	(@<=0X14B)				; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				; Load B Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X3AD				; Transfer
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
TM	(0XE4)	(@<=0X151)				; Transfer and Mark Indirect
SKF1				; Skip if FF1 Equals 1
T	0X3A9				; Transfer
LB	(0XCA)	(B<=0X05A)				; Load B Indirect
TM	(0XE4)	(@<=0X151)				; Transfer and Mark Indirect
SKF1				; Skip if FF1 Equals 1
T	0X3A9				; Transfer
LB	(0XCB)	(B<=0X052)				; Load B Indirect
SF1					; Set FF1
TM	(0XD8)	(@<=0X140)				; Transfer and Mark Indirect
TL	0X480				; Transfer Long
LB	(0XCF)	(B<=0X017)				; Load B Indirect
LDI	0X0				; Load Accumulator Immediate
EXD	0					; Exchange Accumulator and Memory and decrement BL
T	0X3AE				; Transfer
LBL	0X04F				; Load B Long
SKBI	0X2					; Skip if BL equals to Immediate.
LDI	0X0				; Load Accumulator Immediate
LDI	0X3				; Load Accumulator Immediate
EX	1					; Exchange Accumulator and Memory
LDI	0X0				; Load Accumulator Immediate
EXD	1					; Exchange Accumulator and Memory and decrement BL
SKBI	0X1					; Skip if BL equals to Immediate.
T	0X3B3				; Transfer
LDI	0X0				; Load Accumulator Immediate
EX	5					; Exchange Accumulator and Memory
LDI	0X6				; Load Accumulator Immediate
TL	0X47C				; Transfer Long
SF1					; Set FF1
LB	(0XC0)	(B<=0X048)				; Load B Indirect
TM	(0XF7)	(@<=0X194)				; Transfer and Mark Indirect
T	0X3F1				; Transfer
TM	(0XDF)	(@<=0X14C)				; Transfer and Mark Indirect
TL	0X2EF				; Transfer Long
LB	(0XC4)	(B<=0X041)				; Load B Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X3F5				; Transfer
LB	(0XC8)	(B<=0X042)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X3D0				; Transfer
TM	(0XDD)	(@<=0X14A)				; Transfer and Mark Indirect
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
T	0X3DB				; Transfer
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X3D6				; Transfer
TM	(0XDD)	(@<=0X14A)				; Transfer and Mark Indirect
LB	(0XCA)	(B<=0X05A)				; Load B Indirect
T	0X3DB				; Transfer
LB	(0XCA)	(B<=0X05A)				; Load B Indirect
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
T	0X3DE				; Transfer
TM	(0XDD)	(@<=0X14A)				; Transfer and Mark Indirect
LB	(0XCB)	(B<=0X052)				; Load B Indirect
TM	(0XF4)	(@<=0X191)				; Transfer and Mark Indirect
T	0X3E0				; Transfer
T	0X3F6				; Transfer
LB	(0XCB)	(B<=0X052)				; Load B Indirect
TM	(0XDD)	(@<=0X14A)				; Transfer and Mark Indirect
LB	(0XC8)	(B<=0X042)				; Load B Indirect
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				; Load B Indirect
TM	(0XD0)	(@<=0X117)				; Transfer and Mark Indirect
LB	(0XC5)	(B<=0X0B1)				; Load B Indirect
TM	(0XE7)	(@<=0X154)				; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				; Load B Indirect
SKF1				; Skip if FF1 Equals 1
LDI	0XB				; Load Accumulator Immediate
LDI	0XD				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X3F7				; Transfer
LDI	0X5				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
RF2					; Reset FF2
TL	0X103				; Transfer Long
LB	(0XCD)	(B<=0X059)				; Load B Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X3C5				; Transfer
T	0X3F7				; Transfer
LB	(0XCF)	(B<=0X017)				; Load B Indirect
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
LB	(0XCD)	(B<=0X059)				; Load B Indirect
LDI	0X0				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LDI	0X7				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
SF2					; Set FF2
TL	0X480				; Transfer Long
TL	0X44C				; Transfer Long
TM	(0XDA)	(@<=0X142)				; Transfer and Mark Indirect
LAX					; Load Accumulator from X Register
T	0X434				; Transfer
TML	0X1CB				; Transfer and Mark Long
T	0X40B				; Transfer
LBL	0X083				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LBL	0X0A0				; Load B Long
SF1					; Set FF1
TM	(0XE3)	(@<=0X183)				; Transfer and Mark Indirect
TM	(0XE6)	(@<=0X153)				; Transfer and Mark Indirect
TM	(0XEB)	(@<=0X164)				; Transfer and Mark Indirect
SKF1				; Skip if FF1 Equals 1
T	0X400				; Transfer
T	0X426				; Transfer
TML	0X1CB				; Transfer and Mark Long
T	0X41A				; Transfer
LBL	0X09B				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LBL	0X0B0				; Load B Long
LD	0X0				; Load Accumulator from Memory
T	0X429				; Transfer
TML	0X1CB				; Transfer and Mark Long
T	0X424				; Transfer
LBL	0X08B				; Load B Long
TM	(0XD4)	(@<=0X12D)				; Transfer and Mark Indirect
LBL	0X0A1				; Load B Long
LDI	0X3				; Load Accumulator Immediate
AND					; Logical AND
ADI	0X1				; Add Immediate and skip on carry-out
LBL	0X0A1				; Load B Long
SF1					; Set FF1
LXA					; Load X Register from Accumulator
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
ADI	0X4				; Add Immediate and skip on carry-out
T	0X402				; Transfer
TM	(0XDE)	(@<=0X14B)				; Transfer and Mark Indirect
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
LXA					; Load X Register from Accumulator
LBL	0X0E9				; Load B Long
TM	(0XF4)	(@<=0X191)				; Transfer and Mark Indirect
T	0X43D				; Transfer
LBL	0X0BB				; Load B Long
LAX					; Load Accumulator from X Register
TM	(0XD5)	(@<=0X12E)				; Transfer and Mark Indirect
LAX					; Load Accumulator from X Register
TL	0X440				; Transfer Long
LBL	0X0B3				; Load B Long
TM	(0XD5)	(@<=0X12E)				; Transfer and Mark Indirect
LB	(0XC2)	(B<=0X051)				; Load B Indirect
TM	(0XD3)	(@<=0X123)				; Transfer and Mark Indirect
T	0X44D				; Transfer
DECB					; Decrement BL
LD	0X7				; Load Accumulator from Memory
COMP				; Complement
ADSK				; Add and skip on carry-out
T	0X450				; Transfer
LD	0X7				; Load Accumulator from Memory
TM	(0XD0)	(@<=0X117)				; Transfer and Mark Indirect
SF1					; Set FF1
TL	0X00B				; Transfer Long
LD	0X7				; Load Accumulator from Memory
EX	0					; Exchange Accumulator and Memory
INCB					; Increment BL
LDI	0X9				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
T	0X44D				; Transfer
SKF2				; Skip if FF2 Equals 1
TL	0X800				; Transfer Long
T	0X466				; Transfer
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X45E				; Transfer
TL	0X3F7				; Transfer Long
TL	0X4D3				; Transfer Long
T	0X45C				; Transfer
LBL	0X079				; Load B Long
LD	0X0				; Load Accumulator from Memory
ADI	0X4				; Add Immediate and skip on carry-out
T	0X468				; Transfer
TL	0X10E				; Transfer Long
ADI	0X6				; Add Immediate and skip on carry-out
T	0X466				; Transfer
LDI	0X1				; Load Accumulator Immediate
EOR					; Logical Exclusive-OR
LXA					; Load X Register from Accumulator
LB	(0XC1)	(B<=0X0E9)				; Load B Indirect
LDI	0XC				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X473				; Transfer
T	0X466				; Transfer
ADI	0X8				; Add Immediate and skip on carry-out
LDI	0X0				; Load Accumulator Immediate
LDI	0X1				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
XBMX				; Exchange BM and X
LDI	0X1				; Load Accumulator Immediate
AD					; Add
EX	0					; Exchange Accumulator and Memory
T	0X466				; Transfer
IOL	0XD3				; Input/Output Long
TL	0X800				; Transfer Long
LDI	0X1				; Load Accumulator Immediate
IOL	0XD3				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
TL	0X111				; Transfer Long
LBL	0X0B8				; Load B Long
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X49F				; Transfer
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
INCB					; Increment BL
LDI	0XA				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LB	(0XCC)	(B<=0X0B9)				; Load B Indirect
LD	0X2				; Load Accumulator from Memory
EX	3					; Exchange Accumulator and Memory
LDI	0X0				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LBL	0X049				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
LDI	0X2				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
TL	0X0A7				; Transfer Long
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X4A4				; Transfer
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
LB	(0XCC)	(B<=0X0B9)				; Load B Indirect
T	0X4A9				; Transfer
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X48F				; Transfer
LBL	0X0FF				; Load B Long
LBL	0X029				; Load B Long
TM	(0XF7)	(@<=0X194)				; Transfer and Mark Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X48F				; Transfer
DECB					; Decrement BL
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
LBL	0X049				; Load B Long
LD	0X0				; Load Accumulator from Memory
LXA					; Load X Register from Accumulator
LB	(0XC8)	(B<=0X042)				; Load B Indirect
TM	(0XFC)	(@<=0X19D)				; Transfer and Mark Indirect
LB	(0XC9)	(B<=0X04A)				; Load B Indirect
TM	(0XFC)	(@<=0X19D)				; Transfer and Mark Indirect
LB	(0XCA)	(B<=0X05A)				; Load B Indirect
TM	(0XFC)	(@<=0X19D)				; Transfer and Mark Indirect
LB	(0XCB)	(B<=0X052)				; Load B Indirect
TM	(0XFC)	(@<=0X19D)				; Transfer and Mark Indirect
SF1					; Set FF1
TL	0X00B				; Transfer Long
LBL	0X0FF				; Load B Long
LDI	0X8				; Load Accumulator Immediate
LDI	0X9				; Load Accumulator Immediate
LDI	0XA				; Load Accumulator Immediate
LDI	0XB				; Load Accumulator Immediate
LDI	0XC				; Load Accumulator Immediate
LDI	0XD				; Load Accumulator Immediate
LDI	0XE				; Load Accumulator Immediate
LDI	0XF				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
SKF1				; Skip if FF1 Equals 1
T	0X4D1				; Transfer
SKF2				; Skip if FF2 Equals 1
LDI	0X2				; Load Accumulator Immediate
LDI	0X1				; Load Accumulator Immediate
SF2					; Set FF2
TM	(0XF9)	(@<=0X1B5)				; Transfer and Mark Indirect
TL	0X005				; Transfer Long
LB	(0XCE)	(B<=0X016)				; Load B Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X4D8				; Transfer
TL	0X800				; Transfer Long
LB	(0XCF)	(B<=0X017)				; Load B Indirect
TM	(0XF6)	(@<=0X193)				; Transfer and Mark Indirect
LDI	0X3				; Load Accumulator Immediate
LDI	0XB				; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				; Transfer and Mark Indirect
T	0X4F0				; Transfer
TML	0X393				; Transfer and Mark Long
LBL	0X0FF				; Load B Long
LB	(0XC5)	(B<=0X0B1)				; Load B Indirect
TM	(0XF7)	(@<=0X194)				; Transfer and Mark Indirect
T	0X4E9				; Transfer
LB	(0XCE)	(B<=0X016)				; Load B Indirect
TM	(0XD0)	(@<=0X117)				; Transfer and Mark Indirect
RTN					; Return
RTN					; Return
LB	(0XCE)	(B<=0X016)				; Load B Indirect
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
RTN					; Return
EX	0					; Exchange Accumulator and Memory
RTN					; Return
LBL	0X0FF				; Load B Long
LBL	0X069				; Load B Long
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X4FA				; Transfer
DECB					; Decrement BL
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X4FA				; Transfer
TML	0X103				; Transfer and Mark Long
T	0X4D3				; Transfer
LB	(0XC7)	(B<=0X0E0)				; Load B Indirect
TM	(0XDC)	(@<=0X149)				; Transfer and Mark Indirect
TL	0X317				; Transfer Long
LBL	0X0FF				; Load B Long
TL	0X41E				; Transfer Long
TL	0X405				; Transfer Long
TL	0X414				; Transfer Long
TL	0X2D0				; Transfer Long
TL	0X461				; Transfer Long
TL	0X461				; Transfer Long
TL	0X370				; Transfer Long
TL	0X2DC				; Transfer Long
LBL	0X005				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X029				; Load B Long
LDI	0X0				; Load Accumulator Immediate
EXD	0					; Exchange Accumulator and Memory and decrement BL
LDI	0X0				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
TL	0X540				; Transfer Long
XABL					; Exchange Accumulator and BL
INCB					; Increment BL
LD	0X0				; Load Accumulator from Memory
ADI	0X6				; Add Immediate and skip on carry-out
ADI	0X2				; Add Immediate and skip on carry-out
T	0X525				; Transfer
TL	0X56C				; Transfer Long
LDI	0X2				; Load Accumulator Immediate
TL	0X564				; Transfer Long
LBL	0X002				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X006				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
IOL	0X41				; Input/Output Long
INCB					; Increment BL
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X000				; Load B Long
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
SKZ					; Skip on Accumulator Zero
RTN					; Return
RTNSK				; Return and Skip
LBL	0X000				; Load B Long
LDI	0X0				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
TML	0X366				; Transfer and Mark Long
LDI	0X1				; Load Accumulator Immediate
TML	0X368				; Transfer and Mark Long
TML	0X366				; Transfer and Mark Long
LDI	0X2				; Load Accumulator Immediate
TML	0X368				; Transfer and Mark Long
TML	0X366				; Transfer and Mark Long
LDI	0X4				; Load Accumulator Immediate
TML	0X368				; Transfer and Mark Long
TML	0X366				; Transfer and Mark Long
LDI	0X8				; Load Accumulator Immediate
TML	0X368				; Transfer and Mark Long
LBL	0X029				; Load B Long
LD	0X2				; Load Accumulator from Memory
EXD	2					; Exchange Accumulator and Memory and decrement BL
LD	0X2				; Load Accumulator from Memory
XABL					; Exchange Accumulator and BL
SKBI	0X2					; Skip if BL equals to Immediate.
T	0X562				; Transfer
TL	0X51D				; Transfer Long
XABL					; Exchange Accumulator and BL
INCB					; Increment BL
XBMX				; Exchange BM and X
LXA					; Load X Register from Accumulator
XBMX				; Exchange BM and X
SAG					; Special Address Generation
LD	0X0				; Load Accumulator from Memory
XABL					; Exchange Accumulator and BL
LAX					; Load Accumulator from X Register
EX	0					; Exchange Accumulator and Memory
LBL	0X029				; Load B Long
RC					; Reset Carry flip-flop
LDI	0X1				; Load Accumulator Immediate
AD					; Add
EXD	0					; Exchange Accumulator and Memory and decrement BL
SKC					; Skip on Carry flip-flop
T	0X540				; Transfer
SKBI	0X7					; Skip if BL equals to Immediate.
T	0X56E				; Transfer
LBL	0X005				; Load B Long
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
XABL					; Exchange Accumulator and BL
TML	0X36A				; Transfer and Mark Long
TL	0X2D0				; Transfer Long
OR					; Logical OR
LXA					; Load X Register from Accumulator
EX	0					; Exchange Accumulator and Memory
LBL	0X007				; Load B Long
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
RC					; Reset Carry flip-flop
TML	0X27E				; Transfer and Mark Long
SC					; Set Carry flip-flop
TML	0X13E				; Transfer and Mark Long
TML	0X27E				; Transfer and Mark Long
T	0X596				; Transfer
TML	0X1BE				; Transfer and Mark Long
TML	0X27E				; Transfer and Mark Long
T	0X597				; Transfer
SF2					; Set FF2
TML	0X23E				; Transfer and Mark Long
LBL	0X002				; Load B Long
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X004				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
IOL	0X41				; Input/Output Long
SKF2				; Skip if FF2 Equals 1
RTN					; Return
LBL	0X029				; Load B Long
EXD	0					; Exchange Accumulator and Memory and decrement BL
XAX					; Exchange Accumulator and X
EX	0					; Exchange Accumulator and Memory
XAX					; Exchange Accumulator and X
XBMX				; Exchange BM and X
TL	0X57B				; Transfer Long
SKC					; Skip on Carry flip-flop
LDI	0X8				; Load Accumulator Immediate
LDI	0X0				; Load Accumulator Immediate
LBL	0X001				; Load B Long
IOL	0X41				; Input/Output Long
LBL	0X003				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
IOL	0X41				; Input/Output Long
RTN					; Return
SETB 	0X00				; Load B Long
EX	0					; Exchange Accumulator and Memory
LBL	0X004				; Load B Long
LDI	0X1				; Load Accumulator Immediate
EXD	0					; Exchange Accumulator and Memory and decrement BL
LD	0X0				; Load Accumulator from Memory
LXA					; Load X Register from Accumulator
DECB					; Decrement BL
LD	0X0				; Load Accumulator from Memory
XAX					; Exchange Accumulator and X
XBMX				; Exchange BM and X
XABL					; Exchange Accumulator and BL
LD	0X0				; Load Accumulator from Memory
LBL	0X004				; Load B Long
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
LDI	0X0				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
LBL	0X001				; Load B Long
IOL	0X41				; Input/Output Long
INCB					; Increment BL
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
INCB					; Increment BL
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
IOL	0X41				; Input/Output Long
DECB					; Decrement BL
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
LBL	0X004				; Load B Long
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
IOL	0X41				; Input/Output Long
LD	0X0				; Load Accumulator from Memory
ADSK				; Add and skip on carry-out
T	0X5C4				; Transfer
EXD	0					; Exchange Accumulator and Memory and decrement BL
LDI	0X1				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X5C0				; Transfer
EXD	0					; Exchange Accumulator and Memory and decrement BL
LDI	0X1				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X5C0				; Transfer
LBL	0X005				; Load B Long
LDI	0X8				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
TL	0X3C0				; Transfer Long
LBL	0X0FF				; Load B Long
SKF1				; Skip if FF1 Equals 1
T	0X61C				; Transfer
LBL	0X048				; Load B Long
LDI	0X8				; Load Accumulator Immediate
OR					; Logical OR
ADI	0X4				; Add Immediate and skip on carry-out
T	0X61C				; Transfer
LBL	0X0B9				; Load B Long
LDI	0X8				; Load Accumulator Immediate
OR					; Logical OR
ADI	0X2				; Add Immediate and skip on carry-out
T	0X61C				; Transfer
T	0X61B				; Transfer
LBL	0X079				; Load B Long
LD	0X0				; Load Accumulator from Memory
LXA					; Load X Register from Accumulator
T	0X624				; Transfer
SKF2				; Skip if FF2 Equals 1
T	0X600				; Transfer
LBL	0X0E9				; Load B Long
LDI	0X2				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
LDI	0X6				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
LBL	0X0E9				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
T	0X60F				; Transfer
LBMX				; Load BM with X
LDI	0XF				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
IOL	0XFB				; Input/Output Long
IOL	0XF7				; Input/Output Long
LD	0X1				; Load Accumulator from Memory
IOL	0XFE				; Input/Output Long
LD	0X1				; Load Accumulator from Memory
IOL	0XFD				; Input/Output Long
DECB					; Decrement BL
T	0X635				; Transfer
TL	0X655				; Transfer Long
LAX					; Load Accumulator from X Register
ADI	0X8				; Add Immediate and skip on carry-out
ADI	0X4				; Add Immediate and skip on carry-out
T	0X62B				; Transfer
SKBI	0XA					; Skip if BL equals to Immediate.
T	0X63D				; Transfer
TL	0X642				; Transfer Long
SKBI	0X2					; Skip if BL equals to Immediate.
T	0X62B				; Transfer
T	0X63B				; Transfer
TL	0X62B				; Transfer Long
LDI	0X4				; Load Accumulator Immediate
SAG					; Special Address Generation
AD					; Add
SAG					; Special Address Generation
EX	0					; Exchange Accumulator and Memory
ADI	0X8				; Add Immediate and skip on carry-out
T	0X640				; Transfer
LDI	0X5				; Load Accumulator Immediate
AND					; Logical AND
IOL	0XFE				; Input/Output Long
LD	0X1				; Load Accumulator from Memory
LDI	0X5				; Load Accumulator Immediate
AND					; Logical AND
IOL	0XFD				; Input/Output Long
LD	0X1				; Load Accumulator from Memory
TL	0X631				; Transfer Long
IOL	0XF3				; Input/Output Long
LBL	0X0A9				; Load B Long
LD	0X0				; Load Accumulator from Memory
SKZ					; Skip on Accumulator Zero
T	0X66E				; Transfer
LDI	0XA				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
SKF2				; Skip if FF2 Equals 1
SKF1				; Skip if FF1 Equals 1
T	0X663				; Transfer
LBL	0X030				; Load B Long
LBL	0X038				; Load B Long
RC					; Reset Carry flip-flop
LDI	0X7				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
DC					; Decimal Correction
EX	0					; Exchange Accumulator and Memory
SKC					; Skip on Carry flip-flop
T	0X66E				; Transfer
INCB					; Increment BL
T	0X670				; Transfer
TL	0X00B				; Transfer Long
SKBI	0X8					; Skip if BL equals to Immediate.
T	0X665				; Transfer
T	0X66E				; Transfer
LD	0X0				; Load Accumulator from Memory
TL	0X682				; Transfer Long
LBL	0X0A9				; Load B Long
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
LBL	0X017				; Load B Long
SKZ					; Skip on Accumulator Zero
T	0X673				; Transfer
TL	0X680				; Transfer Long
LDI	0X8				; Load Accumulator Immediate
AND					; Logical AND
IOL	0XD5				; Input/Output Long
DECB					; Decrement BL
LD	0X0				; Load Accumulator from Memory
IOL	0XD4				; Input/Output Long
DECB					; Decrement BL
LD	0X1				; Load Accumulator from Memory
COMP				; Complement
EX	1					; Exchange Accumulator and Memory
EXD	0					; Exchange Accumulator and Memory and decrement BL
T	0X689				; Transfer
LBL	0X005				; Load B Long
LDI	0X0				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
T	0X697				; Transfer
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
DECB					; Decrement BL
LDI	0X1				; Load Accumulator Immediate
AND					; Logical AND
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
ADI	0X7				; Add Immediate and skip on carry-out
IOL	0X21				; Input/Output Long
INCB					; Increment BL
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
LDI	0X2				; Load Accumulator Immediate
AND					; Logical AND
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
ADI	0X6				; Add Immediate and skip on carry-out
IOL	0X21				; Input/Output Long
INCB					; Increment BL
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
LDI	0X4				; Load Accumulator Immediate
AND					; Logical AND
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
ADI	0X4				; Add Immediate and skip on carry-out
IOL	0X21				; Input/Output Long
INCB					; Increment BL
XABL					; Exchange Accumulator and BL
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
LD	0X0				; Load Accumulator from Memory
XAX					; Exchange Accumulator and X
XABL					; Exchange Accumulator and BL
TL	0X2C0				; Transfer Long
LBL	0X000				; Load B Long
LDI	0XF				; Load Accumulator Immediate
IOL	0X21				; Input/Output Long
LDI	0XF				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
INCB					; Increment BL
T	0X6C2				; Transfer
LDI	0X0				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
IOL	0XFB				; Input/Output Long
IOL	0XF7				; Input/Output Long
LAX					; Load Accumulator from X Register
IOL	0XFE				; Input/Output Long
LAX					; Load Accumulator from X Register
IOL	0XFD				; Input/Output Long
INCB					; Increment BL
T	0X6D0				; Transfer
IOL	0XF3				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
INCB					; Increment BL
T	0X6DA				; Transfer
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X6CB				; Transfer
LDI	0X0				; Load Accumulator Immediate
TML	0X36A				; Transfer and Mark Long
LDI	0X0				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
XBMX				; Exchange BM and X
LDI	0XF				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
EX	0					; Exchange Accumulator and Memory
LAX					; Load Accumulator from X Register
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X6F9				; Transfer
LAX					; Load Accumulator from X Register
ADI	0XF				; Add Immediate and skip on carry-out
T	0X6F2				; Transfer
T	0X6E8				; Transfer
INCB					; Increment BL
T	0X6E7				; Transfer
XBMX				; Exchange BM and X
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X6E5				; Transfer
T	0X6FA				; Transfer
SF2					; Set FF2
LDI	0X9				; Load Accumulator Immediate
TML	0X36A				; Transfer and Mark Long
TL	0X700				; Transfer Long
SETB 	0X00				; Load B Long
TML	0X36C				; Transfer and Mark Long
IOL	0XD0				; Input/Output Long
IOL	0XD8				; Input/Output Long
TML	0X1EE				; Transfer and Mark Long
T	0X702				; Transfer
IOL	0XD1				; Input/Output Long
IOL	0XD9				; Input/Output Long
TML	0X1EE				; Transfer and Mark Long
T	0X709				; Transfer
IOL	0XD2				; Input/Output Long
IOL	0XDA				; Input/Output Long
TML	0X1EE				; Transfer and Mark Long
T	0X710				; Transfer
IOL	0XD3				; Input/Output Long
IOL	0XDF				; Input/Output Long
TML	0X1EE				; Transfer and Mark Long
T	0X717				; Transfer
IOL	0XD4				; Input/Output Long
IOL	0XDC				; Input/Output Long
TML	0X1FB				; Transfer and Mark Long
T	0X71E				; Transfer
IOL	0XD5				; Input/Output Long
IOL	0XDD				; Input/Output Long
TML	0X1FB				; Transfer and Mark Long
T	0X725				; Transfer
LDI	0X0				; Load Accumulator Immediate
IOL	0XD5				; Input/Output Long
LBL	0X000				; Load B Long
LDI	0X8				; Load Accumulator Immediate
TML	0X36A				; Transfer and Mark Long
RC					; Reset Carry flip-flop
T	0X737				; Transfer
SC					; Set Carry flip-flop
SF1					; Set FF1
LDI	0XF				; Load Accumulator Immediate
IOL	0X20				; Input/Output Long
LDI	0XF				; Load Accumulator Immediate
IOL	0X40				; Input/Output Long
TL	0X744				; Transfer Long
TL	0X736				; Transfer Long
SF1					; Set FF1
T	0X75E				; Transfer
SKF1				; Skip if FF1 Equals 1
LDI	0X8				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
XBMX				; Exchange BM and X
SKC					; Skip on Carry flip-flop
T	0X74E				; Transfer
IOL	0X21				; Input/Output Long
T	0X750				; Transfer
IOL	0X41				; Input/Output Long
SKF1				; Skip if FF1 Equals 1
ADI	0X9				; Add Immediate and skip on carry-out
ADI	0X9				; Add Immediate and skip on carry-out
T	0X742				; Transfer
INCB					; Increment BL
T	0X744				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X75A				; Transfer
RF1					; Reset FF1
T	0X744				; Transfer
SKC					; Skip on Carry flip-flop
T	0X740				; Transfer
LBL	0X000				; Load B Long
SKC					; Skip on Carry flip-flop
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
TML	0X36A				; Transfer and Mark Long
LDI	0XF				; Load Accumulator Immediate
IOL	0XD3				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
LDI	0X0				; Load Accumulator Immediate
IOL	0XD3				; Input/Output Long
TL	0X7C0				; Transfer Long
XAX					; Exchange Accumulator and X
XBMX				; Exchange BM and X
SF2					; Set FF2
TL	0X732				; Transfer Long
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X76D				; Transfer
INCB					; Increment BL
T	0X77C				; Transfer
T	0X77C				; Transfer
LDI	0X3				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
LBL	0X001				; Load B Long
LABL				; Load Accumulator with BL
EX	0					; Exchange Accumulator and Memory
TL	0X780				; Transfer Long
TML	0X1D2				; Transfer and Mark Long
TML	0X1D2				; Transfer and Mark Long
TML	0X1D2				; Transfer and Mark Long
LD	0X0				; Load Accumulator from Memory
SKBI	0X0					; Skip if BL equals to Immediate.
RTN					; Return
XAX					; Exchange Accumulator and X
ADI	0X1				; Add Immediate and skip on carry-out
XAX					; Exchange Accumulator and X
RTNSK				; Return and Skip
LXA					; Load X Register from Accumulator
IOL	0XFB				; Input/Output Long
LAX					; Load Accumulator from X Register
IOL	0XFE				; Input/Output Long
IOL	0XFE				; Input/Output Long
XBMX				; Exchange BM and X
LAX					; Load Accumulator from X Register
IOL	0XFE				; Input/Output Long
IOL	0XFE				; Input/Output Long
LABL				; Load Accumulator with BL
IOL	0XFE				; Input/Output Long
XBMX				; Exchange BM and X
LDI	0X5				; Load Accumulator Immediate
XABL					; Exchange Accumulator and BL
LDI	0XF				; Load Accumulator Immediate
IOL	0XFE				; Input/Output Long
INCB					; Increment BL
T	0X7A2				; Transfer
IOL	0XF3				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
INCB					; Increment BL
T	0X7A8				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X7B0				; Transfer
RF1					; Reset FF1
T	0X7A8				; Transfer
IOL	0XFB				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
INCB					; Increment BL
T	0X7B2				; Transfer
SKF2				; Skip if FF2 Equals 1
RTN					; Return
T	0X7A6				; Transfer
SF1					; Set FF1
XABL					; Exchange Accumulator and BL
LAX					; Load Accumulator from X Register
TML	0X36A				; Transfer and Mark Long
TL	0X7D1				; Transfer Long
TML	0X36E				; Transfer and Mark Long
LDI	0XD				; Load Accumulator Immediate
ADSK				; Add and skip on carry-out
T	0X7DB				; Transfer
LXA					; Load X Register from Accumulator
IOL	0XD6				; Input/Output Long
TML	0X36E				; Transfer and Mark Long
LAX					; Load Accumulator from X Register
IOL	0XDB				; Input/Output Long
LDI	0X1				; Load Accumulator Immediate
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X7E0				; Transfer
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X7C5				; Transfer
LBL	0X000				; Load B Long
LDI	0X3				; Load Accumulator Immediate
TML	0X36A				; Transfer and Mark Long
TL	0X510				; Transfer Long
SF2					; Set FF2
LD	0X0				; Load Accumulator from Memory
SKZ					; Skip on Accumulator Zero
T	0X7E5				; Transfer
T	0X7E6				; Transfer
LD	0X0				; Load Accumulator from Memory
SKZ					; Skip on Accumulator Zero
T	0X7E7				; Transfer
SF2					; Set FF2
LDI	0X4				; Load Accumulator Immediate
LDI	0X5				; Load Accumulator Immediate
LDI	0X6				; Load Accumulator Immediate
LDI	0X7				; Load Accumulator Immediate
TL	0X7B9				; Transfer Long
LAX					; Load Accumulator from X Register
XABL					; Exchange Accumulator and BL
LDI	0X8				; Load Accumulator Immediate
LXA					; Load X Register from Accumulator
LDI	0XA				; Load Accumulator Immediate
DOA					; Discrete Output
TML	0X1D2				; Transfer and Mark Long
DIA					; Discrete Input Group A
EX	0					; Exchange Accumulator and Memory
EOR					; Logical Exclusive-OR
SKZ					; Skip on Accumulator Zero
T	0X7EC				; Transfer
LAX					; Load Accumulator from X Register
ADI	0X1				; Add Immediate and skip on carry-out
T	0X7ED				; Transfer
LABL				; Load Accumulator with BL
XAX					; Exchange Accumulator and X
LDI	0X3				; Load Accumulator Immediate
AND					; Logical AND
EX	0					; Exchange Accumulator and Memory
RTN					; Return
LB	(0XC7)	(B<=0X0E0)				; Load B Indirect
TM	(0XDC)	(@<=0X149)				; Transfer and Mark Indirect
SF2					; Set FF2
LB	(0XC0)	(B<=0X048)				; Load B Indirect
LDI	0X7				; Load Accumulator Immediate
AND					; Logical AND
ADI	0XB				; Add Immediate and skip on carry-out
T	0X80A				; Transfer
TL	0X2D0				; Transfer Long
LB	(0XCF)	(B<=0X017)				; Load B Indirect
LDI	0X8				; Load Accumulator Immediate
LDI	0X0				; Load Accumulator Immediate
EXD	0					; Exchange Accumulator and Memory and decrement BL
T	0X80C				; Transfer
LDI	0X8				; Load Accumulator Immediate
IOL	0XD5				; Input/Output Long
TML	0X103				; Transfer and Mark Long
LDI	0X3				; Load Accumulator Immediate
IOL	0XD0				; Input/Output Long
TML	0X1D2				; Transfer and Mark Long
TL	0X2F4				; Transfer Long
RF1					; Reset FF1
LBL	0X013				; Load B Long
LDI	0XC				; Load Accumulator Immediate
TML	0X195				; Transfer and Mark Long
T	0X831				; Transfer
TM	(0XF6)	(@<=0X193)				; Transfer and Mark Indirect
TM	(0XD7)	(@<=0X15C)				; Transfer and Mark Indirect
SKF1				; Skip if FF1 Equals 1
T	0X82C				; Transfer
T	0X832				; Transfer
LDI	0X8				; Load Accumulator Immediate
LDI	0X4				; Load Accumulator Immediate
LB	(0XC6)	(B<=0X015)				; Load B Indirect
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
TM	(0XFB)	(@<=0X1AC)				; Transfer and Mark Indirect
T	0X833				; Transfer
LBL	0X014				; Load B Long
TM	(0XF7)	(@<=0X194)				; Transfer and Mark Indirect
LDI	0X5				; Load Accumulator Immediate
LDI	0X7				; Load Accumulator Immediate
LDI	0X6				; Load Accumulator Immediate
LDI	0X0				; Load Accumulator Immediate
SF1					; Set FF1
TL	0X84E				; Transfer Long
LBL	0X014				; Load B Long
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
T	0X831				; Transfer
SF1					; Set FF1
RF2					; Reset FF2
TL	0X4C2				; Transfer Long
LB	(0XCE)	(B<=0X016)				; Load B Indirect
TM	(0XD6)	(@<=0X17B)				; Transfer and Mark Indirect
T	0X844				; Transfer
T	0X84D				; Transfer
LBL	0X014				; Load B Long
TM	(0XF5)	(@<=0X192)				; Transfer and Mark Indirect
LDI	0X3				; Load Accumulator Immediate
LDI	0XF				; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				; Transfer and Mark Indirect
TML	0X103				; Transfer and Mark Long
T	0X840				; Transfer
LDI	0X6				; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				; Transfer and Mark Indirect
LB	(0XC7)	(B<=0X0E0)				; Load B Indirect
TM	(0XDC)	(@<=0X149)				; Transfer and Mark Indirect
TM	(0XF8)	(@<=0X199)				; Transfer and Mark Indirect
T	0X855				; Transfer
TL	0X10E				; Transfer Long
LDI	0X8				; Load Accumulator Immediate
IOL	0XD5				; Input/Output Long
LDI	0XC				; Load Accumulator Immediate
IOL	0XD0				; Input/Output Long
T	0X853				; Transfer
LDI	0X9				; Load Accumulator Immediate
LDI	0X8				; Load Accumulator Immediate
IOL	0XD6				; Input/Output Long
LB	(0XCE)	(B<=0X016)				; Load B Indirect
TM	(0XD2)	(@<=0X122)				; Transfer and Mark Indirect
T	0X865				; Transfer
LDI	0XA				; Load Accumulator Immediate
EX	0					; Exchange Accumulator and Memory
LDI	0X1				; Load Accumulator Immediate
LDI	0X5				; Load Accumulator Immediate
TL	0X835				; Transfer Long
OR					; Logical OR
EX	0					; Exchange Accumulator and Memory
SKZ					; Skip on Accumulator Zero
TM	(0XDB)	(@<=0X143)				; Transfer and Mark Indirect
T	0X853				; Transfer
LBL	0X013				; Load B Long
LDI	0XC				; Load Accumulator Immediate
TML	0X195				; Transfer and Mark Long
T	0X877				; Transfer
SKF1				; Skip if FF1 Equals 1
LDI	0X3				; Load Accumulator Immediate
LDI	0XC				; Load Accumulator Immediate
EOR					; Logical Exclusive-OR
EX	0					; Exchange Accumulator and Memory
SKBI	0X3					; Skip if BL equals to Immediate.
T	0X86E				; Transfer
SKF1				; Skip if FF1 Equals 1
T	0X866				; Transfer
RF1					; Reset FF1
LDI	0X3				; Load Accumulator Immediate
T	0X871				; Transfer
TL	0X456				; Transfer Long
T	0X883				; Transfer
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LB	(0XC6)	(B<=0X015)				; Load B Indirect
TL	0X869				; Transfer Long
TL	0X8DB				; Transfer Long
TL	0X8DB				; Transfer Long
TL	0X85D				; Transfer Long
TL	0X827				; Transfer Long
TL	0X8EF				; Transfer Long
TL	0X8C7				; Transfer Long
TL	0X8C8				; Transfer Long
TL	0X82E				; Transfer Long
TL	0X8DE				; Transfer Long
TL	0X8DE				; Transfer Long
TL	0X85C				; Transfer Long
TL	0X828				; Transfer Long
TL	0X840				; Transfer Long
TL	0X834				; Transfer Long
TL	0X81B				; Transfer Long
TL	0X81C				; Transfer Long
TL	0X8E4				; Transfer Long
TL	0X8E4				; Transfer Long
TL	0X83C				; Transfer Long
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
TL	0X8CB				; Transfer Long
LB	(0XC6)	(B<=0X015)				; Load B Indirect
TL	0X870				; Transfer Long
RTN					; Return
TL	0X82D				; Transfer Long
TL	0X8E1				; Transfer Long
TL	0X8E1				; Transfer Long
TL	0X838				; Transfer Long
T	0X8AF				; Transfer
RTN					; Return
LDI	0X0				; Load Accumulator Immediate
IOL	0X41				; Input/Output Long
INCB					; Increment BL
T	0X8C0				; Transfer
TL	0X2DB				; Transfer Long
LDI	0X1				; Load Accumulator Immediate
LDI	0X2				; Load Accumulator Immediate
LBL	0X013				; Load B Long
LB	(0XC6)	(B<=0X015)				; Load B Indirect
AND					; Logical AND
SKZ					; Skip on Accumulator Zero
TM	(0XFF)	(@<=0X1AE)				; Transfer and Mark Indirect
T	0X8F4				; Transfer
LBL	0X0E5				; Load B Long
AND					; Logical AND
DECB					; Decrement BL
AND					; Logical AND
LBL	0X014				; Load B Long
SKZ					; Skip on Accumulator Zero
RTN					; Return
RF1					; Reset FF1
RTN					; Return
LDI	0X1				; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				; Transfer and Mark Indirect
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
LDI	0X2				; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				; Transfer and Mark Indirect
TM	(0XDA)	(@<=0X142)				; Transfer and Mark Indirect
LDI	0X8				; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				; Transfer and Mark Indirect
TM	(0XDB)	(@<=0X143)				; Transfer and Mark Indirect
LDI	0X4				; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				; Transfer and Mark Indirect
DECB					; Decrement BL
TM	(0XDC)	(@<=0X149)				; Transfer and Mark Indirect
TM	(0XD9)	(@<=0X141)				; Transfer and Mark Indirect
INCB					; Increment BL
TM	(0XE7)	(@<=0X154)				; Transfer and Mark Indirect
DECB					; Decrement BL
TM	(0XDE)	(@<=0X14B)				; Transfer and Mark Indirect
TM	(0XDB)	(@<=0X143)				; Transfer and Mark Indirect
T	0X8F4				; Transfer
LBL	0X014				; Load B Long
TM	(0XF6)	(@<=0X193)				; Transfer and Mark Indirect
T	0X8F6				; Transfer
TM	(0XFF)	(@<=0X1AE)				; Transfer and Mark Indirect
TL	0X833				; Transfer Long
TL	0X832				; Transfer Long
TL	0X011				; Transfer Long
TL	0X84F				; Transfer Long
LB	(0XC0)	(B<=0X048)				; Load B Indirect
T	0X8C0				; Transfer
TL	0X21E				; Transfer Long
