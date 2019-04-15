                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Sat May 12 12:35:37 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module gpio
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _gpio_set
                                     13 	.globl _gpio_clr
                                     14 	.globl _gpio_mode
                                     15 	.globl _gpio_toggle
                                     16 	.globl _gpio_read
                                     17 	.globl _gpio_write_port
                                     18 	.globl _gpio_read_port
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 ;--------------------------------------------------------
                                     32 ; global & static initialisations
                                     33 ;--------------------------------------------------------
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area GSINIT
                                     38 ;--------------------------------------------------------
                                     39 ; Home
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area HOME
                                     43 ;--------------------------------------------------------
                                     44 ; code
                                     45 ;--------------------------------------------------------
                                     46 	.area CODE
                                     47 ;	../../../../ulibSTM8/lib/gpio.c: 4: void gpio_set(gpio_t* port, gpio_pin_t pin)
                                     48 ;	-----------------------------------------
                                     49 ;	 function gpio_set
                                     50 ;	-----------------------------------------
      008362                         51 _gpio_set:
                                     52 ;	../../../../ulibSTM8/lib/gpio.c: 6: port->odr |= pin;
      008362 1E 03            [ 2]   53 	ldw	x, (0x03, sp)
      008364 F6               [ 1]   54 	ld	a, (x)
      008365 1A 05            [ 1]   55 	or	a, (0x05, sp)
      008367 F7               [ 1]   56 	ld	(x), a
      008368 81               [ 4]   57 	ret
                                     58 ;	../../../../ulibSTM8/lib/gpio.c: 9: void gpio_clr(gpio_t* port, gpio_pin_t pin)
                                     59 ;	-----------------------------------------
                                     60 ;	 function gpio_clr
                                     61 ;	-----------------------------------------
      008369                         62 _gpio_clr:
      008369 88               [ 1]   63 	push	a
                                     64 ;	../../../../ulibSTM8/lib/gpio.c: 11: port->odr &= ~pin;
      00836A 1E 04            [ 2]   65 	ldw	x, (0x04, sp)
      00836C F6               [ 1]   66 	ld	a, (x)
      00836D 6B 01            [ 1]   67 	ld	(0x01, sp), a
      00836F 7B 06            [ 1]   68 	ld	a, (0x06, sp)
      008371 43               [ 1]   69 	cpl	a
      008372 14 01            [ 1]   70 	and	a, (0x01, sp)
      008374 F7               [ 1]   71 	ld	(x), a
      008375 84               [ 1]   72 	pop	a
      008376 81               [ 4]   73 	ret
                                     74 ;	../../../../ulibSTM8/lib/gpio.c: 15: void gpio_mode(gpio_t* port, gpio_pin_t pin, gpio_mode_t mode){
                                     75 ;	-----------------------------------------
                                     76 ;	 function gpio_mode
                                     77 ;	-----------------------------------------
      008377                         78 _gpio_mode:
      008377 52 07            [ 2]   79 	sub	sp, #7
                                     80 ;	../../../../ulibSTM8/lib/gpio.c: 17: switch (mode) {
      008379 7B 0D            [ 1]   81 	ld	a, (0x0d, sp)
      00837B A1 07            [ 1]   82 	cp	a, #0x07
      00837D 23 03            [ 2]   83 	jrule	00117$
      00837F CC 84 77         [ 2]   84 	jp	00111$
      008382                         85 00117$:
                                     86 ;	../../../../ulibSTM8/lib/gpio.c: 20: port->ddr &= ~pin;
      008382 16 0A            [ 2]   87 	ldw	y, (0x0a, sp)
      008384 17 06            [ 2]   88 	ldw	(0x06, sp), y
      008386 7B 0C            [ 1]   89 	ld	a, (0x0c, sp)
      008388 43               [ 1]   90 	cpl	a
      008389 6B 03            [ 1]   91 	ld	(0x03, sp), a
      00838B 1E 06            [ 2]   92 	ldw	x, (0x06, sp)
      00838D 5C               [ 2]   93 	incw	x
      00838E 5C               [ 2]   94 	incw	x
      00838F 1F 01            [ 2]   95 	ldw	(0x01, sp), x
                                     96 ;	../../../../ulibSTM8/lib/gpio.c: 21: port->cr1 &= ~pin;
      008391 16 06            [ 2]   97 	ldw	y, (0x06, sp)
      008393 72 A9 00 03      [ 2]   98 	addw	y, #0x0003
                                     99 ;	../../../../ulibSTM8/lib/gpio.c: 22: port->cr2 &= ~pin;
      008397 1E 06            [ 2]  100 	ldw	x, (0x06, sp)
      008399 1C 00 04         [ 2]  101 	addw	x, #0x0004
      00839C 1F 04            [ 2]  102 	ldw	(0x04, sp), x
                                    103 ;	../../../../ulibSTM8/lib/gpio.c: 17: switch (mode) {
      00839E 5F               [ 1]  104 	clrw	x
      00839F 7B 0D            [ 1]  105 	ld	a, (0x0d, sp)
      0083A1 97               [ 1]  106 	ld	xl, a
      0083A2 58               [ 2]  107 	sllw	x
      0083A3 DE 83 A7         [ 2]  108 	ldw	x, (#00118$, x)
      0083A6 FC               [ 2]  109 	jp	(x)
      0083A7                        110 00118$:
      0083A7 83 B7                  111 	.dw	#00101$
      0083A9 83 D0                  112 	.dw	#00102$
      0083AB 83 E9                  113 	.dw	#00103$
      0083AD 84 01                  114 	.dw	#00104$
      0083AF 84 19                  115 	.dw	#00105$
      0083B1 84 31                  116 	.dw	#00106$
      0083B3 84 49                  117 	.dw	#00107$
      0083B5 84 61                  118 	.dw	#00108$
                                    119 ;	../../../../ulibSTM8/lib/gpio.c: 19: case gpio_mode_in: {
      0083B7                        120 00101$:
                                    121 ;	../../../../ulibSTM8/lib/gpio.c: 20: port->ddr &= ~pin;
      0083B7 1E 01            [ 2]  122 	ldw	x, (0x01, sp)
      0083B9 F6               [ 1]  123 	ld	a, (x)
      0083BA 14 03            [ 1]  124 	and	a, (0x03, sp)
      0083BC 1E 01            [ 2]  125 	ldw	x, (0x01, sp)
      0083BE F7               [ 1]  126 	ld	(x), a
                                    127 ;	../../../../ulibSTM8/lib/gpio.c: 21: port->cr1 &= ~pin;
      0083BF 90 F6            [ 1]  128 	ld	a, (y)
      0083C1 14 03            [ 1]  129 	and	a, (0x03, sp)
      0083C3 90 F7            [ 1]  130 	ld	(y), a
                                    131 ;	../../../../ulibSTM8/lib/gpio.c: 22: port->cr2 &= ~pin;
      0083C5 1E 04            [ 2]  132 	ldw	x, (0x04, sp)
      0083C7 F6               [ 1]  133 	ld	a, (x)
      0083C8 14 03            [ 1]  134 	and	a, (0x03, sp)
      0083CA 1E 04            [ 2]  135 	ldw	x, (0x04, sp)
      0083CC F7               [ 1]  136 	ld	(x), a
                                    137 ;	../../../../ulibSTM8/lib/gpio.c: 23: break;
      0083CD CC 84 77         [ 2]  138 	jp	00111$
                                    139 ;	../../../../ulibSTM8/lib/gpio.c: 25: case gpio_mode_in_pup: {
      0083D0                        140 00102$:
                                    141 ;	../../../../ulibSTM8/lib/gpio.c: 26: port->ddr &= ~pin;
      0083D0 1E 01            [ 2]  142 	ldw	x, (0x01, sp)
      0083D2 F6               [ 1]  143 	ld	a, (x)
      0083D3 14 03            [ 1]  144 	and	a, (0x03, sp)
      0083D5 1E 01            [ 2]  145 	ldw	x, (0x01, sp)
      0083D7 F7               [ 1]  146 	ld	(x), a
                                    147 ;	../../../../ulibSTM8/lib/gpio.c: 27: port->cr1 |= pin;
      0083D8 90 F6            [ 1]  148 	ld	a, (y)
      0083DA 1A 0C            [ 1]  149 	or	a, (0x0c, sp)
      0083DC 90 F7            [ 1]  150 	ld	(y), a
                                    151 ;	../../../../ulibSTM8/lib/gpio.c: 28: port->cr2 &= ~pin;
      0083DE 1E 04            [ 2]  152 	ldw	x, (0x04, sp)
      0083E0 F6               [ 1]  153 	ld	a, (x)
      0083E1 14 03            [ 1]  154 	and	a, (0x03, sp)
      0083E3 1E 04            [ 2]  155 	ldw	x, (0x04, sp)
      0083E5 F7               [ 1]  156 	ld	(x), a
                                    157 ;	../../../../ulibSTM8/lib/gpio.c: 29: break;
      0083E6 CC 84 77         [ 2]  158 	jp	00111$
                                    159 ;	../../../../ulibSTM8/lib/gpio.c: 31: case gpio_mode_in_int: {
      0083E9                        160 00103$:
                                    161 ;	../../../../ulibSTM8/lib/gpio.c: 32: port->ddr &= ~pin;
      0083E9 1E 01            [ 2]  162 	ldw	x, (0x01, sp)
      0083EB F6               [ 1]  163 	ld	a, (x)
      0083EC 14 03            [ 1]  164 	and	a, (0x03, sp)
      0083EE 1E 01            [ 2]  165 	ldw	x, (0x01, sp)
      0083F0 F7               [ 1]  166 	ld	(x), a
                                    167 ;	../../../../ulibSTM8/lib/gpio.c: 33: port->cr1 &= ~pin;
      0083F1 90 F6            [ 1]  168 	ld	a, (y)
      0083F3 14 03            [ 1]  169 	and	a, (0x03, sp)
      0083F5 90 F7            [ 1]  170 	ld	(y), a
                                    171 ;	../../../../ulibSTM8/lib/gpio.c: 34: port->cr2 |= pin;
      0083F7 1E 04            [ 2]  172 	ldw	x, (0x04, sp)
      0083F9 F6               [ 1]  173 	ld	a, (x)
      0083FA 1A 0C            [ 1]  174 	or	a, (0x0c, sp)
      0083FC 1E 04            [ 2]  175 	ldw	x, (0x04, sp)
      0083FE F7               [ 1]  176 	ld	(x), a
                                    177 ;	../../../../ulibSTM8/lib/gpio.c: 35: break;
      0083FF 20 76            [ 2]  178 	jra	00111$
                                    179 ;	../../../../ulibSTM8/lib/gpio.c: 37: case gpio_mode_in_int_pup: {
      008401                        180 00104$:
                                    181 ;	../../../../ulibSTM8/lib/gpio.c: 38: port->ddr &= ~pin;
      008401 1E 01            [ 2]  182 	ldw	x, (0x01, sp)
      008403 F6               [ 1]  183 	ld	a, (x)
      008404 14 03            [ 1]  184 	and	a, (0x03, sp)
      008406 1E 01            [ 2]  185 	ldw	x, (0x01, sp)
      008408 F7               [ 1]  186 	ld	(x), a
                                    187 ;	../../../../ulibSTM8/lib/gpio.c: 39: port->cr1 |= pin;
      008409 90 F6            [ 1]  188 	ld	a, (y)
      00840B 1A 0C            [ 1]  189 	or	a, (0x0c, sp)
      00840D 90 F7            [ 1]  190 	ld	(y), a
                                    191 ;	../../../../ulibSTM8/lib/gpio.c: 40: port->cr2 |= pin;
      00840F 1E 04            [ 2]  192 	ldw	x, (0x04, sp)
      008411 F6               [ 1]  193 	ld	a, (x)
      008412 1A 0C            [ 1]  194 	or	a, (0x0c, sp)
      008414 1E 04            [ 2]  195 	ldw	x, (0x04, sp)
      008416 F7               [ 1]  196 	ld	(x), a
                                    197 ;	../../../../ulibSTM8/lib/gpio.c: 41: break;
      008417 20 5E            [ 2]  198 	jra	00111$
                                    199 ;	../../../../ulibSTM8/lib/gpio.c: 44: case gpio_mode_out_od: {
      008419                        200 00105$:
                                    201 ;	../../../../ulibSTM8/lib/gpio.c: 45: port->ddr |= pin;
      008419 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      00841B F6               [ 1]  203 	ld	a, (x)
      00841C 1A 0C            [ 1]  204 	or	a, (0x0c, sp)
      00841E 1E 01            [ 2]  205 	ldw	x, (0x01, sp)
      008420 F7               [ 1]  206 	ld	(x), a
                                    207 ;	../../../../ulibSTM8/lib/gpio.c: 46: port->cr1 &= ~pin;
      008421 90 F6            [ 1]  208 	ld	a, (y)
      008423 14 03            [ 1]  209 	and	a, (0x03, sp)
      008425 90 F7            [ 1]  210 	ld	(y), a
                                    211 ;	../../../../ulibSTM8/lib/gpio.c: 47: port->cr2 &= ~pin;
      008427 1E 04            [ 2]  212 	ldw	x, (0x04, sp)
      008429 F6               [ 1]  213 	ld	a, (x)
      00842A 14 03            [ 1]  214 	and	a, (0x03, sp)
      00842C 1E 04            [ 2]  215 	ldw	x, (0x04, sp)
      00842E F7               [ 1]  216 	ld	(x), a
                                    217 ;	../../../../ulibSTM8/lib/gpio.c: 48: break;
      00842F 20 46            [ 2]  218 	jra	00111$
                                    219 ;	../../../../ulibSTM8/lib/gpio.c: 50: case gpio_mode_out_pp: {
      008431                        220 00106$:
                                    221 ;	../../../../ulibSTM8/lib/gpio.c: 51: port->ddr |= pin;
      008431 1E 01            [ 2]  222 	ldw	x, (0x01, sp)
      008433 F6               [ 1]  223 	ld	a, (x)
      008434 1A 0C            [ 1]  224 	or	a, (0x0c, sp)
      008436 1E 01            [ 2]  225 	ldw	x, (0x01, sp)
      008438 F7               [ 1]  226 	ld	(x), a
                                    227 ;	../../../../ulibSTM8/lib/gpio.c: 52: port->cr1 |= pin;
      008439 90 F6            [ 1]  228 	ld	a, (y)
      00843B 1A 0C            [ 1]  229 	or	a, (0x0c, sp)
      00843D 90 F7            [ 1]  230 	ld	(y), a
                                    231 ;	../../../../ulibSTM8/lib/gpio.c: 53: port->cr2 &= ~pin;
      00843F 1E 04            [ 2]  232 	ldw	x, (0x04, sp)
      008441 F6               [ 1]  233 	ld	a, (x)
      008442 14 03            [ 1]  234 	and	a, (0x03, sp)
      008444 1E 04            [ 2]  235 	ldw	x, (0x04, sp)
      008446 F7               [ 1]  236 	ld	(x), a
                                    237 ;	../../../../ulibSTM8/lib/gpio.c: 54: break;
      008447 20 2E            [ 2]  238 	jra	00111$
                                    239 ;	../../../../ulibSTM8/lib/gpio.c: 56: case gpio_mode_out_od_fast: {
      008449                        240 00107$:
                                    241 ;	../../../../ulibSTM8/lib/gpio.c: 57: port->ddr |= pin;
      008449 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      00844B F6               [ 1]  243 	ld	a, (x)
      00844C 1A 0C            [ 1]  244 	or	a, (0x0c, sp)
      00844E 1E 01            [ 2]  245 	ldw	x, (0x01, sp)
      008450 F7               [ 1]  246 	ld	(x), a
                                    247 ;	../../../../ulibSTM8/lib/gpio.c: 58: port->cr1 &= ~pin;
      008451 90 F6            [ 1]  248 	ld	a, (y)
      008453 14 03            [ 1]  249 	and	a, (0x03, sp)
      008455 90 F7            [ 1]  250 	ld	(y), a
                                    251 ;	../../../../ulibSTM8/lib/gpio.c: 59: port->cr2 |= pin;
      008457 1E 04            [ 2]  252 	ldw	x, (0x04, sp)
      008459 F6               [ 1]  253 	ld	a, (x)
      00845A 1A 0C            [ 1]  254 	or	a, (0x0c, sp)
      00845C 1E 04            [ 2]  255 	ldw	x, (0x04, sp)
      00845E F7               [ 1]  256 	ld	(x), a
                                    257 ;	../../../../ulibSTM8/lib/gpio.c: 60: break;
      00845F 20 16            [ 2]  258 	jra	00111$
                                    259 ;	../../../../ulibSTM8/lib/gpio.c: 62: case gpio_mode_out_pp_fast: {
      008461                        260 00108$:
                                    261 ;	../../../../ulibSTM8/lib/gpio.c: 63: port->ddr |= pin;
      008461 1E 01            [ 2]  262 	ldw	x, (0x01, sp)
      008463 F6               [ 1]  263 	ld	a, (x)
      008464 1A 0C            [ 1]  264 	or	a, (0x0c, sp)
      008466 1E 01            [ 2]  265 	ldw	x, (0x01, sp)
      008468 F7               [ 1]  266 	ld	(x), a
                                    267 ;	../../../../ulibSTM8/lib/gpio.c: 64: port->cr1 |= pin;
      008469 90 F6            [ 1]  268 	ld	a, (y)
      00846B 1A 0C            [ 1]  269 	or	a, (0x0c, sp)
      00846D 90 F7            [ 1]  270 	ld	(y), a
                                    271 ;	../../../../ulibSTM8/lib/gpio.c: 65: port->cr2 |= pin;
      00846F 1E 04            [ 2]  272 	ldw	x, (0x04, sp)
      008471 F6               [ 1]  273 	ld	a, (x)
      008472 1A 0C            [ 1]  274 	or	a, (0x0c, sp)
      008474 1E 04            [ 2]  275 	ldw	x, (0x04, sp)
      008476 F7               [ 1]  276 	ld	(x), a
                                    277 ;	../../../../ulibSTM8/lib/gpio.c: 71: }
      008477                        278 00111$:
      008477 5B 07            [ 2]  279 	addw	sp, #7
      008479 81               [ 4]  280 	ret
                                    281 ;	../../../../ulibSTM8/lib/gpio.c: 75: void gpio_toggle(gpio_t* port, gpio_pin_t pin)
                                    282 ;	-----------------------------------------
                                    283 ;	 function gpio_toggle
                                    284 ;	-----------------------------------------
      00847A                        285 _gpio_toggle:
                                    286 ;	../../../../ulibSTM8/lib/gpio.c: 77: port->odr = port->odr ^ pin;
      00847A 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
      00847C F6               [ 1]  288 	ld	a, (x)
      00847D 18 05            [ 1]  289 	xor	a, (0x05, sp)
      00847F F7               [ 1]  290 	ld	(x), a
      008480 81               [ 4]  291 	ret
                                    292 ;	../../../../ulibSTM8/lib/gpio.c: 81: uint8_t gpio_read(gpio_t* port, gpio_pin_t pin)
                                    293 ;	-----------------------------------------
                                    294 ;	 function gpio_read
                                    295 ;	-----------------------------------------
      008481                        296 _gpio_read:
                                    297 ;	../../../../ulibSTM8/lib/gpio.c: 83: return (port->idr & pin);
      008481 1E 03            [ 2]  298 	ldw	x, (0x03, sp)
      008483 E6 01            [ 1]  299 	ld	a, (0x1, x)
      008485 14 05            [ 1]  300 	and	a, (0x05, sp)
      008487 81               [ 4]  301 	ret
                                    302 ;	../../../../ulibSTM8/lib/gpio.c: 86: void gpio_write_port(gpio_t* port, uint8_t val)
                                    303 ;	-----------------------------------------
                                    304 ;	 function gpio_write_port
                                    305 ;	-----------------------------------------
      008488                        306 _gpio_write_port:
                                    307 ;	../../../../ulibSTM8/lib/gpio.c: 88: port->odr = val;
      008488 1E 03            [ 2]  308 	ldw	x, (0x03, sp)
      00848A 7B 05            [ 1]  309 	ld	a, (0x05, sp)
      00848C F7               [ 1]  310 	ld	(x), a
      00848D 81               [ 4]  311 	ret
                                    312 ;	../../../../ulibSTM8/lib/gpio.c: 91: uint8_t gpio_read_port(gpio_t* port)
                                    313 ;	-----------------------------------------
                                    314 ;	 function gpio_read_port
                                    315 ;	-----------------------------------------
      00848E                        316 _gpio_read_port:
                                    317 ;	../../../../ulibSTM8/lib/gpio.c: 93: return port->idr;
      00848E 1E 03            [ 2]  318 	ldw	x, (0x03, sp)
      008490 E6 01            [ 1]  319 	ld	a, (0x1, x)
      008492 81               [ 4]  320 	ret
                                    321 	.area CODE
                                    322 	.area INITIALIZER
                                    323 	.area CABS (ABS)
