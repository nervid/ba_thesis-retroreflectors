;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Sat May 12 12:35:37 2018
;--------------------------------------------------------
	.module gpio
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gpio_set
	.globl _gpio_clr
	.globl _gpio_mode
	.globl _gpio_toggle
	.globl _gpio_read
	.globl _gpio_write_port
	.globl _gpio_read_port
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../../../../ulibSTM8/lib/gpio.c: 4: void gpio_set(gpio_t* port, gpio_pin_t pin)
;	-----------------------------------------
;	 function gpio_set
;	-----------------------------------------
_gpio_set:
;	../../../../ulibSTM8/lib/gpio.c: 6: port->odr |= pin;
	ldw	x, (0x03, sp)
	ld	a, (x)
	or	a, (0x05, sp)
	ld	(x), a
	ret
;	../../../../ulibSTM8/lib/gpio.c: 9: void gpio_clr(gpio_t* port, gpio_pin_t pin)
;	-----------------------------------------
;	 function gpio_clr
;	-----------------------------------------
_gpio_clr:
	push	a
;	../../../../ulibSTM8/lib/gpio.c: 11: port->odr &= ~pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	(x), a
	pop	a
	ret
;	../../../../ulibSTM8/lib/gpio.c: 15: void gpio_mode(gpio_t* port, gpio_pin_t pin, gpio_mode_t mode){
;	-----------------------------------------
;	 function gpio_mode
;	-----------------------------------------
_gpio_mode:
	sub	sp, #7
;	../../../../ulibSTM8/lib/gpio.c: 17: switch (mode) {
	ld	a, (0x0d, sp)
	cp	a, #0x07
	jrule	00117$
	jp	00111$
00117$:
;	../../../../ulibSTM8/lib/gpio.c: 20: port->ddr &= ~pin;
	ldw	y, (0x0a, sp)
	ldw	(0x06, sp), y
	ld	a, (0x0c, sp)
	cpl	a
	ld	(0x03, sp), a
	ldw	x, (0x06, sp)
	incw	x
	incw	x
	ldw	(0x01, sp), x
;	../../../../ulibSTM8/lib/gpio.c: 21: port->cr1 &= ~pin;
	ldw	y, (0x06, sp)
	addw	y, #0x0003
;	../../../../ulibSTM8/lib/gpio.c: 22: port->cr2 &= ~pin;
	ldw	x, (0x06, sp)
	addw	x, #0x0004
	ldw	(0x04, sp), x
;	../../../../ulibSTM8/lib/gpio.c: 17: switch (mode) {
	clrw	x
	ld	a, (0x0d, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00118$, x)
	jp	(x)
00118$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
	.dw	#00106$
	.dw	#00107$
	.dw	#00108$
;	../../../../ulibSTM8/lib/gpio.c: 19: case gpio_mode_in: {
00101$:
;	../../../../ulibSTM8/lib/gpio.c: 20: port->ddr &= ~pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 21: port->cr1 &= ~pin;
	ld	a, (y)
	and	a, (0x03, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 22: port->cr2 &= ~pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 23: break;
	jp	00111$
;	../../../../ulibSTM8/lib/gpio.c: 25: case gpio_mode_in_pup: {
00102$:
;	../../../../ulibSTM8/lib/gpio.c: 26: port->ddr &= ~pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 27: port->cr1 |= pin;
	ld	a, (y)
	or	a, (0x0c, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 28: port->cr2 &= ~pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 29: break;
	jp	00111$
;	../../../../ulibSTM8/lib/gpio.c: 31: case gpio_mode_in_int: {
00103$:
;	../../../../ulibSTM8/lib/gpio.c: 32: port->ddr &= ~pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 33: port->cr1 &= ~pin;
	ld	a, (y)
	and	a, (0x03, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 34: port->cr2 |= pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 35: break;
	jra	00111$
;	../../../../ulibSTM8/lib/gpio.c: 37: case gpio_mode_in_int_pup: {
00104$:
;	../../../../ulibSTM8/lib/gpio.c: 38: port->ddr &= ~pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 39: port->cr1 |= pin;
	ld	a, (y)
	or	a, (0x0c, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 40: port->cr2 |= pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 41: break;
	jra	00111$
;	../../../../ulibSTM8/lib/gpio.c: 44: case gpio_mode_out_od: {
00105$:
;	../../../../ulibSTM8/lib/gpio.c: 45: port->ddr |= pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 46: port->cr1 &= ~pin;
	ld	a, (y)
	and	a, (0x03, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 47: port->cr2 &= ~pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 48: break;
	jra	00111$
;	../../../../ulibSTM8/lib/gpio.c: 50: case gpio_mode_out_pp: {
00106$:
;	../../../../ulibSTM8/lib/gpio.c: 51: port->ddr |= pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 52: port->cr1 |= pin;
	ld	a, (y)
	or	a, (0x0c, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 53: port->cr2 &= ~pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 54: break;
	jra	00111$
;	../../../../ulibSTM8/lib/gpio.c: 56: case gpio_mode_out_od_fast: {
00107$:
;	../../../../ulibSTM8/lib/gpio.c: 57: port->ddr |= pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 58: port->cr1 &= ~pin;
	ld	a, (y)
	and	a, (0x03, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 59: port->cr2 |= pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 60: break;
	jra	00111$
;	../../../../ulibSTM8/lib/gpio.c: 62: case gpio_mode_out_pp_fast: {
00108$:
;	../../../../ulibSTM8/lib/gpio.c: 63: port->ddr |= pin;
	ldw	x, (0x01, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 64: port->cr1 |= pin;
	ld	a, (y)
	or	a, (0x0c, sp)
	ld	(y), a
;	../../../../ulibSTM8/lib/gpio.c: 65: port->cr2 |= pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	or	a, (0x0c, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../../../../ulibSTM8/lib/gpio.c: 71: }
00111$:
	addw	sp, #7
	ret
;	../../../../ulibSTM8/lib/gpio.c: 75: void gpio_toggle(gpio_t* port, gpio_pin_t pin)
;	-----------------------------------------
;	 function gpio_toggle
;	-----------------------------------------
_gpio_toggle:
;	../../../../ulibSTM8/lib/gpio.c: 77: port->odr = port->odr ^ pin;
	ldw	x, (0x03, sp)
	ld	a, (x)
	xor	a, (0x05, sp)
	ld	(x), a
	ret
;	../../../../ulibSTM8/lib/gpio.c: 81: uint8_t gpio_read(gpio_t* port, gpio_pin_t pin)
;	-----------------------------------------
;	 function gpio_read
;	-----------------------------------------
_gpio_read:
;	../../../../ulibSTM8/lib/gpio.c: 83: return (port->idr & pin);
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	and	a, (0x05, sp)
	ret
;	../../../../ulibSTM8/lib/gpio.c: 86: void gpio_write_port(gpio_t* port, uint8_t val)
;	-----------------------------------------
;	 function gpio_write_port
;	-----------------------------------------
_gpio_write_port:
;	../../../../ulibSTM8/lib/gpio.c: 88: port->odr = val;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	ret
;	../../../../ulibSTM8/lib/gpio.c: 91: uint8_t gpio_read_port(gpio_t* port)
;	-----------------------------------------
;	 function gpio_read_port
;	-----------------------------------------
_gpio_read_port:
;	../../../../ulibSTM8/lib/gpio.c: 93: return port->idr;
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
