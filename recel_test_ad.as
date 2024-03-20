;
;2024-03-20
;file obtained from PPS4Emul with recel_screech.bin
;for assembler test
;current address is put in comment zone

;put zone C0..FF into comment
;replace LBL at line 182 with 2 SETB
; add directive SECTION 0x100 at line 182
; ;;     ;




T	0X001				;0X000	; Transfer
RF1					;0X001	; Reset FF1
RF2					;0X002	; Reset FF2
TL	0X6C0				;0X003	; Transfer Long
LBL	0X089				;0X005	; Load B Long
LDI	0X0				;0X007	; Load Accumulator Immediate
EX	1					;0X008	; Exchange Accumulator and Memory
LDI	0XA				;0X009	; Load Accumulator Immediate
EX	0					;0X00A	; Exchange Accumulator and Memory
LBL	0X0C9				;0X00B	; Load B Long
LABL				;0X00D	; Load Accumulator with BL
DOA					;0X00E	; Discrete Output
TL	0X8F8				;0X00F	; Transfer Long
DIA					;0X011	; Discrete Input Group A
EX	0					;0X012	; Exchange Accumulator and Memory
EOR					;0X013	; Logical Exclusive-OR
SKZ					;0X014	; Skip on Accumulator Zero
T	0X020				;0X015	; Transfer
LD	0X1				;0X016	; Load Accumulator from Memory
LDI	0X1				;0X017	; Load Accumulator Immediate
ADSK				;0X018	; Add and skip on carry-out
T	0X022				;0X019	; Transfer
EX	1					;0X01A	; Exchange Accumulator and Memory
LD	0X2				;0X01B	; Load Accumulator from Memory
EOR					;0X01C	; Logical Exclusive-OR
SKZ					;0X01D	; Skip on Accumulator Zero
T	0X026				;0X01E	; Transfer
LD	0X2				;0X01F	; Load Accumulator from Memory
LD	0X3				;0X020	; Load Accumulator from Memory
LD	0X2				;0X021	; Load Accumulator from Memory
EXD	1					;0X022	; Exchange Accumulator and Memory and decrement BL
T	0X00D				;0X023	; Transfer
TL	0X080				;0X024	; Transfer Long
COMP				;0X026	; Complement
AND					;0X027	; Logical AND
EX	2					;0X028	; Exchange Accumulator and Memory
COMP				;0X029	; Complement
AND					;0X02A	; Logical AND
SKZ					;0X02B	; Skip on Accumulator Zero
T	0X02E				;0X02C	; Transfer
T	0X020				;0X02D	; Transfer
EX	0					;0X02E	; Exchange Accumulator and Memory
LXA					;0X02F	; Load X Register from Accumulator
LDI	0X8				;0X030	; Load Accumulator Immediate
AND					;0X031	; Logical AND
SKZ					;0X032	; Skip on Accumulator Zero
T	0X03D				;0X033	; Transfer
LDI	0X4				;0X034	; Load Accumulator Immediate
AND					;0X035	; Logical AND
SKZ					;0X036	; Skip on Accumulator Zero
T	0X03D				;0X037	; Transfer
LDI	0X2				;0X038	; Load Accumulator Immediate
AND					;0X039	; Logical AND
SKZ					;0X03A	; Skip on Accumulator Zero
T	0X03D				;0X03B	; Transfer
LDI	0X1				;0X03C	; Load Accumulator Immediate
TL	0X040				;0X03D	; Transfer Long
T	0X011				;0X03F	; Transfer
XAX					;0X040	; Exchange Accumulator and X
EX	2					;0X041	; Exchange Accumulator and Memory
LABL				;0X042	; Load Accumulator with BL
ADI	0X8				;0X043	; Add Immediate and skip on carry-out
T	0X046				;0X044	; Transfer
T	0X04B				;0X045	; Transfer
SKF1				;0X046	; Skip if FF1 Equals 1
T	0X049				;0X047	; Transfer
T	0X04B				;0X048	; Transfer
ADI	0X2				;0X049	; Add Immediate and skip on carry-out
T	0X079				;0X04A	; Transfer
LAX					;0X04B	; Load Accumulator from X Register
OR					;0X04C	; Logical OR
EX	2					;0X04D	; Exchange Accumulator and Memory
LAX					;0X04E	; Load Accumulator from X Register
COMP				;0X04F	; Complement
ADI	0X4				;0X050	; Add Immediate and skip on carry-out
ADI	0X1				;0X051	; Add Immediate and skip on carry-out
T	0X053				;0X052	; Transfer
ADI	0X8				;0X053	; Add Immediate and skip on carry-out
ADI	0XD				;0X054	; Add Immediate and skip on carry-out
T	0X056				;0X055	; Transfer
LXA					;0X056	; Load X Register from Accumulator
XABL					;0X057	; Exchange Accumulator and BL
LBL	0X00F				;0X058	; Load B Long
EX	0					;0X05A	; Exchange Accumulator and Memory
LD	0X0				;0X05B	; Load Accumulator from Memory
ADSK				;0X05C	; Add and skip on carry-out
T	0X06C				;0X05D	; Transfer
XAX					;0X05E	; Exchange Accumulator and X
EX	0					;0X05F	; Exchange Accumulator and Memory
LD	0X0				;0X060	; Load Accumulator from Memory
AD					;0X061	; Add
EX	0					;0X062	; Exchange Accumulator and Memory
XAX					;0X063	; Exchange Accumulator and X
SKZ					;0X064	; Skip on Accumulator Zero
LDI	0X0				;0X065	; Load Accumulator Immediate
LDI	0X8				;0X066	; Load Accumulator Immediate
AD					;0X067	; Add
XAX					;0X068	; Exchange Accumulator and X
LDI	0XF				;0X069	; Load Accumulator Immediate
XAX					;0X06A	; Exchange Accumulator and X
T	0X06E				;0X06B	; Transfer
SKF2				;0X06C	; Skip if FF2 Equals 1
T	0X07B				;0X06D	; Transfer
COMP				;0X06E	; Complement
XS					;0X06F	; Exchange SA and SB
CYS					;0X070	; Cycle SA register and Accumulator
LAX					;0X071	; Load Accumulator from X Register
CYS					;0X072	; Cycle SA register and Accumulator
LAX					;0X073	; Load Accumulator from X Register
ADI	0X1				;0X074	; Add Immediate and skip on carry-out
LDI	0X7				;0X075	; Load Accumulator Immediate
LDI	0XA				;0X076	; Load Accumulator Immediate
CYS					;0X077	; Cycle SA register and Accumulator
RTN					;0X078	; Return
TL	0X01F				;0X079	; Transfer Long
TL	0X00B				;0X07B	; Transfer Long
T	0X07E				;0X07D	; Transfer
TL	0X011				;0X07E	; Transfer Long
LDI	0X1				;0X080	; Load Accumulator Immediate
LBL	0X089				;0X081	; Load B Long
ADSK				;0X083	; Add and skip on carry-out
T	0X094				;0X084	; Transfer
EX	1					;0X085	; Exchange Accumulator and Memory
LDI	0X1				;0X086	; Load Accumulator Immediate
ADSK				;0X087	; Add and skip on carry-out
T	0X094				;0X088	; Transfer
LDI	0XA				;0X089	; Load Accumulator Immediate
EX	3					;0X08A	; Exchange Accumulator and Memory
LDI	0X1				;0X08B	; Load Accumulator Immediate
ADSK				;0X08C	; Add and skip on carry-out
T	0X091				;0X08D	; Transfer
EX	1					;0X08E	; Exchange Accumulator and Memory
LDI	0X1				;0X08F	; Load Accumulator Immediate
AD					;0X090	; Add
EX	0					;0X091	; Exchange Accumulator and Memory
TL	0X676				;0X092	; Transfer Long
EX	0					;0X094	; Exchange Accumulator and Memory
LBL	0X089				;0X095	; Load B Long
LD	0X1				;0X097	; Load Accumulator from Memory
SKZ					;0X098	; Skip on Accumulator Zero
T	0X0BA				;0X099	; Transfer
LDI	0X3				;0X09A	; Load Accumulator Immediate
AD					;0X09B	; Add
SKZ					;0X09C	; Skip on Accumulator Zero
T	0X0BA				;0X09D	; Transfer
LDI	0X0				;0X09E	; Load Accumulator Immediate
LXA					;0X09F	; Load X Register from Accumulator
IOL	0XDB				;0X0A0	; Input/Output Long
LAX					;0X0A2	; Load Accumulator from X Register
ADI	0X1				;0X0A3	; Add Immediate and skip on carry-out
T	0X09F				;0X0A4	; Transfer
SKF2				;0X0A5	; Skip if FF2 Equals 1
T	0X0AE				;0X0A6	; Transfer
LBL	0X049				;0X0A7	; Load B Long
LDI	0X7				;0X0A9	; Load Accumulator Immediate
ADSK				;0X0AA	; Add and skip on carry-out
DC					;0X0AB	; Decimal Correction
EX	0					;0X0AC	; Exchange Accumulator and Memory
T	0X0BC				;0X0AD	; Transfer
SKF1				;0X0AE	; Skip if FF1 Equals 1
T	0X0B1				;0X0AF	; Transfer
T	0X0BC				;0X0B0	; Transfer
LBL	0X042				;0X0B1	; Load B Long
LDI	0X1				;0X0B3	; Load Accumulator Immediate
AND					;0X0B4	; Logical AND
SKZ					;0X0B5	; Skip on Accumulator Zero
T	0X0B8				;0X0B6	; Transfer
T	0X0AD				;0X0B7	; Transfer
TL	0X487				;0X0B8	; Transfer Long
TL	0X00B				;0X0BA	; Transfer Long
TL	0X614				;0X0BC	; Transfer Long
LBL	0X0FF				;0X0BE	; Load B Long
T	0X0F7				;0X0C0	; Transfer
SKF1				;0X0C1	; Skip if FF1 Equals 1
T	0X0EE				;0X0C2	; Transfer
T	0X0FF				;0X0C3	; Transfer
T	0X0FE				;0X0C4	; Transfer
SKBI	0XE					;0X0C5	; Skip if BL equals to Immediate.
TM	(0XEA)	(@<=0X163)				;0X0C6	; Transfer and Mark Indirect
DECB					;0X0C7	; Decrement BL
T	0X0FD				;0X0C8	; Transfer
T	0X0F5				;0X0C9	; Transfer
T	0X0E5				;0X0CA	; Transfer
T	0X0ED				;0X0CB	; Transfer
SKBI	0X6					;0X0CC	; Skip if BL equals to Immediate.
T	0X0E6				;0X0CD	; Transfer
TM	(0XE9)	(@<=0X162)				;0X0CE	; Transfer and Mark Indirect
TM	(0XE8)	(@<=0X161)				;0X0CF	; Transfer and Mark Indirect
INCB					;0X0D0	; Increment BL
XBMX				;0X0D1	; Exchange BM and X
SF1					;0X0D2	; Set FF1
DIB					;0X0D3	; Discrete Input Group B
EXD	2					;0X0D4	; Exchange Accumulator and Memory and decrement BL
EXD	1					;0X0D5	; Exchange Accumulator and Memory and decrement BL
LDI	0X4				;0X0D6	; Load Accumulator Immediate
TL	0XC40				;0X0D7	; Transfer Long
SKBI	0X1					;0X0D9	; Skip if BL equals to Immediate.
SKBI	0X2					;0X0DA	; Skip if BL equals to Immediate.
SKBI	0X3					;0X0DB	; Skip if BL equals to Immediate.
SKBI	0X9					;0X0DC	; Skip if BL equals to Immediate.
SKBI	0XA					;0X0DD	; Skip if BL equals to Immediate.
SKBI	0XB					;0X0DE	; Skip if BL equals to Immediate.
SKBI	0XC					;0X0DF	; Skip if BL equals to Immediate.
T	0X0C0				;0X0E0	; Transfer
T	0X0C1				;0X0E1	; Transfer
T	0X0C2				;0X0E2	; Transfer
T	0X0C3				;0X0E3	; Transfer
TL	0X152				;0X0E4	; Transfer Long
TL	0X354				;0X0E6	; Transfer Long
ADI	0XE				;0X0E8	; Add Immediate and skip on carry-out
ADI	0XD				;0X0E9	; Add Immediate and skip on carry-out
ADI	0XC				;0X0EA	; Add Immediate and skip on carry-out
ADI	0XB				;0X0EB	; Add Immediate and skip on carry-out
ADI	0X6				;0X0EC	; Add Immediate and skip on carry-out
ADI	0X5				;0X0ED	; Add Immediate and skip on carry-out
ADI	0X4				;0X0EE	; Add Immediate and skip on carry-out
ADI	0X3				;0X0EF	; Add Immediate and skip on carry-out
LDI	0XE				;0X0F0	; Load Accumulator Immediate
LDI	0XD				;0X0F1	; Load Accumulator Immediate
LDI	0XC				;0X0F2	; Load Accumulator Immediate
LDI	0XB				;0X0F3	; Load Accumulator Immediate
T	0X0D1				;0X0F4	; Transfer
T	0X0D2				;0X0F5	; Transfer
T	0X0D3				;0X0F6	; Transfer
T	0X0D4				;0X0F7	; Transfer
T	0X0D9				;0X0F8	; Transfer
T	0X0F5				;0X0F9	; Transfer
T	0X0F7				;0X0FA	; Transfer
T	0X0EC				;0X0FB	; Transfer
T	0X0DD				;0X0FC	; Transfer
T	0X0F9				;0X0FD	; Transfer
T	0X0FB				;0X0FE	; Transfer
T	0X0EE				;0X0FF	; Transfer
SF1					;0X100	; Set FF1
TL	0X005				;0X101	; Transfer Long
RF1					;0X103	; Reset FF1
T	0X101				;0X104	; Transfer
LB	(0XC0)	(B<=0X048)				;0X105	; Load B Indirect
OR					;0X106	; Logical OR
EX	0					;0X107	; Exchange Accumulator and Memory
RF2					;0X108	; Reset FF2
LB	(0XCF)	(B<=0X017)				;0X109	; Load B Indirect
LB	(0XC0)	(B<=0X048)				;0X10A	; Load B Indirect
LDI	0X7				;0X10B	; Load Accumulator Immediate
AND					;0X10C	; Logical AND
EX	0					;0X10D	; Exchange Accumulator and Memory
TML	0X100				;0X10E	; Transfer and Mark Long
T	0X10E				;0X110	; Transfer
LB	(0XCF)	(B<=0X017)				;0X111	; Load B Indirect
LDI	0X8				;0X112	; Load Accumulator Immediate
OR					;0X113	; Logical OR
EX	0					;0X114	; Exchange Accumulator and Memory
SF2					;0X115	; Set FF2
T	0X10A				;0X116	; Transfer
LDI	0X1				;0X117	; Load Accumulator Immediate
RC					;0X118	; Reset Carry flip-flop
SKF1				;0X119	; Skip if FF1 Equals 1
RTN					;0X11A	; Return
AD					;0X11B	; Add
EX	0					;0X11C	; Exchange Accumulator and Memory
SKC					;0X11D	; Skip on Carry flip-flop
RTN					;0X11E	; Return
LDI	0XF				;0X11F	; Load Accumulator Immediate
EX	0					;0X120	; Exchange Accumulator and Memory
RTNSK				;0X121	; Return and Skip
LDI	0X1				;0X122	; Load Accumulator Immediate
RC					;0X123	; Reset Carry flip-flop
SKF1				;0X124	; Skip if FF1 Equals 1
T	0X126				;0X125	; Transfer
ADI	0X6				;0X126	; Add Immediate and skip on carry-out
ADSK				;0X127	; Add and skip on carry-out
DC					;0X128	; Decimal Correction
EX	0					;0X129	; Exchange Accumulator and Memory
SKC					;0X12A	; Skip on Carry flip-flop
RTN					;0X12B	; Return
RTNSK				;0X12C	; Return and Skip
LDI	0X1				;0X12D	; Load Accumulator Immediate
LXA					;0X12E	; Load X Register from Accumulator
RC					;0X12F	; Reset Carry flip-flop
ADI	0X6				;0X130	; Add Immediate and skip on carry-out
ADSK				;0X131	; Add and skip on carry-out
DC					;0X132	; Decimal Correction
EX	0					;0X133	; Exchange Accumulator and Memory
SKC					;0X134	; Skip on Carry flip-flop
T	0X13C				;0X135	; Transfer
LDI	0X1				;0X136	; Load Accumulator Immediate
INCB					;0X137	; Increment BL
T	0X13A				;0X138	; Transfer
T	0X13C				;0X139	; Transfer
SKBI	0X8					;0X13A	; Skip if BL equals to Immediate.
T	0X12F				;0X13B	; Transfer
LAX					;0X13C	; Load Accumulator from X Register
RTN					;0X13D	; Return
TL	0X5B1				;0X13E	; Transfer Long
LDI	0X1				;0X140	; Load Accumulator Immediate
LDI	0X2				;0X141	; Load Accumulator Immediate
LDI	0X4				;0X142	; Load Accumulator Immediate
LDI	0X8				;0X143	; Load Accumulator Immediate
SKF1				;0X144	; Skip if FF1 Equals 1
RTN					;0X145	; Return
OR					;0X146	; Logical OR
EX	0					;0X147	; Exchange Accumulator and Memory
RTN					;0X148	; Return
LDI	0XE				;0X149	; Load Accumulator Immediate
LDI	0XD				;0X14A	; Load Accumulator Immediate
LDI	0XB				;0X14B	; Load Accumulator Immediate
LDI	0X7				;0X14C	; Load Accumulator Immediate
SKF1				;0X14D	; Skip if FF1 Equals 1
RTN					;0X14E	; Return
AND					;0X14F	; Logical AND
T	0X147				;0X150	; Transfer
LDI	0X1				;0X151	; Load Accumulator Immediate
LDI	0X2				;0X152	; Load Accumulator Immediate
LDI	0X4				;0X153	; Load Accumulator Immediate
LDI	0X8				;0X154	; Load Accumulator Immediate
SKF1				;0X155	; Skip if FF1 Equals 1
RTN					;0X156	; Return
AND					;0X157	; Logical AND
SKZ					;0X158	; Skip on Accumulator Zero
RTN					;0X159	; Return
RF1					;0X15A	; Reset FF1
RTN					;0X15B	; Return
SKF1				;0X15C	; Skip if FF1 Equals 1
T	0X15F				;0X15D	; Transfer
T	0X15A				;0X15E	; Transfer
SF1					;0X15F	; Set FF1
RTN					;0X160	; Return
LDI	0X1				;0X161	; Load Accumulator Immediate
LDI	0X2				;0X162	; Load Accumulator Immediate
LDI	0X4				;0X163	; Load Accumulator Immediate
LDI	0X8				;0X164	; Load Accumulator Immediate
AND					;0X165	; Logical AND
SKZ					;0X166	; Skip on Accumulator Zero
T	0X15F				;0X167	; Transfer
RTN					;0X168	; Return
LDI	0X1				;0X169	; Load Accumulator Immediate
LDI	0X2				;0X16A	; Load Accumulator Immediate
LDI	0X4				;0X16B	; Load Accumulator Immediate
LDI	0X8				;0X16C	; Load Accumulator Immediate
AND					;0X16D	; Logical AND
SKZ					;0X16E	; Skip on Accumulator Zero
RTN					;0X16F	; Return
T	0X15F				;0X170	; Transfer
LDI	0X1				;0X171	; Load Accumulator Immediate
LDI	0X2				;0X172	; Load Accumulator Immediate
LDI	0X4				;0X173	; Load Accumulator Immediate
LDI	0X8				;0X174	; Load Accumulator Immediate
SKF1				;0X175	; Skip if FF1 Equals 1
RTN					;0X176	; Return
AND					;0X177	; Logical AND
SKZ					;0X178	; Skip on Accumulator Zero
T	0X15A				;0X179	; Transfer
RTN					;0X17A	; Return
LDI	0XF				;0X17B	; Load Accumulator Immediate
ADSK				;0X17C	; Add and skip on carry-out
RTNSK				;0X17D	; Return and Skip
T	0X147				;0X17E	; Transfer
SETB 	0X00				;0X180	; Load B Long
LDI	0X1				;0X180	; Load Accumulator Immediate
LDI	0X2				;0X181	; Load Accumulator Immediate
LDI	0X4				;0X182	; Load Accumulator Immediate
LDI	0X8				;0X183	; Load Accumulator Immediate
SKF1				;0X184	; Skip if FF1 Equals 1
RTN					;0X185	; Return
LXA					;0X186	; Load X Register from Accumulator
AND					;0X187	; Logical AND
SKZ					;0X188	; Skip on Accumulator Zero
T	0X18E				;0X189	; Transfer
XAX					;0X18A	; Exchange Accumulator and X
AD					;0X18B	; Add
EX	0					;0X18C	; Exchange Accumulator and Memory
RTN					;0X18D	; Return
COMP				;0X18E	; Complement
AND					;0X18F	; Logical AND
T	0X18C				;0X190	; Transfer
LDI	0X1				;0X191	; Load Accumulator Immediate
LDI	0X2				;0X192	; Load Accumulator Immediate
LDI	0X4				;0X193	; Load Accumulator Immediate
LDI	0X8				;0X194	; Load Accumulator Immediate
AND					;0X195	; Logical AND
SKZ					;0X196	; Skip on Accumulator Zero
RTNSK				;0X197	; Return and Skip
RTN					;0X198	; Return
LD	0X0				;0X199	; Load Accumulator from Memory
SKZ					;0X19A	; Skip on Accumulator Zero
RTN					;0X19B	; Return
RTNSK				;0X19C	; Return and Skip
LDI	0X1				;0X19D	; Load Accumulator Immediate
AND					;0X19E	; Logical AND
SKZ					;0X19F	; Skip on Accumulator Zero
T	0X1A2				;0X1A0	; Transfer
RTN					;0X1A1	; Return
IOL	0XD6				;0X1A2	; Input/Output Long
LDI	0XC				;0X1A4	; Load Accumulator Immediate
AND					;0X1A5	; Logical AND
EX	0					;0X1A6	; Exchange Accumulator and Memory
INCB					;0X1A7	; Increment BL
LAX					;0X1A8	; Load Accumulator from X Register
EOR					;0X1A9	; Logical Exclusive-OR
SKZ					;0X1AA	; Skip on Accumulator Zero
RTN					;0X1AB	; Return
LBL	0X069				;0X1AC	; Load B Long
LBL	0X068				;0X1AE	; Load B Long
LDI	0X1				;0X1B0	; Load Accumulator Immediate
AD					;0X1B1	; Add
EX	0					;0X1B2	; Exchange Accumulator and Memory
TL	0X103				;0X1B3	; Transfer Long
TL	0X200				;0X1B5	; Transfer Long
TL	0X4E2				;0X1B7	; Transfer Long
TL	0X8D0				;0X1B9	; Transfer Long
TL	0X8E0				;0X1BB	; Transfer Long
LBL	0X0AA				;0X1BD	; Load B Long
T	0X1B2				;0X1BF	; Transfer
SAG					;0X1C0	; Special Address Generation
LD	0X0				;0X1C1	; Load Accumulator from Memory
EOR					;0X1C2	; Logical Exclusive-OR
SKZ					;0X1C3	; Skip on Accumulator Zero
RTNSK				;0X1C4	; Return and Skip
INCB					;0X1C5	; Increment BL
LAX					;0X1C6	; Load Accumulator from X Register
EOR					;0X1C7	; Logical Exclusive-OR
SKZ					;0X1C8	; Skip on Accumulator Zero
RTNSK				;0X1C9	; Return and Skip
RTN					;0X1CA	; Return
LBL	0X0E9				;0X1CB	; Load B Long
LDI	0X1				;0X1CD	; Load Accumulator Immediate
AND					;0X1CE	; Logical AND
SKZ					;0X1CF	; Skip on Accumulator Zero
RTN					;0X1D0	; Return
RTNSK				;0X1D1	; Return and Skip
LDI	0X0				;0X1D2	; Load Accumulator Immediate
XABL					;0X1D3	; Exchange Accumulator and BL
SAG					;0X1D4	; Special Address Generation
EX	0					;0X1D5	; Exchange Accumulator and Memory
INCB					;0X1D6	; Increment BL
LDI	0X7				;0X1D7	; Load Accumulator Immediate
SAG					;0X1D8	; Special Address Generation
EX	0					;0X1D9	; Exchange Accumulator and Memory
LDI	0X0				;0X1DA	; Load Accumulator Immediate
T	0X1DC				;0X1DB	; Transfer
ADI	0X1				;0X1DC	; Add Immediate and skip on carry-out
T	0X1DB				;0X1DD	; Transfer
INCB					;0X1DE	; Increment BL
T	0X1DA				;0X1DF	; Transfer
INCB					;0X1E0	; Increment BL
RC					;0X1E1	; Reset Carry flip-flop
LDI	0X1				;0X1E2	; Load Accumulator Immediate
SAG					;0X1E3	; Special Address Generation
AD					;0X1E4	; Add
SAG					;0X1E5	; Special Address Generation
EX	0					;0X1E6	; Exchange Accumulator and Memory
SKC					;0X1E7	; Skip on Carry flip-flop
T	0X1DA				;0X1E8	; Transfer
DECB					;0X1E9	; Decrement BL
SAG					;0X1EA	; Special Address Generation
EX	0					;0X1EB	; Exchange Accumulator and Memory
XABL					;0X1EC	; Exchange Accumulator and BL
RTN					;0X1ED	; Return
XBMX				;0X1EE	; Exchange BM and X
EX	0					;0X1EF	; Exchange Accumulator and Memory
LDI	0X0				;0X1F0	; Load Accumulator Immediate
LXA					;0X1F1	; Load X Register from Accumulator
IOL	0XDB				;0X1F2	; Input/Output Long
LAX					;0X1F4	; Load Accumulator from X Register
ADI	0X1				;0X1F5	; Add Immediate and skip on carry-out
T	0X1F1				;0X1F6	; Transfer
LDI	0X1				;0X1F7	; Load Accumulator Immediate
LXA					;0X1F8	; Load X Register from Accumulator
LD	0X0				;0X1F9	; Load Accumulator from Memory
XBMX				;0X1FA	; Exchange BM and X
TL	0X772				;0X1FB	; Transfer Long
LBL	0X0FF				;0X1FD	; Load B Long
SETB 	0X00				;0X200	; Load B Long
LB	(0XCD)	(B<=0X059)				;0X200	; Load B Indirect
EX	0					;0X201	; Exchange Accumulator and Memory
LDI	0X3				;0X202	; Load Accumulator Immediate
AND					;0X203	; Logical AND
ADI	0X1				;0X204	; Add Immediate and skip on carry-out
EXD	0					;0X205	; Exchange Accumulator and Memory and decrement BL
EX	0					;0X206	; Exchange Accumulator and Memory
LDI	0XC				;0X207	; Load Accumulator Immediate
AND					;0X208	; Logical AND
ADI	0X7				;0X209	; Add Immediate and skip on carry-out
ADI	0X3				;0X20A	; Add Immediate and skip on carry-out
T	0X20C				;0X20B	; Transfer
ADI	0X7				;0X20C	; Add Immediate and skip on carry-out
ADI	0X9				;0X20D	; Add Immediate and skip on carry-out
T	0X20F				;0X20E	; Transfer
EX	0					;0X20F	; Exchange Accumulator and Memory
SKF1				;0X210	; Skip if FF1 Equals 1
RTN					;0X211	; Return
SF1					;0X212	; Set FF1
LBL	0X058				;0X213	; Load B Long
LD	0X0				;0X215	; Load Accumulator from Memory
ADI	0XF				;0X216	; Add Immediate and skip on carry-out
RTN					;0X217	; Return
EX	0					;0X218	; Exchange Accumulator and Memory
INCB					;0X219	; Increment BL
LD	0X0				;0X21A	; Load Accumulator from Memory
LXA					;0X21B	; Load X Register from Accumulator
TL	0X8FE				;0X21C	; Transfer Long
LB	(0XC8)	(B<=0X042)				;0X21E	; Load B Indirect
LB	(0XCB)	(B<=0X052)				;0X21F	; Load B Indirect
LDI	0X2				;0X220	; Load Accumulator Immediate
AND					;0X221	; Logical AND
SKZ					;0X222	; Skip on Accumulator Zero
T	0X230				;0X223	; Transfer
SKBI	0X2					;0X224	; Skip if BL equals to Immediate.
T	0X22A				;0X225	; Transfer
LABL				;0X226	; Load Accumulator with BL
ADI	0X8				;0X227	; Add Immediate and skip on carry-out
XABL					;0X228	; Exchange Accumulator and BL
T	0X221				;0X229	; Transfer
XBMX				;0X22A	; Exchange BM and X
LAX					;0X22B	; Load Accumulator from X Register
XBMX				;0X22C	; Exchange BM and X
ADI	0XB				;0X22D	; Add Immediate and skip on carry-out
T	0X21F				;0X22E	; Transfer
RTN					;0X22F	; Return
XABL					;0X230	; Exchange Accumulator and BL
SAG					;0X231	; Special Address Generation
EX	0					;0X232	; Exchange Accumulator and Memory
LAX					;0X233	; Load Accumulator from X Register
SAG					;0X234	; Special Address Generation
AD					;0X235	; Add
XABL					;0X236	; Exchange Accumulator and BL
LAX					;0X237	; Load Accumulator from X Register
ADI	0XF				;0X238	; Add Immediate and skip on carry-out
T	0X23A				;0X239	; Transfer
TL	0X242				;0X23A	; Transfer Long
TL	0X8E0				;0X23C	; Transfer Long
TL	0X5B0				;0X23E	; Transfer Long
LAX					;0X240	; Load Accumulator from X Register
ADI	0X1				;0X241	; Add Immediate and skip on carry-out
LXA					;0X242	; Load X Register from Accumulator
IOL	0XD6				;0X243	; Input/Output Long
TM	(0XD2)	(@<=0X122)				;0X245	; Transfer and Mark Indirect
T	0X253				;0X246	; Transfer
INCB					;0X247	; Increment BL
T	0X24A				;0X248	; Transfer
T	0X24C				;0X249	; Transfer
SKBI	0X8					;0X24A	; Skip if BL equals to Immediate.
T	0X240				;0X24B	; Transfer
LABL				;0X24C	; Load Accumulator with BL
DC					;0X24D	; Decimal Correction
XABL					;0X24E	; Exchange Accumulator and BL
LDI	0XF				;0X24F	; Load Accumulator Immediate
IOL	0XD3				;0X250	; Input/Output Long
TM	(0XDA)	(@<=0X142)				;0X252	; Transfer and Mark Indirect
LABL				;0X253	; Load Accumulator with BL
ADI	0X2				;0X254	; Add Immediate and skip on carry-out
T	0X258				;0X255	; Transfer
LDI	0XE				;0X256	; Load Accumulator Immediate
T	0X25E				;0X257	; Transfer
ADI	0X6				;0X258	; Add Immediate and skip on carry-out
T	0X25B				;0X259	; Transfer
T	0X260				;0X25A	; Transfer
ADI	0X2				;0X25B	; Add Immediate and skip on carry-out
T	0X260				;0X25C	; Transfer
LDI	0X6				;0X25D	; Load Accumulator Immediate
TL	0X2A2				;0X25E	; Transfer Long
XABL					;0X260	; Exchange Accumulator and BL
ADI	0X8				;0X261	; Add Immediate and skip on carry-out
LDI	0X2				;0X262	; Load Accumulator Immediate
LDI	0XA				;0X263	; Load Accumulator Immediate
XABL					;0X264	; Exchange Accumulator and BL
LD	0X0				;0X265	; Load Accumulator from Memory
ADI	0X8				;0X266	; Add Immediate and skip on carry-out
T	0X26A				;0X267	; Transfer
TL	0X285				;0X268	; Transfer Long
ADI	0X4				;0X26A	; Add Immediate and skip on carry-out
T	0X27A				;0X26B	; Transfer
XABL					;0X26C	; Exchange Accumulator and BL
ADI	0X5				;0X26D	; Add Immediate and skip on carry-out
XABL					;0X26E	; Exchange Accumulator and BL
LD	0X2				;0X26F	; Load Accumulator from Memory
EOR					;0X270	; Logical Exclusive-OR
SKZ					;0X271	; Skip on Accumulator Zero
T	0X27C				;0X272	; Transfer
EX	0					;0X273	; Exchange Accumulator and Memory
EXD	2					;0X274	; Exchange Accumulator and Memory and decrement BL
SKBI	0X2					;0X275	; Skip if BL equals to Immediate.
T	0X278				;0X276	; Transfer
T	0X27A				;0X277	; Transfer
SKBI	0XA					;0X278	; Skip if BL equals to Immediate.
T	0X26F				;0X279	; Transfer
TL	0X103				;0X27A	; Transfer Long
TL	0X280				;0X27C	; Transfer Long
TL	0X538				;0X27E	; Transfer Long
LD	0X2				;0X280	; Load Accumulator from Memory
COMP				;0X281	; Complement
ADSK				;0X282	; Add and skip on carry-out
T	0X2A0				;0X283	; Transfer
RF2					;0X284	; Reset FF2
XABL					;0X285	; Exchange Accumulator and BL
ADI	0X8				;0X286	; Add Immediate and skip on carry-out
LDI	0X2				;0X287	; Load Accumulator Immediate
LDI	0XA				;0X288	; Load Accumulator Immediate
XABL					;0X289	; Exchange Accumulator and BL
IOL	0XD3				;0X28A	; Input/Output Long
TM	(0XDB)	(@<=0X143)				;0X28C	; Transfer and Mark Indirect
XABL					;0X28D	; Exchange Accumulator and BL
ADI	0X5				;0X28E	; Add Immediate and skip on carry-out
XABL					;0X28F	; Exchange Accumulator and BL
LD	0X2				;0X290	; Load Accumulator from Memory
EXD	2					;0X291	; Exchange Accumulator and Memory and decrement BL
SKBI	0X2					;0X292	; Skip if BL equals to Immediate.
T	0X295				;0X293	; Transfer
T	0X297				;0X294	; Transfer
SKBI	0XA					;0X295	; Skip if BL equals to Immediate.
T	0X290				;0X296	; Transfer
SKF2				;0X297	; Skip if FF2 Equals 1
T	0X29A				;0X298	; Transfer
T	0X2A0				;0X299	; Transfer
SF2					;0X29A	; Set FF2
LBL	0X069				;0X29B	; Load B Long
LDI	0X3				;0X29D	; Load Accumulator Immediate
LDI	0X1				;0X29E	; Load Accumulator Immediate
TM	(0XD1)	(@<=0X118)				;0X29F	; Transfer and Mark Indirect
TL	0X103				;0X2A0	; Transfer Long
XABL					;0X2A2	; Exchange Accumulator and BL
LD	0X0				;0X2A3	; Load Accumulator from Memory
LXA					;0X2A4	; Load X Register from Accumulator
INCB					;0X2A5	; Increment BL
LD	0X0				;0X2A6	; Load Accumulator from Memory
LBL	0X000				;0X2A7	; Load B Long
EX	6					;0X2A9	; Exchange Accumulator and Memory
TML	0X1C0				;0X2AA	; Transfer and Mark Long
T	0X2B9				;0X2AC	; Transfer
LBL	0X070				;0X2AD	; Load B Long
TML	0X1C0				;0X2AF	; Transfer and Mark Long
T	0X2B9				;0X2B1	; Transfer
LBL	0X080				;0X2B2	; Load B Long
TML	0X1C0				;0X2B4	; Transfer and Mark Long
T	0X2BB				;0X2B6	; Transfer
TL	0X2DF				;0X2B7	; Transfer Long
LBL	0X069				;0X2B9	; Load B Long
LBL	0X068				;0X2BB	; Load B Long
T	0X29E				;0X2BD	; Transfer
TL	0X8C0				;0X2BE	; Transfer Long
XAX					;0X2C0	; Exchange Accumulator and X
IOL	0X21				;0X2C1	; Input/Output Long
INCB					;0X2C3	; Increment BL
T	0X2CD				;0X2C4	; Transfer
LBL	0X015				;0X2C5	; Load B Long
LD	0X1				;0X2C7	; Load Accumulator from Memory
EX	1					;0X2C8	; Exchange Accumulator and Memory
COMP				;0X2C9	; Complement
EXD	0					;0X2CA	; Exchange Accumulator and Memory and decrement BL
T	0X2C7				;0X2CB	; Transfer
TL	0X313				;0X2CC	; Transfer Long
TL	0X693				;0X2CE	; Transfer Long
LB	(0XC8)	(B<=0X042)				;0X2D0	; Load B Indirect
LB	(0XC9)	(B<=0X04A)				;0X2D1	; Load B Indirect
LDI	0XC				;0X2D2	; Load Accumulator Immediate
AND					;0X2D3	; Logical AND
EX	1					;0X2D4	; Exchange Accumulator and Memory
LDI	0XC				;0X2D5	; Load Accumulator Immediate
AND					;0X2D6	; Logical AND
EX	0					;0X2D7	; Exchange Accumulator and Memory
SKBI	0XA					;0X2D8	; Skip if BL equals to Immediate.
T	0X2D1				;0X2D9	; Transfer
LDI	0XF				;0X2DA	; Load Accumulator Immediate
LDI	0X7				;0X2DB	; Load Accumulator Immediate
LDI	0X8				;0X2DC	; Load Accumulator Immediate
TL	0X105				;0X2DD	; Transfer Long
LB	(0XC8)	(B<=0X042)				;0X2DF	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X2E0	; Transfer and Mark Indirect
T	0X2E3				;0X2E1	; Transfer
T	0X2EC				;0X2E2	; Transfer
LB	(0XC9)	(B<=0X04A)				;0X2E3	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X2E4	; Transfer and Mark Indirect
T	0X2E7				;0X2E5	; Transfer
T	0X2EC				;0X2E6	; Transfer
LB	(0XCA)	(B<=0X05A)				;0X2E7	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X2E8	; Transfer and Mark Indirect
T	0X2EB				;0X2E9	; Transfer
T	0X2EC				;0X2EA	; Transfer
LB	(0XCB)	(B<=0X052)				;0X2EB	; Load B Indirect
INCB					;0X2EC	; Increment BL
TL	0X260				;0X2ED	; Transfer Long
LDI	0X8				;0X2EF	; Load Accumulator Immediate
IOL	0XD2				;0X2F0	; Input/Output Long
TL	0X3C7				;0X2F2	; Transfer Long
LBL	0X005				;0X2F4	; Load B Long
LDI	0X0				;0X2F6	; Load Accumulator Immediate
IOL	0X41				;0X2F7	; Input/Output Long
LBL	0X003				;0X2F9	; Load B Long
LDI	0X0				;0X2FB	; Load Accumulator Immediate
EXD	0					;0X2FC	; Exchange Accumulator and Memory and decrement BL
LDI	0X0				;0X2FD	; Load Accumulator Immediate
TL	0X5C0				;0X2FE	; Transfer Long
SKF1				;0X300	; Skip if FF1 Equals 1
T	0X317				;0X301	; Transfer
LBL	0X042				;0X302	; Load B Long
LDI	0X1				;0X304	; Load Accumulator Immediate
AND					;0X305	; Logical AND
SKZ					;0X306	; Skip on Accumulator Zero
T	0X30A				;0X307	; Transfer
TL	0X8FC				;0X308	; Transfer Long
LB	(0XC7)	(B<=0X0E0)				;0X30A	; Load B Indirect
TM	(0XF4)	(@<=0X191)				;0X30B	; Transfer and Mark Indirect
T	0X30F				;0X30C	; Transfer
TL	0X800				;0X30D	; Transfer Long
TL	0X8FA				;0X30F	; Transfer Long
TL	0X212				;0X311	; Transfer Long
SKF2				;0X313	; Skip if FF2 Equals 1
T	0X300				;0X314	; Transfer
SKF1				;0X315	; Skip if FF1 Equals 1
T	0X311				;0X316	; Transfer
LBL	0X069				;0X317	; Load B Long
TM	(0XD6)	(@<=0X17B)				;0X319	; Transfer and Mark Indirect
T	0X320				;0X31A	; Transfer
LBL	0X068				;0X31B	; Load B Long
TM	(0XD6)	(@<=0X17B)				;0X31D	; Transfer and Mark Indirect
T	0X338				;0X31E	; Transfer
T	0X33A				;0X31F	; Transfer
LBL	0X078				;0X320	; Load B Long
TM	(0XF8)	(@<=0X199)				;0X322	; Transfer and Mark Indirect
T	0X334				;0X323	; Transfer
LB	(0XC3)	(B<=0X040)				;0X324	; Load B Indirect
TM	(0XD2)	(@<=0X122)				;0X325	; Transfer and Mark Indirect
T	0X32A				;0X326	; Transfer
LDI	0X9				;0X327	; Load Accumulator Immediate
EX	0					;0X328	; Exchange Accumulator and Memory
T	0X31B				;0X329	; Transfer
LBL	0X0AB				;0X32A	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X32C	; Transfer and Mark Indirect
LBL	0X0B3				;0X32D	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X32F	; Transfer and Mark Indirect
LDI	0X6				;0X330	; Load Accumulator Immediate
IOL	0XD6				;0X331	; Input/Output Long
T	0X31B				;0X333	; Transfer
LB	(0XC5)	(B<=0X0B1)				;0X334	; Load B Indirect
TM	(0XF6)	(@<=0X193)				;0X335	; Transfer and Mark Indirect
T	0X31B				;0X336	; Transfer
T	0X324				;0X337	; Transfer
TL	0X340				;0X338	; Transfer Long
LB	(0XC8)	(B<=0X042)				;0X33A	; Load B Indirect
TM	(0XF4)	(@<=0X191)				;0X33B	; Transfer and Mark Indirect
T	0X33E				;0X33C	; Transfer
T	0X30F				;0X33D	; Transfer
TL	0X4AF				;0X33E	; Transfer Long
T	0X341				;0X340	; Transfer
T	0X342				;0X341	; Transfer
LB	(0XC5)	(B<=0X0B1)				;0X342	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X343	; Transfer and Mark Indirect
T	0X346				;0X344	; Transfer
T	0X351				;0X345	; Transfer
RF1					;0X346	; Reset FF1
TM	(0XF4)	(@<=0X191)				;0X347	; Transfer and Mark Indirect
T	0X34D				;0X348	; Transfer
LB	(0XC4)	(B<=0X041)				;0X349	; Load B Indirect
TM	(0XF8)	(@<=0X199)				;0X34A	; Transfer and Mark Indirect
T	0X363				;0X34B	; Transfer
T	0X351				;0X34C	; Transfer
LB	(0XCF)	(B<=0X017)				;0X34D	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X34E	; Transfer and Mark Indirect
T	0X351				;0X34F	; Transfer
T	0X363				;0X350	; Transfer
LB	(0XC4)	(B<=0X041)				;0X351	; Load B Indirect
LDI	0X0				;0X352	; Load Accumulator Immediate
SKF1				;0X353	; Skip if FF1 Equals 1
EX	0					;0X354	; Exchange Accumulator and Memory
TM	(0XD2)	(@<=0X122)				;0X355	; Transfer and Mark Indirect
T	0X35A				;0X356	; Transfer
LDI	0X9				;0X357	; Load Accumulator Immediate
EX	0					;0X358	; Exchange Accumulator and Memory
T	0X363				;0X359	; Transfer
LB	(0XCF)	(B<=0X017)				;0X35A	; Load B Indirect
SF1					;0X35B	; Set FF1
TM	(0XD9)	(@<=0X141)				;0X35C	; Transfer and Mark Indirect
LBL	0X0A3				;0X35D	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X35F	; Transfer and Mark Indirect
LDI	0X6				;0X360	; Load Accumulator Immediate
IOL	0XD6				;0X361	; Input/Output Long
TL	0X10E				;0X363	; Transfer Long
LBL	0X0AA				;0X365	; Load B Long
EXD	7					;0X367	; Exchange Accumulator and Memory and decrement BL
TL	0X580				;0X368	; Transfer Long
TL	0X78D				;0X36A	; Transfer Long
TL	0X778				;0X36C	; Transfer Long
TL	0X7EA				;0X36E	; Transfer Long
LBL	0X0E9				;0X370	; Load B Long
LDI	0X1				;0X372	; Load Accumulator Immediate
AND					;0X373	; Logical AND
LBL	0X079				;0X374	; Load B Long
SKZ					;0X376	; Skip on Accumulator Zero
T	0X37C				;0X377	; Transfer
LDI	0X4				;0X378	; Load Accumulator Immediate
EX	0					;0X379	; Exchange Accumulator and Memory
TL	0X380				;0X37A	; Transfer Long
AD					;0X37C	; Add
EX	0					;0X37D	; Exchange Accumulator and Memory
TL	0X00B				;0X37E	; Transfer Long
LB	(0XC0)	(B<=0X048)				;0X380	; Load B Indirect
TM	(0XF8)	(@<=0X199)				;0X381	; Transfer and Mark Indirect
T	0X386				;0X382	; Transfer
LB	(0XCB)	(B<=0X052)				;0X383	; Load B Indirect
TM	(0XF8)	(@<=0X199)				;0X384	; Transfer and Mark Indirect
T	0X390				;0X385	; Transfer
SF1					;0X386	; Set FF1
LB	(0XC2)	(B<=0X051)				;0X387	; Load B Indirect
TM	(0XD6)	(@<=0X17B)				;0X388	; Transfer and Mark Indirect
T	0X395				;0X389	; Transfer
DECB					;0X38A	; Decrement BL
TM	(0XD6)	(@<=0X17B)				;0X38B	; Transfer and Mark Indirect
T	0X392				;0X38C	; Transfer
LB	(0XC3)	(B<=0X040)				;0X38D	; Load B Indirect
TM	(0XD6)	(@<=0X17B)				;0X38E	; Transfer and Mark Indirect
T	0X396				;0X38F	; Transfer
TL	0X10E				;0X390	; Transfer Long
INCB					;0X392	; Increment BL
LDI	0X9				;0X393	; Load Accumulator Immediate
EX	0					;0X394	; Exchange Accumulator and Memory
LDI	0X0				;0X395	; Load Accumulator Immediate
LDI	0XF				;0X396	; Load Accumulator Immediate
LBL	0X078				;0X397	; Load B Long
EX	0					;0X399	; Exchange Accumulator and Memory
LBL	0X0A1				;0X39A	; Load B Long
TM	(0XDE)	(@<=0X14B)				;0X39C	; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				;0X39D	; Load B Indirect
TM	(0XF8)	(@<=0X199)				;0X39E	; Transfer and Mark Indirect
T	0X3AD				;0X39F	; Transfer
LB	(0XC9)	(B<=0X04A)				;0X3A0	; Load B Indirect
TM	(0XE4)	(@<=0X151)				;0X3A1	; Transfer and Mark Indirect
SKF1				;0X3A2	; Skip if FF1 Equals 1
T	0X3A9				;0X3A3	; Transfer
LB	(0XCA)	(B<=0X05A)				;0X3A4	; Load B Indirect
TM	(0XE4)	(@<=0X151)				;0X3A5	; Transfer and Mark Indirect
SKF1				;0X3A6	; Skip if FF1 Equals 1
T	0X3A9				;0X3A7	; Transfer
LB	(0XCB)	(B<=0X052)				;0X3A8	; Load B Indirect
SF1					;0X3A9	; Set FF1
TM	(0XD8)	(@<=0X140)				;0X3AA	; Transfer and Mark Indirect
TL	0X480				;0X3AB	; Transfer Long
LB	(0XCF)	(B<=0X017)				;0X3AD	; Load B Indirect
LDI	0X0				;0X3AE	; Load Accumulator Immediate
EXD	0					;0X3AF	; Exchange Accumulator and Memory and decrement BL
T	0X3AE				;0X3B0	; Transfer
LBL	0X04F				;0X3B1	; Load B Long
SKBI	0X2					;0X3B3	; Skip if BL equals to Immediate.
LDI	0X0				;0X3B4	; Load Accumulator Immediate
LDI	0X3				;0X3B5	; Load Accumulator Immediate
EX	1					;0X3B6	; Exchange Accumulator and Memory
LDI	0X0				;0X3B7	; Load Accumulator Immediate
EXD	1					;0X3B8	; Exchange Accumulator and Memory and decrement BL
SKBI	0X1					;0X3B9	; Skip if BL equals to Immediate.
T	0X3B3				;0X3BA	; Transfer
LDI	0X0				;0X3BB	; Load Accumulator Immediate
EX	5					;0X3BC	; Exchange Accumulator and Memory
LDI	0X6				;0X3BD	; Load Accumulator Immediate
TL	0X47C				;0X3BE	; Transfer Long
SF1					;0X3C0	; Set FF1
LB	(0XC0)	(B<=0X048)				;0X3C1	; Load B Indirect
TM	(0XF7)	(@<=0X194)				;0X3C2	; Transfer and Mark Indirect
T	0X3F1				;0X3C3	; Transfer
TM	(0XDF)	(@<=0X14C)				;0X3C4	; Transfer and Mark Indirect
TL	0X2EF				;0X3C5	; Transfer Long
LB	(0XC4)	(B<=0X041)				;0X3C7	; Load B Indirect
TM	(0XD6)	(@<=0X17B)				;0X3C8	; Transfer and Mark Indirect
T	0X3F5				;0X3C9	; Transfer
LB	(0XC8)	(B<=0X042)				;0X3CA	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X3CB	; Transfer and Mark Indirect
T	0X3D0				;0X3CC	; Transfer
TM	(0XDD)	(@<=0X14A)				;0X3CD	; Transfer and Mark Indirect
LB	(0XC9)	(B<=0X04A)				;0X3CE	; Load B Indirect
T	0X3DB				;0X3CF	; Transfer
LB	(0XC9)	(B<=0X04A)				;0X3D0	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X3D1	; Transfer and Mark Indirect
T	0X3D6				;0X3D2	; Transfer
TM	(0XDD)	(@<=0X14A)				;0X3D3	; Transfer and Mark Indirect
LB	(0XCA)	(B<=0X05A)				;0X3D4	; Load B Indirect
T	0X3DB				;0X3D5	; Transfer
LB	(0XCA)	(B<=0X05A)				;0X3D6	; Load B Indirect
TM	(0XF5)	(@<=0X192)				;0X3D7	; Transfer and Mark Indirect
T	0X3DE				;0X3D8	; Transfer
TM	(0XDD)	(@<=0X14A)				;0X3D9	; Transfer and Mark Indirect
LB	(0XCB)	(B<=0X052)				;0X3DA	; Load B Indirect
TM	(0XF4)	(@<=0X191)				;0X3DB	; Transfer and Mark Indirect
T	0X3E0				;0X3DC	; Transfer
T	0X3F6				;0X3DD	; Transfer
LB	(0XCB)	(B<=0X052)				;0X3DE	; Load B Indirect
TM	(0XDD)	(@<=0X14A)				;0X3DF	; Transfer and Mark Indirect
LB	(0XC8)	(B<=0X042)				;0X3E0	; Load B Indirect
TM	(0XD9)	(@<=0X141)				;0X3E1	; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				;0X3E2	; Load B Indirect
TM	(0XD0)	(@<=0X117)				;0X3E3	; Transfer and Mark Indirect
LB	(0XC5)	(B<=0X0B1)				;0X3E4	; Load B Indirect
TM	(0XE7)	(@<=0X154)				;0X3E5	; Transfer and Mark Indirect
LB	(0XC0)	(B<=0X048)				;0X3E6	; Load B Indirect
SKF1				;0X3E7	; Skip if FF1 Equals 1
LDI	0XB				;0X3E8	; Load Accumulator Immediate
LDI	0XD				;0X3E9	; Load Accumulator Immediate
ADSK				;0X3EA	; Add and skip on carry-out
T	0X3F7				;0X3EB	; Transfer
LDI	0X5				;0X3EC	; Load Accumulator Immediate
EX	0					;0X3ED	; Exchange Accumulator and Memory
RF2					;0X3EE	; Reset FF2
TL	0X103				;0X3EF	; Transfer Long
LB	(0XCD)	(B<=0X059)				;0X3F1	; Load B Indirect
TM	(0XF8)	(@<=0X199)				;0X3F2	; Transfer and Mark Indirect
T	0X3C5				;0X3F3	; Transfer
T	0X3F7				;0X3F4	; Transfer
LB	(0XCF)	(B<=0X017)				;0X3F5	; Load B Indirect
TM	(0XD9)	(@<=0X141)				;0X3F6	; Transfer and Mark Indirect
LB	(0XCD)	(B<=0X059)				;0X3F7	; Load B Indirect
LDI	0X0				;0X3F8	; Load Accumulator Immediate
EX	0					;0X3F9	; Exchange Accumulator and Memory
LDI	0X7				;0X3FA	; Load Accumulator Immediate
IOL	0XD6				;0X3FB	; Input/Output Long
SF2					;0X3FD	; Set FF2
TL	0X480				;0X3FE	; Transfer Long
TL	0X44C				;0X400	; Transfer Long
TM	(0XDA)	(@<=0X142)				;0X402	; Transfer and Mark Indirect
LAX					;0X403	; Load Accumulator from X Register
T	0X434				;0X404	; Transfer
TML	0X1CB				;0X405	; Transfer and Mark Long
T	0X40B				;0X407	; Transfer
LBL	0X083				;0X408	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X40A	; Transfer and Mark Indirect
LBL	0X0A0				;0X40B	; Load B Long
SF1					;0X40D	; Set FF1
TM	(0XE3)	(@<=0X183)				;0X40E	; Transfer and Mark Indirect
TM	(0XE6)	(@<=0X153)				;0X40F	; Transfer and Mark Indirect
TM	(0XEB)	(@<=0X164)				;0X410	; Transfer and Mark Indirect
SKF1				;0X411	; Skip if FF1 Equals 1
T	0X400				;0X412	; Transfer
T	0X426				;0X413	; Transfer
TML	0X1CB				;0X414	; Transfer and Mark Long
T	0X41A				;0X416	; Transfer
LBL	0X09B				;0X417	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X419	; Transfer and Mark Indirect
LBL	0X0B0				;0X41A	; Load B Long
LD	0X0				;0X41C	; Load Accumulator from Memory
T	0X429				;0X41D	; Transfer
TML	0X1CB				;0X41E	; Transfer and Mark Long
T	0X424				;0X420	; Transfer
LBL	0X08B				;0X421	; Load B Long
TM	(0XD4)	(@<=0X12D)				;0X423	; Transfer and Mark Indirect
LBL	0X0A1				;0X424	; Load B Long
LDI	0X3				;0X426	; Load Accumulator Immediate
AND					;0X427	; Logical AND
ADI	0X1				;0X428	; Add Immediate and skip on carry-out
LBL	0X0A1				;0X429	; Load B Long
SF1					;0X42B	; Set FF1
LXA					;0X42C	; Load X Register from Accumulator
LDI	0XC				;0X42D	; Load Accumulator Immediate
AND					;0X42E	; Logical AND
ADI	0X4				;0X42F	; Add Immediate and skip on carry-out
T	0X402				;0X430	; Transfer
TM	(0XDE)	(@<=0X14B)				;0X431	; Transfer and Mark Indirect
LAX					;0X432	; Load Accumulator from X Register
ADI	0X1				;0X433	; Add Immediate and skip on carry-out
LXA					;0X434	; Load X Register from Accumulator
LBL	0X0E9				;0X435	; Load B Long
TM	(0XF4)	(@<=0X191)				;0X437	; Transfer and Mark Indirect
T	0X43D				;0X438	; Transfer
LBL	0X0BB				;0X439	; Load B Long
LAX					;0X43B	; Load Accumulator from X Register
TM	(0XD5)	(@<=0X12E)				;0X43C	; Transfer and Mark Indirect
LAX					;0X43D	; Load Accumulator from X Register
TL	0X440				;0X43E	; Transfer Long
LBL	0X0B3				;0X440	; Load B Long
TM	(0XD5)	(@<=0X12E)				;0X442	; Transfer and Mark Indirect
LB	(0XC2)	(B<=0X051)				;0X443	; Load B Indirect
TM	(0XD3)	(@<=0X123)				;0X444	; Transfer and Mark Indirect
T	0X44D				;0X445	; Transfer
DECB					;0X446	; Decrement BL
LD	0X7				;0X447	; Load Accumulator from Memory
COMP				;0X448	; Complement
ADSK				;0X449	; Add and skip on carry-out
T	0X450				;0X44A	; Transfer
LD	0X7				;0X44B	; Load Accumulator from Memory
TM	(0XD0)	(@<=0X117)				;0X44C	; Transfer and Mark Indirect
SF1					;0X44D	; Set FF1
TL	0X00B				;0X44E	; Transfer Long
LD	0X7				;0X450	; Load Accumulator from Memory
EX	0					;0X451	; Exchange Accumulator and Memory
INCB					;0X452	; Increment BL
LDI	0X9				;0X453	; Load Accumulator Immediate
EX	0					;0X454	; Exchange Accumulator and Memory
T	0X44D				;0X455	; Transfer
SKF2				;0X456	; Skip if FF2 Equals 1
TL	0X800				;0X457	; Transfer Long
T	0X466				;0X459	; Transfer
TM	(0XF8)	(@<=0X199)				;0X45A	; Transfer and Mark Indirect
T	0X45E				;0X45B	; Transfer
TL	0X3F7				;0X45C	; Transfer Long
TL	0X4D3				;0X45E	; Transfer Long
T	0X45C				;0X460	; Transfer
LBL	0X079				;0X461	; Load B Long
LD	0X0				;0X463	; Load Accumulator from Memory
ADI	0X4				;0X464	; Add Immediate and skip on carry-out
T	0X468				;0X465	; Transfer
TL	0X10E				;0X466	; Transfer Long
ADI	0X6				;0X468	; Add Immediate and skip on carry-out
T	0X466				;0X469	; Transfer
LDI	0X1				;0X46A	; Load Accumulator Immediate
EOR					;0X46B	; Logical Exclusive-OR
LXA					;0X46C	; Load X Register from Accumulator
LB	(0XC1)	(B<=0X0E9)				;0X46D	; Load B Indirect
LDI	0XC				;0X46E	; Load Accumulator Immediate
AND					;0X46F	; Logical AND
SKZ					;0X470	; Skip on Accumulator Zero
T	0X473				;0X471	; Transfer
T	0X466				;0X472	; Transfer
ADI	0X8				;0X473	; Add Immediate and skip on carry-out
LDI	0X0				;0X474	; Load Accumulator Immediate
LDI	0X1				;0X475	; Load Accumulator Immediate
XABL					;0X476	; Exchange Accumulator and BL
XBMX				;0X477	; Exchange BM and X
LDI	0X1				;0X478	; Load Accumulator Immediate
AD					;0X479	; Add
EX	0					;0X47A	; Exchange Accumulator and Memory
T	0X466				;0X47B	; Transfer
IOL	0XD3				;0X47C	; Input/Output Long
TL	0X800				;0X47E	; Transfer Long
LDI	0X1				;0X480	; Load Accumulator Immediate
IOL	0XD3				;0X481	; Input/Output Long
TML	0X1D2				;0X483	; Transfer and Mark Long
TL	0X111				;0X485	; Transfer Long
LBL	0X0B8				;0X487	; Load B Long
TM	(0XF8)	(@<=0X199)				;0X489	; Transfer and Mark Indirect
T	0X49F				;0X48A	; Transfer
TM	(0XD2)	(@<=0X122)				;0X48B	; Transfer and Mark Indirect
INCB					;0X48C	; Increment BL
LDI	0XA				;0X48D	; Load Accumulator Immediate
EX	0					;0X48E	; Exchange Accumulator and Memory
LB	(0XCC)	(B<=0X0B9)				;0X48F	; Load B Indirect
LD	0X2				;0X490	; Load Accumulator from Memory
EX	3					;0X491	; Exchange Accumulator and Memory
LDI	0X0				;0X492	; Load Accumulator Immediate
EX	0					;0X493	; Exchange Accumulator and Memory
LBL	0X049				;0X494	; Load B Long
LDI	0X1				;0X496	; Load Accumulator Immediate
AND					;0X497	; Logical AND
SKZ					;0X498	; Skip on Accumulator Zero
LDI	0X2				;0X499	; Load Accumulator Immediate
LDI	0X4				;0X49A	; Load Accumulator Immediate
IOL	0XD6				;0X49B	; Input/Output Long
TL	0X0A7				;0X49D	; Transfer Long
TM	(0XD2)	(@<=0X122)				;0X49F	; Transfer and Mark Indirect
T	0X4A4				;0X4A0	; Transfer
TM	(0XD2)	(@<=0X122)				;0X4A1	; Transfer and Mark Indirect
LB	(0XCC)	(B<=0X0B9)				;0X4A2	; Load B Indirect
T	0X4A9				;0X4A3	; Transfer
TM	(0XD2)	(@<=0X122)				;0X4A4	; Transfer and Mark Indirect
T	0X48F				;0X4A5	; Transfer
LBL	0X0FF				;0X4A6	; Load B Long
LBL	0X029				;0X4A8	; Load B Long
TM	(0XF7)	(@<=0X194)				;0X4AA	; Transfer and Mark Indirect
TM	(0XD6)	(@<=0X17B)				;0X4AB	; Transfer and Mark Indirect
T	0X48F				;0X4AC	; Transfer
DECB					;0X4AD	; Decrement BL
TM	(0XD6)	(@<=0X17B)				;0X4AE	; Transfer and Mark Indirect
LBL	0X049				;0X4AF	; Load B Long
LD	0X0				;0X4B1	; Load Accumulator from Memory
LXA					;0X4B2	; Load X Register from Accumulator
LB	(0XC8)	(B<=0X042)				;0X4B3	; Load B Indirect
TM	(0XFC)	(@<=0X19D)				;0X4B4	; Transfer and Mark Indirect
LB	(0XC9)	(B<=0X04A)				;0X4B5	; Load B Indirect
TM	(0XFC)	(@<=0X19D)				;0X4B6	; Transfer and Mark Indirect
LB	(0XCA)	(B<=0X05A)				;0X4B7	; Load B Indirect
TM	(0XFC)	(@<=0X19D)				;0X4B8	; Transfer and Mark Indirect
LB	(0XCB)	(B<=0X052)				;0X4B9	; Load B Indirect
TM	(0XFC)	(@<=0X19D)				;0X4BA	; Transfer and Mark Indirect
SF1					;0X4BB	; Set FF1
TL	0X00B				;0X4BC	; Transfer Long
LBL	0X0FF				;0X4BE	; Load B Long
LDI	0X8				;0X4C0	; Load Accumulator Immediate
LDI	0X9				;0X4C1	; Load Accumulator Immediate
LDI	0XA				;0X4C2	; Load Accumulator Immediate
LDI	0XB				;0X4C3	; Load Accumulator Immediate
LDI	0XC				;0X4C4	; Load Accumulator Immediate
LDI	0XD				;0X4C5	; Load Accumulator Immediate
LDI	0XE				;0X4C6	; Load Accumulator Immediate
LDI	0XF				;0X4C7	; Load Accumulator Immediate
IOL	0XD6				;0X4C8	; Input/Output Long
SKF1				;0X4CA	; Skip if FF1 Equals 1
T	0X4D1				;0X4CB	; Transfer
SKF2				;0X4CC	; Skip if FF2 Equals 1
LDI	0X2				;0X4CD	; Load Accumulator Immediate
LDI	0X1				;0X4CE	; Load Accumulator Immediate
SF2					;0X4CF	; Set FF2
TM	(0XF9)	(@<=0X1B5)				;0X4D0	; Transfer and Mark Indirect
TL	0X005				;0X4D1	; Transfer Long
LB	(0XCE)	(B<=0X016)				;0X4D3	; Load B Indirect
TM	(0XD6)	(@<=0X17B)				;0X4D4	; Transfer and Mark Indirect
T	0X4D8				;0X4D5	; Transfer
TL	0X800				;0X4D6	; Transfer Long
LB	(0XCF)	(B<=0X017)				;0X4D8	; Load B Indirect
TM	(0XF6)	(@<=0X193)				;0X4D9	; Transfer and Mark Indirect
LDI	0X3				;0X4DA	; Load Accumulator Immediate
LDI	0XB				;0X4DB	; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				;0X4DC	; Transfer and Mark Indirect
T	0X4F0				;0X4DD	; Transfer
TML	0X393				;0X4DE	; Transfer and Mark Long
LBL	0X0FF				;0X4E0	; Load B Long
LB	(0XC5)	(B<=0X0B1)				;0X4E2	; Load B Indirect
TM	(0XF7)	(@<=0X194)				;0X4E3	; Transfer and Mark Indirect
T	0X4E9				;0X4E4	; Transfer
LB	(0XCE)	(B<=0X016)				;0X4E5	; Load B Indirect
TM	(0XD0)	(@<=0X117)				;0X4E6	; Transfer and Mark Indirect
RTN					;0X4E7	; Return
RTN					;0X4E8	; Return
LB	(0XCE)	(B<=0X016)				;0X4E9	; Load B Indirect
TM	(0XD2)	(@<=0X122)				;0X4EA	; Transfer and Mark Indirect
RTN					;0X4EB	; Return
EX	0					;0X4EC	; Exchange Accumulator and Memory
RTN					;0X4ED	; Return
LBL	0X0FF				;0X4EE	; Load B Long
LBL	0X069				;0X4F0	; Load B Long
TM	(0XF8)	(@<=0X199)				;0X4F2	; Transfer and Mark Indirect
T	0X4FA				;0X4F3	; Transfer
DECB					;0X4F4	; Decrement BL
TM	(0XF8)	(@<=0X199)				;0X4F5	; Transfer and Mark Indirect
T	0X4FA				;0X4F6	; Transfer
TML	0X103				;0X4F7	; Transfer and Mark Long
T	0X4D3				;0X4F9	; Transfer
LB	(0XC7)	(B<=0X0E0)				;0X4FA	; Load B Indirect
TM	(0XDC)	(@<=0X149)				;0X4FB	; Transfer and Mark Indirect
TL	0X317				;0X4FC	; Transfer Long
LBL	0X0FF				;0X4FE	; Load B Long
TL	0X41E				;0X500	; Transfer Long
TL	0X405				;0X502	; Transfer Long
TL	0X414				;0X504	; Transfer Long
TL	0X2D0				;0X506	; Transfer Long
TL	0X461				;0X508	; Transfer Long
TL	0X461				;0X50A	; Transfer Long
TL	0X370				;0X50C	; Transfer Long
TL	0X2DC				;0X50E	; Transfer Long
LBL	0X005				;0X510	; Load B Long
LDI	0X0				;0X512	; Load Accumulator Immediate
IOL	0X41				;0X513	; Input/Output Long
LBL	0X029				;0X515	; Load B Long
LDI	0X0				;0X517	; Load Accumulator Immediate
EXD	0					;0X518	; Exchange Accumulator and Memory and decrement BL
LDI	0X0				;0X519	; Load Accumulator Immediate
EX	0					;0X51A	; Exchange Accumulator and Memory
TL	0X540				;0X51B	; Transfer Long
XABL					;0X51D	; Exchange Accumulator and BL
INCB					;0X51E	; Increment BL
LD	0X0				;0X51F	; Load Accumulator from Memory
ADI	0X6				;0X520	; Add Immediate and skip on carry-out
ADI	0X2				;0X521	; Add Immediate and skip on carry-out
T	0X525				;0X522	; Transfer
TL	0X56C				;0X523	; Transfer Long
LDI	0X2				;0X525	; Load Accumulator Immediate
TL	0X564				;0X526	; Transfer Long
LBL	0X002				;0X528	; Load B Long
LDI	0X0				;0X52A	; Load Accumulator Immediate
IOL	0X41				;0X52B	; Input/Output Long
LBL	0X006				;0X52D	; Load B Long
LDI	0X0				;0X52F	; Load Accumulator Immediate
IOL	0X41				;0X530	; Input/Output Long
IOL	0X41				;0X532	; Input/Output Long
INCB					;0X534	; Increment BL
LDI	0X0				;0X535	; Load Accumulator Immediate
IOL	0X41				;0X536	; Input/Output Long
LBL	0X000				;0X538	; Load B Long
LDI	0X8				;0X53A	; Load Accumulator Immediate
IOL	0X41				;0X53B	; Input/Output Long
SKZ					;0X53D	; Skip on Accumulator Zero
RTN					;0X53E	; Return
RTNSK				;0X53F	; Return and Skip
LBL	0X000				;0X540	; Load B Long
LDI	0X0				;0X542	; Load Accumulator Immediate
EX	0					;0X543	; Exchange Accumulator and Memory
TML	0X366				;0X544	; Transfer and Mark Long
LDI	0X1				;0X546	; Load Accumulator Immediate
TML	0X368				;0X547	; Transfer and Mark Long
TML	0X366				;0X549	; Transfer and Mark Long
LDI	0X2				;0X54B	; Load Accumulator Immediate
TML	0X368				;0X54C	; Transfer and Mark Long
TML	0X366				;0X54E	; Transfer and Mark Long
LDI	0X4				;0X550	; Load Accumulator Immediate
TML	0X368				;0X551	; Transfer and Mark Long
TML	0X366				;0X553	; Transfer and Mark Long
LDI	0X8				;0X555	; Load Accumulator Immediate
TML	0X368				;0X556	; Transfer and Mark Long
LBL	0X029				;0X558	; Load B Long
LD	0X2				;0X55A	; Load Accumulator from Memory
EXD	2					;0X55B	; Exchange Accumulator and Memory and decrement BL
LD	0X2				;0X55C	; Load Accumulator from Memory
XABL					;0X55D	; Exchange Accumulator and BL
SKBI	0X2					;0X55E	; Skip if BL equals to Immediate.
T	0X562				;0X55F	; Transfer
TL	0X51D				;0X560	; Transfer Long
XABL					;0X562	; Exchange Accumulator and BL
INCB					;0X563	; Increment BL
XBMX				;0X564	; Exchange BM and X
LXA					;0X565	; Load X Register from Accumulator
XBMX				;0X566	; Exchange BM and X
SAG					;0X567	; Special Address Generation
LD	0X0				;0X568	; Load Accumulator from Memory
XABL					;0X569	; Exchange Accumulator and BL
LAX					;0X56A	; Load Accumulator from X Register
EX	0					;0X56B	; Exchange Accumulator and Memory
LBL	0X029				;0X56C	; Load B Long
RC					;0X56E	; Reset Carry flip-flop
LDI	0X1				;0X56F	; Load Accumulator Immediate
AD					;0X570	; Add
EXD	0					;0X571	; Exchange Accumulator and Memory and decrement BL
SKC					;0X572	; Skip on Carry flip-flop
T	0X540				;0X573	; Transfer
SKBI	0X7					;0X574	; Skip if BL equals to Immediate.
T	0X56E				;0X575	; Transfer
LBL	0X005				;0X576	; Load B Long
LDI	0X8				;0X578	; Load Accumulator Immediate
IOL	0X41				;0X579	; Input/Output Long
XABL					;0X57B	; Exchange Accumulator and BL
TML	0X36A				;0X57C	; Transfer and Mark Long
TL	0X2D0				;0X57E	; Transfer Long
OR					;0X580	; Logical OR
LXA					;0X581	; Load X Register from Accumulator
EX	0					;0X582	; Exchange Accumulator and Memory
LBL	0X007				;0X583	; Load B Long
LDI	0X8				;0X585	; Load Accumulator Immediate
IOL	0X41				;0X586	; Input/Output Long
RC					;0X588	; Reset Carry flip-flop
TML	0X27E				;0X589	; Transfer and Mark Long
SC					;0X58B	; Set Carry flip-flop
TML	0X13E				;0X58C	; Transfer and Mark Long
TML	0X27E				;0X58E	; Transfer and Mark Long
T	0X596				;0X590	; Transfer
TML	0X1BE				;0X591	; Transfer and Mark Long
TML	0X27E				;0X593	; Transfer and Mark Long
T	0X597				;0X595	; Transfer
SF2					;0X596	; Set FF2
TML	0X23E				;0X597	; Transfer and Mark Long
LBL	0X002				;0X599	; Load B Long
LDI	0X8				;0X59B	; Load Accumulator Immediate
IOL	0X41				;0X59C	; Input/Output Long
LBL	0X004				;0X59E	; Load B Long
LDI	0X0				;0X5A0	; Load Accumulator Immediate
IOL	0X41				;0X5A1	; Input/Output Long
IOL	0X41				;0X5A3	; Input/Output Long
SKF2				;0X5A5	; Skip if FF2 Equals 1
RTN					;0X5A6	; Return
LBL	0X029				;0X5A7	; Load B Long
EXD	0					;0X5A9	; Exchange Accumulator and Memory and decrement BL
XAX					;0X5AA	; Exchange Accumulator and X
EX	0					;0X5AB	; Exchange Accumulator and Memory
XAX					;0X5AC	; Exchange Accumulator and X
XBMX				;0X5AD	; Exchange BM and X
TL	0X57B				;0X5AE	; Transfer Long
SKC					;0X5B0	; Skip on Carry flip-flop
LDI	0X8				;0X5B1	; Load Accumulator Immediate
LDI	0X0				;0X5B2	; Load Accumulator Immediate
LBL	0X001				;0X5B3	; Load B Long
IOL	0X41				;0X5B5	; Input/Output Long
LBL	0X003				;0X5B7	; Load B Long
LDI	0X0				;0X5B9	; Load Accumulator Immediate
IOL	0X41				;0X5BA	; Input/Output Long
IOL	0X41				;0X5BC	; Input/Output Long
RTN					;0X5BE	; Return
SETB 	0X00				;0X5C0	; Load B Long
EX	0					;0X5C0	; Exchange Accumulator and Memory
LBL	0X004				;0X5C1	; Load B Long
LDI	0X1				;0X5C3	; Load Accumulator Immediate
EXD	0					;0X5C4	; Exchange Accumulator and Memory and decrement BL
LD	0X0				;0X5C5	; Load Accumulator from Memory
LXA					;0X5C6	; Load X Register from Accumulator
DECB					;0X5C7	; Decrement BL
LD	0X0				;0X5C8	; Load Accumulator from Memory
XAX					;0X5C9	; Exchange Accumulator and X
XBMX				;0X5CA	; Exchange BM and X
XABL					;0X5CB	; Exchange Accumulator and BL
LD	0X0				;0X5CC	; Load Accumulator from Memory
LBL	0X004				;0X5CD	; Load B Long
AND					;0X5CF	; Logical AND
SKZ					;0X5D0	; Skip on Accumulator Zero
LDI	0X0				;0X5D1	; Load Accumulator Immediate
LDI	0X8				;0X5D2	; Load Accumulator Immediate
LBL	0X001				;0X5D3	; Load B Long
IOL	0X41				;0X5D5	; Input/Output Long
INCB					;0X5D7	; Increment BL
LDI	0X0				;0X5D8	; Load Accumulator Immediate
IOL	0X41				;0X5D9	; Input/Output Long
INCB					;0X5DB	; Increment BL
LDI	0X0				;0X5DC	; Load Accumulator Immediate
IOL	0X41				;0X5DD	; Input/Output Long
IOL	0X41				;0X5DF	; Input/Output Long
DECB					;0X5E1	; Decrement BL
LDI	0X8				;0X5E2	; Load Accumulator Immediate
IOL	0X41				;0X5E3	; Input/Output Long
LBL	0X004				;0X5E5	; Load B Long
LDI	0X0				;0X5E7	; Load Accumulator Immediate
IOL	0X41				;0X5E8	; Input/Output Long
IOL	0X41				;0X5EA	; Input/Output Long
LD	0X0				;0X5EC	; Load Accumulator from Memory
ADSK				;0X5ED	; Add and skip on carry-out
T	0X5C4				;0X5EE	; Transfer
EXD	0					;0X5EF	; Exchange Accumulator and Memory and decrement BL
LDI	0X1				;0X5F0	; Load Accumulator Immediate
ADSK				;0X5F1	; Add and skip on carry-out
T	0X5C0				;0X5F2	; Transfer
EXD	0					;0X5F3	; Exchange Accumulator and Memory and decrement BL
LDI	0X1				;0X5F4	; Load Accumulator Immediate
ADSK				;0X5F5	; Add and skip on carry-out
T	0X5C0				;0X5F6	; Transfer
LBL	0X005				;0X5F7	; Load B Long
LDI	0X8				;0X5F9	; Load Accumulator Immediate
IOL	0X41				;0X5FA	; Input/Output Long
TL	0X3C0				;0X5FC	; Transfer Long
LBL	0X0FF				;0X5FE	; Load B Long
SKF1				;0X600	; Skip if FF1 Equals 1
T	0X61C				;0X601	; Transfer
LBL	0X048				;0X602	; Load B Long
LDI	0X8				;0X604	; Load Accumulator Immediate
OR					;0X605	; Logical OR
ADI	0X4				;0X606	; Add Immediate and skip on carry-out
T	0X61C				;0X607	; Transfer
LBL	0X0B9				;0X608	; Load B Long
LDI	0X8				;0X60A	; Load Accumulator Immediate
OR					;0X60B	; Logical OR
ADI	0X2				;0X60C	; Add Immediate and skip on carry-out
T	0X61C				;0X60D	; Transfer
T	0X61B				;0X60E	; Transfer
LBL	0X079				;0X60F	; Load B Long
LD	0X0				;0X611	; Load Accumulator from Memory
LXA					;0X612	; Load X Register from Accumulator
T	0X624				;0X613	; Transfer
SKF2				;0X614	; Skip if FF2 Equals 1
T	0X600				;0X615	; Transfer
LBL	0X0E9				;0X616	; Load B Long
LDI	0X2				;0X618	; Load Accumulator Immediate
AND					;0X619	; Logical AND
SKZ					;0X61A	; Skip on Accumulator Zero
LDI	0X6				;0X61B	; Load Accumulator Immediate
LDI	0X4				;0X61C	; Load Accumulator Immediate
LXA					;0X61D	; Load X Register from Accumulator
LBL	0X0E9				;0X61E	; Load B Long
LDI	0X1				;0X620	; Load Accumulator Immediate
AND					;0X621	; Logical AND
SKZ					;0X622	; Skip on Accumulator Zero
T	0X60F				;0X623	; Transfer
LBMX				;0X624	; Load BM with X
LDI	0XF				;0X625	; Load Accumulator Immediate
XABL					;0X626	; Exchange Accumulator and BL
IOL	0XFB				;0X627	; Input/Output Long
IOL	0XF7				;0X629	; Input/Output Long
LD	0X1				;0X62B	; Load Accumulator from Memory
IOL	0XFE				;0X62C	; Input/Output Long
LD	0X1				;0X62E	; Load Accumulator from Memory
IOL	0XFD				;0X62F	; Input/Output Long
DECB					;0X631	; Decrement BL
T	0X635				;0X632	; Transfer
TL	0X655				;0X633	; Transfer Long
LAX					;0X635	; Load Accumulator from X Register
ADI	0X8				;0X636	; Add Immediate and skip on carry-out
ADI	0X4				;0X637	; Add Immediate and skip on carry-out
T	0X62B				;0X638	; Transfer
SKBI	0XA					;0X639	; Skip if BL equals to Immediate.
T	0X63D				;0X63A	; Transfer
TL	0X642				;0X63B	; Transfer Long
SKBI	0X2					;0X63D	; Skip if BL equals to Immediate.
T	0X62B				;0X63E	; Transfer
T	0X63B				;0X63F	; Transfer
TL	0X62B				;0X640	; Transfer Long
LDI	0X4				;0X642	; Load Accumulator Immediate
SAG					;0X643	; Special Address Generation
AD					;0X644	; Add
SAG					;0X645	; Special Address Generation
EX	0					;0X646	; Exchange Accumulator and Memory
ADI	0X8				;0X647	; Add Immediate and skip on carry-out
T	0X640				;0X648	; Transfer
LDI	0X5				;0X649	; Load Accumulator Immediate
AND					;0X64A	; Logical AND
IOL	0XFE				;0X64B	; Input/Output Long
LD	0X1				;0X64D	; Load Accumulator from Memory
LDI	0X5				;0X64E	; Load Accumulator Immediate
AND					;0X64F	; Logical AND
IOL	0XFD				;0X650	; Input/Output Long
LD	0X1				;0X652	; Load Accumulator from Memory
TL	0X631				;0X653	; Transfer Long
IOL	0XF3				;0X655	; Input/Output Long
LBL	0X0A9				;0X657	; Load B Long
LD	0X0				;0X659	; Load Accumulator from Memory
SKZ					;0X65A	; Skip on Accumulator Zero
T	0X66E				;0X65B	; Transfer
LDI	0XA				;0X65C	; Load Accumulator Immediate
EX	0					;0X65D	; Exchange Accumulator and Memory
SKF2				;0X65E	; Skip if FF2 Equals 1
SKF1				;0X65F	; Skip if FF1 Equals 1
T	0X663				;0X660	; Transfer
LBL	0X030				;0X661	; Load B Long
LBL	0X038				;0X663	; Load B Long
RC					;0X665	; Reset Carry flip-flop
LDI	0X7				;0X666	; Load Accumulator Immediate
ADSK				;0X667	; Add and skip on carry-out
DC					;0X668	; Decimal Correction
EX	0					;0X669	; Exchange Accumulator and Memory
SKC					;0X66A	; Skip on Carry flip-flop
T	0X66E				;0X66B	; Transfer
INCB					;0X66C	; Increment BL
T	0X670				;0X66D	; Transfer
TL	0X00B				;0X66E	; Transfer Long
SKBI	0X8					;0X670	; Skip if BL equals to Immediate.
T	0X665				;0X671	; Transfer
T	0X66E				;0X672	; Transfer
LD	0X0				;0X673	; Load Accumulator from Memory
TL	0X682				;0X674	; Transfer Long
LBL	0X0A9				;0X676	; Load B Long
LDI	0X1				;0X678	; Load Accumulator Immediate
AND					;0X679	; Logical AND
LBL	0X017				;0X67A	; Load B Long
SKZ					;0X67C	; Skip on Accumulator Zero
T	0X673				;0X67D	; Transfer
TL	0X680				;0X67E	; Transfer Long
LDI	0X8				;0X680	; Load Accumulator Immediate
AND					;0X681	; Logical AND
IOL	0XD5				;0X682	; Input/Output Long
DECB					;0X684	; Decrement BL
LD	0X0				;0X685	; Load Accumulator from Memory
IOL	0XD4				;0X686	; Input/Output Long
DECB					;0X688	; Decrement BL
LD	0X1				;0X689	; Load Accumulator from Memory
COMP				;0X68A	; Complement
EX	1					;0X68B	; Exchange Accumulator and Memory
EXD	0					;0X68C	; Exchange Accumulator and Memory and decrement BL
T	0X689				;0X68D	; Transfer
LBL	0X005				;0X68E	; Load B Long
LDI	0X0				;0X690	; Load Accumulator Immediate
LXA					;0X691	; Load X Register from Accumulator
T	0X697				;0X692	; Transfer
XABL					;0X693	; Exchange Accumulator and BL
XAX					;0X694	; Exchange Accumulator and X
XABL					;0X695	; Exchange Accumulator and BL
DECB					;0X696	; Decrement BL
LDI	0X1				;0X697	; Load Accumulator Immediate
AND					;0X698	; Logical AND
XAX					;0X699	; Exchange Accumulator and X
XABL					;0X69A	; Exchange Accumulator and BL
XAX					;0X69B	; Exchange Accumulator and X
ADI	0X7				;0X69C	; Add Immediate and skip on carry-out
IOL	0X21				;0X69D	; Input/Output Long
INCB					;0X69F	; Increment BL
XABL					;0X6A0	; Exchange Accumulator and BL
XAX					;0X6A1	; Exchange Accumulator and X
XABL					;0X6A2	; Exchange Accumulator and BL
LDI	0X2				;0X6A3	; Load Accumulator Immediate
AND					;0X6A4	; Logical AND
XAX					;0X6A5	; Exchange Accumulator and X
XABL					;0X6A6	; Exchange Accumulator and BL
XAX					;0X6A7	; Exchange Accumulator and X
ADI	0X6				;0X6A8	; Add Immediate and skip on carry-out
IOL	0X21				;0X6A9	; Input/Output Long
INCB					;0X6AB	; Increment BL
XABL					;0X6AC	; Exchange Accumulator and BL
XAX					;0X6AD	; Exchange Accumulator and X
XABL					;0X6AE	; Exchange Accumulator and BL
LDI	0X4				;0X6AF	; Load Accumulator Immediate
AND					;0X6B0	; Logical AND
XAX					;0X6B1	; Exchange Accumulator and X
XABL					;0X6B2	; Exchange Accumulator and BL
XAX					;0X6B3	; Exchange Accumulator and X
ADI	0X4				;0X6B4	; Add Immediate and skip on carry-out
IOL	0X21				;0X6B5	; Input/Output Long
INCB					;0X6B7	; Increment BL
XABL					;0X6B8	; Exchange Accumulator and BL
XAX					;0X6B9	; Exchange Accumulator and X
XABL					;0X6BA	; Exchange Accumulator and BL
LD	0X0				;0X6BB	; Load Accumulator from Memory
XAX					;0X6BC	; Exchange Accumulator and X
XABL					;0X6BD	; Exchange Accumulator and BL
TL	0X2C0				;0X6BE	; Transfer Long
LBL	0X000				;0X6C0	; Load B Long
LDI	0XF				;0X6C2	; Load Accumulator Immediate
IOL	0X21				;0X6C3	; Input/Output Long
LDI	0XF				;0X6C5	; Load Accumulator Immediate
IOL	0X41				;0X6C6	; Input/Output Long
INCB					;0X6C8	; Increment BL
T	0X6C2				;0X6C9	; Transfer
LDI	0X0				;0X6CA	; Load Accumulator Immediate
LXA					;0X6CB	; Load X Register from Accumulator
IOL	0XFB				;0X6CC	; Input/Output Long
IOL	0XF7				;0X6CE	; Input/Output Long
LAX					;0X6D0	; Load Accumulator from X Register
IOL	0XFE				;0X6D1	; Input/Output Long
LAX					;0X6D3	; Load Accumulator from X Register
IOL	0XFD				;0X6D4	; Input/Output Long
INCB					;0X6D6	; Increment BL
T	0X6D0				;0X6D7	; Transfer
IOL	0XF3				;0X6D8	; Input/Output Long
TML	0X1D2				;0X6DA	; Transfer and Mark Long
INCB					;0X6DC	; Increment BL
T	0X6DA				;0X6DD	; Transfer
LAX					;0X6DE	; Load Accumulator from X Register
ADI	0X1				;0X6DF	; Add Immediate and skip on carry-out
T	0X6CB				;0X6E0	; Transfer
LDI	0X0				;0X6E1	; Load Accumulator Immediate
TML	0X36A				;0X6E2	; Transfer and Mark Long
LDI	0X0				;0X6E4	; Load Accumulator Immediate
LXA					;0X6E5	; Load X Register from Accumulator
XBMX				;0X6E6	; Exchange BM and X
LDI	0XF				;0X6E7	; Load Accumulator Immediate
LXA					;0X6E8	; Load X Register from Accumulator
EX	0					;0X6E9	; Exchange Accumulator and Memory
LAX					;0X6EA	; Load Accumulator from X Register
EOR					;0X6EB	; Logical Exclusive-OR
SKZ					;0X6EC	; Skip on Accumulator Zero
T	0X6F9				;0X6ED	; Transfer
LAX					;0X6EE	; Load Accumulator from X Register
ADI	0XF				;0X6EF	; Add Immediate and skip on carry-out
T	0X6F2				;0X6F0	; Transfer
T	0X6E8				;0X6F1	; Transfer
INCB					;0X6F2	; Increment BL
T	0X6E7				;0X6F3	; Transfer
XBMX				;0X6F4	; Exchange BM and X
LAX					;0X6F5	; Load Accumulator from X Register
ADI	0X1				;0X6F6	; Add Immediate and skip on carry-out
T	0X6E5				;0X6F7	; Transfer
T	0X6FA				;0X6F8	; Transfer
SF2					;0X6F9	; Set FF2
LDI	0X9				;0X6FA	; Load Accumulator Immediate
TML	0X36A				;0X6FB	; Transfer and Mark Long
TL	0X700				;0X6FD	; Transfer Long
SETB 	0X00				;0X700	; Load B Long
TML	0X36C				;0X700	; Transfer and Mark Long
IOL	0XD0				;0X702	; Input/Output Long
IOL	0XD8				;0X704	; Input/Output Long
TML	0X1EE				;0X706	; Transfer and Mark Long
T	0X702				;0X708	; Transfer
IOL	0XD1				;0X709	; Input/Output Long
IOL	0XD9				;0X70B	; Input/Output Long
TML	0X1EE				;0X70D	; Transfer and Mark Long
T	0X709				;0X70F	; Transfer
IOL	0XD2				;0X710	; Input/Output Long
IOL	0XDA				;0X712	; Input/Output Long
TML	0X1EE				;0X714	; Transfer and Mark Long
T	0X710				;0X716	; Transfer
IOL	0XD3				;0X717	; Input/Output Long
IOL	0XDF				;0X719	; Input/Output Long
TML	0X1EE				;0X71B	; Transfer and Mark Long
T	0X717				;0X71D	; Transfer
IOL	0XD4				;0X71E	; Input/Output Long
IOL	0XDC				;0X720	; Input/Output Long
TML	0X1FB				;0X722	; Transfer and Mark Long
T	0X71E				;0X724	; Transfer
IOL	0XD5				;0X725	; Input/Output Long
IOL	0XDD				;0X727	; Input/Output Long
TML	0X1FB				;0X729	; Transfer and Mark Long
T	0X725				;0X72B	; Transfer
LDI	0X0				;0X72C	; Load Accumulator Immediate
IOL	0XD5				;0X72D	; Input/Output Long
LBL	0X000				;0X72F	; Load B Long
LDI	0X8				;0X731	; Load Accumulator Immediate
TML	0X36A				;0X732	; Transfer and Mark Long
RC					;0X734	; Reset Carry flip-flop
T	0X737				;0X735	; Transfer
SC					;0X736	; Set Carry flip-flop
SF1					;0X737	; Set FF1
LDI	0XF				;0X738	; Load Accumulator Immediate
IOL	0X20				;0X739	; Input/Output Long
LDI	0XF				;0X73B	; Load Accumulator Immediate
IOL	0X40				;0X73C	; Input/Output Long
TL	0X744				;0X73E	; Transfer Long
TL	0X736				;0X740	; Transfer Long
SF1					;0X742	; Set FF1
T	0X75E				;0X743	; Transfer
SKF1				;0X744	; Skip if FF1 Equals 1
LDI	0X8				;0X745	; Load Accumulator Immediate
LDI	0X4				;0X746	; Load Accumulator Immediate
LXA					;0X747	; Load X Register from Accumulator
XBMX				;0X748	; Exchange BM and X
SKC					;0X749	; Skip on Carry flip-flop
T	0X74E				;0X74A	; Transfer
IOL	0X21				;0X74B	; Input/Output Long
T	0X750				;0X74D	; Transfer
IOL	0X41				;0X74E	; Input/Output Long
SKF1				;0X750	; Skip if FF1 Equals 1
ADI	0X9				;0X751	; Add Immediate and skip on carry-out
ADI	0X9				;0X752	; Add Immediate and skip on carry-out
T	0X742				;0X753	; Transfer
INCB					;0X754	; Increment BL
T	0X744				;0X755	; Transfer
SKF1				;0X756	; Skip if FF1 Equals 1
T	0X75A				;0X757	; Transfer
RF1					;0X758	; Reset FF1
T	0X744				;0X759	; Transfer
SKC					;0X75A	; Skip on Carry flip-flop
T	0X740				;0X75B	; Transfer
LBL	0X000				;0X75C	; Load B Long
SKC					;0X75E	; Skip on Carry flip-flop
LDI	0X1				;0X75F	; Load Accumulator Immediate
LDI	0X2				;0X760	; Load Accumulator Immediate
TML	0X36A				;0X761	; Transfer and Mark Long
LDI	0XF				;0X763	; Load Accumulator Immediate
IOL	0XD3				;0X764	; Input/Output Long
TML	0X1D2				;0X766	; Transfer and Mark Long
LDI	0X0				;0X768	; Load Accumulator Immediate
IOL	0XD3				;0X769	; Input/Output Long
TL	0X7C0				;0X76B	; Transfer Long
XAX					;0X76D	; Exchange Accumulator and X
XBMX				;0X76E	; Exchange BM and X
SF2					;0X76F	; Set FF2
TL	0X732				;0X770	; Transfer Long
EOR					;0X772	; Logical Exclusive-OR
SKZ					;0X773	; Skip on Accumulator Zero
T	0X76D				;0X774	; Transfer
INCB					;0X775	; Increment BL
T	0X77C				;0X776	; Transfer
T	0X77C				;0X777	; Transfer
LDI	0X3				;0X778	; Load Accumulator Immediate
LXA					;0X779	; Load X Register from Accumulator
LBL	0X001				;0X77A	; Load B Long
LABL				;0X77C	; Load Accumulator with BL
EX	0					;0X77D	; Exchange Accumulator and Memory
TL	0X780				;0X77E	; Transfer Long
TML	0X1D2				;0X780	; Transfer and Mark Long
TML	0X1D2				;0X782	; Transfer and Mark Long
TML	0X1D2				;0X784	; Transfer and Mark Long
LD	0X0				;0X786	; Load Accumulator from Memory
SKBI	0X0					;0X787	; Skip if BL equals to Immediate.
RTN					;0X788	; Return
XAX					;0X789	; Exchange Accumulator and X
ADI	0X1				;0X78A	; Add Immediate and skip on carry-out
XAX					;0X78B	; Exchange Accumulator and X
RTNSK				;0X78C	; Return and Skip
LXA					;0X78D	; Load X Register from Accumulator
IOL	0XFB				;0X78E	; Input/Output Long
LAX					;0X790	; Load Accumulator from X Register
IOL	0XFE				;0X791	; Input/Output Long
IOL	0XFE				;0X793	; Input/Output Long
XBMX				;0X795	; Exchange BM and X
LAX					;0X796	; Load Accumulator from X Register
IOL	0XFE				;0X797	; Input/Output Long
IOL	0XFE				;0X799	; Input/Output Long
LABL				;0X79B	; Load Accumulator with BL
IOL	0XFE				;0X79C	; Input/Output Long
XBMX				;0X79E	; Exchange BM and X
LDI	0X5				;0X79F	; Load Accumulator Immediate
XABL					;0X7A0	; Exchange Accumulator and BL
LDI	0XF				;0X7A1	; Load Accumulator Immediate
IOL	0XFE				;0X7A2	; Input/Output Long
INCB					;0X7A4	; Increment BL
T	0X7A2				;0X7A5	; Transfer
IOL	0XF3				;0X7A6	; Input/Output Long
TML	0X1D2				;0X7A8	; Transfer and Mark Long
INCB					;0X7AA	; Increment BL
T	0X7A8				;0X7AB	; Transfer
SKF1				;0X7AC	; Skip if FF1 Equals 1
T	0X7B0				;0X7AD	; Transfer
RF1					;0X7AE	; Reset FF1
T	0X7A8				;0X7AF	; Transfer
IOL	0XFB				;0X7B0	; Input/Output Long
TML	0X1D2				;0X7B2	; Transfer and Mark Long
INCB					;0X7B4	; Increment BL
T	0X7B2				;0X7B5	; Transfer
SKF2				;0X7B6	; Skip if FF2 Equals 1
RTN					;0X7B7	; Return
T	0X7A6				;0X7B8	; Transfer
SF1					;0X7B9	; Set FF1
XABL					;0X7BA	; Exchange Accumulator and BL
LAX					;0X7BB	; Load Accumulator from X Register
TML	0X36A				;0X7BC	; Transfer and Mark Long
TL	0X7D1				;0X7BE	; Transfer Long
TML	0X36E				;0X7C0	; Transfer and Mark Long
LDI	0XD				;0X7C2	; Load Accumulator Immediate
ADSK				;0X7C3	; Add and skip on carry-out
T	0X7DB				;0X7C4	; Transfer
LXA					;0X7C5	; Load X Register from Accumulator
IOL	0XD6				;0X7C6	; Input/Output Long
TML	0X36E				;0X7C8	; Transfer and Mark Long
LAX					;0X7CA	; Load Accumulator from X Register
IOL	0XDB				;0X7CB	; Input/Output Long
LDI	0X1				;0X7CD	; Load Accumulator Immediate
EOR					;0X7CE	; Logical Exclusive-OR
SKZ					;0X7CF	; Skip on Accumulator Zero
T	0X7E0				;0X7D0	; Transfer
LAX					;0X7D1	; Load Accumulator from X Register
ADI	0X1				;0X7D2	; Add Immediate and skip on carry-out
T	0X7C5				;0X7D3	; Transfer
LBL	0X000				;0X7D4	; Load B Long
LDI	0X3				;0X7D6	; Load Accumulator Immediate
TML	0X36A				;0X7D7	; Transfer and Mark Long
TL	0X510				;0X7D9	; Transfer Long
SF2					;0X7DB	; Set FF2
LD	0X0				;0X7DC	; Load Accumulator from Memory
SKZ					;0X7DD	; Skip on Accumulator Zero
T	0X7E5				;0X7DE	; Transfer
T	0X7E6				;0X7DF	; Transfer
LD	0X0				;0X7E0	; Load Accumulator from Memory
SKZ					;0X7E1	; Skip on Accumulator Zero
T	0X7E7				;0X7E2	; Transfer
SF2					;0X7E3	; Set FF2
LDI	0X4				;0X7E4	; Load Accumulator Immediate
LDI	0X5				;0X7E5	; Load Accumulator Immediate
LDI	0X6				;0X7E6	; Load Accumulator Immediate
LDI	0X7				;0X7E7	; Load Accumulator Immediate
TL	0X7B9				;0X7E8	; Transfer Long
LAX					;0X7EA	; Load Accumulator from X Register
XABL					;0X7EB	; Exchange Accumulator and BL
LDI	0X8				;0X7EC	; Load Accumulator Immediate
LXA					;0X7ED	; Load X Register from Accumulator
LDI	0XA				;0X7EE	; Load Accumulator Immediate
DOA					;0X7EF	; Discrete Output
TML	0X1D2				;0X7F0	; Transfer and Mark Long
DIA					;0X7F2	; Discrete Input Group A
EX	0					;0X7F3	; Exchange Accumulator and Memory
EOR					;0X7F4	; Logical Exclusive-OR
SKZ					;0X7F5	; Skip on Accumulator Zero
T	0X7EC				;0X7F6	; Transfer
LAX					;0X7F7	; Load Accumulator from X Register
ADI	0X1				;0X7F8	; Add Immediate and skip on carry-out
T	0X7ED				;0X7F9	; Transfer
LABL				;0X7FA	; Load Accumulator with BL
XAX					;0X7FB	; Exchange Accumulator and X
LDI	0X3				;0X7FC	; Load Accumulator Immediate
AND					;0X7FD	; Logical AND
EX	0					;0X7FE	; Exchange Accumulator and Memory
RTN					;0X7FF	; Return
LB	(0XC7)	(B<=0X0E0)				;0X800	; Load B Indirect
TM	(0XDC)	(@<=0X149)				;0X801	; Transfer and Mark Indirect
SF2					;0X802	; Set FF2
LB	(0XC0)	(B<=0X048)				;0X803	; Load B Indirect
LDI	0X7				;0X804	; Load Accumulator Immediate
AND					;0X805	; Logical AND
ADI	0XB				;0X806	; Add Immediate and skip on carry-out
T	0X80A				;0X807	; Transfer
TL	0X2D0				;0X808	; Transfer Long
LB	(0XCF)	(B<=0X017)				;0X80A	; Load B Indirect
LDI	0X8				;0X80B	; Load Accumulator Immediate
LDI	0X0				;0X80C	; Load Accumulator Immediate
EXD	0					;0X80D	; Exchange Accumulator and Memory and decrement BL
T	0X80C				;0X80E	; Transfer
LDI	0X8				;0X80F	; Load Accumulator Immediate
IOL	0XD5				;0X810	; Input/Output Long
TML	0X103				;0X812	; Transfer and Mark Long
LDI	0X3				;0X814	; Load Accumulator Immediate
IOL	0XD0				;0X815	; Input/Output Long
TML	0X1D2				;0X817	; Transfer and Mark Long
TL	0X2F4				;0X819	; Transfer Long
RF1					;0X81B	; Reset FF1
LBL	0X013				;0X81C	; Load B Long
LDI	0XC				;0X81E	; Load Accumulator Immediate
TML	0X195				;0X81F	; Transfer and Mark Long
T	0X831				;0X821	; Transfer
TM	(0XF6)	(@<=0X193)				;0X822	; Transfer and Mark Indirect
TM	(0XD7)	(@<=0X15C)				;0X823	; Transfer and Mark Indirect
SKF1				;0X824	; Skip if FF1 Equals 1
T	0X82C				;0X825	; Transfer
T	0X832				;0X826	; Transfer
LDI	0X8				;0X827	; Load Accumulator Immediate
LDI	0X4				;0X828	; Load Accumulator Immediate
LB	(0XC6)	(B<=0X015)				;0X829	; Load B Indirect
AND					;0X82A	; Logical AND
SKZ					;0X82B	; Skip on Accumulator Zero
TM	(0XFB)	(@<=0X1AC)				;0X82C	; Transfer and Mark Indirect
T	0X833				;0X82D	; Transfer
LBL	0X014				;0X82E	; Load B Long
TM	(0XF7)	(@<=0X194)				;0X830	; Transfer and Mark Indirect
LDI	0X5				;0X831	; Load Accumulator Immediate
LDI	0X7				;0X832	; Load Accumulator Immediate
LDI	0X6				;0X833	; Load Accumulator Immediate
LDI	0X0				;0X834	; Load Accumulator Immediate
SF1					;0X835	; Set FF1
TL	0X84E				;0X836	; Transfer Long
LBL	0X014				;0X838	; Load B Long
TM	(0XD9)	(@<=0X141)				;0X83A	; Transfer and Mark Indirect
T	0X831				;0X83B	; Transfer
SF1					;0X83C	; Set FF1
RF2					;0X83D	; Reset FF2
TL	0X4C2				;0X83E	; Transfer Long
LB	(0XCE)	(B<=0X016)				;0X840	; Load B Indirect
TM	(0XD6)	(@<=0X17B)				;0X841	; Transfer and Mark Indirect
T	0X844				;0X842	; Transfer
T	0X84D				;0X843	; Transfer
LBL	0X014				;0X844	; Load B Long
TM	(0XF5)	(@<=0X192)				;0X846	; Transfer and Mark Indirect
LDI	0X3				;0X847	; Load Accumulator Immediate
LDI	0XF				;0X848	; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				;0X849	; Transfer and Mark Indirect
TML	0X103				;0X84A	; Transfer and Mark Long
T	0X840				;0X84C	; Transfer
LDI	0X6				;0X84D	; Load Accumulator Immediate
TM	(0XF9)	(@<=0X1B5)				;0X84E	; Transfer and Mark Indirect
LB	(0XC7)	(B<=0X0E0)				;0X84F	; Load B Indirect
TM	(0XDC)	(@<=0X149)				;0X850	; Transfer and Mark Indirect
TM	(0XF8)	(@<=0X199)				;0X851	; Transfer and Mark Indirect
T	0X855				;0X852	; Transfer
TL	0X10E				;0X853	; Transfer Long
LDI	0X8				;0X855	; Load Accumulator Immediate
IOL	0XD5				;0X856	; Input/Output Long
LDI	0XC				;0X858	; Load Accumulator Immediate
IOL	0XD0				;0X859	; Input/Output Long
T	0X853				;0X85B	; Transfer
LDI	0X9				;0X85C	; Load Accumulator Immediate
LDI	0X8				;0X85D	; Load Accumulator Immediate
IOL	0XD6				;0X85E	; Input/Output Long
LB	(0XCE)	(B<=0X016)				;0X860	; Load B Indirect
TM	(0XD2)	(@<=0X122)				;0X861	; Transfer and Mark Indirect
T	0X865				;0X862	; Transfer
LDI	0XA				;0X863	; Load Accumulator Immediate
EX	0					;0X864	; Exchange Accumulator and Memory
LDI	0X1				;0X865	; Load Accumulator Immediate
LDI	0X5				;0X866	; Load Accumulator Immediate
TL	0X835				;0X867	; Transfer Long
OR					;0X869	; Logical OR
EX	0					;0X86A	; Exchange Accumulator and Memory
SKZ					;0X86B	; Skip on Accumulator Zero
TM	(0XDB)	(@<=0X143)				;0X86C	; Transfer and Mark Indirect
T	0X853				;0X86D	; Transfer
LBL	0X013				;0X86E	; Load B Long
LDI	0XC				;0X870	; Load Accumulator Immediate
TML	0X195				;0X871	; Transfer and Mark Long
T	0X877				;0X873	; Transfer
SKF1				;0X874	; Skip if FF1 Equals 1
LDI	0X3				;0X875	; Load Accumulator Immediate
LDI	0XC				;0X876	; Load Accumulator Immediate
EOR					;0X877	; Logical Exclusive-OR
EX	0					;0X878	; Exchange Accumulator and Memory
SKBI	0X3					;0X879	; Skip if BL equals to Immediate.
T	0X86E				;0X87A	; Transfer
SKF1				;0X87B	; Skip if FF1 Equals 1
T	0X866				;0X87C	; Transfer
RF1					;0X87D	; Reset FF1
LDI	0X3				;0X87E	; Load Accumulator Immediate
T	0X871				;0X87F	; Transfer
TL	0X456				;0X880	; Transfer Long
T	0X883				;0X882	; Transfer
LDI	0X1				;0X883	; Load Accumulator Immediate
LDI	0X2				;0X884	; Load Accumulator Immediate
LB	(0XC6)	(B<=0X015)				;0X885	; Load B Indirect
TL	0X869				;0X886	; Transfer Long
TL	0X8DB				;0X888	; Transfer Long
TL	0X8DB				;0X88A	; Transfer Long
TL	0X85D				;0X88C	; Transfer Long
TL	0X827				;0X88E	; Transfer Long
TL	0X8EF				;0X890	; Transfer Long
TL	0X8C7				;0X892	; Transfer Long
TL	0X8C8				;0X894	; Transfer Long
TL	0X82E				;0X896	; Transfer Long
TL	0X8DE				;0X898	; Transfer Long
TL	0X8DE				;0X89A	; Transfer Long
TL	0X85C				;0X89C	; Transfer Long
TL	0X828				;0X89E	; Transfer Long
TL	0X840				;0X8A0	; Transfer Long
TL	0X834				;0X8A2	; Transfer Long
TL	0X81B				;0X8A4	; Transfer Long
TL	0X81C				;0X8A6	; Transfer Long
TL	0X8E4				;0X8A8	; Transfer Long
TL	0X8E4				;0X8AA	; Transfer Long
TL	0X83C				;0X8AC	; Transfer Long
LDI	0X1				;0X8AE	; Load Accumulator Immediate
LDI	0X2				;0X8AF	; Load Accumulator Immediate
TL	0X8CB				;0X8B0	; Transfer Long
LB	(0XC6)	(B<=0X015)				;0X8B2	; Load B Indirect
TL	0X870				;0X8B3	; Transfer Long
RTN					;0X8B5	; Return
TL	0X82D				;0X8B6	; Transfer Long
TL	0X8E1				;0X8B8	; Transfer Long
TL	0X8E1				;0X8BA	; Transfer Long
TL	0X838				;0X8BC	; Transfer Long
T	0X8AF				;0X8BE	; Transfer
RTN					;0X8BF	; Return
LDI	0X0				;0X8C0	; Load Accumulator Immediate
IOL	0X41				;0X8C1	; Input/Output Long
INCB					;0X8C3	; Increment BL
T	0X8C0				;0X8C4	; Transfer
TL	0X2DB				;0X8C5	; Transfer Long
LDI	0X1				;0X8C7	; Load Accumulator Immediate
LDI	0X2				;0X8C8	; Load Accumulator Immediate
LBL	0X013				;0X8C9	; Load B Long
LB	(0XC6)	(B<=0X015)				;0X8CB	; Load B Indirect
AND					;0X8CC	; Logical AND
SKZ					;0X8CD	; Skip on Accumulator Zero
TM	(0XFF)	(@<=0X1AE)				;0X8CE	; Transfer and Mark Indirect
T	0X8F4				;0X8CF	; Transfer
LBL	0X0E5				;0X8D0	; Load B Long
AND					;0X8D2	; Logical AND
DECB					;0X8D3	; Decrement BL
AND					;0X8D4	; Logical AND
LBL	0X014				;0X8D5	; Load B Long
SKZ					;0X8D7	; Skip on Accumulator Zero
RTN					;0X8D8	; Return
RF1					;0X8D9	; Reset FF1
RTN					;0X8DA	; Return
LDI	0X1				;0X8DB	; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				;0X8DC	; Transfer and Mark Indirect
TM	(0XD9)	(@<=0X141)				;0X8DD	; Transfer and Mark Indirect
LDI	0X2				;0X8DE	; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				;0X8DF	; Transfer and Mark Indirect
TM	(0XDA)	(@<=0X142)				;0X8E0	; Transfer and Mark Indirect
LDI	0X8				;0X8E1	; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				;0X8E2	; Transfer and Mark Indirect
TM	(0XDB)	(@<=0X143)				;0X8E3	; Transfer and Mark Indirect
LDI	0X4				;0X8E4	; Load Accumulator Immediate
TM	(0XFD)	(@<=0X1B9)				;0X8E5	; Transfer and Mark Indirect
DECB					;0X8E6	; Decrement BL
TM	(0XDC)	(@<=0X149)				;0X8E7	; Transfer and Mark Indirect
TM	(0XD9)	(@<=0X141)				;0X8E8	; Transfer and Mark Indirect
INCB					;0X8E9	; Increment BL
TM	(0XE7)	(@<=0X154)				;0X8EA	; Transfer and Mark Indirect
DECB					;0X8EB	; Decrement BL
TM	(0XDE)	(@<=0X14B)				;0X8EC	; Transfer and Mark Indirect
TM	(0XDB)	(@<=0X143)				;0X8ED	; Transfer and Mark Indirect
T	0X8F4				;0X8EE	; Transfer
LBL	0X014				;0X8EF	; Load B Long
TM	(0XF6)	(@<=0X193)				;0X8F1	; Transfer and Mark Indirect
T	0X8F6				;0X8F2	; Transfer
TM	(0XFF)	(@<=0X1AE)				;0X8F3	; Transfer and Mark Indirect
TL	0X833				;0X8F4	; Transfer Long
TL	0X832				;0X8F6	; Transfer Long
TL	0X011				;0X8F8	; Transfer Long
TL	0X84F				;0X8FA	; Transfer Long
LB	(0XC0)	(B<=0X048)				;0X8FC	; Load B Indirect
T	0X8C0				;0X8FD	; Transfer
TL	0X21E				;0X8FE	; Transfer Long
