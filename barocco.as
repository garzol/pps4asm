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
	mistake     PTR 0x1B5
	SEC200      PTR 0x200
	SEC240      PTR 0x240
	SEC280      PTR 0x280
	SEC300		PTR 0x300
	
SECTION BOOT
	
	T	test1			;0X000	; Transfer
test1:
	RF1
	RF2
	TL	opt__1
test2:
	LBL		0xC8		; BL<-0C7
	LABL				; A <-#7	
	CYS					; A <- SA(4:1) shift SA SA(12:9)<-A
	XABL                ; just to see
	LBL		0xC7	    ; 
	LABL				; A <-#8
	CYS					; A <- SA(4:1) shift SA SA(12:9)<-A
	XABL                ; just to see
	LBL		0xCE	    ; 
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
 
 SECTION mistake
    TL		test2

;===
;001 000 00	000 00	  
;002 001 26	000 00	  
;003 002 25	0D9 00	  
;004 003 51	0D9 00	TL	187	  
;005 004 87	0D9 00	  
;006 187 00	0D9 00	LBL	36  
;007 188 C9	0D9 00	"36"  
;008 189 C0	036 00	LB  
;009 0C0 5A	036 00	"A5"  
;010 18A 00	036 00	LBL	37
;011 18B C8	036 00	"37"  
;012 18C 7F	036 00	LDI 0 - only LBL  36 was kept 
;013 18D 1E	036 00	SKZ  
;014 18E C1	036 F0	LB 		(0xC1) is skipped and no fetch   
;015 18F 00	036 F0	LBL 39  
;016 190 C6	036 F0	"39"
;017 191 7F	039 F0	LDI 0  
;018 192 1E	039 F0	SKZ
;019 193 00	039 F0	/!\ 1st part of LBL 4A is skipped  
;020 194 B5	039 F0	but not 2nd, which is interpreted and executed as TM 1B5   
;021 1B5 50	039 F0	1B5 is result of B5 above, and contains TL 005  
;022 1B6 05	039 F0	  
;023 005 00	039 F0	Ahah... Barocco enough  LBL C8
;024 006 37	039 F0	"C8"  
;025 007 11	0C8 F0	LABL  (A<-8)
;026 008 6F	0C8 F0	CYS  
;027 009 19	0C8 70	XABL   
;028 00A 00	0C0 F0	LBL C7  
;029 00B 38	0C0 70	"C7"  
;030 00C 11	0C7 70	LABL  (A<-7)  
;031 00D 6F	0C7 70	CYS  
;032 00E 19	0C7 80	XABL  
;033 00F 00	0C0 F0	LBL CE  
;034 010 31	0C0 80	"CE"  
;035 011 11	0CE 80	LABL  (A<-E)  
;036 012 6F	0CE 80	CYS  
;037 013 19	0CE 10	XABL  
;038 014 05	0C5 A0  RTN... where are we landing?	  
;039 187 00	0C5 10	we land at 187, so yes CYS takes /A and gives back /SA(:)  
;040 188 C9	0C5 10	...LBL 036, we loop  
;041 189 C0	036 10	  
;042 0C0 5A	036 10	    
;
	




