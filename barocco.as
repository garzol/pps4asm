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


 ===
 first trace before the discovery at 193
001 000 00	00E 00	  should be 81 here... not normal
002 001 26	00E 00	  rst=0 rw=0 wio=0 bgt=0
003 002 25	0D9 00	  rst=0 rw=0 wio=0 bgt=0
004 003 51	0D9 00	  rst=0 rw=0 wio=0 bgt=0
005 004 87	0D9 00	  TL 187
006 187 00	0D9 00	  LBL 36
007 188 C9	0D9 00	  "
008 189 C0	036 00	  LB
009 0C0 5A	036 00	  2nd part of LB (fetch A5)
010 18A 00	036 00	  LBL 37
011 18B C8	036 00	  "
012 18C 7F	036 00	  LDI 0
013 18D 1E	036 00	  SKZ
014 18E C1	036 F0	  LB
015 18F 00	036 F0	  LBL 39
016 190 C6	036 F0	  "
017 191 7F	039 F0	  LDI 0 - There we have 39, previous instruction was skipped
018 192 1E	039 F0	  SKZ
019 193 00	039 F0	  here we expect LBL 4A to be skipped  (4A=/B5)
020 194 B5	039 F0	  instead of executing next inst it mistakenly TM 1B5, ahah
021 1B5 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
022 1B6 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
023 1B7 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
024 1B8 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
025 1B9 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
026 1BA 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
027 1BB 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
028 1BC 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
029 1BD 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
030 1BE 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
031 1BF 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
032 180 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
033 181 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
034 182 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
035 183 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
036 184 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
037 185 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
038 186 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
039 187 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
040 188 C9	0FF F0	  rst=0 rw=0 wio=0 bgt=0
041 189 C0	0FF F0	  rst=0 rw=0 wio=0 bgt=0
042 0C0 5A	0FF F0	  rst=0 rw=0 wio=0 bgt=0
043 18A 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
044 18B C8	0FF F0	  rst=0 rw=0 wio=0 bgt=0
045 18C 7F	0FF F0	  rst=0 rw=0 wio=0 bgt=0
046 18D 1E	0FF F0	  rst=0 rw=0 wio=0 bgt=0
047 18E C1	0FF F0	  rst=0 rw=0 wio=0 bgt=0
048 18F 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
049 190 C6	0FF F0	  rst=0 rw=0 wio=0 bgt=0
050 191 7F	039 F0	  rst=0 rw=0 wio=0 bgt=0
051 192 1E	039 F0	  rst=0 rw=0 wio=0 bgt=0
052 193 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
053 194 B5	039 F0	  rst=0 rw=0 wio=0 bgt=0
054 1B5 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
055 1B6 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
056 1B7 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
057 1B8 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
058 1B9 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
059 1BA 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
060 1BB 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
061 1BC 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
062 1BD 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
063 1BE 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
064 1BF 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
065 180 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
066 181 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
067 182 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
068 183 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
069 184 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
070 185 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
071 186 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
072 187 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
073 188 C9	0FF F0	  rst=0 rw=0 wio=0 bgt=0
074 189 C0	0FF F0	  rst=0 rw=0 wio=0 bgt=0
075 0C0 5A	0FF F0	  rst=0 rw=0 wio=0 bgt=0
076 18A 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
077 18B C8	0FF F0	  rst=0 rw=0 wio=0 bgt=0
078 18C 7F	0FF F0	  rst=0 rw=0 wio=0 bgt=0
079 18D 1E	0FF F0	  rst=0 rw=0 wio=0 bgt=0
080 18E C1	0FF F0	  rst=0 rw=0 wio=0 bgt=0
081 18F 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
082 190 C6	0FF F0	  rst=0 rw=0 wio=0 bgt=0
083 191 7F	039 F0	  rst=0 rw=0 wio=0 bgt=0
084 192 1E	039 F0	  rst=0 rw=0 wio=0 bgt=0
085 193 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
086 194 B5	039 F0	  rst=0 rw=0 wio=0 bgt=0
087 1B5 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
088 1B6 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
089 1B7 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
090 1B8 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
091 1B9 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
092 1BA 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
093 1BB 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
094 1BC 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
095 1BD 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
096 1BE 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
097 1BF 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
098 180 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
099 181 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
100 182 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
101 183 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
102 184 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
103 185 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
104 186 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
105 187 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
106 188 C9	0FF F0	  rst=0 rw=0 wio=0 bgt=0
107 189 C0	0FF F0	  rst=0 rw=0 wio=0 bgt=0
108 0C0 5A	0FF F0	  rst=0 rw=0 wio=0 bgt=0
109 18A 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
110 18B C8	0FF F0	  rst=0 rw=0 wio=0 bgt=0
111 18C 7F	0FF F0	  rst=0 rw=0 wio=0 bgt=0
112 18D 1E	0FF F0	  rst=0 rw=0 wio=0 bgt=0
113 18E C1	0FF F0	  rst=0 rw=0 wio=0 bgt=0
114 18F 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
115 190 C6	0FF F0	  rst=0 rw=0 wio=0 bgt=0
116 191 7F	039 F0	  rst=0 rw=0 wio=0 bgt=0
117 192 1E	039 F0	  rst=0 rw=0 wio=0 bgt=0
118 193 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
119 194 B5	039 F0	  rst=0 rw=0 wio=0 bgt=0
120 1B5 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
121 1B6 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
122 1B7 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
123 1B8 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
124 1B9 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
125 1BA 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
126 1BB 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
127 1BC 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
128 1BD 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
129 1BE 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
130 9C0 41	1EE F0	  rst=0 rw=1 wio=0 bgt=1
131 180 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
132 181 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
133 182 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
134 183 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
135 184 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
136 185 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
137 186 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
138 187 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
139 188 C9	0FF F0	  rst=0 rw=0 wio=0 bgt=0
140 189 C0	0FF F0	  rst=0 rw=0 wio=0 bgt=0
141 0C0 5A	0FF F0	  rst=0 rw=0 wio=0 bgt=0
142 18A 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
143 18B C8	0FF F0	  rst=0 rw=0 wio=0 bgt=0
144 18C 7F	0FF F0	  rst=0 rw=0 wio=0 bgt=0
145 18D 1E	0FF F0	  rst=0 rw=0 wio=0 bgt=0
146 18E C1	0FF F0	  rst=0 rw=0 wio=0 bgt=0
147 18F 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
148 190 C6	0FF F0	  rst=0 rw=0 wio=0 bgt=0
149 191 7F	039 F0	  rst=0 rw=0 wio=0 bgt=0
150 192 1E	039 F0	  rst=0 rw=0 wio=0 bgt=0
151 193 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
152 194 B5	039 F0	  rst=0 rw=0 wio=0 bgt=0
153 1B5 00	039 F0	  rst=1 rw=0 wio=0 bgt=0
154 000 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
155 001 26	039 F0	  rst=0 rw=0 wio=0 bgt=0
156 002 25	0D9 F0	  rst=0 rw=0 wio=0 bgt=0
157 003 51	0D9 F0	  rst=0 rw=0 wio=0 bgt=0
158 004 87	0D9 F0	  rst=0 rw=0 wio=0 bgt=0
159 187 00	0D9 F0	  rst=0 rw=0 wio=0 bgt=0
160 188 C9	0D9 F0	  rst=0 rw=0 wio=0 bgt=0
161 189 C0	036 F0	  rst=0 rw=0 wio=0 bgt=0
162 0C0 5A	036 F0	  rst=0 rw=0 wio=0 bgt=0
163 18A 00	036 F0	  rst=0 rw=0 wio=0 bgt=0
164 18B C8	036 F0	  rst=0 rw=0 wio=0 bgt=0
165 18C 7F	036 F0	  rst=0 rw=0 wio=0 bgt=0
166 18D 1E	036 F0	  rst=0 rw=0 wio=0 bgt=0
167 18E C1	036 F0	  rst=0 rw=0 wio=0 bgt=0
168 18F 00	036 F0	  rst=0 rw=0 wio=0 bgt=0
169 190 C6	036 F0	  rst=0 rw=0 wio=0 bgt=0
170 191 7F	039 F0	  rst=0 rw=0 wio=0 bgt=0
171 192 1E	039 F0	  rst=0 rw=0 wio=0 bgt=0
172 193 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
173 194 B5	039 F0	  rst=0 rw=0 wio=0 bgt=0
174 1B5 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
175 1B6 00	039 F0	  rst=0 rw=0 wio=0 bgt=0
176 1B7 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
177 1B8 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
178 1B9 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
179 1BA 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
180 1BB 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
181 1BC 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
182 1BD 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
183 1BE 00	0FF F0	  rst=0 rw=0 wio=0 bgt=0
 
