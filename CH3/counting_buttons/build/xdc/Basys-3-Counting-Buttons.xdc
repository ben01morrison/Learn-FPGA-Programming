## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
        # create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]
        set_property IOSTANDARD LVCMOS33 [get_ports clk]
        create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


## Switches
# set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]
# set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]
# set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]
# set_property -dict { PACKAGE_PIN W17 IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]
# set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports { SW[4] }]
# set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { SW[5] }]
# set_property -dict { PACKAGE_PIN W14 IOSTANDARD LVCMOS33 } [get_ports { SW[6] }]
# set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports { SW[7] }]
# set_property -dict { PACKAGE_PIN V2 IOSTANDARD LVCMOS33 } [get_ports { SW[8] }]
# set_property -dict { PACKAGE_PIN T3 IOSTANDARD LVCMOS33 } [get_ports { SW[9] }]
# set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS33 } [get_ports { SW[10] }]
# set_property -dict { PACKAGE_PIN R3 IOSTANDARD LVCMOS33 } [get_ports { SW[11] }]
# set_property -dict { PACKAGE_PIN W2 IOSTANDARD LVCMOS33 } [get_ports { SW[12] }]
# set_property -dict { PACKAGE_PIN U1 IOSTANDARD LVCMOS33 } [get_ports { SW[13] }]
# set_property -dict { PACKAGE_PIN T1 IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]
set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETSW }]



## LEDs
 set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]
 set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]
 set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]
 set_property -dict { PACKAGE_PIN V19 IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]
 set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]
 set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]
 set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]
 set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]
 set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 } [get_ports { LED[8] }]
 set_property -dict { PACKAGE_PIN V3 IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]
 set_property -dict { PACKAGE_PIN W3 IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]
 set_property -dict { PACKAGE_PIN U3 IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]
 set_property -dict { PACKAGE_PIN P3 IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]
 set_property -dict { PACKAGE_PIN N3 IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]
 set_property -dict { PACKAGE_PIN P1 IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]
 set_property -dict { PACKAGE_PIN L1 IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]



# 7 Segment Display
# Segment lines
 set_property -dict { PACKAGE_PIN W7 IOSTANDARD LVCMOS33 } [get_ports { cathode[0] }]
 set_property -dict { PACKAGE_PIN W6 IOSTANDARD LVCMOS33 } [get_ports { cathode[1] }]
 set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [get_ports { cathode[2] }]
 set_property -dict { PACKAGE_PIN V8 IOSTANDARD LVCMOS33 } [get_ports { cathode[3] }]
 set_property -dict { PACKAGE_PIN U5 IOSTANDARD LVCMOS33 } [get_ports { cathode[4] }]
 set_property -dict { PACKAGE_PIN V5 IOSTANDARD LVCMOS33 } [get_ports { cathode[5] }]
 set_property -dict { PACKAGE_PIN U7 IOSTANDARD LVCMOS33 } [get_ports { cathode[6] }]

# Decimal point
set_property -dict { PACKAGE_PIN V7 IOSTANDARD LVCMOS33 } [get_ports { cathode[7] }]

# Anode lines
 set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33 } [get_ports { anode[0] }]
 set_property -dict { PACKAGE_PIN U4 IOSTANDARD LVCMOS33 } [get_ports { anode[1] }]
 set_property -dict { PACKAGE_PIN V4 IOSTANDARD LVCMOS33 } [get_ports { anode[2] }]
 set_property -dict { PACKAGE_PIN W4 IOSTANDARD LVCMOS33 } [get_ports { anode[3] }]



## Buttons
## Center button
 set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { CENTER_BUTTON }]
## Up button
 set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[0] }]
## Left button
 set_property -dict { PACKAGE_PIN W19 IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[1] }]
## Right button
 set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[2] }]
## Down button
 set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[3] }]




## Pmod Header JA
## Sch name = JA1
# set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS33 } [get_ports { JA[0] }]
## Sch name = JA2
# set_property -dict { PACKAGE_PIN L2 IOSTANDARD LVCMOS33 } [get_ports { JA[1] }]
## Sch name = JA3
# set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]
## Sch name = JA4
# set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]
## Sch name = JA7
# set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]
## Sch name = JA8
# set_property -dict { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 } [get_ports { JA[5] }]
## Sch name = JA9
# set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports { JA[6] }]
## Sch name = JA10
# set_property -dict { PACKAGE_PIN G3 IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]

## Pmod Header JB
## Sch name = JB1
# set_property -dict { PACKAGE_PIN A14 IOSTANDARD LVCMOS33 } [get_ports { JB[0] }]
## Sch name = JB2
# set_property -dict { PACKAGE_PIN A16 IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]
## Sch name = JB3
# set_property -dict { PACKAGE_PIN B15 IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]
## Sch name = JB4
# set_property -dict { PACKAGE_PIN B16 IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]
## Sch name = JB7
# set_property -dict { PACKAGE_PIN A15 IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]
## Sch name = JB8
# set_property -dict { PACKAGE_PIN A17 IOSTANDARD LVCMOS33 } [get_ports { JB[5] }]
## Sch name = JB9
# set_property -dict { PACKAGE_PIN C15 IOSTANDARD LVCMOS33 } [get_ports { JB[6] }]
## Sch name = JB10
# set_property -dict { PACKAGE_PIN C16 IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]

## Pmod Header JC
## Sch name = JC1
# set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports { JC[0] }]
## Sch name = JC2
# set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]
## Sch name = JC3
# set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]
## Sch name = JC4
# set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]
## Sch name = JC7
# set_property -dict { PACKAGE_PIN L17 IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]
## Sch name = JC8
# set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { JC[5] }]
## Sch name = JC9
# set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { JC[6] }]
## Sch name = JC10
# set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]



## Pmod Header JXADC
## Sch name = XA1_P
# set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { JXADC[0] }]
## Sch name = XA2_P
# set_property -dict { PACKAGE_PIN L3 IOSTANDARD LVCMOS33 } [get_ports { JXADC[1] }]
## Sch name = XA3_P
# set_property -dict { PACKAGE_PIN M2 IOSTANDARD LVCMOS33 } [get_ports { JXADC[2] }]
## Sch name = XA4_P
# set_property -dict { PACKAGE_PIN N2 IOSTANDARD LVCMOS33 } [get_ports { JXADC[3] }]
## Sch name = XA1_N
# set_property -dict { PACKAGE_PIN K3 IOSTANDARD LVCMOS33 } [get_ports { JXADC[4] }]
## Sch name = XA2_N
# set_property -dict { PACKAGE_PIN M3 IOSTANDARD LVCMOS33 } [get_ports { JXADC[5] }]
## Sch name = XA3_N
# set_property -dict { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports { JXADC[6] }]
## Sch name = XA4_N
# set_property -dict { PACKAGE_PIN N1 IOSTANDARD LVCMOS33 } [get_ports { JXADC[7] }]




## VGA Connector
## Red Channel
# set_property -dict { PACKAGE_PIN G19 IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[0] }]
# set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[1] }]
# set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[2] }]
# set_property -dict { PACKAGE_PIN N19 IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[3] }]
## Blue Channel
# set_property -dict { PACKAGE_PIN N18 IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[0] }]
# set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[1] }]
# set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[2] }]
# set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[3] }]
## Green Channel
# set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[0] }]
# set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[1] }]
# set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[2] }]
# set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[3] }]
## Synchronization
# set_property -dict { PACKAGE_PIN P19 IOSTANDARD LVCMOS33 } [get_ports { HSYNC }]
# set_property -dict { PACKAGE_PIN R19 IOSTANDARD LVCMOS33 } [get_ports { VSYNC }]



## USB-RS232 Interface
# set_property -dict { PACKAGE_PIN B18 IOSTANDARD LVCMOS33 } [get_ports { RsRx }]
# set_property -dict { PACKAGE_PIN A18 IOSTANDARD LVCMOS33 } [get_ports { RsTx }]



## USB HID (PS/2)
# set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 PULLUP true } [get_ports PS2Clk]
# set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS33 PULLUP true } [get_ports PS2Data]


## Quad SPI Flash
# set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[0]}]
# set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[1]}]
# set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[2]}]
# set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[3]}]
# set_property -dict { PACKAGE_PIN K19 IOSTANDARD LVCMOS33 } [get_ports QspiCSn]




## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]