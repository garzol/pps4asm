;
; file: barocco.as
;
; experimental prog for testing borderline cases
;
;
; 2024-05-03
; copyrights 2024 AA55 Consulting
;
;
; 
;


	BOOT		PTR 0x000
	opt__1		PTR 0x187
	SEC200      PTR 0x200
	SEC240      PTR 0x240
	SEC280      PTR 0x280
	SEC300		PTR 0x300
	
SECTION BOOT
	
	T	test1			;0X000	; Transfer
test1:
	TL	opt__1
test2:
	LBL		0xC7		; BL<-0C7
	LABL				; A <-#7	
	CYS					; A <- SA(4:1) shift SA SA(12:9)<-A
	XABL                ; just to see
	LBL		0xB8	    ; 
	LABL				; A <-#8
	CYS					; A <- SA(4:1) shift SA SA(12:9)<-A
	XABL                ; just to see
	LBL		0xB1	    ; 
	LABL				; A <-#1
	CYS					; A <- SA(4:1) shift SA SA(12:9)<-A
	XABL                ; now SA is 187 or E78, we don't know
	RTN					; let's see were we land...
	
SECTION opt__1	
	LBL 	0x36
	LB 		(0xC0) (B<=0xA5)
	LBL		0x37
 	LDI		0			; what do we have in B here?  
 	SKZ
	LB 		(0xC1) (B<=0x48)
 	LBL		0x39
 	LDI		0
 	SKZ
	LBL		0x4A
 	LBL		0x3B
 	TL		test2
 	