;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14865 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM2_init
	.globl _display
	.globl _TIM2_ClearFlag
	.globl _TIM2_ITConfig
	.globl _TIM2_Cmd
	.globl _TIM2_TimeBaseInit
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_PeripheralClockConfig
	.globl _vlastni_cas
	.globl _init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_vlastni_cas::
	.ds 4
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int _CAN_RX_IRQHandler ; int8
	int _CAN_TX_IRQHandler ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int _UART1_TX_IRQHandler ; int17
	int _UART1_RX_IRQHandler ; int18
	int _I2C_IRQHandler ; int19
	int _UART3_TX_IRQHandler ; int20
	int _UART3_RX_IRQHandler ; int21
	int _ADC2_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./src/main.c: 13: void init(void) {
; genLabel
;	-----------------------------------------
;	 function init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_init:
;	./src/main.c: 14: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovani MCU na 16MHz
; genSend
	clr	a
; genCall
	call	_CLK_HSIPrescalerConfig
;	./src/main.c: 16: GPIO_Init(DIN_PORT, DIN_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x04
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	./src/main.c: 17: GPIO_Init(CS_PORT, CS_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
; genIPush
	push	#0xd0
; genSend
	ld	a, #0x02
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	./src/main.c: 18: GPIO_Init(CLK_PORT, CLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
; genLabel
00101$:
;	./src/main.c: 21: }
; genEndFunction
	ret
;	./src/main.c: 25: void display(uint8_t address, uint8_t data) {
; genLabel
;	-----------------------------------------
;	 function display
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 2 bytes.
_display:
	pushw	x
; genReceive
	ld	(0x01, sp), a
;	./src/main.c: 27: LOW(CS); // začátek přenosu
; genSend
	ld	a, #0x02
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
;	./src/main.c: 32: mask = 0b10000000;
; genAssign
	ld	a, #0x80
	ld	(0x02, sp), a
;	./src/main.c: 33: while (mask) {
; genLabel
00104$:
; genIfx
	tnz	(0x02, sp)
	jrne	00157$
	jp	00106$
00157$:
;	./src/main.c: 34: if (address & mask) {
; genAnd
	ld	a, (0x01, sp)
	and	a, (0x02, sp)
; genIfx
	tnz	a
	jrne	00158$
	jp	00102$
00158$:
;	./src/main.c: 35: HIGH(DIN);
; genSend
	ld	a, #0x04
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00103$
; genLabel
00102$:
;	./src/main.c: 37: LOW(DIN);
; genSend
	ld	a, #0x04
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genLabel
00103$:
;	./src/main.c: 39: HIGH(CLK);
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
;	./src/main.c: 40: mask = mask >> 1;
; genRightShiftLiteral
	srl	(0x02, sp)
;	./src/main.c: 41: LOW(CLK);
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genGoto
	jp	00104$
; genLabel
00106$:
;	./src/main.c: 44: mask = 0b10000000;
; genAssign
	ld	a, #0x80
	ld	(0x02, sp), a
;	./src/main.c: 45: while (mask) {
; genLabel
00110$:
; genIfx
	tnz	(0x02, sp)
	jrne	00159$
	jp	00112$
00159$:
;	./src/main.c: 46: if (data & mask) {
; genAnd
	ld	a, (0x05, sp)
	and	a, (0x02, sp)
; genIfx
	tnz	a
	jrne	00160$
	jp	00108$
00160$:
;	./src/main.c: 47: HIGH(DIN);
; genSend
	ld	a, #0x04
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00109$
; genLabel
00108$:
;	./src/main.c: 49: LOW(DIN);
; genSend
	ld	a, #0x04
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genLabel
00109$:
;	./src/main.c: 51: HIGH(CLK);
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
;	./src/main.c: 52: mask = mask >> 1;
; genRightShiftLiteral
	srl	(0x02, sp)
;	./src/main.c: 53: LOW(CLK);
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genGoto
	jp	00110$
; genLabel
00112$:
;	./src/main.c: 56: HIGH(CS); // konec přenosu
; genSend
	ld	a, #0x02
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
; genLabel
00113$:
;	./src/main.c: 57: }
; genEndFunction
	popw	x
	popw	x
	pop	a
	jp	(x)
;	./src/main.c: 58: void TIM2_init(void)
; genLabel
;	-----------------------------------------
;	 function TIM2_init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM2_init:
;	./src/main.c: 60: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x05
; genCall
	call	_CLK_PeripheralClockConfig
;	./src/main.c: 61: TIM2_TimeBaseInit(TIM2_PRESCALER_16,999);
; genSend
	ldw	x, #0x03e7
; genSend
	ld	a, #0x04
; genCall
	call	_TIM2_TimeBaseInit
;	./src/main.c: 62: TIM2_ClearFlag(TIM2_FLAG_UPDATE);
; genSend
	clrw	x
	incw	x
; genCall
	call	_TIM2_ClearFlag
;	./src/main.c: 63: TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x01
; genCall
	call	_TIM2_ITConfig
;	./src/main.c: 64: TIM2_Cmd(ENABLE);
; genSend
	ld	a, #0x01
; genCall
	jp	_TIM2_Cmd
; genLabel
00101$:
;	./src/main.c: 65: }
; genEndFunction
	ret
;	./src/main.c: 67: int main(void) {
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 13 bytes.
_main:
	sub	sp, #13
;	./src/main.c: 69: uint32_t time = 0;
; genAssign
	clrw	x
	ldw	(0x07, sp), x
	ldw	(0x05, sp), x
;	./src/main.c: 70: uint8_t number = 0;
; genAssign
	clr	(0x0b, sp)
;	./src/main.c: 71: uint16_t number1 = 000;
; genAssign
	clrw	x
	ldw	(0x0c, sp), x
;	./src/main.c: 75: init();
; genCall
	call	_init
;	./src/main.c: 76: TIM2_init();
; genCall
	call	_TIM2_init
;	./src/main.c: 78: display(DECODE_MODE, 0b11111111);
; genIPush
	push	#0xff
; genSend
	ld	a, #0x09
; genCall
	call	_display
;	./src/main.c: 79: display(SCAN_LIMIT, 7);
; genIPush
	push	#0x07
; genSend
	ld	a, #0x0b
; genCall
	call	_display
;	./src/main.c: 80: display(INTENSITY, 1);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x0a
; genCall
	call	_display
;	./src/main.c: 81: display(DISPLAY_TEST, DISPLAY_TEST_OFF);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x0f
; genCall
	call	_display
;	./src/main.c: 82: display(SHUTDOWN, SHUTDOWN_ON);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x0c
; genCall
	call	_display
;	./src/main.c: 83: display(DIGIT0, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x01
; genCall
	call	_display
;	./src/main.c: 84: display(DIGIT1, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x02
; genCall
	call	_display
;	./src/main.c: 85: display(DIGIT2, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x03
; genCall
	call	_display
;	./src/main.c: 86: display(DIGIT3, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x04
; genCall
	call	_display
;	./src/main.c: 87: display(DIGIT4, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x05
; genCall
	call	_display
;	./src/main.c: 88: display(DIGIT5, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x06
; genCall
	call	_display
;	./src/main.c: 89: display(DIGIT6, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x07
; genCall
	call	_display
;	./src/main.c: 90: display(DIGIT7, 0xF);
; genIPush
	push	#0x0f
; genSend
	ld	a, #0x08
; genCall
	call	_display
;	./src/main.c: 92: while(1){
; genLabel
00108$:
;	./src/main.c: 94: if (vlastni_cas - time > 300){
; genMinus
	ldw	x, _vlastni_cas+2
	subw	x, (0x07, sp)
	ldw	(0x03, sp), x
	ld	a, _vlastni_cas+1
	sbc	a, (0x06, sp)
	ld	(0x02, sp), a
	ld	a, _vlastni_cas+0
	sbc	a, (0x05, sp)
	ld	(0x01, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x012c
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrc	00140$
	jp	00108$
00140$:
; skipping generated iCode
;	./src/main.c: 95: time = vlastni_cas;
; genAssign
	ldw	x, _vlastni_cas+2
	ldw	(0x07, sp), x
	ldw	x, _vlastni_cas+0
	ldw	(0x05, sp), x
;	./src/main.c: 96: display(DIGIT0, number);
; genIPush
	ld	a, (0x0b, sp)
	push	a
; genSend
	ld	a, #0x01
; genCall
	call	_display
;	./src/main.c: 97: number ++;
; genPlus
	inc	(0x0b, sp)
;	./src/main.c: 99: if(number>9){
; genCmp
; genCmpTnz
	ld	a, (0x0b, sp)
	cp	a, #0x09
	jrugt	00141$
	jp	00102$
00141$:
; skipping generated iCode
;	./src/main.c: 100: number=0;
; genAssign
	clr	(0x0b, sp)
; genLabel
00102$:
;	./src/main.c: 104: vysledek = number1/100;
; genCast
; genAssign
	ldw	y, (0x0c, sp)
	ldw	(0x09, sp), y
; genDivMod
	ldw	x, (0x09, sp)
	ldw	y, #0x0064
	divw	x, y
	ld	a, xl
; genCast
; genAssign
;	./src/main.c: 106: display(DIGIT6, vysledek);
; genIPush
	push	a
; genSend
	ld	a, #0x07
; genCall
	call	_display
;	./src/main.c: 108: n= number1%100;
; genDivMod
	ldw	x, (0x09, sp)
	ldw	y, #0x0064
	divw	x, y
	ldw	x, y
; genCast
; genAssign
;	./src/main.c: 109: vysledek1 = n/10;
; genCast
; genAssign
; genDivMod
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
; genCast
; genAssign
;	./src/main.c: 111: display(DIGIT5, vysledek1);
; genIPush
	push	a
; genSend
	ld	a, #0x06
; genCall
	call	_display
;	./src/main.c: 113: n= number1%10;
; genDivMod
	ldw	x, (0x09, sp)
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
; genCast
; genAssign
; genCast
; genAssign
;	./src/main.c: 114: display(DIGIT4, n);
; genCast
; genAssign
; genIPush
	push	a
; genSend
	ld	a, #0x05
; genCall
	call	_display
;	./src/main.c: 116: number1 ++;
; genPlus
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0c, sp), x
00142$:
;	./src/main.c: 118: if(number1>999){
; genCast
; genAssign
	ldw	x, (0x0c, sp)
; genCmp
; genCmpTnz
	cpw	x, #0x03e7
	jrugt	00143$
	jp	00108$
00143$:
; skipping generated iCode
;	./src/main.c: 119: number1 = 0;
; genAssign
	clrw	x
	ldw	(0x0c, sp), x
; genGoto
	jp	00108$
; genLabel
00110$:
;	./src/main.c: 124: }
; genEndFunction
	addw	sp, #13
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__vlastni_cas:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
	.area CABS (ABS)
