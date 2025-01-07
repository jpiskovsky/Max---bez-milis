                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.1 #14865 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module milis
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_ITConfig
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_TimeBaseInit
                                     15 	.globl _ITC_SetSoftwarePriority
                                     16 	.globl _miliseconds
                                     17 	.globl _milis
                                     18 	.globl _init_milis
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
      000005                         27 _miliseconds::
      000005                         28 	.ds 4
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	./src/milis.c: 13: MILIS_PROTOTYPE
                                     59 ; genLabel
                                     60 ;	-----------------------------------------
                                     61 ;	 function milis
                                     62 ;	-----------------------------------------
                                     63 ;	Register assignment is optimal.
                                     64 ;	Stack space usage: 4 bytes.
      008338                         65 _milis:
      008338 52 04            [ 2]   66 	sub	sp, #4
                                     67 ;	./src/milis.c: 20: TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
                                     68 ; genIPush
      00833A 4B 00            [ 1]   69 	push	#0x00
                                     70 ; genSend
      00833C A6 01            [ 1]   71 	ld	a, #0x01
                                     72 ; genCall
      00833E CD 84 73         [ 4]   73 	call	_TIM4_ITConfig
                                     74 ;	./src/milis.c: 21: tmp = miliseconds;
                                     75 ; genAssign
      008341 CE 00 07         [ 2]   76 	ldw	x, _miliseconds+2
      008344 90 CE 00 05      [ 2]   77 	ldw	y, _miliseconds+0
      008348 17 01            [ 2]   78 	ldw	(0x01, sp), y
                                     79 ;	./src/milis.c: 22: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
                                     80 ; genIPush
      00834A 89               [ 2]   81 	pushw	x
      00834B 4B 01            [ 1]   82 	push	#0x01
                                     83 ; genSend
      00834D A6 01            [ 1]   84 	ld	a, #0x01
                                     85 ; genCall
      00834F CD 84 73         [ 4]   86 	call	_TIM4_ITConfig
      008352 85               [ 2]   87 	popw	x
                                     88 ;	./src/milis.c: 23: return tmp;
                                     89 ; genReturn
      008353 16 01            [ 2]   90 	ldw	y, (0x01, sp)
                                     91 ; genLabel
      008355                         92 00101$:
                                     93 ;	./src/milis.c: 24: }
                                     94 ; genEndFunction
      008355 5B 04            [ 2]   95 	addw	sp, #4
      008357 81               [ 4]   96 	ret
                                     97 ;	./src/milis.c: 27: void init_milis(void)
                                     98 ; genLabel
                                     99 ;	-----------------------------------------
                                    100 ;	 function init_milis
                                    101 ;	-----------------------------------------
                                    102 ;	Register assignment is optimal.
                                    103 ;	Stack space usage: 0 bytes.
      008358                        104 _init_milis:
                                    105 ;	./src/milis.c: 29: TIM4_TimeBaseInit(PRESCALER, PERIOD);       // (16MHz / 128) / 125 = 1000Hz
                                    106 ; genIPush
      008358 4B 7C            [ 1]  107 	push	#0x7c
                                    108 ; genSend
      00835A A6 07            [ 1]  109 	ld	a, #0x07
                                    110 ; genCall
      00835C CD 86 A0         [ 4]  111 	call	_TIM4_TimeBaseInit
                                    112 ;	./src/milis.c: 30: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
                                    113 ; genSend
      00835F A6 01            [ 1]  114 	ld	a, #0x01
                                    115 ; genCall
      008361 CD 87 32         [ 4]  116 	call	_TIM4_ClearFlag
                                    117 ;	./src/milis.c: 31: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
                                    118 ; genIPush
      008364 4B 01            [ 1]  119 	push	#0x01
                                    120 ; genSend
      008366 A6 01            [ 1]  121 	ld	a, #0x01
                                    122 ; genCall
      008368 CD 84 73         [ 4]  123 	call	_TIM4_ITConfig
                                    124 ;	./src/milis.c: 32: ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);     // nizka priorita preruseni
                                    125 ; genIPush
      00836B 4B 01            [ 1]  126 	push	#0x01
                                    127 ; genSend
      00836D A6 17            [ 1]  128 	ld	a, #0x17
                                    129 ; genCall
      00836F CD 85 9E         [ 4]  130 	call	_ITC_SetSoftwarePriority
                                    131 ;	./src/milis.c: 33: enableInterrupts();
                                    132 ;	genInline
      008372 9A               [ 1]  133 	rim
                                    134 ;	./src/milis.c: 34: TIM4_Cmd(ENABLE);
                                    135 ; genSend
      008373 A6 01            [ 1]  136 	ld	a, #0x01
                                    137 ; genCall
      008375 CC 85 6D         [ 2]  138 	jp	_TIM4_Cmd
                                    139 ; genLabel
      008378                        140 00101$:
                                    141 ;	./src/milis.c: 35: }
                                    142 ; genEndFunction
      008378 81               [ 4]  143 	ret
                                    144 	.area CODE
                                    145 	.area CONST
                                    146 	.area INITIALIZER
      008099                        147 __xinit__miliseconds:
      008099 00 00 00 00            148 	.byte #0x00, #0x00, #0x00, #0x00	; 0
                                    149 	.area CABS (ABS)
