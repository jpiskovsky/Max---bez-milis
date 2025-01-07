                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.1 #14865 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM2_ClearFlag
                                     13 	.globl _TRAP_IRQHandler
                                     14 	.globl _TLI_IRQHandler
                                     15 	.globl _AWU_IRQHandler
                                     16 	.globl _CLK_IRQHandler
                                     17 	.globl _EXTI_PORTA_IRQHandler
                                     18 	.globl _EXTI_PORTB_IRQHandler
                                     19 	.globl _EXTI_PORTC_IRQHandler
                                     20 	.globl _EXTI_PORTD_IRQHandler
                                     21 	.globl _EXTI_PORTE_IRQHandler
                                     22 	.globl _CAN_RX_IRQHandler
                                     23 	.globl _CAN_TX_IRQHandler
                                     24 	.globl _SPI_IRQHandler
                                     25 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     26 	.globl _TIM1_CAP_COM_IRQHandler
                                     27 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     28 	.globl _TIM2_CAP_COM_IRQHandler
                                     29 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     30 	.globl _TIM3_CAP_COM_IRQHandler
                                     31 	.globl _UART1_TX_IRQHandler
                                     32 	.globl _UART1_RX_IRQHandler
                                     33 	.globl _I2C_IRQHandler
                                     34 	.globl _UART3_TX_IRQHandler
                                     35 	.globl _UART3_RX_IRQHandler
                                     36 	.globl _ADC2_IRQHandler
                                     37 	.globl _TIM4_UPD_OVF_IRQHandler
                                     38 	.globl _EEPROM_EEC_IRQHandler
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DABS (ABS)
                                     51 
                                     52 ; default segment ordering for linker
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area CONST
                                     57 	.area INITIALIZER
                                     58 	.area CODE
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; global & static initialisations
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area GSINIT
                                     65 	.area GSFINAL
                                     66 	.area GSINIT
                                     67 ;--------------------------------------------------------
                                     68 ; Home
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
                                     71 	.area HOME
                                     72 ;--------------------------------------------------------
                                     73 ; code
                                     74 ;--------------------------------------------------------
                                     75 	.area CODE
                                     76 ;	./src/stm8s_it.c: 65: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     77 ; genLabel
                                     78 ;	-----------------------------------------
                                     79 ;	 function TRAP_IRQHandler
                                     80 ;	-----------------------------------------
                                     81 ;	Register assignment is optimal.
                                     82 ;	Stack space usage: 0 bytes.
      008379                         83 _TRAP_IRQHandler:
                                     84 ;	./src/stm8s_it.c: 70: }
                                     85 ; genLabel
      008379                         86 00101$:
                                     87 ; genEndFunction
      008379 80               [11]   88 	iret
                                     89 ;	./src/stm8s_it.c: 76: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     90 ; genLabel
                                     91 ;	-----------------------------------------
                                     92 ;	 function TLI_IRQHandler
                                     93 ;	-----------------------------------------
                                     94 ;	Register assignment is optimal.
                                     95 ;	Stack space usage: 0 bytes.
      00837A                         96 _TLI_IRQHandler:
                                     97 ;	./src/stm8s_it.c: 81: }
                                     98 ; genLabel
      00837A                         99 00101$:
                                    100 ; genEndFunction
      00837A 80               [11]  101 	iret
                                    102 ;	./src/stm8s_it.c: 88: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                    103 ; genLabel
                                    104 ;	-----------------------------------------
                                    105 ;	 function AWU_IRQHandler
                                    106 ;	-----------------------------------------
                                    107 ;	Register assignment is optimal.
                                    108 ;	Stack space usage: 0 bytes.
      00837B                        109 _AWU_IRQHandler:
                                    110 ;	./src/stm8s_it.c: 93: }
                                    111 ; genLabel
      00837B                        112 00101$:
                                    113 ; genEndFunction
      00837B 80               [11]  114 	iret
                                    115 ;	./src/stm8s_it.c: 100: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                    116 ; genLabel
                                    117 ;	-----------------------------------------
                                    118 ;	 function CLK_IRQHandler
                                    119 ;	-----------------------------------------
                                    120 ;	Register assignment is optimal.
                                    121 ;	Stack space usage: 0 bytes.
      00837C                        122 _CLK_IRQHandler:
                                    123 ;	./src/stm8s_it.c: 105: }
                                    124 ; genLabel
      00837C                        125 00101$:
                                    126 ; genEndFunction
      00837C 80               [11]  127 	iret
                                    128 ;	./src/stm8s_it.c: 112: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    129 ; genLabel
                                    130 ;	-----------------------------------------
                                    131 ;	 function EXTI_PORTA_IRQHandler
                                    132 ;	-----------------------------------------
                                    133 ;	Register assignment is optimal.
                                    134 ;	Stack space usage: 0 bytes.
      00837D                        135 _EXTI_PORTA_IRQHandler:
                                    136 ;	./src/stm8s_it.c: 117: }
                                    137 ; genLabel
      00837D                        138 00101$:
                                    139 ; genEndFunction
      00837D 80               [11]  140 	iret
                                    141 ;	./src/stm8s_it.c: 124: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    142 ; genLabel
                                    143 ;	-----------------------------------------
                                    144 ;	 function EXTI_PORTB_IRQHandler
                                    145 ;	-----------------------------------------
                                    146 ;	Register assignment is optimal.
                                    147 ;	Stack space usage: 0 bytes.
      00837E                        148 _EXTI_PORTB_IRQHandler:
                                    149 ;	./src/stm8s_it.c: 129: }
                                    150 ; genLabel
      00837E                        151 00101$:
                                    152 ; genEndFunction
      00837E 80               [11]  153 	iret
                                    154 ;	./src/stm8s_it.c: 136: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    155 ; genLabel
                                    156 ;	-----------------------------------------
                                    157 ;	 function EXTI_PORTC_IRQHandler
                                    158 ;	-----------------------------------------
                                    159 ;	Register assignment is optimal.
                                    160 ;	Stack space usage: 0 bytes.
      00837F                        161 _EXTI_PORTC_IRQHandler:
                                    162 ;	./src/stm8s_it.c: 141: }
                                    163 ; genLabel
      00837F                        164 00101$:
                                    165 ; genEndFunction
      00837F 80               [11]  166 	iret
                                    167 ;	./src/stm8s_it.c: 148: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    168 ; genLabel
                                    169 ;	-----------------------------------------
                                    170 ;	 function EXTI_PORTD_IRQHandler
                                    171 ;	-----------------------------------------
                                    172 ;	Register assignment is optimal.
                                    173 ;	Stack space usage: 0 bytes.
      008380                        174 _EXTI_PORTD_IRQHandler:
                                    175 ;	./src/stm8s_it.c: 153: }
                                    176 ; genLabel
      008380                        177 00101$:
                                    178 ; genEndFunction
      008380 80               [11]  179 	iret
                                    180 ;	./src/stm8s_it.c: 160: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    181 ; genLabel
                                    182 ;	-----------------------------------------
                                    183 ;	 function EXTI_PORTE_IRQHandler
                                    184 ;	-----------------------------------------
                                    185 ;	Register assignment is optimal.
                                    186 ;	Stack space usage: 0 bytes.
      008381                        187 _EXTI_PORTE_IRQHandler:
                                    188 ;	./src/stm8s_it.c: 165: }
                                    189 ; genLabel
      008381                        190 00101$:
                                    191 ; genEndFunction
      008381 80               [11]  192 	iret
                                    193 ;	./src/stm8s_it.c: 186: INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
                                    194 ; genLabel
                                    195 ;	-----------------------------------------
                                    196 ;	 function CAN_RX_IRQHandler
                                    197 ;	-----------------------------------------
                                    198 ;	Register assignment is optimal.
                                    199 ;	Stack space usage: 0 bytes.
      008382                        200 _CAN_RX_IRQHandler:
                                    201 ;	./src/stm8s_it.c: 191: }
                                    202 ; genLabel
      008382                        203 00101$:
                                    204 ; genEndFunction
      008382 80               [11]  205 	iret
                                    206 ;	./src/stm8s_it.c: 198: INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
                                    207 ; genLabel
                                    208 ;	-----------------------------------------
                                    209 ;	 function CAN_TX_IRQHandler
                                    210 ;	-----------------------------------------
                                    211 ;	Register assignment is optimal.
                                    212 ;	Stack space usage: 0 bytes.
      008383                        213 _CAN_TX_IRQHandler:
                                    214 ;	./src/stm8s_it.c: 203: }
                                    215 ; genLabel
      008383                        216 00101$:
                                    217 ; genEndFunction
      008383 80               [11]  218 	iret
                                    219 ;	./src/stm8s_it.c: 211: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    220 ; genLabel
                                    221 ;	-----------------------------------------
                                    222 ;	 function SPI_IRQHandler
                                    223 ;	-----------------------------------------
                                    224 ;	Register assignment is optimal.
                                    225 ;	Stack space usage: 0 bytes.
      008384                        226 _SPI_IRQHandler:
                                    227 ;	./src/stm8s_it.c: 216: }
                                    228 ; genLabel
      008384                        229 00101$:
                                    230 ; genEndFunction
      008384 80               [11]  231 	iret
                                    232 ;	./src/stm8s_it.c: 223: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    233 ; genLabel
                                    234 ;	-----------------------------------------
                                    235 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    236 ;	-----------------------------------------
                                    237 ;	Register assignment is optimal.
                                    238 ;	Stack space usage: 0 bytes.
      008385                        239 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    240 ;	./src/stm8s_it.c: 228: }
                                    241 ; genLabel
      008385                        242 00101$:
                                    243 ; genEndFunction
      008385 80               [11]  244 	iret
                                    245 ;	./src/stm8s_it.c: 235: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    246 ; genLabel
                                    247 ;	-----------------------------------------
                                    248 ;	 function TIM1_CAP_COM_IRQHandler
                                    249 ;	-----------------------------------------
                                    250 ;	Register assignment is optimal.
                                    251 ;	Stack space usage: 0 bytes.
      008386                        252 _TIM1_CAP_COM_IRQHandler:
                                    253 ;	./src/stm8s_it.c: 240: }
                                    254 ; genLabel
      008386                        255 00101$:
                                    256 ; genEndFunction
      008386 80               [11]  257 	iret
                                    258 ;	./src/stm8s_it.c: 272: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    259 ; genLabel
                                    260 ;	-----------------------------------------
                                    261 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    262 ;	-----------------------------------------
                                    263 ;	Register assignment is optimal.
                                    264 ;	Stack space usage: 0 bytes.
      008387                        265 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    266 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      008387 62               [ 2]  267 	div	x, a
                                    268 ;	./src/stm8s_it.c: 274: TIM2_ClearFlag(TIM2_FLAG_UPDATE);
                                    269 ; genSend
      008388 5F               [ 1]  270 	clrw	x
      008389 5C               [ 1]  271 	incw	x
                                    272 ; genCall
      00838A CD 86 AC         [ 4]  273 	call	_TIM2_ClearFlag
                                    274 ;	./src/stm8s_it.c: 275: vlastni_cas++;
                                    275 ; genPlus
      00838D CE 00 03         [ 2]  276 	ldw	x, _vlastni_cas+2
      008390 1C 00 01         [ 2]  277 	addw	x, #0x0001
      008393 90 CE 00 01      [ 2]  278 	ldw	y, _vlastni_cas+0
      008397 24 02            [ 1]  279 	jrnc	00103$
      008399 90 5C            [ 1]  280 	incw	y
      00839B                        281 00103$:
                                    282 ; genAssign
      00839B CF 00 03         [ 2]  283 	ldw	_vlastni_cas+2, x
      00839E 90 CF 00 01      [ 2]  284 	ldw	_vlastni_cas+0, y
                                    285 ; genLabel
      0083A2                        286 00101$:
                                    287 ;	./src/stm8s_it.c: 279: }
                                    288 ; genEndFunction
      0083A2 80               [11]  289 	iret
                                    290 ;	./src/stm8s_it.c: 287: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    291 ; genLabel
                                    292 ;	-----------------------------------------
                                    293 ;	 function TIM2_CAP_COM_IRQHandler
                                    294 ;	-----------------------------------------
                                    295 ;	Register assignment is optimal.
                                    296 ;	Stack space usage: 0 bytes.
      0083A3                        297 _TIM2_CAP_COM_IRQHandler:
                                    298 ;	./src/stm8s_it.c: 292: }
                                    299 ; genLabel
      0083A3                        300 00101$:
                                    301 ; genEndFunction
      0083A3 80               [11]  302 	iret
                                    303 ;	./src/stm8s_it.c: 302: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    304 ; genLabel
                                    305 ;	-----------------------------------------
                                    306 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    307 ;	-----------------------------------------
                                    308 ;	Register assignment is optimal.
                                    309 ;	Stack space usage: 0 bytes.
      0083A4                        310 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    311 ;	./src/stm8s_it.c: 307: }
                                    312 ; genLabel
      0083A4                        313 00101$:
                                    314 ; genEndFunction
      0083A4 80               [11]  315 	iret
                                    316 ;	./src/stm8s_it.c: 314: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    317 ; genLabel
                                    318 ;	-----------------------------------------
                                    319 ;	 function TIM3_CAP_COM_IRQHandler
                                    320 ;	-----------------------------------------
                                    321 ;	Register assignment is optimal.
                                    322 ;	Stack space usage: 0 bytes.
      0083A5                        323 _TIM3_CAP_COM_IRQHandler:
                                    324 ;	./src/stm8s_it.c: 319: }
                                    325 ; genLabel
      0083A5                        326 00101$:
                                    327 ; genEndFunction
      0083A5 80               [11]  328 	iret
                                    329 ;	./src/stm8s_it.c: 329: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
                                    330 ; genLabel
                                    331 ;	-----------------------------------------
                                    332 ;	 function UART1_TX_IRQHandler
                                    333 ;	-----------------------------------------
                                    334 ;	Register assignment is optimal.
                                    335 ;	Stack space usage: 0 bytes.
      0083A6                        336 _UART1_TX_IRQHandler:
                                    337 ;	./src/stm8s_it.c: 334: }
                                    338 ; genLabel
      0083A6                        339 00101$:
                                    340 ; genEndFunction
      0083A6 80               [11]  341 	iret
                                    342 ;	./src/stm8s_it.c: 341: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    343 ; genLabel
                                    344 ;	-----------------------------------------
                                    345 ;	 function UART1_RX_IRQHandler
                                    346 ;	-----------------------------------------
                                    347 ;	Register assignment is optimal.
                                    348 ;	Stack space usage: 0 bytes.
      0083A7                        349 _UART1_RX_IRQHandler:
                                    350 ;	./src/stm8s_it.c: 346: }
                                    351 ; genLabel
      0083A7                        352 00101$:
                                    353 ; genEndFunction
      0083A7 80               [11]  354 	iret
                                    355 ;	./src/stm8s_it.c: 354: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    356 ; genLabel
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_IRQHandler
                                    359 ;	-----------------------------------------
                                    360 ;	Register assignment is optimal.
                                    361 ;	Stack space usage: 0 bytes.
      0083A8                        362 _I2C_IRQHandler:
                                    363 ;	./src/stm8s_it.c: 359: }
                                    364 ; genLabel
      0083A8                        365 00101$:
                                    366 ; genEndFunction
      0083A8 80               [11]  367 	iret
                                    368 ;	./src/stm8s_it.c: 393: INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
                                    369 ; genLabel
                                    370 ;	-----------------------------------------
                                    371 ;	 function UART3_TX_IRQHandler
                                    372 ;	-----------------------------------------
                                    373 ;	Register assignment is optimal.
                                    374 ;	Stack space usage: 0 bytes.
      0083A9                        375 _UART3_TX_IRQHandler:
                                    376 ;	./src/stm8s_it.c: 398: }
                                    377 ; genLabel
      0083A9                        378 00101$:
                                    379 ; genEndFunction
      0083A9 80               [11]  380 	iret
                                    381 ;	./src/stm8s_it.c: 405: INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
                                    382 ; genLabel
                                    383 ;	-----------------------------------------
                                    384 ;	 function UART3_RX_IRQHandler
                                    385 ;	-----------------------------------------
                                    386 ;	Register assignment is optimal.
                                    387 ;	Stack space usage: 0 bytes.
      0083AA                        388 _UART3_RX_IRQHandler:
                                    389 ;	./src/stm8s_it.c: 410: }
                                    390 ; genLabel
      0083AA                        391 00101$:
                                    392 ; genEndFunction
      0083AA 80               [11]  393 	iret
                                    394 ;	./src/stm8s_it.c: 419: INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
                                    395 ; genLabel
                                    396 ;	-----------------------------------------
                                    397 ;	 function ADC2_IRQHandler
                                    398 ;	-----------------------------------------
                                    399 ;	Register assignment is optimal.
                                    400 ;	Stack space usage: 0 bytes.
      0083AB                        401 _ADC2_IRQHandler:
                                    402 ;	./src/stm8s_it.c: 425: return;
                                    403 ; genReturn
                                    404 ; genLabel
      0083AB                        405 00101$:
                                    406 ;	./src/stm8s_it.c: 427: }
                                    407 ; genEndFunction
      0083AB 80               [11]  408 	iret
                                    409 ;	./src/stm8s_it.c: 476: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    410 ; genLabel
                                    411 ;	-----------------------------------------
                                    412 ;	 function TIM4_UPD_OVF_IRQHandler
                                    413 ;	-----------------------------------------
                                    414 ;	Register assignment might be sub-optimal.
                                    415 ;	Stack space usage: 0 bytes.
      0083AC                        416 _TIM4_UPD_OVF_IRQHandler:
                                    417 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      0083AC 62               [ 2]  418 	div	x, a
                                    419 ;	./src/stm8s_it.c: 478: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
                                    420 ; genSend
      0083AD A6 01            [ 1]  421 	ld	a, #0x01
                                    422 ; genCall
      0083AF CD 87 32         [ 4]  423 	call	_TIM4_ClearFlag
                                    424 ;	./src/stm8s_it.c: 479: miliseconds++;
                                    425 ; genAssign
      0083B2 CE 00 07         [ 2]  426 	ldw	x, _miliseconds+2
      0083B5 90 CE 00 05      [ 2]  427 	ldw	y, _miliseconds+0
                                    428 ; genPlus
      0083B9 5C               [ 1]  429 	incw	x
      0083BA 26 02            [ 1]  430 	jrne	00103$
      0083BC 90 5C            [ 1]  431 	incw	y
      0083BE                        432 00103$:
                                    433 ; genAssign
      0083BE CF 00 07         [ 2]  434 	ldw	_miliseconds+2, x
      0083C1 90 CF 00 05      [ 2]  435 	ldw	_miliseconds+0, y
                                    436 ; genLabel
      0083C5                        437 00101$:
                                    438 ;	./src/stm8s_it.c: 480: }
                                    439 ; genEndFunction
      0083C5 80               [11]  440 	iret
                                    441 ;	./src/stm8s_it.c: 488: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    442 ; genLabel
                                    443 ;	-----------------------------------------
                                    444 ;	 function EEPROM_EEC_IRQHandler
                                    445 ;	-----------------------------------------
                                    446 ;	Register assignment is optimal.
                                    447 ;	Stack space usage: 0 bytes.
      0083C6                        448 _EEPROM_EEC_IRQHandler:
                                    449 ;	./src/stm8s_it.c: 493: }
                                    450 ; genLabel
      0083C6                        451 00101$:
                                    452 ; genEndFunction
      0083C6 80               [11]  453 	iret
                                    454 	.area CODE
                                    455 	.area CONST
                                    456 	.area INITIALIZER
                                    457 	.area CABS (ABS)
