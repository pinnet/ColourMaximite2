EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L Memory_RAM:IS42S16400J-xC U2
U 1 1 5F1C8D23
P 5400 3750
F 0 "U2" H 5400 5331 50  0000 C CNN
F 1 "IS42S16400J-xC" H 5400 5240 50  0000 C CNN
F 2 "Package_SO:TSOP-II-54_22.2x10.16mm_P0.8mm" H 5400 3750 50  0001 C CNN
F 3 "http://www.issi.com/WW/pdf/42-45S16400J.pdf" H 4800 5000 50  0001 C CNN
	1    5400 3750
	1    0    0    -1  
$EndComp
Text GLabel 4600 2850 0    50   Input ~ 0
PF0
Text GLabel 4600 2950 0    50   Input ~ 0
PF1
Text GLabel 4600 3050 0    50   Input ~ 0
PF2
Text GLabel 4600 3150 0    50   Input ~ 0
PF3
Text GLabel 4600 3250 0    50   Input ~ 0
PF4
Text GLabel 4600 3350 0    50   Input ~ 0
PF5
Text GLabel 4600 3450 0    50   Input ~ 0
PF12
Text GLabel 4600 3550 0    50   Input ~ 0
PF13
Text GLabel 4600 3650 0    50   Input ~ 0
PF14
Text GLabel 4600 3750 0    50   Input ~ 0
PF15
Text GLabel 4600 4850 0    50   Input ~ 0
PF11
$Comp
L power:+3V3 #PWR08
U 1 1 5F2C5338
P 5400 1900
F 0 "#PWR08" H 5400 1750 50  0001 C CNN
F 1 "+3V3" H 5415 2073 50  0000 C CNN
F 2 "" H 5400 1900 50  0001 C CNN
F 3 "" H 5400 1900 50  0001 C CNN
	1    5400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2350 5100 2100
Wire Wire Line
	5100 2100 5200 2100
Wire Wire Line
	5700 2100 5700 2350
Wire Wire Line
	5400 2100 5400 1900
Connection ~ 5400 2100
Wire Wire Line
	5400 2100 5500 2100
Wire Wire Line
	5200 2350 5200 2100
Connection ~ 5200 2100
Wire Wire Line
	5200 2100 5300 2100
Wire Wire Line
	5300 2350 5300 2100
Connection ~ 5300 2100
Wire Wire Line
	5300 2100 5400 2100
Wire Wire Line
	5400 2350 5400 2100
Wire Wire Line
	5500 2350 5500 2100
Connection ~ 5500 2100
Wire Wire Line
	5500 2100 5600 2100
Wire Wire Line
	5600 2350 5600 2100
Connection ~ 5600 2100
Wire Wire Line
	5600 2100 5700 2100
$Comp
L power:GND #PWR09
U 1 1 5F2C674B
P 5400 5600
F 0 "#PWR09" H 5400 5350 50  0001 C CNN
F 1 "GND" H 5405 5427 50  0000 C CNN
F 2 "" H 5400 5600 50  0001 C CNN
F 3 "" H 5400 5600 50  0001 C CNN
	1    5400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5150 5100 5350
Wire Wire Line
	5700 5350 5700 5150
Wire Wire Line
	5400 5600 5400 5350
Connection ~ 5400 5350
Wire Wire Line
	5400 5350 5500 5350
Connection ~ 5600 5350
Wire Wire Line
	5600 5350 5700 5350
Wire Wire Line
	5500 5150 5500 5350
Connection ~ 5500 5350
Wire Wire Line
	5500 5350 5600 5350
Wire Wire Line
	5400 5150 5400 5350
Wire Wire Line
	5300 5150 5300 5350
Wire Wire Line
	5100 5350 5200 5350
Connection ~ 5300 5350
Wire Wire Line
	5300 5350 5400 5350
Wire Wire Line
	5200 5150 5200 5350
Connection ~ 5200 5350
Wire Wire Line
	5200 5350 5300 5350
Wire Wire Line
	5600 5150 5600 5350
Text GLabel 4600 2650 0    50   Input ~ 0
PG4
Text GLabel 4600 2750 0    50   Input ~ 0
PG5
Text GLabel 4600 3850 0    50   Input ~ 0
PG0
Text GLabel 4600 3950 0    50   Input ~ 0
PG1
Text GLabel 6200 2650 2    50   BiDi ~ 0
PD14
Text GLabel 6200 2750 2    50   BiDi ~ 0
PD15
Text GLabel 6200 2850 2    50   BiDi ~ 0
PD0
Text GLabel 6200 2950 2    50   BiDi ~ 0
PD1
Text GLabel 6200 3050 2    50   BiDi ~ 0
PE7
Text GLabel 6200 3150 2    50   BiDi ~ 0
PE8
Text GLabel 6200 3250 2    50   BiDi ~ 0
PE9
Text GLabel 6200 3350 2    50   BiDi ~ 0
PE10
Text GLabel 6200 3450 2    50   BiDi ~ 0
PE11
Text GLabel 6200 3550 2    50   BiDi ~ 0
PE12
Text GLabel 6200 3650 2    50   BiDi ~ 0
PE13
Text GLabel 6200 3750 2    50   BiDi ~ 0
PE14
Text GLabel 6200 3850 2    50   BiDi ~ 0
PE15
Text GLabel 6200 3950 2    50   BiDi ~ 0
PD8
Text GLabel 6200 4050 2    50   BiDi ~ 0
PD9
Text GLabel 6200 4150 2    50   BiDi ~ 0
PD10
Text GLabel 4600 4150 0    50   Input ~ 0
PH6
Text GLabel 4600 4250 0    50   Input ~ 0
PH7
Text GLabel 4600 4350 0    50   Input ~ 0
PG8
Text GLabel 4600 4450 0    50   Input ~ 0
PE0
Text GLabel 4600 4550 0    50   Input ~ 0
PE1
Text GLabel 4600 4650 0    50   Input ~ 0
PH5
Text GLabel 4600 4750 0    50   Input ~ 0
PG15
$EndSCHEMATC
