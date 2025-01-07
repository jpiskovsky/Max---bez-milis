                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.1 #14865 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM2_init
                                     13 	.globl _display
                                     14 	.globl _TIM2_ClearFlag
                                     15 	.globl _TIM2_ITConfig
                                     16 	.globl _TIM2_Cmd
                                     17 	.globl _TIM2_TimeBaseInit
                                     18 	.globl _GPIO_WriteLow
                                     19 	.globl _GPIO_WriteHigh
                                     20 	.globl _GPIO_Init
                                     21 	.globl _CLK_HSIPrescalerConfig
                                     22 	.globl _CLK_PeripheralClockConfig
                                     23 	.globl _vlastni_cas
                                     24 	.globl _init
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DATA
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area INITIALIZED
      000001                         33 _vlastni_cas::
      000001                         34 	.ds 4
                                     35 ;--------------------------------------------------------
                                     36 ; Stack segment in internal ram
                                     37 ;--------------------------------------------------------
                                     38 	.area SSEG
      008737                         39 __start__stack:
      008737                         40 	.ds	1
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; absolute external ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DABS (ABS)
                                     46 
                                     47 ; default segment ordering for linker
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area CONST
                                     52 	.area INITIALIZER
                                     53 	.area CODE
                                     54 
                                     55 ;--------------------------------------------------------
                                     56 ; interrupt vector
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
      008000                         59 __interrupt_vect:
      008000 82 00 80 6F             60 	int s_GSINIT ; reset
      008004 82 00 83 79             61 	int _TRAP_IRQHandler ; trap
      008008 82 00 83 7A             62 	int _TLI_IRQHandler ; int0
      00800C 82 00 83 7B             63 	int _AWU_IRQHandler ; int1
      008010 82 00 83 7C             64 	int _CLK_IRQHandler ; int2
      008014 82 00 83 7D             65 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 83 7E             66 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 83 7F             67 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 83 80             68 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 83 81             69 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 83 82             70 	int _CAN_RX_IRQHandler ; int8
      00802C 82 00 83 83             71 	int _CAN_TX_IRQHandler ; int9
      008030 82 00 83 84             72 	int _SPI_IRQHandler ; int10
      008034 82 00 83 85             73 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 83 86             74 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 83 87             75 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 83 A3             76 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 83 A4             77 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 83 A5             78 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 83 A6             79 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 83 A7             80 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 83 A8             81 	int _I2C_IRQHandler ; int19
      008058 82 00 83 A9             82 	int _UART3_TX_IRQHandler ; int20
      00805C 82 00 83 AA             83 	int _UART3_RX_IRQHandler ; int21
      008060 82 00 83 AB             84 	int _ADC2_IRQHandler ; int22
      008064 82 00 83 AC             85 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 83 C6             86 	int _EEPROM_EEC_IRQHandler ; int24
                                     87 ;--------------------------------------------------------
                                     88 ; global & static initialisations
                                     89 ;--------------------------------------------------------
                                     90 	.area HOME
                                     91 	.area GSINIT
                                     92 	.area GSFINAL
                                     93 	.area GSINIT
      00806F CD 85 6B         [ 4]   94 	call	___sdcc_external_startup
      008072 4D               [ 1]   95 	tnz	a
      008073 27 03            [ 1]   96 	jreq	__sdcc_init_data
      008075 CC 80 6C         [ 2]   97 	jp	__sdcc_program_startup
      008078                         98 __sdcc_init_data:
                                     99 ; stm8_genXINIT() start
      008078 AE 00 00         [ 2]  100 	ldw x, #l_DATA
      00807B 27 07            [ 1]  101 	jreq	00002$
      00807D                        102 00001$:
      00807D 72 4F 00 00      [ 1]  103 	clr (s_DATA - 1, x)
      008081 5A               [ 2]  104 	decw x
      008082 26 F9            [ 1]  105 	jrne	00001$
      008084                        106 00002$:
      008084 AE 00 08         [ 2]  107 	ldw	x, #l_INITIALIZER
      008087 27 09            [ 1]  108 	jreq	00004$
      008089                        109 00003$:
      008089 D6 80 94         [ 1]  110 	ld	a, (s_INITIALIZER - 1, x)
      00808C D7 00 00         [ 1]  111 	ld	(s_INITIALIZED - 1, x), a
      00808F 5A               [ 2]  112 	decw	x
      008090 26 F7            [ 1]  113 	jrne	00003$
      008092                        114 00004$:
                                    115 ; stm8_genXINIT() end
                                    116 	.area GSFINAL
      008092 CC 80 6C         [ 2]  117 	jp	__sdcc_program_startup
                                    118 ;--------------------------------------------------------
                                    119 ; Home
                                    120 ;--------------------------------------------------------
                                    121 	.area HOME
                                    122 	.area HOME
      00806C                        123 __sdcc_program_startup:
      00806C CC 82 39         [ 2]  124 	jp	_main
                                    125 ;	return from main will return to caller
                                    126 ;--------------------------------------------------------
                                    127 ; code
                                    128 ;--------------------------------------------------------
                                    129 	.area CODE
                                    130 ;	./src/main.c: 13: void init(void) {
                                    131 ; genLabel
                                    132 ;	-----------------------------------------
                                    133 ;	 function init
                                    134 ;	-----------------------------------------
                                    135 ;	Register assignment is optimal.
                                    136 ;	Stack space usage: 0 bytes.
      008164                        137 _init:
                                    138 ;	./src/main.c: 14: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovani MCU na 16MHz
                                    139 ; genSend
      008164 4F               [ 1]  140 	clr	a
                                    141 ; genCall
      008165 CD 85 89         [ 4]  142 	call	_CLK_HSIPrescalerConfig
                                    143 ;	./src/main.c: 16: GPIO_Init(DIN_PORT, DIN_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    144 ; genIPush
      008168 4B C0            [ 1]  145 	push	#0xc0
                                    146 ; genSend
      00816A A6 04            [ 1]  147 	ld	a, #0x04
                                    148 ; genSend
      00816C AE 50 05         [ 2]  149 	ldw	x, #0x5005
                                    150 ; genCall
      00816F CD 83 C7         [ 4]  151 	call	_GPIO_Init
                                    152 ;	./src/main.c: 17: GPIO_Init(CS_PORT, CS_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
                                    153 ; genIPush
      008172 4B D0            [ 1]  154 	push	#0xd0
                                    155 ; genSend
      008174 A6 02            [ 1]  156 	ld	a, #0x02
                                    157 ; genSend
      008176 AE 50 05         [ 2]  158 	ldw	x, #0x5005
                                    159 ; genCall
      008179 CD 83 C7         [ 4]  160 	call	_GPIO_Init
                                    161 ;	./src/main.c: 18: GPIO_Init(CLK_PORT, CLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    162 ; genIPush
      00817C 4B C0            [ 1]  163 	push	#0xc0
                                    164 ; genSend
      00817E A6 01            [ 1]  165 	ld	a, #0x01
                                    166 ; genSend
      008180 AE 50 05         [ 2]  167 	ldw	x, #0x5005
                                    168 ; genCall
      008183 CD 83 C7         [ 4]  169 	call	_GPIO_Init
                                    170 ; genLabel
      008186                        171 00101$:
                                    172 ;	./src/main.c: 21: }
                                    173 ; genEndFunction
      008186 81               [ 4]  174 	ret
                                    175 ;	./src/main.c: 25: void display(uint8_t address, uint8_t data) {
                                    176 ; genLabel
                                    177 ;	-----------------------------------------
                                    178 ;	 function display
                                    179 ;	-----------------------------------------
                                    180 ;	Register assignment is optimal.
                                    181 ;	Stack space usage: 2 bytes.
      008187                        182 _display:
      008187 89               [ 2]  183 	pushw	x
                                    184 ; genReceive
      008188 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	./src/main.c: 27: LOW(CS); // začátek přenosu
                                    187 ; genSend
      00818A A6 02            [ 1]  188 	ld	a, #0x02
                                    189 ; genSend
      00818C AE 50 05         [ 2]  190 	ldw	x, #0x5005
                                    191 ; genCall
      00818F CD 85 43         [ 4]  192 	call	_GPIO_WriteLow
                                    193 ;	./src/main.c: 32: mask = 0b10000000;
                                    194 ; genAssign
      008192 A6 80            [ 1]  195 	ld	a, #0x80
      008194 6B 02            [ 1]  196 	ld	(0x02, sp), a
                                    197 ;	./src/main.c: 33: while (mask) {
                                    198 ; genLabel
      008196                        199 00104$:
                                    200 ; genIfx
      008196 0D 02            [ 1]  201 	tnz	(0x02, sp)
      008198 26 03            [ 1]  202 	jrne	00157$
      00819A CC 81 CF         [ 2]  203 	jp	00106$
      00819D                        204 00157$:
                                    205 ;	./src/main.c: 34: if (address & mask) {
                                    206 ; genAnd
      00819D 7B 01            [ 1]  207 	ld	a, (0x01, sp)
      00819F 14 02            [ 1]  208 	and	a, (0x02, sp)
                                    209 ; genIfx
      0081A1 4D               [ 1]  210 	tnz	a
      0081A2 26 03            [ 1]  211 	jrne	00158$
      0081A4 CC 81 B2         [ 2]  212 	jp	00102$
      0081A7                        213 00158$:
                                    214 ;	./src/main.c: 35: HIGH(DIN);
                                    215 ; genSend
      0081A7 A6 04            [ 1]  216 	ld	a, #0x04
                                    217 ; genSend
      0081A9 AE 50 05         [ 2]  218 	ldw	x, #0x5005
                                    219 ; genCall
      0081AC CD 86 97         [ 4]  220 	call	_GPIO_WriteHigh
                                    221 ; genGoto
      0081AF CC 81 BA         [ 2]  222 	jp	00103$
                                    223 ; genLabel
      0081B2                        224 00102$:
                                    225 ;	./src/main.c: 37: LOW(DIN);
                                    226 ; genSend
      0081B2 A6 04            [ 1]  227 	ld	a, #0x04
                                    228 ; genSend
      0081B4 AE 50 05         [ 2]  229 	ldw	x, #0x5005
                                    230 ; genCall
      0081B7 CD 85 43         [ 4]  231 	call	_GPIO_WriteLow
                                    232 ; genLabel
      0081BA                        233 00103$:
                                    234 ;	./src/main.c: 39: HIGH(CLK);
                                    235 ; genSend
      0081BA A6 01            [ 1]  236 	ld	a, #0x01
                                    237 ; genSend
      0081BC AE 50 05         [ 2]  238 	ldw	x, #0x5005
                                    239 ; genCall
      0081BF CD 86 97         [ 4]  240 	call	_GPIO_WriteHigh
                                    241 ;	./src/main.c: 40: mask = mask >> 1;
                                    242 ; genRightShiftLiteral
      0081C2 04 02            [ 1]  243 	srl	(0x02, sp)
                                    244 ;	./src/main.c: 41: LOW(CLK);
                                    245 ; genSend
      0081C4 A6 01            [ 1]  246 	ld	a, #0x01
                                    247 ; genSend
      0081C6 AE 50 05         [ 2]  248 	ldw	x, #0x5005
                                    249 ; genCall
      0081C9 CD 85 43         [ 4]  250 	call	_GPIO_WriteLow
                                    251 ; genGoto
      0081CC CC 81 96         [ 2]  252 	jp	00104$
                                    253 ; genLabel
      0081CF                        254 00106$:
                                    255 ;	./src/main.c: 44: mask = 0b10000000;
                                    256 ; genAssign
      0081CF A6 80            [ 1]  257 	ld	a, #0x80
      0081D1 6B 02            [ 1]  258 	ld	(0x02, sp), a
                                    259 ;	./src/main.c: 45: while (mask) {
                                    260 ; genLabel
      0081D3                        261 00110$:
                                    262 ; genIfx
      0081D3 0D 02            [ 1]  263 	tnz	(0x02, sp)
      0081D5 26 03            [ 1]  264 	jrne	00159$
      0081D7 CC 82 0C         [ 2]  265 	jp	00112$
      0081DA                        266 00159$:
                                    267 ;	./src/main.c: 46: if (data & mask) {
                                    268 ; genAnd
      0081DA 7B 05            [ 1]  269 	ld	a, (0x05, sp)
      0081DC 14 02            [ 1]  270 	and	a, (0x02, sp)
                                    271 ; genIfx
      0081DE 4D               [ 1]  272 	tnz	a
      0081DF 26 03            [ 1]  273 	jrne	00160$
      0081E1 CC 81 EF         [ 2]  274 	jp	00108$
      0081E4                        275 00160$:
                                    276 ;	./src/main.c: 47: HIGH(DIN);
                                    277 ; genSend
      0081E4 A6 04            [ 1]  278 	ld	a, #0x04
                                    279 ; genSend
      0081E6 AE 50 05         [ 2]  280 	ldw	x, #0x5005
                                    281 ; genCall
      0081E9 CD 86 97         [ 4]  282 	call	_GPIO_WriteHigh
                                    283 ; genGoto
      0081EC CC 81 F7         [ 2]  284 	jp	00109$
                                    285 ; genLabel
      0081EF                        286 00108$:
                                    287 ;	./src/main.c: 49: LOW(DIN);
                                    288 ; genSend
      0081EF A6 04            [ 1]  289 	ld	a, #0x04
                                    290 ; genSend
      0081F1 AE 50 05         [ 2]  291 	ldw	x, #0x5005
                                    292 ; genCall
      0081F4 CD 85 43         [ 4]  293 	call	_GPIO_WriteLow
                                    294 ; genLabel
      0081F7                        295 00109$:
                                    296 ;	./src/main.c: 51: HIGH(CLK);
                                    297 ; genSend
      0081F7 A6 01            [ 1]  298 	ld	a, #0x01
                                    299 ; genSend
      0081F9 AE 50 05         [ 2]  300 	ldw	x, #0x5005
                                    301 ; genCall
      0081FC CD 86 97         [ 4]  302 	call	_GPIO_WriteHigh
                                    303 ;	./src/main.c: 52: mask = mask >> 1;
                                    304 ; genRightShiftLiteral
      0081FF 04 02            [ 1]  305 	srl	(0x02, sp)
                                    306 ;	./src/main.c: 53: LOW(CLK);
                                    307 ; genSend
      008201 A6 01            [ 1]  308 	ld	a, #0x01
                                    309 ; genSend
      008203 AE 50 05         [ 2]  310 	ldw	x, #0x5005
                                    311 ; genCall
      008206 CD 85 43         [ 4]  312 	call	_GPIO_WriteLow
                                    313 ; genGoto
      008209 CC 81 D3         [ 2]  314 	jp	00110$
                                    315 ; genLabel
      00820C                        316 00112$:
                                    317 ;	./src/main.c: 56: HIGH(CS); // konec přenosu
                                    318 ; genSend
      00820C A6 02            [ 1]  319 	ld	a, #0x02
                                    320 ; genSend
      00820E AE 50 05         [ 2]  321 	ldw	x, #0x5005
                                    322 ; genCall
      008211 CD 86 97         [ 4]  323 	call	_GPIO_WriteHigh
                                    324 ; genLabel
      008214                        325 00113$:
                                    326 ;	./src/main.c: 57: }
                                    327 ; genEndFunction
      008214 85               [ 2]  328 	popw	x
      008215 85               [ 2]  329 	popw	x
      008216 84               [ 1]  330 	pop	a
      008217 FC               [ 2]  331 	jp	(x)
                                    332 ;	./src/main.c: 58: void TIM2_init(void)
                                    333 ; genLabel
                                    334 ;	-----------------------------------------
                                    335 ;	 function TIM2_init
                                    336 ;	-----------------------------------------
                                    337 ;	Register assignment is optimal.
                                    338 ;	Stack space usage: 0 bytes.
      008218                        339 _TIM2_init:
                                    340 ;	./src/main.c: 60: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
                                    341 ; genIPush
      008218 4B 01            [ 1]  342 	push	#0x01
                                    343 ; genSend
      00821A A6 05            [ 1]  344 	ld	a, #0x05
                                    345 ; genCall
      00821C CD 84 95         [ 4]  346 	call	_CLK_PeripheralClockConfig
                                    347 ;	./src/main.c: 61: TIM2_TimeBaseInit(TIM2_PRESCALER_16,999);
                                    348 ; genSend
      00821F AE 03 E7         [ 2]  349 	ldw	x, #0x03e7
                                    350 ; genSend
      008222 A6 04            [ 1]  351 	ld	a, #0x04
                                    352 ; genCall
      008224 CD 86 8B         [ 4]  353 	call	_TIM2_TimeBaseInit
                                    354 ;	./src/main.c: 62: TIM2_ClearFlag(TIM2_FLAG_UPDATE);
                                    355 ; genSend
      008227 5F               [ 1]  356 	clrw	x
      008228 5C               [ 1]  357 	incw	x
                                    358 ; genCall
      008229 CD 86 AC         [ 4]  359 	call	_TIM2_ClearFlag
                                    360 ;	./src/main.c: 63: TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
                                    361 ; genIPush
      00822C 4B 01            [ 1]  362 	push	#0x01
                                    363 ; genSend
      00822E A6 01            [ 1]  364 	ld	a, #0x01
                                    365 ; genCall
      008230 CD 84 51         [ 4]  366 	call	_TIM2_ITConfig
                                    367 ;	./src/main.c: 64: TIM2_Cmd(ENABLE);
                                    368 ; genSend
      008233 A6 01            [ 1]  369 	ld	a, #0x01
                                    370 ; genCall
      008235 CC 85 4F         [ 2]  371 	jp	_TIM2_Cmd
                                    372 ; genLabel
      008238                        373 00101$:
                                    374 ;	./src/main.c: 65: }
                                    375 ; genEndFunction
      008238 81               [ 4]  376 	ret
                                    377 ;	./src/main.c: 67: int main(void) {
                                    378 ; genLabel
                                    379 ;	-----------------------------------------
                                    380 ;	 function main
                                    381 ;	-----------------------------------------
                                    382 ;	Register assignment might be sub-optimal.
                                    383 ;	Stack space usage: 13 bytes.
      008239                        384 _main:
      008239 52 0D            [ 2]  385 	sub	sp, #13
                                    386 ;	./src/main.c: 69: uint32_t time = 0;
                                    387 ; genAssign
      00823B 5F               [ 1]  388 	clrw	x
      00823C 1F 07            [ 2]  389 	ldw	(0x07, sp), x
      00823E 1F 05            [ 2]  390 	ldw	(0x05, sp), x
                                    391 ;	./src/main.c: 70: uint8_t number = 0;
                                    392 ; genAssign
      008240 0F 0B            [ 1]  393 	clr	(0x0b, sp)
                                    394 ;	./src/main.c: 71: uint16_t number1 = 000;
                                    395 ; genAssign
      008242 5F               [ 1]  396 	clrw	x
      008243 1F 0C            [ 2]  397 	ldw	(0x0c, sp), x
                                    398 ;	./src/main.c: 75: init();
                                    399 ; genCall
      008245 CD 81 64         [ 4]  400 	call	_init
                                    401 ;	./src/main.c: 76: TIM2_init();
                                    402 ; genCall
      008248 CD 82 18         [ 4]  403 	call	_TIM2_init
                                    404 ;	./src/main.c: 78: display(DECODE_MODE, 0b11111111);
                                    405 ; genIPush
      00824B 4B FF            [ 1]  406 	push	#0xff
                                    407 ; genSend
      00824D A6 09            [ 1]  408 	ld	a, #0x09
                                    409 ; genCall
      00824F CD 81 87         [ 4]  410 	call	_display
                                    411 ;	./src/main.c: 79: display(SCAN_LIMIT, 7);
                                    412 ; genIPush
      008252 4B 07            [ 1]  413 	push	#0x07
                                    414 ; genSend
      008254 A6 0B            [ 1]  415 	ld	a, #0x0b
                                    416 ; genCall
      008256 CD 81 87         [ 4]  417 	call	_display
                                    418 ;	./src/main.c: 80: display(INTENSITY, 1);
                                    419 ; genIPush
      008259 4B 01            [ 1]  420 	push	#0x01
                                    421 ; genSend
      00825B A6 0A            [ 1]  422 	ld	a, #0x0a
                                    423 ; genCall
      00825D CD 81 87         [ 4]  424 	call	_display
                                    425 ;	./src/main.c: 81: display(DISPLAY_TEST, DISPLAY_TEST_OFF);
                                    426 ; genIPush
      008260 4B 00            [ 1]  427 	push	#0x00
                                    428 ; genSend
      008262 A6 0F            [ 1]  429 	ld	a, #0x0f
                                    430 ; genCall
      008264 CD 81 87         [ 4]  431 	call	_display
                                    432 ;	./src/main.c: 82: display(SHUTDOWN, SHUTDOWN_ON);
                                    433 ; genIPush
      008267 4B 01            [ 1]  434 	push	#0x01
                                    435 ; genSend
      008269 A6 0C            [ 1]  436 	ld	a, #0x0c
                                    437 ; genCall
      00826B CD 81 87         [ 4]  438 	call	_display
                                    439 ;	./src/main.c: 83: display(DIGIT0, 0xF);
                                    440 ; genIPush
      00826E 4B 0F            [ 1]  441 	push	#0x0f
                                    442 ; genSend
      008270 A6 01            [ 1]  443 	ld	a, #0x01
                                    444 ; genCall
      008272 CD 81 87         [ 4]  445 	call	_display
                                    446 ;	./src/main.c: 84: display(DIGIT1, 0xF);
                                    447 ; genIPush
      008275 4B 0F            [ 1]  448 	push	#0x0f
                                    449 ; genSend
      008277 A6 02            [ 1]  450 	ld	a, #0x02
                                    451 ; genCall
      008279 CD 81 87         [ 4]  452 	call	_display
                                    453 ;	./src/main.c: 85: display(DIGIT2, 0xF);
                                    454 ; genIPush
      00827C 4B 0F            [ 1]  455 	push	#0x0f
                                    456 ; genSend
      00827E A6 03            [ 1]  457 	ld	a, #0x03
                                    458 ; genCall
      008280 CD 81 87         [ 4]  459 	call	_display
                                    460 ;	./src/main.c: 86: display(DIGIT3, 0xF);
                                    461 ; genIPush
      008283 4B 0F            [ 1]  462 	push	#0x0f
                                    463 ; genSend
      008285 A6 04            [ 1]  464 	ld	a, #0x04
                                    465 ; genCall
      008287 CD 81 87         [ 4]  466 	call	_display
                                    467 ;	./src/main.c: 87: display(DIGIT4, 0xF);
                                    468 ; genIPush
      00828A 4B 0F            [ 1]  469 	push	#0x0f
                                    470 ; genSend
      00828C A6 05            [ 1]  471 	ld	a, #0x05
                                    472 ; genCall
      00828E CD 81 87         [ 4]  473 	call	_display
                                    474 ;	./src/main.c: 88: display(DIGIT5, 0xF);
                                    475 ; genIPush
      008291 4B 0F            [ 1]  476 	push	#0x0f
                                    477 ; genSend
      008293 A6 06            [ 1]  478 	ld	a, #0x06
                                    479 ; genCall
      008295 CD 81 87         [ 4]  480 	call	_display
                                    481 ;	./src/main.c: 89: display(DIGIT6, 0xF);
                                    482 ; genIPush
      008298 4B 0F            [ 1]  483 	push	#0x0f
                                    484 ; genSend
      00829A A6 07            [ 1]  485 	ld	a, #0x07
                                    486 ; genCall
      00829C CD 81 87         [ 4]  487 	call	_display
                                    488 ;	./src/main.c: 90: display(DIGIT7, 0xF);
                                    489 ; genIPush
      00829F 4B 0F            [ 1]  490 	push	#0x0f
                                    491 ; genSend
      0082A1 A6 08            [ 1]  492 	ld	a, #0x08
                                    493 ; genCall
      0082A3 CD 81 87         [ 4]  494 	call	_display
                                    495 ;	./src/main.c: 92: while(1){
                                    496 ; genLabel
      0082A6                        497 00108$:
                                    498 ;	./src/main.c: 94: if (vlastni_cas - time > 300){
                                    499 ; genMinus
      0082A6 CE 00 03         [ 2]  500 	ldw	x, _vlastni_cas+2
      0082A9 72 F0 07         [ 2]  501 	subw	x, (0x07, sp)
      0082AC 1F 03            [ 2]  502 	ldw	(0x03, sp), x
      0082AE C6 00 02         [ 1]  503 	ld	a, _vlastni_cas+1
      0082B1 12 06            [ 1]  504 	sbc	a, (0x06, sp)
      0082B3 6B 02            [ 1]  505 	ld	(0x02, sp), a
      0082B5 C6 00 01         [ 1]  506 	ld	a, _vlastni_cas+0
      0082B8 12 05            [ 1]  507 	sbc	a, (0x05, sp)
      0082BA 6B 01            [ 1]  508 	ld	(0x01, sp), a
                                    509 ; genCmp
                                    510 ; genCmpTnz
      0082BC AE 01 2C         [ 2]  511 	ldw	x, #0x012c
      0082BF 13 03            [ 2]  512 	cpw	x, (0x03, sp)
      0082C1 4F               [ 1]  513 	clr	a
      0082C2 12 02            [ 1]  514 	sbc	a, (0x02, sp)
      0082C4 4F               [ 1]  515 	clr	a
      0082C5 12 01            [ 1]  516 	sbc	a, (0x01, sp)
      0082C7 25 03            [ 1]  517 	jrc	00140$
      0082C9 CC 82 A6         [ 2]  518 	jp	00108$
      0082CC                        519 00140$:
                                    520 ; skipping generated iCode
                                    521 ;	./src/main.c: 95: time = vlastni_cas;
                                    522 ; genAssign
      0082CC CE 00 03         [ 2]  523 	ldw	x, _vlastni_cas+2
      0082CF 1F 07            [ 2]  524 	ldw	(0x07, sp), x
      0082D1 CE 00 01         [ 2]  525 	ldw	x, _vlastni_cas+0
      0082D4 1F 05            [ 2]  526 	ldw	(0x05, sp), x
                                    527 ;	./src/main.c: 96: display(DIGIT0, number);
                                    528 ; genIPush
      0082D6 7B 0B            [ 1]  529 	ld	a, (0x0b, sp)
      0082D8 88               [ 1]  530 	push	a
                                    531 ; genSend
      0082D9 A6 01            [ 1]  532 	ld	a, #0x01
                                    533 ; genCall
      0082DB CD 81 87         [ 4]  534 	call	_display
                                    535 ;	./src/main.c: 97: number ++;
                                    536 ; genPlus
      0082DE 0C 0B            [ 1]  537 	inc	(0x0b, sp)
                                    538 ;	./src/main.c: 99: if(number>9){
                                    539 ; genCmp
                                    540 ; genCmpTnz
      0082E0 7B 0B            [ 1]  541 	ld	a, (0x0b, sp)
      0082E2 A1 09            [ 1]  542 	cp	a, #0x09
      0082E4 22 03            [ 1]  543 	jrugt	00141$
      0082E6 CC 82 EB         [ 2]  544 	jp	00102$
      0082E9                        545 00141$:
                                    546 ; skipping generated iCode
                                    547 ;	./src/main.c: 100: number=0;
                                    548 ; genAssign
      0082E9 0F 0B            [ 1]  549 	clr	(0x0b, sp)
                                    550 ; genLabel
      0082EB                        551 00102$:
                                    552 ;	./src/main.c: 104: vysledek = number1/100;
                                    553 ; genCast
                                    554 ; genAssign
      0082EB 16 0C            [ 2]  555 	ldw	y, (0x0c, sp)
      0082ED 17 09            [ 2]  556 	ldw	(0x09, sp), y
                                    557 ; genDivMod
      0082EF 1E 09            [ 2]  558 	ldw	x, (0x09, sp)
      0082F1 90 AE 00 64      [ 2]  559 	ldw	y, #0x0064
      0082F5 65               [ 2]  560 	divw	x, y
      0082F6 9F               [ 1]  561 	ld	a, xl
                                    562 ; genCast
                                    563 ; genAssign
                                    564 ;	./src/main.c: 106: display(DIGIT6, vysledek);
                                    565 ; genIPush
      0082F7 88               [ 1]  566 	push	a
                                    567 ; genSend
      0082F8 A6 07            [ 1]  568 	ld	a, #0x07
                                    569 ; genCall
      0082FA CD 81 87         [ 4]  570 	call	_display
                                    571 ;	./src/main.c: 108: n= number1%100;
                                    572 ; genDivMod
      0082FD 1E 09            [ 2]  573 	ldw	x, (0x09, sp)
      0082FF 90 AE 00 64      [ 2]  574 	ldw	y, #0x0064
      008303 65               [ 2]  575 	divw	x, y
      008304 93               [ 1]  576 	ldw	x, y
                                    577 ; genCast
                                    578 ; genAssign
                                    579 ;	./src/main.c: 109: vysledek1 = n/10;
                                    580 ; genCast
                                    581 ; genAssign
                                    582 ; genDivMod
      008305 4F               [ 1]  583 	clr	a
      008306 95               [ 1]  584 	ld	xh, a
      008307 A6 0A            [ 1]  585 	ld	a, #0x0a
      008309 62               [ 2]  586 	div	x, a
      00830A 9F               [ 1]  587 	ld	a, xl
                                    588 ; genCast
                                    589 ; genAssign
                                    590 ;	./src/main.c: 111: display(DIGIT5, vysledek1);
                                    591 ; genIPush
      00830B 88               [ 1]  592 	push	a
                                    593 ; genSend
      00830C A6 06            [ 1]  594 	ld	a, #0x06
                                    595 ; genCall
      00830E CD 81 87         [ 4]  596 	call	_display
                                    597 ;	./src/main.c: 113: n= number1%10;
                                    598 ; genDivMod
      008311 1E 09            [ 2]  599 	ldw	x, (0x09, sp)
      008313 90 AE 00 0A      [ 2]  600 	ldw	y, #0x000a
      008317 65               [ 2]  601 	divw	x, y
      008318 90 9F            [ 1]  602 	ld	a, yl
                                    603 ; genCast
                                    604 ; genAssign
                                    605 ; genCast
                                    606 ; genAssign
                                    607 ;	./src/main.c: 114: display(DIGIT4, n);
                                    608 ; genCast
                                    609 ; genAssign
                                    610 ; genIPush
      00831A 88               [ 1]  611 	push	a
                                    612 ; genSend
      00831B A6 05            [ 1]  613 	ld	a, #0x05
                                    614 ; genCall
      00831D CD 81 87         [ 4]  615 	call	_display
                                    616 ;	./src/main.c: 116: number1 ++;
                                    617 ; genPlus
      008320 1E 0C            [ 2]  618 	ldw	x, (0x0c, sp)
      008322 5C               [ 1]  619 	incw	x
      008323 1F 0C            [ 2]  620 	ldw	(0x0c, sp), x
      008325                        621 00142$:
                                    622 ;	./src/main.c: 118: if(number1>999){
                                    623 ; genCast
                                    624 ; genAssign
      008325 1E 0C            [ 2]  625 	ldw	x, (0x0c, sp)
                                    626 ; genCmp
                                    627 ; genCmpTnz
      008327 A3 03 E7         [ 2]  628 	cpw	x, #0x03e7
      00832A 22 03            [ 1]  629 	jrugt	00143$
      00832C CC 82 A6         [ 2]  630 	jp	00108$
      00832F                        631 00143$:
                                    632 ; skipping generated iCode
                                    633 ;	./src/main.c: 119: number1 = 0;
                                    634 ; genAssign
      00832F 5F               [ 1]  635 	clrw	x
      008330 1F 0C            [ 2]  636 	ldw	(0x0c, sp), x
                                    637 ; genGoto
      008332 CC 82 A6         [ 2]  638 	jp	00108$
                                    639 ; genLabel
      008335                        640 00110$:
                                    641 ;	./src/main.c: 124: }
                                    642 ; genEndFunction
      008335 5B 0D            [ 2]  643 	addw	sp, #13
      008337 81               [ 4]  644 	ret
                                    645 	.area CODE
                                    646 	.area CONST
                                    647 	.area INITIALIZER
      008095                        648 __xinit__vlastni_cas:
      008095 00 00 00 00            649 	.byte #0x00, #0x00, #0x00, #0x00	; 0
                                    650 	.area CABS (ABS)
