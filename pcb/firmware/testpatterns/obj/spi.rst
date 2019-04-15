                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Sat May 12 12:35:38 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module spi
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _spi_txonly_start
                                     13 	.globl _spi_txonly_transmit
                                     14 	.globl _spi_txonly_stop
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 ;--------------------------------------------------------
                                     28 ; global & static initialisations
                                     29 ;--------------------------------------------------------
                                     30 	.area HOME
                                     31 	.area GSINIT
                                     32 	.area GSFINAL
                                     33 	.area GSINIT
                                     34 ;--------------------------------------------------------
                                     35 ; Home
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area HOME
                                     39 ;--------------------------------------------------------
                                     40 ; code
                                     41 ;--------------------------------------------------------
                                     42 	.area CODE
                                     43 ;	../../../../ulibSTM8/lib/spi.c: 4: void spi_txonly_start()
                                     44 ;	-----------------------------------------
                                     45 ;	 function spi_txonly_start
                                     46 ;	-----------------------------------------
      008527                         47 _spi_txonly_start:
                                     48 ;	../../../../ulibSTM8/lib/spi.c: 6: spi->cr1 = SPI_CR1_SPE | SPI_CR1_MSTR | (0x7 << SPI_CR1_BR_POS); 
      008527 35 7C 52 00      [ 1]   49 	mov	0x5200+0, #0x7c
      00852B 81               [ 4]   50 	ret
                                     51 ;	../../../../ulibSTM8/lib/spi.c: 9: void spi_txonly_transmit(uint8_t data)
                                     52 ;	-----------------------------------------
                                     53 ;	 function spi_txonly_transmit
                                     54 ;	-----------------------------------------
      00852C                         55 _spi_txonly_transmit:
                                     56 ;	../../../../ulibSTM8/lib/spi.c: 11: while(!(spi->sr & SPI_SR_TXE)); // wait until the tx register is empty again
      00852C                         57 00101$:
      00852C AE 52 03         [ 2]   58 	ldw	x, #0x5203
      00852F F6               [ 1]   59 	ld	a, (x)
      008530 A5 02            [ 1]   60 	bcp	a, #0x02
      008532 27 F8            [ 1]   61 	jreq	00101$
                                     62 ;	../../../../ulibSTM8/lib/spi.c: 12: spi->dr = data;
      008534 AE 52 04         [ 2]   63 	ldw	x, #0x5204
      008537 7B 03            [ 1]   64 	ld	a, (0x03, sp)
      008539 F7               [ 1]   65 	ld	(x), a
      00853A 81               [ 4]   66 	ret
                                     67 ;	../../../../ulibSTM8/lib/spi.c: 15: void spi_txonly_stop()
                                     68 ;	-----------------------------------------
                                     69 ;	 function spi_txonly_stop
                                     70 ;	-----------------------------------------
      00853B                         71 _spi_txonly_stop:
                                     72 ;	../../../../ulibSTM8/lib/spi.c: 17: while(!(spi->sr & SPI_SR_TXE)); // wait until the tx register is empty again
      00853B                         73 00101$:
      00853B AE 52 03         [ 2]   74 	ldw	x, #0x5203
      00853E F6               [ 1]   75 	ld	a, (x)
      00853F A5 02            [ 1]   76 	bcp	a, #0x02
      008541 27 F8            [ 1]   77 	jreq	00101$
                                     78 ;	../../../../ulibSTM8/lib/spi.c: 18: while(spi->sr & SPI_SR_BSY); //wait until transmission was finished
      008543                         79 00104$:
      008543 AE 52 03         [ 2]   80 	ldw	x, #0x5203
      008546 F6               [ 1]   81 	ld	a, (x)
      008547 4D               [ 1]   82 	tnz	a
      008548 2B F9            [ 1]   83 	jrmi	00104$
      00854A 81               [ 4]   84 	ret
                                     85 	.area CODE
                                     86 	.area INITIALIZER
                                     87 	.area CABS (ABS)
