;
; file: hm6508test.as
;
; experimental prog for testing recel and 11696
;
;
; 2024-04-07
; copyrights 2024 AA55 Consulting
;
;
; 
;
; here we write patterns to the hm6508
; then we read it
; and start again for ever

	BOOT		PTR 0x000
	DELAY33MS	PTR	0x1D2	
	SEC040      PTR 0x040
	SEC200      PTR 0x200
	SEC240      PTR 0x240
	SEC280      PTR 0x280
	SEC300		PTR 0x300
	
SECTION BOOT
	
	T	next			;0X000	; Transfer
next:
	RF1					;0X001	; Reset FF1
	RF2					;0X002	; Reset FF2

;play bip bip	
	LDI	0XF				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0X9				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0XA				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0X0				;0X768	; Load Accumulator Immediate
	IOL	0XD3			;0X769	; Input/Output Long

;general init
;all 2x16 outputs of RIOTs set to 1
;enable flip flop has not been set yet, since reset
	LBL	000				; Load B Long
loopinitriots:
  	LDI	0xF				; Load Accumulator Immediate
	IOL	0x21			; Input/Output Long
 	LDI	0xF				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long
  	INCB				; Increment BL
 	T	loopinitriots	; Transfer
    
;set all IOs as output
 	LDI	0xF				; 
	IOL	0x20			; 2 is B2 aka A1762, SES 1: enable all output
 	LDI	0xF				; Load Accumulator Immediate
	IOL	0x40			; 4 is B1 aka A1761, SES 1: enable all output
    
    
;IO5 is counter reset. release reset (of counter)
	LBL	005				; Load B Long
 	LDI	0				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long

;IO2 is enable HM6508
;IO2=0 => Out +5V => HM6508 enabled, bc enable pin HM6508=0 (thru nand)
readloop:
	LBL	002				; Load B Long
  	LDI	0				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long


;IO0 is data in from T2. 
;T2 is blocked if outHM=1, T2 is on if outHM=0
;T2 blocked=>in=-12V (thru pull-down)=>A17 reads 1
;T2 on     =>in= +5V                 =>A17 reads 0
;
	LBL	000				; Load B Long
 	LDI	8				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long
	TL  SEC040
	
SECTION SEC040
 	SKF2				; Skip on Carry flip-flop
 	LDI	8				; Load Accumulator Immediate
 	LDI	0				; Load Accumulator Immediate
;IO1 is data out
	LBL	001				; Load B Long
	IOL	0x41			; Input/Output Long
;IO3 is read/write=>write enable pulse
	LBL	003				; Load B Long
	LDI	0				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long
	IOL	0x41			; Input/Output Long

;toggle write 0/1 alternatively
	SKF2
	T   setF2now
	RF2
	T   continuetheboulot
setF2now:	
	SF2
	
continuetheboulot:	
;disable HM6508
	LBL	002				; Load B Long
	LDI	8				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long
	
;IO4 is clk of address
;advance clock
	LBL	004				; Load B Long
  	LDI	0				; Load Accumulator Immediate
	IOL	0x41			; Input/Output Long
	IOL	0x41			; Input/Output Long
	TML DELAY33MS
	TL  readloop
    
SECTION	DELAY33MS
;delay for x ms. 6832cyclx5us==>34ms per call
	LDI	0X0				;0X1D2	; Load Accumulator Immediate
	XABL				;0X1D3	; Exchange Accumulator and BL
	SAG					;0X1D4	; Special Address Generation
	EX	0				;0X1D5	; Exchange Accumulator and Memory
	INCB				;0X1D6	; Increment BL
	LDI	0X7				;0X1D7	; Load Accumulator Immediate
	SAG					;0X1D8	; Special Address Generation
	EX	0				;0X1D9	; Exchange Accumulator and Memory
	LDI	0X0				;0X1DA	; Load Accumulator Immediate
	T	0X1DC			;0X1DB	; Transfer
	ADI	0X1				;0X1DC	; Add Immediate and skip on carry-out
	T	0X1DB			;0X1DD	; Transfer
	INCB				;0X1DE	; Increment BL
	T	0X1DA			;0X1DF	; Transfer
	INCB				;0X1E0	; Increment BL
	RC					;0X1E1	; Reset Carry flip-flop
	LDI	0X1				;0X1E2	; Load Accumulator Immediate
	SAG					;0X1E3	; Special Address Generation
	AD					;0X1E4	; Add
	SAG					;0X1E5	; Special Address Generation
	EX	0				;0X1E6	; Exchange Accumulator and Memory
	SKC					;0X1E7	; Skip on Carry flip-flop
	T	0X1DA			;0X1E8	; Transfer
	DECB				;0X1E9	; Decrement BL
	SAG					;0X1EA	; Special Address Generation
	EX	0				;0X1EB	; Exchange Accumulator and Memory
	XABL				;0X1EC	; Exchange Accumulator and BL
	RTN					;0X1ED	; Return
	
	    
    
SECTION SEC200
	TML READIOLHIGH
    LBL 0x02             ; @2 contains start/stop - 82=>try the other bank. does not work
follows:
    LD  0               ; A<-@2
    SKZ
    T   startIOL        ; goto start command
    T   follows
startIOL:
	EOR					;reset A
	EX  0               ;reset the trigger, so command is called only once per trig 
	LBL 0x04			; B is now 4 
	LD 	0               ; A<-@1 (command)	
	LXA					; command in X
	LBL 0x06			; B is now 6 
	LD  0               ; A<-@0 (param)
	XAX					; command in A, param in X 
	XABL				; BL<-command, A<-BL which is 6 at this moment
	XAX                 ; param back in A
	DECB
	T   commandisnot0
	TL  execD0
commandisnot0:
	DECB	
	T   commandisnot1
	TL  execD1
commandisnot1:		
	DECB	
	T   commandisnot2
	TL  execD2
commandisnot2:		
	DECB	
	T   commandisnot3
	TL  execD3
commandisnot3:		
	DECB	
	T   commandisnot4
	TL  execD4
commandisnot4:		
	DECB	
	T   commandisnot5
	TL  execD5
commandisnot5:		
	DECB	
	T   commandisnot6
	TL  execD6
commandisnot6:		
	DECB	
	T   commandisnot7
	TL  execD7
commandisnot7:		
	DECB	
	T   commandisnot8
	TL  execD8
commandisnot8:		
	DECB	
	T   interm0
	TL  execD9
interm0:
	TL   commandisnot9
	
SECTION SEC240
commandisnot9:		
	DECB	
	;TL   commandisnotA    ;is it permitted?
	T   commandisnotA_0
	TL  execDA
commandisnotA_0:
	TL  commandisnotA
	;setb  0x00
	;setb  0x00
	
commandisnotA:		
	DECB	
	T   commandisnotB
	TL  execDB
commandisnotB:		
	DECB	
	T   commandisnotC
	TL  execDC
commandisnotC:		
	DECB	
	T   commandisnotD
	TL  execDD
commandisnotD:		
	DECB	
	T   commandisnotE
	TL  execDE
commandisnotE:	
	DECB	
	T   commandisnotF
	TL  execDF
commandisnotF:	
    TL  next ;normally impossible to reach here	
	
	
    
    
SECTION SEC280
execD0:
	IOL	0xD0
	TL  SEC200
execD1:
	IOL	0xD1
	TL  SEC200
execD2:
	IOL	0xD2
	TL  SEC200
execD3:
	IOL	0xD3
	TL  SEC200
execD4:
	IOL	0xD4
	TL  SEC200
execD5:
	IOL	0xD5
	TL  SEC200
execD6:
	IOL	0xD6
	TL  SEC200
execD7:
	IOL	0xD7
	TL  SEC200
	
execD8:
	IOL	0xD8
	TL  SEC200
execD9:
	IOL	0xD9
	TL  SEC200
execDA:
	IOL	0xDA
	TL  SEC200
execDB:
	IOL	0xDB
	TL  SEC200
execDC:
	IOL	0xDC
	TL  SEC200
execDD:
	IOL	0xDD
	TL  SEC200
execDE:
	IOL	0xDE
	TL  SEC200
execDF:
	IOL	0xDF
	TL  SEC200
	

SECTION SEC300

READIOLHIGH:
	LDI	0x8
	IOL	0xD8	
	LDI 0x9
	IOL 0xD9
	LDI 0xA
	IOL 0xDA
	;LDI 0x5
	;IOL 0xDB
	LDI 0xC
	IOL 0xDC
	LDI 0xD
	IOL 0xDD
	;LDI 0xA
	;IOL 0xDE
	LDI 0xF
	IOL 0xDF
	RTN




	