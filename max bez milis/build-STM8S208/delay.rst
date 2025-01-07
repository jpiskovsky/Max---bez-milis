                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.1 #14865 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module delay
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _delay_us
                                     12 	.globl _delay_ms
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; absolute external ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DABS (ABS)
                                     25 
                                     26 ; default segment ordering for linker
                                     27 	.area HOME
                                     28 	.area GSINIT
                                     29 	.area GSFINAL
                                     30 	.area CONST
                                     31 	.area INITIALIZER
                                     32 	.area CODE
                                     33 
                                     34 ;--------------------------------------------------------
                                     35 ; global & static initialisations
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area GSINIT
                                     41 ;--------------------------------------------------------
                                     42 ; Home
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area HOME
                                     46 ;--------------------------------------------------------
                                     47 ; code
                                     48 ;--------------------------------------------------------
                                     49 	.area CODE
                                     50 ;	inc/delay.h: 18: static @inline void _delay_cycl( unsigned short __ticks )
                                     51 ; genLabel
                                     52 ;	-----------------------------------------
                                     53 ;	 function _delay_cycl
                                     54 ;	-----------------------------------------
                                     55 ;	Register assignment is optimal.
                                     56 ;	Stack space usage: 0 bytes.
      00809D                         57 __delay_cycl:
                                     58 ; genReceive
                                     59 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                     60 ;	genInline
      00809D 9D               [ 1]   61 	nop
      00809E 9D               [ 1]   62 	nop
                                     63 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                     64 ; genAssign
                                     65 ; genLabel
      00809F                         66 00101$:
                                     67 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                     68 ; genMinus
      00809F 5A               [ 2]   69 	decw	x
                                     70 ;	inc/delay.h: 32: } while ( __ticks );
                                     71 ; genIfx
      0080A0 5D               [ 2]   72 	tnzw	x
      0080A1 27 03            [ 1]   73 	jreq	00121$
      0080A3 CC 80 9F         [ 2]   74 	jp	00101$
      0080A6                         75 00121$:
                                     76 ;	inc/delay.h: 33: __asm__("nop\n");
                                     77 ;	genInline
      0080A6 9D               [ 1]   78 	nop
                                     79 ; genLabel
      0080A7                         80 00104$:
                                     81 ;	inc/delay.h: 43: }
                                     82 ; genEndFunction
      0080A7 81               [ 4]   83 	ret
                                     84 ;	inc/delay.h: 45: static @inline void _delay_us( const unsigned short __us ){
                                     85 ; genLabel
                                     86 ;	-----------------------------------------
                                     87 ;	 function _delay_us
                                     88 ;	-----------------------------------------
                                     89 ;	Register assignment might be sub-optimal.
                                     90 ;	Stack space usage: 0 bytes.
      0080A8                         91 __delay_us:
                                     92 ; genReceive
                                     93 ;	inc/delay.h: 46: _delay_cycl( (unsigned short)( T_COUNT(__us) ));
                                     94 ; genCast
                                     95 ; genAssign
      0080A8 90 5F            [ 1]   96 	clrw	y
                                     97 ; genIPush
      0080AA 89               [ 2]   98 	pushw	x
      0080AB 90 89            [ 2]   99 	pushw	y
                                    100 ; genIPush
      0080AD 4B 00            [ 1]  101 	push	#0x00
      0080AF 4B 24            [ 1]  102 	push	#0x24
      0080B1 4B F4            [ 1]  103 	push	#0xf4
      0080B3 4B 00            [ 1]  104 	push	#0x00
                                    105 ; genCall
      0080B5 CD 86 B6         [ 4]  106 	call	__mullong
      0080B8 5B 08            [ 2]  107 	addw	sp, #8
                                    108 ; genCast
                                    109 ; genAssign
                                    110 ; genIPush
      0080BA 4B 40            [ 1]  111 	push	#0x40
      0080BC 4B 42            [ 1]  112 	push	#0x42
      0080BE 4B 0F            [ 1]  113 	push	#0x0f
      0080C0 4B 00            [ 1]  114 	push	#0x00
                                    115 ; genIPush
      0080C2 89               [ 2]  116 	pushw	x
      0080C3 90 89            [ 2]  117 	pushw	y
                                    118 ; genCall
      0080C5 CD 84 EA         [ 4]  119 	call	__divulong
      0080C8 5B 08            [ 2]  120 	addw	sp, #8
                                    121 ; genRightShiftLiteral
      0080CA 90 54            [ 2]  122 	srlw	y
      0080CC 56               [ 2]  123 	rrcw	x
      0080CD 90 54            [ 2]  124 	srlw	y
      0080CF 56               [ 2]  125 	rrcw	x
      0080D0 90 54            [ 2]  126 	srlw	y
      0080D2 56               [ 2]  127 	rrcw	x
                                    128 ; genCast
                                    129 ; genAssign
                                    130 ; genPlus
      0080D3 5C               [ 1]  131 	incw	x
                                    132 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    133 ;	genInline
      0080D4 9D               [ 1]  134 	nop
      0080D5 9D               [ 1]  135 	nop
                                    136 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    137 ; genAssign
                                    138 ; genLabel
      0080D6                        139 00101$:
                                    140 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    141 ; genMinus
      0080D6 5A               [ 2]  142 	decw	x
                                    143 ;	inc/delay.h: 32: } while ( __ticks );
                                    144 ; genIfx
      0080D7 5D               [ 2]  145 	tnzw	x
      0080D8 27 03            [ 1]  146 	jreq	00122$
      0080DA CC 80 D6         [ 2]  147 	jp	00101$
      0080DD                        148 00122$:
                                    149 ;	inc/delay.h: 33: __asm__("nop\n");
                                    150 ;	genInline
      0080DD 9D               [ 1]  151 	nop
                                    152 ;	inc/delay.h: 46: _delay_cycl( (unsigned short)( T_COUNT(__us) ));
                                    153 ; genLabel
      0080DE                        154 00105$:
                                    155 ;	inc/delay.h: 47: }
                                    156 ; genEndFunction
      0080DE 81               [ 4]  157 	ret
                                    158 ;	./src/delay.c: 4: void delay_us(uint8_t us)
                                    159 ; genLabel
                                    160 ;	-----------------------------------------
                                    161 ;	 function delay_us
                                    162 ;	-----------------------------------------
                                    163 ;	Register assignment might be sub-optimal.
                                    164 ;	Stack space usage: 4 bytes.
      0080DF                        165 _delay_us:
      0080DF 52 04            [ 2]  166 	sub	sp, #4
                                    167 ; genReceive
                                    168 ;	./src/delay.c: 6: _delay_us(us);
                                    169 ; genCast
                                    170 ; genAssign
                                    171 ;	inc/delay.h: 46: _delay_cycl( (unsigned short)( T_COUNT(__us) ));
                                    172 ; genCast
                                    173 ; genAssign
      0080E1 5F               [ 1]  174 	clrw	x
      0080E2 0F 01            [ 1]  175 	clr	(0x01, sp)
                                    176 ; genIPush
      0080E4 88               [ 1]  177 	push	a
      0080E5 89               [ 2]  178 	pushw	x
      0080E6 4F               [ 1]  179 	clr	a
      0080E7 88               [ 1]  180 	push	a
                                    181 ; genIPush
      0080E8 4B 00            [ 1]  182 	push	#0x00
      0080EA 4B 24            [ 1]  183 	push	#0x24
      0080EC 4B F4            [ 1]  184 	push	#0xf4
      0080EE 4B 00            [ 1]  185 	push	#0x00
                                    186 ; genCall
      0080F0 CD 86 B6         [ 4]  187 	call	__mullong
      0080F3 5B 08            [ 2]  188 	addw	sp, #8
                                    189 ; genCast
                                    190 ; genAssign
                                    191 ; genIPush
      0080F5 4B 40            [ 1]  192 	push	#0x40
      0080F7 4B 42            [ 1]  193 	push	#0x42
      0080F9 4B 0F            [ 1]  194 	push	#0x0f
      0080FB 4B 00            [ 1]  195 	push	#0x00
                                    196 ; genIPush
      0080FD 89               [ 2]  197 	pushw	x
      0080FE 90 89            [ 2]  198 	pushw	y
                                    199 ; genCall
      008100 CD 84 EA         [ 4]  200 	call	__divulong
      008103 5B 08            [ 2]  201 	addw	sp, #8
                                    202 ; genRightShiftLiteral
      008105 90 54            [ 2]  203 	srlw	y
      008107 56               [ 2]  204 	rrcw	x
      008108 90 54            [ 2]  205 	srlw	y
      00810A 56               [ 2]  206 	rrcw	x
      00810B 90 54            [ 2]  207 	srlw	y
      00810D 56               [ 2]  208 	rrcw	x
                                    209 ; genCast
                                    210 ; genAssign
                                    211 ; genPlus
      00810E 5C               [ 1]  212 	incw	x
                                    213 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    214 ;	genInline
      00810F 9D               [ 1]  215 	nop
      008110 9D               [ 1]  216 	nop
                                    217 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    218 ; genAssign
                                    219 ; genLabel
      008111                        220 00101$:
                                    221 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    222 ; genMinus
      008111 5A               [ 2]  223 	decw	x
                                    224 ;	inc/delay.h: 32: } while ( __ticks );
                                    225 ; genIfx
      008112 5D               [ 2]  226 	tnzw	x
      008113 27 03            [ 1]  227 	jreq	00123$
      008115 CC 81 11         [ 2]  228 	jp	00101$
      008118                        229 00123$:
                                    230 ;	inc/delay.h: 33: __asm__("nop\n");
                                    231 ;	genInline
      008118 9D               [ 1]  232 	nop
                                    233 ;	./src/delay.c: 6: _delay_us(us);
                                    234 ; genLabel
      008119                        235 00106$:
                                    236 ;	./src/delay.c: 7: }
                                    237 ; genEndFunction
      008119 5B 04            [ 2]  238 	addw	sp, #4
      00811B 81               [ 4]  239 	ret
                                    240 ;	./src/delay.c: 9: void delay_ms(uint16_t ms)
                                    241 ; genLabel
                                    242 ;	-----------------------------------------
                                    243 ;	 function delay_ms
                                    244 ;	-----------------------------------------
                                    245 ;	Register assignment might be sub-optimal.
                                    246 ;	Stack space usage: 2 bytes.
      00811C                        247 _delay_ms:
      00811C 89               [ 2]  248 	pushw	x
                                    249 ; genReceive
      00811D 1F 01            [ 2]  250 	ldw	(0x01, sp), x
                                    251 ;	./src/delay.c: 11: for (int16_t i = 0; i < ms; i++) {
                                    252 ; genAssign
      00811F 90 5F            [ 1]  253 	clrw	y
                                    254 ; genLabel
      008121                        255 00123$:
                                    256 ; genCast
                                    257 ; genAssign
      008121 93               [ 1]  258 	ldw	x, y
                                    259 ; genCmp
                                    260 ; genCmpTnz
      008122 13 01            [ 2]  261 	cpw	x, (0x01, sp)
      008124 25 03            [ 1]  262 	jrc	00202$
      008126 CC 81 62         [ 2]  263 	jp	00125$
      008129                        264 00202$:
                                    265 ; skipping generated iCode
                                    266 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    267 ;	genInline
      008129 9D               [ 1]  268 	nop
      00812A 9D               [ 1]  269 	nop
                                    270 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    271 ; genAssign
      00812B AE 01 F5         [ 2]  272 	ldw	x, #0x01f5
                                    273 ; genLabel
      00812E                        274 00102$:
                                    275 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    276 ; genMinus
      00812E 5A               [ 2]  277 	decw	x
                                    278 ;	inc/delay.h: 32: } while ( __ticks );
                                    279 ; genIfx
      00812F 5D               [ 2]  280 	tnzw	x
      008130 27 03            [ 1]  281 	jreq	00203$
      008132 CC 81 2E         [ 2]  282 	jp	00102$
      008135                        283 00203$:
                                    284 ;	inc/delay.h: 33: __asm__("nop\n");
                                    285 ;	genInline
      008135 9D               [ 1]  286 	nop
                                    287 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    288 ;	genInline
      008136 9D               [ 1]  289 	nop
      008137 9D               [ 1]  290 	nop
                                    291 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    292 ; genAssign
      008138 AE 01 F5         [ 2]  293 	ldw	x, #0x01f5
                                    294 ; genLabel
      00813B                        295 00107$:
                                    296 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    297 ; genMinus
      00813B 5A               [ 2]  298 	decw	x
                                    299 ;	inc/delay.h: 32: } while ( __ticks );
                                    300 ; genIfx
      00813C 5D               [ 2]  301 	tnzw	x
      00813D 27 03            [ 1]  302 	jreq	00204$
      00813F CC 81 3B         [ 2]  303 	jp	00107$
      008142                        304 00204$:
                                    305 ;	inc/delay.h: 33: __asm__("nop\n");
                                    306 ;	genInline
      008142 9D               [ 1]  307 	nop
                                    308 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    309 ;	genInline
      008143 9D               [ 1]  310 	nop
      008144 9D               [ 1]  311 	nop
                                    312 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    313 ; genAssign
      008145 AE 01 F5         [ 2]  314 	ldw	x, #0x01f5
                                    315 ; genLabel
      008148                        316 00112$:
                                    317 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    318 ; genMinus
      008148 5A               [ 2]  319 	decw	x
                                    320 ;	inc/delay.h: 32: } while ( __ticks );
                                    321 ; genIfx
      008149 5D               [ 2]  322 	tnzw	x
      00814A 27 03            [ 1]  323 	jreq	00205$
      00814C CC 81 48         [ 2]  324 	jp	00112$
      00814F                        325 00205$:
                                    326 ;	inc/delay.h: 33: __asm__("nop\n");
                                    327 ;	genInline
      00814F 9D               [ 1]  328 	nop
                                    329 ;	inc/delay.h: 29: __asm__("nop\n nop\n"); 
                                    330 ;	genInline
      008150 9D               [ 1]  331 	nop
      008151 9D               [ 1]  332 	nop
                                    333 ;	inc/delay.h: 30: do { 		// ASM: ldw X, #tick; lab$: decw X; tnzw X; jrne lab$
                                    334 ; genAssign
      008152 AE 01 E7         [ 2]  335 	ldw	x, #0x01e7
                                    336 ; genLabel
      008155                        337 00117$:
                                    338 ;	inc/delay.h: 31: __ticks--;//      2c;                 1c;     2c    ; 1/2c   
                                    339 ; genMinus
      008155 5A               [ 2]  340 	decw	x
                                    341 ;	inc/delay.h: 32: } while ( __ticks );
                                    342 ; genIfx
      008156 5D               [ 2]  343 	tnzw	x
      008157 27 03            [ 1]  344 	jreq	00206$
      008159 CC 81 55         [ 2]  345 	jp	00117$
      00815C                        346 00206$:
                                    347 ;	inc/delay.h: 33: __asm__("nop\n");
                                    348 ;	genInline
      00815C 9D               [ 1]  349 	nop
                                    350 ;	./src/delay.c: 11: for (int16_t i = 0; i < ms; i++) {
                                    351 ; genPlus
      00815D 90 5C            [ 1]  352 	incw	y
                                    353 ; genGoto
      00815F CC 81 21         [ 2]  354 	jp	00123$
                                    355 ; genLabel
      008162                        356 00125$:
                                    357 ;	./src/delay.c: 17: }
                                    358 ; genEndFunction
      008162 85               [ 2]  359 	popw	x
      008163 81               [ 4]  360 	ret
                                    361 	.area CODE
                                    362 	.area CONST
                                    363 	.area INITIALIZER
                                    364 	.area CABS (ABS)
