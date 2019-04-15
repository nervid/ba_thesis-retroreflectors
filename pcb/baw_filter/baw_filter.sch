EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:baw_filter
LIBS:baw_filter-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_Coaxial J1
U 1 1 5AF9C736
P 2150 3400
F 0 "J1" H 2160 3520 50  0000 C CNN
F 1 "Conn_Coaxial" V 2265 3400 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SMA_Jack_Edge_Mount" H 2150 3400 50  0001 C CNN
F 3 "" H 2150 3400 50  0001 C CNN
	1    2150 3400
	-1   0    0    -1  
$EndComp
$Comp
L Conn_Coaxial J2
U 1 1 5AF9C7AA
P 4400 3400
F 0 "J2" H 4410 3520 50  0000 C CNN
F 1 "Conn_Coaxial" V 4515 3400 50  0000 C CNN
F 2 "Connectors_Molex:Molex_SMA_Jack_Edge_Mount" H 4400 3400 50  0001 C CNN
F 3 "" H 4400 3400 50  0001 C CNN
	1    4400 3400
	1    0    0    -1  
$EndComp
$Comp
L BAW_Filter U1
U 1 1 5AF9C870
P 3250 3400
F 0 "U1" H 3250 3600 60  0000 C CNN
F 1 "BAW_Filter" H 3550 3150 60  0000 C CNN
F 2 "qorvo_885062:885062" H 3250 3600 60  0001 C CNN
F 3 "" H 3250 3600 60  0001 C CNN
	1    3250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3400 2800 3400
Wire Wire Line
	3700 3400 4250 3400
Wire Wire Line
	2150 3600 2150 3900
Wire Wire Line
	4400 3900 4400 3600
$Comp
L L L1
U 1 1 5AF9C975
P 2650 3600
F 0 "L1" V 2600 3600 50  0000 C CNN
F 1 "9.1nH" V 2725 3600 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" H 2650 3600 50  0001 C CNN
F 3 "" H 2650 3600 50  0001 C CNN
	1    2650 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3750 3250 3900
Wire Wire Line
	2150 3900 4400 3900
Connection ~ 3250 3900
$Comp
L L L2
U 1 1 5AF9C9F4
P 3950 3600
F 0 "L2" V 3900 3600 50  0000 C CNN
F 1 "6.8nH" V 4025 3600 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" H 3950 3600 50  0001 C CNN
F 3 "" H 3950 3600 50  0001 C CNN
	1    3950 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3450 3950 3400
Connection ~ 3950 3400
Wire Wire Line
	3950 3750 3950 3900
Connection ~ 3950 3900
Wire Wire Line
	2650 3450 2650 3400
Connection ~ 2650 3400
Wire Wire Line
	2650 3750 2650 3900
Connection ~ 2650 3900
$EndSCHEMATC
