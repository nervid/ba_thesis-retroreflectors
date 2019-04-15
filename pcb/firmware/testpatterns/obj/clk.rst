                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Sat May 12 12:35:38 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module clk
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _clk_set_source_auto
                                     13 	.globl _clk_set_hsidiv
                                     14 	.globl _clk_set_cpudiv
                                     15 	.globl _clk_peripheral_enable
                                     16 	.globl _clk_peripheral_disable
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 ;--------------------------------------------------------
                                     30 ; global & static initialisations
                                     31 ;--------------------------------------------------------
                                     32 	.area HOME
                                     33 	.area GSINIT
                                     34 	.area GSFINAL
                                     35 	.area GSINIT
                                     36 ;--------------------------------------------------------
                                     37 ; Home
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area HOME
                                     41 ;--------------------------------------------------------
                                     42 ; code
                                     43 ;--------------------------------------------------------
                                     44 	.area CODE
                                     45 ;	../../../../ulibSTM8/lib/clk.c: 5: void clk_set_source_auto(clk_source_t src)
                                     46 ;	-----------------------------------------
                                     47 ;	 function clk_set_source_auto
                                     48 ;	-----------------------------------------
      008493                         49 _clk_set_source_auto:
                                     50 ;	../../../../ulibSTM8/lib/clk.c: 7: clk->swcr |= CLK_SWCR_SWEN; // enable automatic clock switching 
      008493 AE 50 C5         [ 2]   51 	ldw	x, #0x50c5
      008496 F6               [ 1]   52 	ld	a, (x)
      008497 AA 02            [ 1]   53 	or	a, #0x02
      008499 F7               [ 1]   54 	ld	(x), a
                                     55 ;	../../../../ulibSTM8/lib/clk.c: 8: clk->swr = src; // initiate switch to new source
      00849A AE 50 C4         [ 2]   56 	ldw	x, #0x50c4
      00849D 7B 03            [ 1]   57 	ld	a, (0x03, sp)
      00849F F7               [ 1]   58 	ld	(x), a
      0084A0 81               [ 4]   59 	ret
                                     60 ;	../../../../ulibSTM8/lib/clk.c: 11: void clk_set_hsidiv(clk_hsidiv_t div)
                                     61 ;	-----------------------------------------
                                     62 ;	 function clk_set_hsidiv
                                     63 ;	-----------------------------------------
      0084A1                         64 _clk_set_hsidiv:
      0084A1 88               [ 1]   65 	push	a
                                     66 ;	../../../../ulibSTM8/lib/clk.c: 13: clk->ckdivr = (clk->ckdivr & (~CLK_CKDIVR_HSI_MASK)) | (div << CLK_CKDIVR_HSI_POS);  
      0084A2 AE 50 C6         [ 2]   67 	ldw	x, #0x50c6
      0084A5 F6               [ 1]   68 	ld	a, (x)
      0084A6 A4 E7            [ 1]   69 	and	a, #0xe7
      0084A8 6B 01            [ 1]   70 	ld	(0x01, sp), a
      0084AA 7B 04            [ 1]   71 	ld	a, (0x04, sp)
      0084AC 48               [ 1]   72 	sll	a
      0084AD 48               [ 1]   73 	sll	a
      0084AE 48               [ 1]   74 	sll	a
      0084AF 1A 01            [ 1]   75 	or	a, (0x01, sp)
      0084B1 AE 50 C6         [ 2]   76 	ldw	x, #0x50c6
      0084B4 F7               [ 1]   77 	ld	(x), a
      0084B5 84               [ 1]   78 	pop	a
      0084B6 81               [ 4]   79 	ret
                                     80 ;	../../../../ulibSTM8/lib/clk.c: 16: void clk_set_cpudiv(clk_cpudiv_t div)
                                     81 ;	-----------------------------------------
                                     82 ;	 function clk_set_cpudiv
                                     83 ;	-----------------------------------------
      0084B7                         84 _clk_set_cpudiv:
      0084B7 88               [ 1]   85 	push	a
                                     86 ;	../../../../ulibSTM8/lib/clk.c: 18: clk->ckdivr = (clk->ckdivr & (~CLK_CKDIVR_CPU_MASK)) | (div << CLK_CKDIVR_CPU_POS);  
      0084B8 AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      0084BB F6               [ 1]   88 	ld	a, (x)
      0084BC A4 F8            [ 1]   89 	and	a, #0xf8
      0084BE 6B 01            [ 1]   90 	ld	(0x01, sp), a
      0084C0 7B 04            [ 1]   91 	ld	a, (0x04, sp)
      0084C2 1A 01            [ 1]   92 	or	a, (0x01, sp)
      0084C4 AE 50 C6         [ 2]   93 	ldw	x, #0x50c6
      0084C7 F7               [ 1]   94 	ld	(x), a
      0084C8 84               [ 1]   95 	pop	a
      0084C9 81               [ 4]   96 	ret
                                     97 ;	../../../../ulibSTM8/lib/clk.c: 21: void clk_peripheral_enable(clk_peripheral_t per)
                                     98 ;	-----------------------------------------
                                     99 ;	 function clk_peripheral_enable
                                    100 ;	-----------------------------------------
      0084CA                        101 _clk_peripheral_enable:
      0084CA 52 08            [ 2]  102 	sub	sp, #8
                                    103 ;	../../../../ulibSTM8/lib/clk.c: 23: clk->pckenr1 |= per & 0xFF;
      0084CC AE 50 C7         [ 2]  104 	ldw	x, #0x50c7
      0084CF F6               [ 1]  105 	ld	a, (x)
      0084D0 95               [ 1]  106 	ld	xh, a
      0084D1 7B 0C            [ 1]  107 	ld	a, (0x0c, sp)
      0084D3 6B 02            [ 1]  108 	ld	(0x02, sp), a
      0084D5 0F 01            [ 1]  109 	clr	(0x01, sp)
      0084D7 4F               [ 1]  110 	clr	a
      0084D8 1A 01            [ 1]  111 	or	a, (0x01, sp)
      0084DA 02               [ 1]  112 	rlwa	x
      0084DB 1A 02            [ 1]  113 	or	a, (0x02, sp)
      0084DD 95               [ 1]  114 	ld	xh, a
      0084DE AE 50 C7         [ 2]  115 	ldw	x, #0x50c7
      0084E1 F7               [ 1]  116 	ld	(x), a
                                    117 ;	../../../../ulibSTM8/lib/clk.c: 24: clk->pckenr2 |= (per & 0xFF00) >> 8;
      0084E2 AE 50 CA         [ 2]  118 	ldw	x, #0x50ca
      0084E5 F6               [ 1]  119 	ld	a, (x)
      0084E6 95               [ 1]  120 	ld	xh, a
      0084E7 0F 04            [ 1]  121 	clr	(0x04, sp)
      0084E9 7B 0B            [ 1]  122 	ld	a, (0x0b, sp)
      0084EB 6B 08            [ 1]  123 	ld	(0x08, sp), a
      0084ED 4F               [ 1]  124 	clr	a
      0084EE 0F 05            [ 1]  125 	clr	(0x05, sp)
      0084F0 1A 05            [ 1]  126 	or	a, (0x05, sp)
      0084F2 02               [ 1]  127 	rlwa	x
      0084F3 1A 08            [ 1]  128 	or	a, (0x08, sp)
      0084F5 95               [ 1]  129 	ld	xh, a
      0084F6 AE 50 CA         [ 2]  130 	ldw	x, #0x50ca
      0084F9 F7               [ 1]  131 	ld	(x), a
      0084FA 5B 08            [ 2]  132 	addw	sp, #8
      0084FC 81               [ 4]  133 	ret
                                    134 ;	../../../../ulibSTM8/lib/clk.c: 27: void clk_peripheral_disable(clk_peripheral_t per)
                                    135 ;	-----------------------------------------
                                    136 ;	 function clk_peripheral_disable
                                    137 ;	-----------------------------------------
      0084FD                        138 _clk_peripheral_disable:
      0084FD 52 06            [ 2]  139 	sub	sp, #6
                                    140 ;	../../../../ulibSTM8/lib/clk.c: 29: clk->pckenr1 &= ~(per & 0xFF);
      0084FF AE 50 C7         [ 2]  141 	ldw	x, #0x50c7
      008502 F6               [ 1]  142 	ld	a, (x)
      008503 6B 06            [ 1]  143 	ld	(0x06, sp), a
      008505 7B 0A            [ 1]  144 	ld	a, (0x0a, sp)
      008507 95               [ 1]  145 	ld	xh, a
      008508 4F               [ 1]  146 	clr	a
      008509 9E               [ 1]  147 	ld	a, xh
      00850A 43               [ 1]  148 	cpl	a
      00850B 14 06            [ 1]  149 	and	a, (0x06, sp)
      00850D AE 50 C7         [ 2]  150 	ldw	x, #0x50c7
      008510 F7               [ 1]  151 	ld	(x), a
                                    152 ;	../../../../ulibSTM8/lib/clk.c: 30: clk->pckenr2 &= ~((per & 0xFF00) >> 8);
      008511 AE 50 CA         [ 2]  153 	ldw	x, #0x50ca
      008514 F6               [ 1]  154 	ld	a, (x)
      008515 6B 05            [ 1]  155 	ld	(0x05, sp), a
      008517 0F 04            [ 1]  156 	clr	(0x04, sp)
      008519 7B 09            [ 1]  157 	ld	a, (0x09, sp)
      00851B 0F 01            [ 1]  158 	clr	(0x01, sp)
      00851D 43               [ 1]  159 	cpl	a
      00851E 14 05            [ 1]  160 	and	a, (0x05, sp)
      008520 AE 50 CA         [ 2]  161 	ldw	x, #0x50ca
      008523 F7               [ 1]  162 	ld	(x), a
      008524 5B 06            [ 2]  163 	addw	sp, #6
      008526 81               [ 4]  164 	ret
                                    165 	.area CODE
                                    166 	.area INITIALIZER
                                    167 	.area CABS (ABS)
