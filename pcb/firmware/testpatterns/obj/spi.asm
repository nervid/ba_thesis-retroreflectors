;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Sat May 12 12:35:38 2018
;--------------------------------------------------------
	.module spi
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spi_txonly_start
	.globl _spi_txonly_transmit
	.globl _spi_txonly_stop
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
;	../../../../ulibSTM8/lib/spi.c: 4: void spi_txonly_start()
;	-----------------------------------------
;	 function spi_txonly_start
;	-----------------------------------------
_spi_txonly_start:
;	../../../../ulibSTM8/lib/spi.c: 6: spi->cr1 = SPI_CR1_SPE | SPI_CR1_MSTR | (0x7 << SPI_CR1_BR_POS); 
	mov	0x5200+0, #0x7c
	ret
;	../../../../ulibSTM8/lib/spi.c: 9: void spi_txonly_transmit(uint8_t data)
;	-----------------------------------------
;	 function spi_txonly_transmit
;	-----------------------------------------
_spi_txonly_transmit:
;	../../../../ulibSTM8/lib/spi.c: 11: while(!(spi->sr & SPI_SR_TXE)); // wait until the tx register is empty again
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	../../../../ulibSTM8/lib/spi.c: 12: spi->dr = data;
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	../../../../ulibSTM8/lib/spi.c: 15: void spi_txonly_stop()
;	-----------------------------------------
;	 function spi_txonly_stop
;	-----------------------------------------
_spi_txonly_stop:
;	../../../../ulibSTM8/lib/spi.c: 17: while(!(spi->sr & SPI_SR_TXE)); // wait until the tx register is empty again
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	../../../../ulibSTM8/lib/spi.c: 18: while(spi->sr & SPI_SR_BSY); //wait until transmission was finished
00104$:
	ldw	x, #0x5203
	ld	a, (x)
	tnz	a
	jrmi	00104$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
