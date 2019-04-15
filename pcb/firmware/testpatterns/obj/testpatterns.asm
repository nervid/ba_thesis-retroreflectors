;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Sun May 20 14:29:50 2018
;--------------------------------------------------------
	.module testpatterns
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _send_frame
	.globl _calcCRC
	.globl _send_data
	.globl _switch_mode
	.globl _display_mode
	.globl __delay
	.globl __delay_long
	.globl _spi_txonly_transmit
	.globl _spi_txonly_start
	.globl _clk_set_cpudiv
	.globl _clk_set_hsidiv
	.globl _clk_set_source_auto
	.globl _gpio_mode
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_send_data_data_cnt_1_24:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
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
;	testpatterns.c: 109: static data_cnt = 0;
	clrw	x
	ldw	_send_data_data_cnt_1_24+0, x
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
;	testpatterns.c: 32: void _delay_long(){
;	-----------------------------------------
;	 function _delay_long
;	-----------------------------------------
__delay_long:
	sub	sp, #4
;	testpatterns.c: 35: for(x=0;x<50000;x++);
	ldw	x, #0xc350
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
00104$:
	ldw	y, (0x03, sp)
	subw	y, #0x0001
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	tnzw	y
	jrne	00104$
	tnzw	x
	jrne	00104$
	addw	sp, #4
	ret
;	testpatterns.c: 38: void _delay(){
;	-----------------------------------------
;	 function _delay
;	-----------------------------------------
__delay:
	sub	sp, #8
;	testpatterns.c: 41: for(x=0;x<50;x++);
	ldw	x, #0x0032
	ldw	(0x03, sp), x
	clrw	y
00104$:
	ldw	x, (0x03, sp)
	subw	x, #0x0001
	ld	a, yl
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	a, yh
	sbc	a, #0x00
	ld	(0x05, sp), a
	ldw	(0x03, sp), x
	ldw	y, (0x05, sp)
	tnzw	x
	jrne	00104$
	ldw	x, (0x05, sp)
	jrne	00104$
	addw	sp, #8
	ret
;	testpatterns.c: 44: void display_mode(pattern_mode_t mode)
;	-----------------------------------------
;	 function display_mode
;	-----------------------------------------
_display_mode:
;	testpatterns.c: 48: leds = gpiod->odr & ~(0x1E); // blank leds
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xe1
;	testpatterns.c: 50: switch(mode){
	rlwa	x
	ld	a, (0x03, sp)
	rrwa	x
	push	a
	ld	a, xh
	cp	a, #0x00
	pop	a
	jreq	00101$
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x01
	pop	a
	jreq	00102$
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x02
	pop	a
	jreq	00103$
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x03
	pop	a
	jreq	00104$
	jra	00106$
;	testpatterns.c: 51: case pattern_mode_clk:
00101$:
;	testpatterns.c: 52: leds |= 1<<2;
	or	a, #0x04
;	testpatterns.c: 53: break;
	jra	00106$
;	testpatterns.c: 55: case pattern_mode_3byte:
00102$:
;	testpatterns.c: 56: leds |= 1<<3;
	or	a, #0x08
;	testpatterns.c: 57: break;
	jra	00106$
;	testpatterns.c: 59: case pattern_mode_2byte:
00103$:
;	testpatterns.c: 60: leds |= 1<<4;
	or	a, #0x10
;	testpatterns.c: 61: break;
	jra	00106$
;	testpatterns.c: 63: case pattern_mode_1byte:
00104$:
;	testpatterns.c: 64: leds |= 1<<5;
	or	a, #0x20
;	testpatterns.c: 70: }
00106$:
;	testpatterns.c: 72: LED1_PORT->odr = leds;
	ldw	x, #0x500f
	ld	(x), a
	ret
;	testpatterns.c: 75: pattern_mode_t switch_mode(pattern_mode_t mode)
;	-----------------------------------------
;	 function switch_mode
;	-----------------------------------------
_switch_mode:
;	testpatterns.c: 78: if((gpiob->idr & (1<<4)) == 0){
	ldw	x, #0x5006
	ld	a, (x)
	bcp	a, #0x10
	jrne	00108$
;	testpatterns.c: 79: switch(mode){
	ld	a, (0x03, sp)
	cp	a, #0x00
	jreq	00101$
	ld	a, (0x03, sp)
	cp	a, #0x01
	jreq	00102$
	ld	a, (0x03, sp)
	cp	a, #0x02
	jreq	00103$
	ld	a, (0x03, sp)
	cp	a, #0x03
	jreq	00104$
	jra	00105$
;	testpatterns.c: 80: case pattern_mode_clk:
00101$:
;	testpatterns.c: 81: mode = pattern_mode_3byte;
	ld	a, #0x01
	ld	(0x03, sp), a
;	testpatterns.c: 82: break;
	jra	00108$
;	testpatterns.c: 84: case pattern_mode_3byte:
00102$:
;	testpatterns.c: 85: mode = pattern_mode_2byte;
	ld	a, #0x02
	ld	(0x03, sp), a
;	testpatterns.c: 86: break;
	jra	00108$
;	testpatterns.c: 88: case pattern_mode_2byte:
00103$:
;	testpatterns.c: 89: mode = pattern_mode_1byte;
	ld	a, #0x03
	ld	(0x03, sp), a
;	testpatterns.c: 90: break;
	jra	00108$
;	testpatterns.c: 92: case pattern_mode_1byte:
00104$:
;	testpatterns.c: 93: mode = pattern_mode_clk;
	clr	(0x03, sp)
;	testpatterns.c: 94: break;
	jra	00108$
;	testpatterns.c: 96: default:
00105$:
;	testpatterns.c: 97: mode = pattern_mode_clk;
	clr	(0x03, sp)
;	testpatterns.c: 99: }
00108$:
;	testpatterns.c: 102: return mode;
	ld	a, (0x03, sp)
	ret
;	testpatterns.c: 105: void send_data(pattern_mode_t mode)
;	-----------------------------------------
;	 function send_data
;	-----------------------------------------
_send_data:
	sub	sp, #10
;	testpatterns.c: 108: const uint8_t data[8] = {0xAA, 0xA7, 0x12, 'T', 'E', 'S', 'T', 0xAA};
	ldw	x, sp
	incw	x
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	ld	a, #0xaa
	ld	(x), a
	ldw	x, (0x09, sp)
	incw	x
	ld	a, #0xa7
	ld	(x), a
	ldw	x, (0x09, sp)
	incw	x
	incw	x
	ld	a, #0x12
	ld	(x), a
	ldw	x, (0x09, sp)
	ld	a, #0x54
	ld	(0x0003, x), a
	ldw	x, (0x09, sp)
	ld	a, #0x45
	ld	(0x0004, x), a
	ldw	x, (0x09, sp)
	ld	a, #0x53
	ld	(0x0005, x), a
	ldw	x, (0x09, sp)
	ld	a, #0x54
	ld	(0x0006, x), a
	ldw	x, (0x09, sp)
	addw	x, #0x0007
	ld	a, #0xaa
	ld	(x), a
;	testpatterns.c: 111: switch(mode){
	ld	a, (0x0d, sp)
	cp	a, #0x00
	jreq	00101$
	ld	a, (0x0d, sp)
	cp	a, #0x01
	jreq	00102$
	jra	00107$
;	testpatterns.c: 112: case pattern_mode_clk:
00101$:
;	testpatterns.c: 114: spi_txonly_transmit(0xAA);
	push	#0xaa
	call	_spi_txonly_transmit
	pop	a
;	testpatterns.c: 115: break;
	jra	00107$
;	testpatterns.c: 117: case pattern_mode_3byte:
00102$:
;	testpatterns.c: 118: spi_txonly_transmit(data[data_cnt]);
	ldw	x, (0x09, sp)
	addw	x, _send_data_data_cnt_1_24+0
	ld	a, (x)
	push	a
	call	_spi_txonly_transmit
	pop	a
;	testpatterns.c: 119: data_cnt++;
	ldw	x, _send_data_data_cnt_1_24+0
	incw	x
;	testpatterns.c: 121: if(data_cnt > 7){
	ldw	_send_data_data_cnt_1_24+0, x
	cpw	x, #0x0007
	jrsle	00107$
;	testpatterns.c: 122: data_cnt = 0;
	clrw	x
	ldw	_send_data_data_cnt_1_24+0, x
;	testpatterns.c: 128: }
00107$:
	addw	sp, #10
	ret
;	testpatterns.c: 133: char calcCRC(char *data, int length)
;	-----------------------------------------
;	 function calcCRC
;	-----------------------------------------
_calcCRC:
	sub	sp, #6
;	testpatterns.c: 135: int crc = 0;
	clrw	x
	ldw	(0x05, sp), x
;	testpatterns.c: 138: for(j=0; j < length; j++)
	clrw	x
	ldw	(0x01, sp), x
00109$:
	ldw	x, (0x01, sp)
	cpw	x, (0x0b, sp)
	jrsge	00104$
;	testpatterns.c: 140: crc ^= (data[j] << 8);
	ldw	x, (0x09, sp)
	addw	x, (0x01, sp)
	ld	a, (x)
	ld	xh, a
	rlc	a
	clr	a
	sbc	a, #0x00
	clr	a
	xor	a, (0x06, sp)
	rlwa	x
	xor	a, (0x05, sp)
	ld	xh, a
	ldw	(0x05, sp), x
;	testpatterns.c: 142: for(i=0;i<8;i++)
	ldw	x, #0x0008
	ldw	(0x03, sp), x
00107$:
;	testpatterns.c: 144: if((crc & 0x8000) != 0)
	ldw	x, (0x05, sp)
	tnzw	x
	jrpl	00102$
;	testpatterns.c: 145: crc ^= (0x1070 << 3);
	ld	a, (0x06, sp)
	xor	a, #0x80
	ld	xl, a
	ld	a, (0x05, sp)
	xor	a, #0x83
	ld	xh, a
	ldw	(0x05, sp), x
00102$:
;	testpatterns.c: 147: crc <<= 1;
	ldw	x, (0x05, sp)
	sllw	x
	ldw	(0x05, sp), x
	ldw	x, (0x03, sp)
	decw	x
	ldw	(0x03, sp), x
;	testpatterns.c: 142: for(i=0;i<8;i++)
	tnzw	x
	jrne	00107$
;	testpatterns.c: 138: for(j=0; j < length; j++)
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00109$
00104$:
;	testpatterns.c: 151: return (char)(crc >> 8);
	ldw	x, (0x05, sp)
	clr	a
	tnzw	x
	jrpl	00137$
	dec	a
00137$:
	rrwa	x
	ld	a, xl
	addw	sp, #6
	ret
;	testpatterns.c: 155: void send_frame(uint8_t *data, uint8_t id){
;	-----------------------------------------
;	 function send_frame
;	-----------------------------------------
_send_frame:
	sub	sp, #17
;	testpatterns.c: 157: uint8_t frame[9] = {0xAA, 0xA7, 0x12}; // insert preamble
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0xaa
	ld	(x), a
	ldw	x, (0x0c, sp)
	incw	x
	ld	a, #0xa7
	ld	(x), a
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ld	a, #0x12
	ld	(x), a
	ldw	y, (0x0c, sp)
	addw	y, #0x0003
	clr	(y)
	ldw	x, (0x0c, sp)
	addw	x, #0x0004
	clr	(x)
	ldw	x, (0x0c, sp)
	addw	x, #0x0005
	clr	(x)
	ldw	x, (0x0c, sp)
	addw	x, #0x0006
	clr	(x)
	ldw	x, (0x0c, sp)
	addw	x, #0x0007
	clr	(x)
	ldw	x, (0x0c, sp)
	addw	x, #0x0008
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	clr	(x)
;	testpatterns.c: 158: frame[3] = id;
	ld	a, (0x16, sp)
	ld	(y), a
;	testpatterns.c: 160: for(i = 0; i<4; i++){
	clr	(0x0b, sp)
00104$:
;	testpatterns.c: 161: frame[4+i] = data[i];
	ld	a, (0x0b, sp)
	add	a, #0x04
	ld	xl, a
	clr	a
	ld	xh, a
	addw	x, (0x0c, sp)
	ldw	(0x0e, sp), x
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	addw	x, (0x14, sp)
	ld	a, (x)
	ldw	x, (0x0e, sp)
	ld	(x), a
;	testpatterns.c: 160: for(i = 0; i<4; i++){
	inc	(0x0b, sp)
	ld	a, (0x0b, sp)
	cp	a, #0x04
	jrc	00104$
;	testpatterns.c: 163: frame[8] = calcCRC(&frame[3],5); 
	push	#0x05
	push	#0x00
	pushw	y
	call	_calcCRC
	addw	sp, #4
	ldw	x, (0x10, sp)
	ld	(x), a
;	testpatterns.c: 165: for(j=0;j<10;j++){
	clr	(0x0a, sp)
;	testpatterns.c: 166: for(i = 0; i<9; i++){
00114$:
	clr	(0x0b, sp)
00106$:
;	testpatterns.c: 167: spi_txonly_transmit(frame[i]);
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	addw	x, (0x0c, sp)
	ld	a, (x)
	push	a
	call	_spi_txonly_transmit
	pop	a
;	testpatterns.c: 166: for(i = 0; i<9; i++){
	inc	(0x0b, sp)
	ld	a, (0x0b, sp)
	cp	a, #0x09
	jrc	00106$
;	testpatterns.c: 165: for(j=0;j<10;j++){
	inc	(0x0a, sp)
	ld	a, (0x0a, sp)
	cp	a, #0x0a
	jrc	00114$
	addw	sp, #17
	ret
;	testpatterns.c: 174: int main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #6
;	testpatterns.c: 179: const uint8_t data[4] = {'T', 'E', 'S', 'T'};
	ldw	x, sp
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ld	a, #0x54
	ld	(x), a
	ldw	x, (0x05, sp)
	incw	x
	ld	a, #0x45
	ld	(x), a
	ldw	x, (0x05, sp)
	incw	x
	incw	x
	ld	a, #0x53
	ld	(x), a
	ldw	x, (0x05, sp)
	addw	x, #0x0003
	ld	a, #0x54
	ld	(x), a
;	testpatterns.c: 181: clk_set_source_auto(clk_source_hsi);
	push	#0xe1
	call	_clk_set_source_auto
	pop	a
;	testpatterns.c: 182: clk_set_cpudiv(clk_cpudiv_1);
	push	#0x00
	call	_clk_set_cpudiv
	pop	a
;	testpatterns.c: 183: clk_set_hsidiv(clk_hsidiv_8);
	push	#0x03
	call	_clk_set_hsidiv
	pop	a
;	testpatterns.c: 187: gpio_mode(LED1_PORT,1<<2,gpio_mode_out_pp); // set up led pin as push-pull output
	push	#0x05
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 188: gpio_mode(LED2_PORT,1<<3,gpio_mode_out_pp);
	push	#0x05
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 189: gpio_mode(LED3_PORT,1<<4,gpio_mode_out_pp);
	push	#0x05
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 190: gpio_mode(LED4_PORT,1<<5,gpio_mode_out_pp);
	push	#0x05
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 192: gpio_mode(BUTTON_PORT,BUTTON_PIN,gpio_mode_in);
	push	#0x00
	push	#0x04
	push	#0x05
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 194: gpio_mode(MOSI_PORT, MOSI_PIN, gpio_mode_out_pp);
	push	#0x05
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_gpio_mode
	addw	sp, #4
;	testpatterns.c: 197: spi_txonly_start();
	call	_spi_txonly_start
;	testpatterns.c: 198: while(1){
	clr	a
00102$:
;	testpatterns.c: 208: id++;
	inc	a
;	testpatterns.c: 215: send_frame(data,id);
	ldw	x, (0x05, sp)
	push	a
	push	a
	pushw	x
	call	_send_frame
	addw	sp, #3
	pop	a
	jra	00102$
	addw	sp, #6
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
