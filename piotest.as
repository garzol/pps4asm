;
; file: piotest.as
;
; experimental prog for testing recel and 11696
;
;
; 2024-03-20
; copyrights 2024 AA55 Consulting
;
;
; 
;
; it is supposed that command is located at     RAM(1)
;                     param (acc) is located at RAM(0)
;                     start command is 0/1 in   RAM(2)
;                     device id is supposed to be D (not configurable)


	DELAY33MS	PTR	0x1D2	
	BOOT		PTR 0x000
	SEC200      PTR 0x200
	SEC280      PTR 0x280
	
SECTION BOOT
	
	T	next			;0X000	; Transfer
next:
	RF1					;0X001	; Reset FF1
	RF2					;0X002	; Reset FF2
	TML	DELAY33MS

;play bip bip	
	LDI	0XF				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0X9				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0X0				;0X768	; Load Accumulator Immediate
	IOL	0XD3			;0X769	; Input/Output Long
    TL	SEC200      
    
SECTION SEC200
	TML DELAY33MS
    LBL 0x82             ; @2 contains start/stop - 82=>try the other bank
    LD  0               ; A<-@2
    SKZ
    T   startIOL        ; goto start command
    T   SEC200
startIOL:
	EOR					;reset A
	EX  0               ;reset the trigger, so command is calle only once per trig 
	DECB				; B is now 1 (or 81...)
	LD 	0               ; A<-@1 (command)	
	LXA					; command in X
	DECB				; B is now 0 (or 80...)
	LD  0               ; A<-@0 (param)
	XAX					; command in A, param in X 
	XABL				; B<-command
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
	T   commandisnot9
	TL  execD9
commandisnot9:		
	DECB	
	TL   commandisnotA
	TL  execDA
	setb  0x00
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
	
	
	