                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Sun May 20 14:29:50 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module testpatterns
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _send_frame
                                     14 	.globl _calcCRC
                                     15 	.globl _send_data
                                     16 	.globl _switch_mode
                                     17 	.globl _display_mode
                                     18 	.globl __delay
                                     19 	.globl __delay_long
                                     20 	.globl _spi_txonly_transmit
                                     21 	.globl _spi_txonly_start
                                     22 	.globl _clk_set_cpudiv
                                     23 	.globl _clk_set_hsidiv
                                     24 	.globl _clk_set_source_auto
                                     25 	.globl _gpio_mode
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DATA
      000001                         30 _send_data_data_cnt_1_24:
      000001                         31 	.ds 2
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; Stack segment in internal ram 
                                     38 ;--------------------------------------------------------
                                     39 	.area	SSEG
      000003                         40 __start__stack:
      000003                         41 	.ds	1
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; interrupt vector 
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
      008000                         51 __interrupt_vect:
      008000 82 00 80 83             52 	int s_GSINIT ;reset
      008004 82 00 00 00             53 	int 0x0000 ;trap
      008008 82 00 00 00             54 	int 0x0000 ;int0
      00800C 82 00 00 00             55 	int 0x0000 ;int1
      008010 82 00 00 00             56 	int 0x0000 ;int2
      008014 82 00 00 00             57 	int 0x0000 ;int3
      008018 82 00 00 00             58 	int 0x0000 ;int4
      00801C 82 00 00 00             59 	int 0x0000 ;int5
      008020 82 00 00 00             60 	int 0x0000 ;int6
      008024 82 00 00 00             61 	int 0x0000 ;int7
      008028 82 00 00 00             62 	int 0x0000 ;int8
      00802C 82 00 00 00             63 	int 0x0000 ;int9
      008030 82 00 00 00             64 	int 0x0000 ;int10
      008034 82 00 00 00             65 	int 0x0000 ;int11
      008038 82 00 00 00             66 	int 0x0000 ;int12
      00803C 82 00 00 00             67 	int 0x0000 ;int13
      008040 82 00 00 00             68 	int 0x0000 ;int14
      008044 82 00 00 00             69 	int 0x0000 ;int15
      008048 82 00 00 00             70 	int 0x0000 ;int16
      00804C 82 00 00 00             71 	int 0x0000 ;int17
      008050 82 00 00 00             72 	int 0x0000 ;int18
      008054 82 00 00 00             73 	int 0x0000 ;int19
      008058 82 00 00 00             74 	int 0x0000 ;int20
      00805C 82 00 00 00             75 	int 0x0000 ;int21
      008060 82 00 00 00             76 	int 0x0000 ;int22
      008064 82 00 00 00             77 	int 0x0000 ;int23
      008068 82 00 00 00             78 	int 0x0000 ;int24
      00806C 82 00 00 00             79 	int 0x0000 ;int25
      008070 82 00 00 00             80 	int 0x0000 ;int26
      008074 82 00 00 00             81 	int 0x0000 ;int27
      008078 82 00 00 00             82 	int 0x0000 ;int28
      00807C 82 00 00 00             83 	int 0x0000 ;int29
                                     84 ;--------------------------------------------------------
                                     85 ; global & static initialisations
                                     86 ;--------------------------------------------------------
                                     87 	.area HOME
                                     88 	.area GSINIT
                                     89 	.area GSFINAL
                                     90 	.area GSINIT
      008083                         91 __sdcc_gs_init_startup:
      008083                         92 __sdcc_init_data:
                                     93 ; stm8_genXINIT() start
      008083 AE 00 02         [ 2]   94 	ldw x, #l_DATA
      008086 27 07            [ 1]   95 	jreq	00002$
      008088                         96 00001$:
      008088 72 4F 00 00      [ 1]   97 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   98 	decw x
      00808D 26 F9            [ 1]   99 	jrne	00001$
      00808F                        100 00002$:
      00808F AE 00 00         [ 2]  101 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  102 	jreq	00004$
      008094                        103 00003$:
      008094 D6 85 4A         [ 1]  104 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 02         [ 1]  105 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  106 	decw	x
      00809B 26 F7            [ 1]  107 	jrne	00003$
      00809D                        108 00004$:
                                    109 ; stm8_genXINIT() end
                                    110 ;	testpatterns.c: 109: static data_cnt = 0;
      00809D 5F               [ 1]  111 	clrw	x
      00809E CF 00 01         [ 2]  112 	ldw	_send_data_data_cnt_1_24+0, x
                                    113 	.area GSFINAL
      0080A1 CC 80 80         [ 2]  114 	jp	__sdcc_program_startup
                                    115 ;--------------------------------------------------------
                                    116 ; Home
                                    117 ;--------------------------------------------------------
                                    118 	.area HOME
                                    119 	.area HOME
      008080                        120 __sdcc_program_startup:
      008080 CC 82 CD         [ 2]  121 	jp	_main
                                    122 ;	return from main will return to caller
                                    123 ;--------------------------------------------------------
                                    124 ; code
                                    125 ;--------------------------------------------------------
                                    126 	.area CODE
                                    127 ;	testpatterns.c: 32: void _delay_long(){
                                    128 ;	-----------------------------------------
                                    129 ;	 function _delay_long
                                    130 ;	-----------------------------------------
      0080A4                        131 __delay_long:
      0080A4 52 04            [ 2]  132 	sub	sp, #4
                                    133 ;	testpatterns.c: 35: for(x=0;x<50000;x++);
      0080A6 AE C3 50         [ 2]  134 	ldw	x, #0xc350
      0080A9 1F 03            [ 2]  135 	ldw	(0x03, sp), x
      0080AB 5F               [ 1]  136 	clrw	x
      0080AC 1F 01            [ 2]  137 	ldw	(0x01, sp), x
      0080AE                        138 00104$:
      0080AE 16 03            [ 2]  139 	ldw	y, (0x03, sp)
      0080B0 72 A2 00 01      [ 2]  140 	subw	y, #0x0001
      0080B4 7B 02            [ 1]  141 	ld	a, (0x02, sp)
      0080B6 A2 00            [ 1]  142 	sbc	a, #0x00
      0080B8 97               [ 1]  143 	ld	xl, a
      0080B9 7B 01            [ 1]  144 	ld	a, (0x01, sp)
      0080BB A2 00            [ 1]  145 	sbc	a, #0x00
      0080BD 95               [ 1]  146 	ld	xh, a
      0080BE 17 03            [ 2]  147 	ldw	(0x03, sp), y
      0080C0 1F 01            [ 2]  148 	ldw	(0x01, sp), x
      0080C2 90 5D            [ 2]  149 	tnzw	y
      0080C4 26 E8            [ 1]  150 	jrne	00104$
      0080C6 5D               [ 2]  151 	tnzw	x
      0080C7 26 E5            [ 1]  152 	jrne	00104$
      0080C9 5B 04            [ 2]  153 	addw	sp, #4
      0080CB 81               [ 4]  154 	ret
                                    155 ;	testpatterns.c: 38: void _delay(){
                                    156 ;	-----------------------------------------
                                    157 ;	 function _delay
                                    158 ;	-----------------------------------------
      0080CC                        159 __delay:
      0080CC 52 08            [ 2]  160 	sub	sp, #8
                                    161 ;	testpatterns.c: 41: for(x=0;x<50;x++);
      0080CE AE 00 32         [ 2]  162 	ldw	x, #0x0032
      0080D1 1F 03            [ 2]  163 	ldw	(0x03, sp), x
      0080D3 90 5F            [ 1]  164 	clrw	y
      0080D5                        165 00104$:
      0080D5 1E 03            [ 2]  166 	ldw	x, (0x03, sp)
      0080D7 1D 00 01         [ 2]  167 	subw	x, #0x0001
      0080DA 90 9F            [ 1]  168 	ld	a, yl
      0080DC A2 00            [ 1]  169 	sbc	a, #0x00
      0080DE 6B 06            [ 1]  170 	ld	(0x06, sp), a
      0080E0 90 9E            [ 1]  171 	ld	a, yh
      0080E2 A2 00            [ 1]  172 	sbc	a, #0x00
      0080E4 6B 05            [ 1]  173 	ld	(0x05, sp), a
      0080E6 1F 03            [ 2]  174 	ldw	(0x03, sp), x
      0080E8 16 05            [ 2]  175 	ldw	y, (0x05, sp)
      0080EA 5D               [ 2]  176 	tnzw	x
      0080EB 26 E8            [ 1]  177 	jrne	00104$
      0080ED 1E 05            [ 2]  178 	ldw	x, (0x05, sp)
      0080EF 26 E4            [ 1]  179 	jrne	00104$
      0080F1 5B 08            [ 2]  180 	addw	sp, #8
      0080F3 81               [ 4]  181 	ret
                                    182 ;	testpatterns.c: 44: void display_mode(pattern_mode_t mode)
                                    183 ;	-----------------------------------------
                                    184 ;	 function display_mode
                                    185 ;	-----------------------------------------
      0080F4                        186 _display_mode:
                                    187 ;	testpatterns.c: 48: leds = gpiod->odr & ~(0x1E); // blank leds
      0080F4 AE 50 0F         [ 2]  188 	ldw	x, #0x500f
      0080F7 F6               [ 1]  189 	ld	a, (x)
      0080F8 A4 E1            [ 1]  190 	and	a, #0xe1
                                    191 ;	testpatterns.c: 50: switch(mode){
      0080FA 02               [ 1]  192 	rlwa	x
      0080FB 7B 03            [ 1]  193 	ld	a, (0x03, sp)
      0080FD 01               [ 1]  194 	rrwa	x
      0080FE 88               [ 1]  195 	push	a
      0080FF 9E               [ 1]  196 	ld	a, xh
      008100 A1 00            [ 1]  197 	cp	a, #0x00
      008102 84               [ 1]  198 	pop	a
      008103 27 1A            [ 1]  199 	jreq	00101$
      008105 88               [ 1]  200 	push	a
      008106 7B 04            [ 1]  201 	ld	a, (0x04, sp)
      008108 A1 01            [ 1]  202 	cp	a, #0x01
      00810A 84               [ 1]  203 	pop	a
      00810B 27 16            [ 1]  204 	jreq	00102$
      00810D 88               [ 1]  205 	push	a
      00810E 7B 04            [ 1]  206 	ld	a, (0x04, sp)
      008110 A1 02            [ 1]  207 	cp	a, #0x02
      008112 84               [ 1]  208 	pop	a
      008113 27 12            [ 1]  209 	jreq	00103$
      008115 88               [ 1]  210 	push	a
      008116 7B 04            [ 1]  211 	ld	a, (0x04, sp)
      008118 A1 03            [ 1]  212 	cp	a, #0x03
      00811A 84               [ 1]  213 	pop	a
      00811B 27 0E            [ 1]  214 	jreq	00104$
      00811D 20 0E            [ 2]  215 	jra	00106$
                                    216 ;	testpatterns.c: 51: case pattern_mode_clk:
      00811F                        217 00101$:
                                    218 ;	testpatterns.c: 52: leds |= 1<<2;
      00811F AA 04            [ 1]  219 	or	a, #0x04
                                    220 ;	testpatterns.c: 53: break;
      008121 20 0A            [ 2]  221 	jra	00106$
                                    222 ;	testpatterns.c: 55: case pattern_mode_3byte:
      008123                        223 00102$:
                                    224 ;	testpatterns.c: 56: leds |= 1<<3;
      008123 AA 08            [ 1]  225 	or	a, #0x08
                                    226 ;	testpatterns.c: 57: break;
      008125 20 06            [ 2]  227 	jra	00106$
                                    228 ;	testpatterns.c: 59: case pattern_mode_2byte:
      008127                        229 00103$:
                                    230 ;	testpatterns.c: 60: leds |= 1<<4;
      008127 AA 10            [ 1]  231 	or	a, #0x10
                                    232 ;	testpatterns.c: 61: break;
      008129 20 02            [ 2]  233 	jra	00106$
                                    234 ;	testpatterns.c: 63: case pattern_mode_1byte:
      00812B                        235 00104$:
                                    236 ;	testpatterns.c: 64: leds |= 1<<5;
      00812B AA 20            [ 1]  237 	or	a, #0x20
                                    238 ;	testpatterns.c: 70: }
      00812D                        239 00106$:
                                    240 ;	testpatterns.c: 72: LED1_PORT->odr = leds;
      00812D AE 50 0F         [ 2]  241 	ldw	x, #0x500f
      008130 F7               [ 1]  242 	ld	(x), a
      008131 81               [ 4]  243 	ret
                                    244 ;	testpatterns.c: 75: pattern_mode_t switch_mode(pattern_mode_t mode)
                                    245 ;	-----------------------------------------
                                    246 ;	 function switch_mode
                                    247 ;	-----------------------------------------
      008132                        248 _switch_mode:
                                    249 ;	testpatterns.c: 78: if((gpiob->idr & (1<<4)) == 0){
      008132 AE 50 06         [ 2]  250 	ldw	x, #0x5006
      008135 F6               [ 1]  251 	ld	a, (x)
      008136 A5 10            [ 1]  252 	bcp	a, #0x10
      008138 26 32            [ 1]  253 	jrne	00108$
                                    254 ;	testpatterns.c: 79: switch(mode){
      00813A 7B 03            [ 1]  255 	ld	a, (0x03, sp)
      00813C A1 00            [ 1]  256 	cp	a, #0x00
      00813E 27 14            [ 1]  257 	jreq	00101$
      008140 7B 03            [ 1]  258 	ld	a, (0x03, sp)
      008142 A1 01            [ 1]  259 	cp	a, #0x01
      008144 27 14            [ 1]  260 	jreq	00102$
      008146 7B 03            [ 1]  261 	ld	a, (0x03, sp)
      008148 A1 02            [ 1]  262 	cp	a, #0x02
      00814A 27 14            [ 1]  263 	jreq	00103$
      00814C 7B 03            [ 1]  264 	ld	a, (0x03, sp)
      00814E A1 03            [ 1]  265 	cp	a, #0x03
      008150 27 14            [ 1]  266 	jreq	00104$
      008152 20 16            [ 2]  267 	jra	00105$
                                    268 ;	testpatterns.c: 80: case pattern_mode_clk:
      008154                        269 00101$:
                                    270 ;	testpatterns.c: 81: mode = pattern_mode_3byte;
      008154 A6 01            [ 1]  271 	ld	a, #0x01
      008156 6B 03            [ 1]  272 	ld	(0x03, sp), a
                                    273 ;	testpatterns.c: 82: break;
      008158 20 12            [ 2]  274 	jra	00108$
                                    275 ;	testpatterns.c: 84: case pattern_mode_3byte:
      00815A                        276 00102$:
                                    277 ;	testpatterns.c: 85: mode = pattern_mode_2byte;
      00815A A6 02            [ 1]  278 	ld	a, #0x02
      00815C 6B 03            [ 1]  279 	ld	(0x03, sp), a
                                    280 ;	testpatterns.c: 86: break;
      00815E 20 0C            [ 2]  281 	jra	00108$
                                    282 ;	testpatterns.c: 88: case pattern_mode_2byte:
      008160                        283 00103$:
                                    284 ;	testpatterns.c: 89: mode = pattern_mode_1byte;
      008160 A6 03            [ 1]  285 	ld	a, #0x03
      008162 6B 03            [ 1]  286 	ld	(0x03, sp), a
                                    287 ;	testpatterns.c: 90: break;
      008164 20 06            [ 2]  288 	jra	00108$
                                    289 ;	testpatterns.c: 92: case pattern_mode_1byte:
      008166                        290 00104$:
                                    291 ;	testpatterns.c: 93: mode = pattern_mode_clk;
      008166 0F 03            [ 1]  292 	clr	(0x03, sp)
                                    293 ;	testpatterns.c: 94: break;
      008168 20 02            [ 2]  294 	jra	00108$
                                    295 ;	testpatterns.c: 96: default:
      00816A                        296 00105$:
                                    297 ;	testpatterns.c: 97: mode = pattern_mode_clk;
      00816A 0F 03            [ 1]  298 	clr	(0x03, sp)
                                    299 ;	testpatterns.c: 99: }
      00816C                        300 00108$:
                                    301 ;	testpatterns.c: 102: return mode;
      00816C 7B 03            [ 1]  302 	ld	a, (0x03, sp)
      00816E 81               [ 4]  303 	ret
                                    304 ;	testpatterns.c: 105: void send_data(pattern_mode_t mode)
                                    305 ;	-----------------------------------------
                                    306 ;	 function send_data
                                    307 ;	-----------------------------------------
      00816F                        308 _send_data:
      00816F 52 0A            [ 2]  309 	sub	sp, #10
                                    310 ;	testpatterns.c: 108: const uint8_t data[8] = {0xAA, 0xA7, 0x12, 'T', 'E', 'S', 'T', 0xAA};
      008171 96               [ 1]  311 	ldw	x, sp
      008172 5C               [ 2]  312 	incw	x
      008173 1F 09            [ 2]  313 	ldw	(0x09, sp), x
      008175 1E 09            [ 2]  314 	ldw	x, (0x09, sp)
      008177 A6 AA            [ 1]  315 	ld	a, #0xaa
      008179 F7               [ 1]  316 	ld	(x), a
      00817A 1E 09            [ 2]  317 	ldw	x, (0x09, sp)
      00817C 5C               [ 2]  318 	incw	x
      00817D A6 A7            [ 1]  319 	ld	a, #0xa7
      00817F F7               [ 1]  320 	ld	(x), a
      008180 1E 09            [ 2]  321 	ldw	x, (0x09, sp)
      008182 5C               [ 2]  322 	incw	x
      008183 5C               [ 2]  323 	incw	x
      008184 A6 12            [ 1]  324 	ld	a, #0x12
      008186 F7               [ 1]  325 	ld	(x), a
      008187 1E 09            [ 2]  326 	ldw	x, (0x09, sp)
      008189 A6 54            [ 1]  327 	ld	a, #0x54
      00818B E7 03            [ 1]  328 	ld	(0x0003, x), a
      00818D 1E 09            [ 2]  329 	ldw	x, (0x09, sp)
      00818F A6 45            [ 1]  330 	ld	a, #0x45
      008191 E7 04            [ 1]  331 	ld	(0x0004, x), a
      008193 1E 09            [ 2]  332 	ldw	x, (0x09, sp)
      008195 A6 53            [ 1]  333 	ld	a, #0x53
      008197 E7 05            [ 1]  334 	ld	(0x0005, x), a
      008199 1E 09            [ 2]  335 	ldw	x, (0x09, sp)
      00819B A6 54            [ 1]  336 	ld	a, #0x54
      00819D E7 06            [ 1]  337 	ld	(0x0006, x), a
      00819F 1E 09            [ 2]  338 	ldw	x, (0x09, sp)
      0081A1 1C 00 07         [ 2]  339 	addw	x, #0x0007
      0081A4 A6 AA            [ 1]  340 	ld	a, #0xaa
      0081A6 F7               [ 1]  341 	ld	(x), a
                                    342 ;	testpatterns.c: 111: switch(mode){
      0081A7 7B 0D            [ 1]  343 	ld	a, (0x0d, sp)
      0081A9 A1 00            [ 1]  344 	cp	a, #0x00
      0081AB 27 08            [ 1]  345 	jreq	00101$
      0081AD 7B 0D            [ 1]  346 	ld	a, (0x0d, sp)
      0081AF A1 01            [ 1]  347 	cp	a, #0x01
      0081B1 27 0A            [ 1]  348 	jreq	00102$
      0081B3 20 24            [ 2]  349 	jra	00107$
                                    350 ;	testpatterns.c: 112: case pattern_mode_clk:
      0081B5                        351 00101$:
                                    352 ;	testpatterns.c: 114: spi_txonly_transmit(0xAA);
      0081B5 4B AA            [ 1]  353 	push	#0xaa
      0081B7 CD 85 2C         [ 4]  354 	call	_spi_txonly_transmit
      0081BA 84               [ 1]  355 	pop	a
                                    356 ;	testpatterns.c: 115: break;
      0081BB 20 1C            [ 2]  357 	jra	00107$
                                    358 ;	testpatterns.c: 117: case pattern_mode_3byte:
      0081BD                        359 00102$:
                                    360 ;	testpatterns.c: 118: spi_txonly_transmit(data[data_cnt]);
      0081BD 1E 09            [ 2]  361 	ldw	x, (0x09, sp)
      0081BF 72 BB 00 01      [ 2]  362 	addw	x, _send_data_data_cnt_1_24+0
      0081C3 F6               [ 1]  363 	ld	a, (x)
      0081C4 88               [ 1]  364 	push	a
      0081C5 CD 85 2C         [ 4]  365 	call	_spi_txonly_transmit
      0081C8 84               [ 1]  366 	pop	a
                                    367 ;	testpatterns.c: 119: data_cnt++;
      0081C9 CE 00 01         [ 2]  368 	ldw	x, _send_data_data_cnt_1_24+0
      0081CC 5C               [ 2]  369 	incw	x
                                    370 ;	testpatterns.c: 121: if(data_cnt > 7){
      0081CD CF 00 01         [ 2]  371 	ldw	_send_data_data_cnt_1_24+0, x
      0081D0 A3 00 07         [ 2]  372 	cpw	x, #0x0007
      0081D3 2D 04            [ 1]  373 	jrsle	00107$
                                    374 ;	testpatterns.c: 122: data_cnt = 0;
      0081D5 5F               [ 1]  375 	clrw	x
      0081D6 CF 00 01         [ 2]  376 	ldw	_send_data_data_cnt_1_24+0, x
                                    377 ;	testpatterns.c: 128: }
      0081D9                        378 00107$:
      0081D9 5B 0A            [ 2]  379 	addw	sp, #10
      0081DB 81               [ 4]  380 	ret
                                    381 ;	testpatterns.c: 133: char calcCRC(char *data, int length)
                                    382 ;	-----------------------------------------
                                    383 ;	 function calcCRC
                                    384 ;	-----------------------------------------
      0081DC                        385 _calcCRC:
      0081DC 52 06            [ 2]  386 	sub	sp, #6
                                    387 ;	testpatterns.c: 135: int crc = 0;
      0081DE 5F               [ 1]  388 	clrw	x
      0081DF 1F 05            [ 2]  389 	ldw	(0x05, sp), x
                                    390 ;	testpatterns.c: 138: for(j=0; j < length; j++)
      0081E1 5F               [ 1]  391 	clrw	x
      0081E2 1F 01            [ 2]  392 	ldw	(0x01, sp), x
      0081E4                        393 00109$:
      0081E4 1E 01            [ 2]  394 	ldw	x, (0x01, sp)
      0081E6 13 0B            [ 2]  395 	cpw	x, (0x0b, sp)
      0081E8 2E 3E            [ 1]  396 	jrsge	00104$
                                    397 ;	testpatterns.c: 140: crc ^= (data[j] << 8);
      0081EA 1E 09            [ 2]  398 	ldw	x, (0x09, sp)
      0081EC 72 FB 01         [ 2]  399 	addw	x, (0x01, sp)
      0081EF F6               [ 1]  400 	ld	a, (x)
      0081F0 95               [ 1]  401 	ld	xh, a
      0081F1 49               [ 1]  402 	rlc	a
      0081F2 4F               [ 1]  403 	clr	a
      0081F3 A2 00            [ 1]  404 	sbc	a, #0x00
      0081F5 4F               [ 1]  405 	clr	a
      0081F6 18 06            [ 1]  406 	xor	a, (0x06, sp)
      0081F8 02               [ 1]  407 	rlwa	x
      0081F9 18 05            [ 1]  408 	xor	a, (0x05, sp)
      0081FB 95               [ 1]  409 	ld	xh, a
      0081FC 1F 05            [ 2]  410 	ldw	(0x05, sp), x
                                    411 ;	testpatterns.c: 142: for(i=0;i<8;i++)
      0081FE AE 00 08         [ 2]  412 	ldw	x, #0x0008
      008201 1F 03            [ 2]  413 	ldw	(0x03, sp), x
      008203                        414 00107$:
                                    415 ;	testpatterns.c: 144: if((crc & 0x8000) != 0)
      008203 1E 05            [ 2]  416 	ldw	x, (0x05, sp)
      008205 5D               [ 2]  417 	tnzw	x
      008206 2A 0C            [ 1]  418 	jrpl	00102$
                                    419 ;	testpatterns.c: 145: crc ^= (0x1070 << 3);
      008208 7B 06            [ 1]  420 	ld	a, (0x06, sp)
      00820A A8 80            [ 1]  421 	xor	a, #0x80
      00820C 97               [ 1]  422 	ld	xl, a
      00820D 7B 05            [ 1]  423 	ld	a, (0x05, sp)
      00820F A8 83            [ 1]  424 	xor	a, #0x83
      008211 95               [ 1]  425 	ld	xh, a
      008212 1F 05            [ 2]  426 	ldw	(0x05, sp), x
      008214                        427 00102$:
                                    428 ;	testpatterns.c: 147: crc <<= 1;
      008214 1E 05            [ 2]  429 	ldw	x, (0x05, sp)
      008216 58               [ 2]  430 	sllw	x
      008217 1F 05            [ 2]  431 	ldw	(0x05, sp), x
      008219 1E 03            [ 2]  432 	ldw	x, (0x03, sp)
      00821B 5A               [ 2]  433 	decw	x
      00821C 1F 03            [ 2]  434 	ldw	(0x03, sp), x
                                    435 ;	testpatterns.c: 142: for(i=0;i<8;i++)
      00821E 5D               [ 2]  436 	tnzw	x
      00821F 26 E2            [ 1]  437 	jrne	00107$
                                    438 ;	testpatterns.c: 138: for(j=0; j < length; j++)
      008221 1E 01            [ 2]  439 	ldw	x, (0x01, sp)
      008223 5C               [ 2]  440 	incw	x
      008224 1F 01            [ 2]  441 	ldw	(0x01, sp), x
      008226 20 BC            [ 2]  442 	jra	00109$
      008228                        443 00104$:
                                    444 ;	testpatterns.c: 151: return (char)(crc >> 8);
      008228 1E 05            [ 2]  445 	ldw	x, (0x05, sp)
      00822A 4F               [ 1]  446 	clr	a
      00822B 5D               [ 2]  447 	tnzw	x
      00822C 2A 01            [ 1]  448 	jrpl	00137$
      00822E 4A               [ 1]  449 	dec	a
      00822F                        450 00137$:
      00822F 01               [ 1]  451 	rrwa	x
      008230 9F               [ 1]  452 	ld	a, xl
      008231 5B 06            [ 2]  453 	addw	sp, #6
      008233 81               [ 4]  454 	ret
                                    455 ;	testpatterns.c: 155: void send_frame(uint8_t *data, uint8_t id){
                                    456 ;	-----------------------------------------
                                    457 ;	 function send_frame
                                    458 ;	-----------------------------------------
      008234                        459 _send_frame:
      008234 52 11            [ 2]  460 	sub	sp, #17
                                    461 ;	testpatterns.c: 157: uint8_t frame[9] = {0xAA, 0xA7, 0x12}; // insert preamble
      008236 96               [ 1]  462 	ldw	x, sp
      008237 5C               [ 2]  463 	incw	x
      008238 1F 0C            [ 2]  464 	ldw	(0x0c, sp), x
      00823A 1E 0C            [ 2]  465 	ldw	x, (0x0c, sp)
      00823C A6 AA            [ 1]  466 	ld	a, #0xaa
      00823E F7               [ 1]  467 	ld	(x), a
      00823F 1E 0C            [ 2]  468 	ldw	x, (0x0c, sp)
      008241 5C               [ 2]  469 	incw	x
      008242 A6 A7            [ 1]  470 	ld	a, #0xa7
      008244 F7               [ 1]  471 	ld	(x), a
      008245 1E 0C            [ 2]  472 	ldw	x, (0x0c, sp)
      008247 5C               [ 2]  473 	incw	x
      008248 5C               [ 2]  474 	incw	x
      008249 A6 12            [ 1]  475 	ld	a, #0x12
      00824B F7               [ 1]  476 	ld	(x), a
      00824C 16 0C            [ 2]  477 	ldw	y, (0x0c, sp)
      00824E 72 A9 00 03      [ 2]  478 	addw	y, #0x0003
      008252 90 7F            [ 1]  479 	clr	(y)
      008254 1E 0C            [ 2]  480 	ldw	x, (0x0c, sp)
      008256 1C 00 04         [ 2]  481 	addw	x, #0x0004
      008259 7F               [ 1]  482 	clr	(x)
      00825A 1E 0C            [ 2]  483 	ldw	x, (0x0c, sp)
      00825C 1C 00 05         [ 2]  484 	addw	x, #0x0005
      00825F 7F               [ 1]  485 	clr	(x)
      008260 1E 0C            [ 2]  486 	ldw	x, (0x0c, sp)
      008262 1C 00 06         [ 2]  487 	addw	x, #0x0006
      008265 7F               [ 1]  488 	clr	(x)
      008266 1E 0C            [ 2]  489 	ldw	x, (0x0c, sp)
      008268 1C 00 07         [ 2]  490 	addw	x, #0x0007
      00826B 7F               [ 1]  491 	clr	(x)
      00826C 1E 0C            [ 2]  492 	ldw	x, (0x0c, sp)
      00826E 1C 00 08         [ 2]  493 	addw	x, #0x0008
      008271 1F 10            [ 2]  494 	ldw	(0x10, sp), x
      008273 1E 10            [ 2]  495 	ldw	x, (0x10, sp)
      008275 7F               [ 1]  496 	clr	(x)
                                    497 ;	testpatterns.c: 158: frame[3] = id;
      008276 7B 16            [ 1]  498 	ld	a, (0x16, sp)
      008278 90 F7            [ 1]  499 	ld	(y), a
                                    500 ;	testpatterns.c: 160: for(i = 0; i<4; i++){
      00827A 0F 0B            [ 1]  501 	clr	(0x0b, sp)
      00827C                        502 00104$:
                                    503 ;	testpatterns.c: 161: frame[4+i] = data[i];
      00827C 7B 0B            [ 1]  504 	ld	a, (0x0b, sp)
      00827E AB 04            [ 1]  505 	add	a, #0x04
      008280 97               [ 1]  506 	ld	xl, a
      008281 4F               [ 1]  507 	clr	a
      008282 95               [ 1]  508 	ld	xh, a
      008283 72 FB 0C         [ 2]  509 	addw	x, (0x0c, sp)
      008286 1F 0E            [ 2]  510 	ldw	(0x0e, sp), x
      008288 5F               [ 1]  511 	clrw	x
      008289 7B 0B            [ 1]  512 	ld	a, (0x0b, sp)
      00828B 97               [ 1]  513 	ld	xl, a
      00828C 72 FB 14         [ 2]  514 	addw	x, (0x14, sp)
      00828F F6               [ 1]  515 	ld	a, (x)
      008290 1E 0E            [ 2]  516 	ldw	x, (0x0e, sp)
      008292 F7               [ 1]  517 	ld	(x), a
                                    518 ;	testpatterns.c: 160: for(i = 0; i<4; i++){
      008293 0C 0B            [ 1]  519 	inc	(0x0b, sp)
      008295 7B 0B            [ 1]  520 	ld	a, (0x0b, sp)
      008297 A1 04            [ 1]  521 	cp	a, #0x04
      008299 25 E1            [ 1]  522 	jrc	00104$
                                    523 ;	testpatterns.c: 163: frame[8] = calcCRC(&frame[3],5); 
      00829B 4B 05            [ 1]  524 	push	#0x05
      00829D 4B 00            [ 1]  525 	push	#0x00
      00829F 90 89            [ 2]  526 	pushw	y
      0082A1 CD 81 DC         [ 4]  527 	call	_calcCRC
      0082A4 5B 04            [ 2]  528 	addw	sp, #4
      0082A6 1E 10            [ 2]  529 	ldw	x, (0x10, sp)
      0082A8 F7               [ 1]  530 	ld	(x), a
                                    531 ;	testpatterns.c: 165: for(j=0;j<10;j++){
      0082A9 0F 0A            [ 1]  532 	clr	(0x0a, sp)
                                    533 ;	testpatterns.c: 166: for(i = 0; i<9; i++){
      0082AB                        534 00114$:
      0082AB 0F 0B            [ 1]  535 	clr	(0x0b, sp)
      0082AD                        536 00106$:
                                    537 ;	testpatterns.c: 167: spi_txonly_transmit(frame[i]);
      0082AD 5F               [ 1]  538 	clrw	x
      0082AE 7B 0B            [ 1]  539 	ld	a, (0x0b, sp)
      0082B0 97               [ 1]  540 	ld	xl, a
      0082B1 72 FB 0C         [ 2]  541 	addw	x, (0x0c, sp)
      0082B4 F6               [ 1]  542 	ld	a, (x)
      0082B5 88               [ 1]  543 	push	a
      0082B6 CD 85 2C         [ 4]  544 	call	_spi_txonly_transmit
      0082B9 84               [ 1]  545 	pop	a
                                    546 ;	testpatterns.c: 166: for(i = 0; i<9; i++){
      0082BA 0C 0B            [ 1]  547 	inc	(0x0b, sp)
      0082BC 7B 0B            [ 1]  548 	ld	a, (0x0b, sp)
      0082BE A1 09            [ 1]  549 	cp	a, #0x09
      0082C0 25 EB            [ 1]  550 	jrc	00106$
                                    551 ;	testpatterns.c: 165: for(j=0;j<10;j++){
      0082C2 0C 0A            [ 1]  552 	inc	(0x0a, sp)
      0082C4 7B 0A            [ 1]  553 	ld	a, (0x0a, sp)
      0082C6 A1 0A            [ 1]  554 	cp	a, #0x0a
      0082C8 25 E1            [ 1]  555 	jrc	00114$
      0082CA 5B 11            [ 2]  556 	addw	sp, #17
      0082CC 81               [ 4]  557 	ret
                                    558 ;	testpatterns.c: 174: int main(){
                                    559 ;	-----------------------------------------
                                    560 ;	 function main
                                    561 ;	-----------------------------------------
      0082CD                        562 _main:
      0082CD 52 06            [ 2]  563 	sub	sp, #6
                                    564 ;	testpatterns.c: 179: const uint8_t data[4] = {'T', 'E', 'S', 'T'};
      0082CF 96               [ 1]  565 	ldw	x, sp
      0082D0 5C               [ 2]  566 	incw	x
      0082D1 1F 05            [ 2]  567 	ldw	(0x05, sp), x
      0082D3 1E 05            [ 2]  568 	ldw	x, (0x05, sp)
      0082D5 A6 54            [ 1]  569 	ld	a, #0x54
      0082D7 F7               [ 1]  570 	ld	(x), a
      0082D8 1E 05            [ 2]  571 	ldw	x, (0x05, sp)
      0082DA 5C               [ 2]  572 	incw	x
      0082DB A6 45            [ 1]  573 	ld	a, #0x45
      0082DD F7               [ 1]  574 	ld	(x), a
      0082DE 1E 05            [ 2]  575 	ldw	x, (0x05, sp)
      0082E0 5C               [ 2]  576 	incw	x
      0082E1 5C               [ 2]  577 	incw	x
      0082E2 A6 53            [ 1]  578 	ld	a, #0x53
      0082E4 F7               [ 1]  579 	ld	(x), a
      0082E5 1E 05            [ 2]  580 	ldw	x, (0x05, sp)
      0082E7 1C 00 03         [ 2]  581 	addw	x, #0x0003
      0082EA A6 54            [ 1]  582 	ld	a, #0x54
      0082EC F7               [ 1]  583 	ld	(x), a
                                    584 ;	testpatterns.c: 181: clk_set_source_auto(clk_source_hsi);
      0082ED 4B E1            [ 1]  585 	push	#0xe1
      0082EF CD 84 93         [ 4]  586 	call	_clk_set_source_auto
      0082F2 84               [ 1]  587 	pop	a
                                    588 ;	testpatterns.c: 182: clk_set_cpudiv(clk_cpudiv_1);
      0082F3 4B 00            [ 1]  589 	push	#0x00
      0082F5 CD 84 B7         [ 4]  590 	call	_clk_set_cpudiv
      0082F8 84               [ 1]  591 	pop	a
                                    592 ;	testpatterns.c: 183: clk_set_hsidiv(clk_hsidiv_8);
      0082F9 4B 03            [ 1]  593 	push	#0x03
      0082FB CD 84 A1         [ 4]  594 	call	_clk_set_hsidiv
      0082FE 84               [ 1]  595 	pop	a
                                    596 ;	testpatterns.c: 187: gpio_mode(LED1_PORT,1<<2,gpio_mode_out_pp); // set up led pin as push-pull output
      0082FF 4B 05            [ 1]  597 	push	#0x05
      008301 4B 04            [ 1]  598 	push	#0x04
      008303 4B 0F            [ 1]  599 	push	#0x0f
      008305 4B 50            [ 1]  600 	push	#0x50
      008307 CD 83 77         [ 4]  601 	call	_gpio_mode
      00830A 5B 04            [ 2]  602 	addw	sp, #4
                                    603 ;	testpatterns.c: 188: gpio_mode(LED2_PORT,1<<3,gpio_mode_out_pp);
      00830C 4B 05            [ 1]  604 	push	#0x05
      00830E 4B 08            [ 1]  605 	push	#0x08
      008310 4B 0F            [ 1]  606 	push	#0x0f
      008312 4B 50            [ 1]  607 	push	#0x50
      008314 CD 83 77         [ 4]  608 	call	_gpio_mode
      008317 5B 04            [ 2]  609 	addw	sp, #4
                                    610 ;	testpatterns.c: 189: gpio_mode(LED3_PORT,1<<4,gpio_mode_out_pp);
      008319 4B 05            [ 1]  611 	push	#0x05
      00831B 4B 10            [ 1]  612 	push	#0x10
      00831D 4B 0F            [ 1]  613 	push	#0x0f
      00831F 4B 50            [ 1]  614 	push	#0x50
      008321 CD 83 77         [ 4]  615 	call	_gpio_mode
      008324 5B 04            [ 2]  616 	addw	sp, #4
                                    617 ;	testpatterns.c: 190: gpio_mode(LED4_PORT,1<<5,gpio_mode_out_pp);
      008326 4B 05            [ 1]  618 	push	#0x05
      008328 4B 20            [ 1]  619 	push	#0x20
      00832A 4B 0F            [ 1]  620 	push	#0x0f
      00832C 4B 50            [ 1]  621 	push	#0x50
      00832E CD 83 77         [ 4]  622 	call	_gpio_mode
      008331 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	testpatterns.c: 192: gpio_mode(BUTTON_PORT,BUTTON_PIN,gpio_mode_in);
      008333 4B 00            [ 1]  625 	push	#0x00
      008335 4B 04            [ 1]  626 	push	#0x04
      008337 4B 05            [ 1]  627 	push	#0x05
      008339 4B 50            [ 1]  628 	push	#0x50
      00833B CD 83 77         [ 4]  629 	call	_gpio_mode
      00833E 5B 04            [ 2]  630 	addw	sp, #4
                                    631 ;	testpatterns.c: 194: gpio_mode(MOSI_PORT, MOSI_PIN, gpio_mode_out_pp);
      008340 4B 05            [ 1]  632 	push	#0x05
      008342 4B 40            [ 1]  633 	push	#0x40
      008344 4B 0A            [ 1]  634 	push	#0x0a
      008346 4B 50            [ 1]  635 	push	#0x50
      008348 CD 83 77         [ 4]  636 	call	_gpio_mode
      00834B 5B 04            [ 2]  637 	addw	sp, #4
                                    638 ;	testpatterns.c: 197: spi_txonly_start();
      00834D CD 85 27         [ 4]  639 	call	_spi_txonly_start
                                    640 ;	testpatterns.c: 198: while(1){
      008350 4F               [ 1]  641 	clr	a
      008351                        642 00102$:
                                    643 ;	testpatterns.c: 208: id++;
      008351 4C               [ 1]  644 	inc	a
                                    645 ;	testpatterns.c: 215: send_frame(data,id);
      008352 1E 05            [ 2]  646 	ldw	x, (0x05, sp)
      008354 88               [ 1]  647 	push	a
      008355 88               [ 1]  648 	push	a
      008356 89               [ 2]  649 	pushw	x
      008357 CD 82 34         [ 4]  650 	call	_send_frame
      00835A 5B 03            [ 2]  651 	addw	sp, #3
      00835C 84               [ 1]  652 	pop	a
      00835D 20 F2            [ 2]  653 	jra	00102$
      00835F 5B 06            [ 2]  654 	addw	sp, #6
      008361 81               [ 4]  655 	ret
                                    656 	.area CODE
                                    657 	.area INITIALIZER
                                    658 	.area CABS (ABS)
