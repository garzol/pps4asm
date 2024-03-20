;
; file: recelplaysound.as
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
	DELAY33MS	PTR	0x1D2	
	BOOT		PTR 0x000
	
SECTION BOOT
	T	0X001			;0X000	; Transfer
	RF1					;0X001	; Reset FF1
	RF2					;0X002	; Reset FF2
	TML	DELAY33MS

;play bip	
	LDI	0XF				;0X763	; Load Accumulator Immediate
	IOL	0XD3			;0X764	; Input/Output Long
	TML	DELAY33MS		;0X766	; Transfer and Mark Long
	LDI	0X0				;0X768	; Load Accumulator Immediate
	IOL	0XD3				;0X769	; Input/Output Long
	
;don't want to take any risk for a first prog
;we'll see loop control later
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS
	TML	DELAY33MS

	T	BOOT



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
	
	
	