;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Sat May 12 12:35:38 2018
;--------------------------------------------------------
	.module clk
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clk_set_source_auto
	.globl _clk_set_hsidiv
	.globl _clk_set_cpudiv
	.globl _clk_peripheral_enable
	.globl _clk_peripheral_disable
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
;	../../../../ulibSTM8/lib/clk.c: 5: void clk_set_source_auto(clk_source_t src)
;	-----------------------------------------
;	 function clk_set_source_auto
;	-----------------------------------------
_clk_set_source_auto:
;	../../../../ulibSTM8/lib/clk.c: 7: clk->swcr |= CLK_SWCR_SWEN; // enable automatic clock switching 
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	../../../../ulibSTM8/lib/clk.c: 8: clk->swr = src; // initiate switch to new source
	ldw	x, #0x50c4
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	../../../../ulibSTM8/lib/clk.c: 11: void clk_set_hsidiv(clk_hsidiv_t div)
;	-----------------------------------------
;	 function clk_set_hsidiv
;	-----------------------------------------
_clk_set_hsidiv:
	push	a
;	../../../../ulibSTM8/lib/clk.c: 13: clk->ckdivr = (clk->ckdivr & (~CLK_CKDIVR_HSI_MASK)) | (div << CLK_CKDIVR_HSI_POS);  
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	sll	a
	sll	a
	sll	a
	or	a, (0x01, sp)
	ldw	x, #0x50c6
	ld	(x), a
	pop	a
	ret
;	../../../../ulibSTM8/lib/clk.c: 16: void clk_set_cpudiv(clk_cpudiv_t div)
;	-----------------------------------------
;	 function clk_set_cpudiv
;	-----------------------------------------
_clk_set_cpudiv:
	push	a
;	../../../../ulibSTM8/lib/clk.c: 18: clk->ckdivr = (clk->ckdivr & (~CLK_CKDIVR_CPU_MASK)) | (div << CLK_CKDIVR_CPU_POS);  
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xf8
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	or	a, (0x01, sp)
	ldw	x, #0x50c6
	ld	(x), a
	pop	a
	ret
;	../../../../ulibSTM8/lib/clk.c: 21: void clk_peripheral_enable(clk_peripheral_t per)
;	-----------------------------------------
;	 function clk_peripheral_enable
;	-----------------------------------------
_clk_peripheral_enable:
	sub	sp, #8
;	../../../../ulibSTM8/lib/clk.c: 23: clk->pckenr1 |= per & 0xFF;
	ldw	x, #0x50c7
	ld	a, (x)
	ld	xh, a
	ld	a, (0x0c, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	clr	a
	or	a, (0x01, sp)
	rlwa	x
	or	a, (0x02, sp)
	ld	xh, a
	ldw	x, #0x50c7
	ld	(x), a
;	../../../../ulibSTM8/lib/clk.c: 24: clk->pckenr2 |= (per & 0xFF00) >> 8;
	ldw	x, #0x50ca
	ld	a, (x)
	ld	xh, a
	clr	(0x04, sp)
	ld	a, (0x0b, sp)
	ld	(0x08, sp), a
	clr	a
	clr	(0x05, sp)
	or	a, (0x05, sp)
	rlwa	x
	or	a, (0x08, sp)
	ld	xh, a
	ldw	x, #0x50ca
	ld	(x), a
	addw	sp, #8
	ret
;	../../../../ulibSTM8/lib/clk.c: 27: void clk_peripheral_disable(clk_peripheral_t per)
;	-----------------------------------------
;	 function clk_peripheral_disable
;	-----------------------------------------
_clk_peripheral_disable:
	sub	sp, #6
;	../../../../ulibSTM8/lib/clk.c: 29: clk->pckenr1 &= ~(per & 0xFF);
	ldw	x, #0x50c7
	ld	a, (x)
	ld	(0x06, sp), a
	ld	a, (0x0a, sp)
	ld	xh, a
	clr	a
	ld	a, xh
	cpl	a
	and	a, (0x06, sp)
	ldw	x, #0x50c7
	ld	(x), a
;	../../../../ulibSTM8/lib/clk.c: 30: clk->pckenr2 &= ~((per & 0xFF00) >> 8);
	ldw	x, #0x50ca
	ld	a, (x)
	ld	(0x05, sp), a
	clr	(0x04, sp)
	ld	a, (0x09, sp)
	clr	(0x01, sp)
	cpl	a
	and	a, (0x05, sp)
	ldw	x, #0x50ca
	ld	(x), a
	addw	sp, #6
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
