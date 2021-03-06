# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.11-s014_1 on Fri Jan 14 14:16:30 CET 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design stable_map

create_clock -name "clk" -add -period 30.0 -waveform {0.0 15.0} [get_ports clk]
set_load -pin_load 1.0 [get_ports {map_data[71]}]
set_load -pin_load 1.0 [get_ports {map_data[70]}]
set_load -pin_load 1.0 [get_ports {map_data[69]}]
set_load -pin_load 1.0 [get_ports {map_data[68]}]
set_load -pin_load 1.0 [get_ports {map_data[67]}]
set_load -pin_load 1.0 [get_ports {map_data[66]}]
set_load -pin_load 1.0 [get_ports {map_data[65]}]
set_load -pin_load 1.0 [get_ports {map_data[64]}]
set_load -pin_load 1.0 [get_ports {map_data[63]}]
set_load -pin_load 1.0 [get_ports {map_data[62]}]
set_load -pin_load 1.0 [get_ports {map_data[61]}]
set_load -pin_load 1.0 [get_ports {map_data[60]}]
set_load -pin_load 1.0 [get_ports {map_data[59]}]
set_load -pin_load 1.0 [get_ports {map_data[58]}]
set_load -pin_load 1.0 [get_ports {map_data[57]}]
set_load -pin_load 1.0 [get_ports {map_data[56]}]
set_load -pin_load 1.0 [get_ports {map_data[55]}]
set_load -pin_load 1.0 [get_ports {map_data[54]}]
set_load -pin_load 1.0 [get_ports {map_data[53]}]
set_load -pin_load 1.0 [get_ports {map_data[52]}]
set_load -pin_load 1.0 [get_ports {map_data[51]}]
set_load -pin_load 1.0 [get_ports {map_data[50]}]
set_load -pin_load 1.0 [get_ports {map_data[49]}]
set_load -pin_load 1.0 [get_ports {map_data[48]}]
set_load -pin_load 1.0 [get_ports {map_data[47]}]
set_load -pin_load 1.0 [get_ports {map_data[46]}]
set_load -pin_load 1.0 [get_ports {map_data[45]}]
set_load -pin_load 1.0 [get_ports {map_data[44]}]
set_load -pin_load 1.0 [get_ports {map_data[43]}]
set_load -pin_load 1.0 [get_ports {map_data[42]}]
set_load -pin_load 1.0 [get_ports {map_data[41]}]
set_load -pin_load 1.0 [get_ports {map_data[40]}]
set_load -pin_load 1.0 [get_ports {map_data[39]}]
set_load -pin_load 1.0 [get_ports {map_data[38]}]
set_load -pin_load 1.0 [get_ports {map_data[37]}]
set_load -pin_load 1.0 [get_ports {map_data[36]}]
set_load -pin_load 1.0 [get_ports {map_data[35]}]
set_load -pin_load 1.0 [get_ports {map_data[34]}]
set_load -pin_load 1.0 [get_ports {map_data[33]}]
set_load -pin_load 1.0 [get_ports {map_data[32]}]
set_load -pin_load 1.0 [get_ports {map_data[31]}]
set_load -pin_load 1.0 [get_ports {map_data[30]}]
set_load -pin_load 1.0 [get_ports {map_data[29]}]
set_load -pin_load 1.0 [get_ports {map_data[28]}]
set_load -pin_load 1.0 [get_ports {map_data[27]}]
set_load -pin_load 1.0 [get_ports {map_data[26]}]
set_load -pin_load 1.0 [get_ports {map_data[25]}]
set_load -pin_load 1.0 [get_ports {map_data[24]}]
set_load -pin_load 1.0 [get_ports {map_data[23]}]
set_load -pin_load 1.0 [get_ports {map_data[22]}]
set_load -pin_load 1.0 [get_ports {map_data[21]}]
set_load -pin_load 1.0 [get_ports {map_data[20]}]
set_load -pin_load 1.0 [get_ports {map_data[19]}]
set_load -pin_load 1.0 [get_ports {map_data[18]}]
set_load -pin_load 1.0 [get_ports {map_data[17]}]
set_load -pin_load 1.0 [get_ports {map_data[16]}]
set_load -pin_load 1.0 [get_ports {map_data[15]}]
set_load -pin_load 1.0 [get_ports {map_data[14]}]
set_load -pin_load 1.0 [get_ports {map_data[13]}]
set_load -pin_load 1.0 [get_ports {map_data[12]}]
set_load -pin_load 1.0 [get_ports {map_data[11]}]
set_load -pin_load 1.0 [get_ports {map_data[10]}]
set_load -pin_load 1.0 [get_ports {map_data[9]}]
set_load -pin_load 1.0 [get_ports {map_data[8]}]
set_load -pin_load 1.0 [get_ports {map_data[7]}]
set_load -pin_load 1.0 [get_ports {map_data[6]}]
set_load -pin_load 1.0 [get_ports {map_data[5]}]
set_load -pin_load 1.0 [get_ports {map_data[4]}]
set_load -pin_load 1.0 [get_ports {map_data[3]}]
set_load -pin_load 1.0 [get_ports {map_data[2]}]
set_load -pin_load 1.0 [get_ports {map_data[1]}]
set_load -pin_load 1.0 [get_ports {map_data[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports clk]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports map_updated]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports vga_done]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {dir_mined[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {dir_mined[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {dir_mined[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[71]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[70]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[69]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[68]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[67]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[66]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[65]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[64]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[63]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[62]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[61]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[60]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[59]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[58]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[57]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[56]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[55]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[54]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[53]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[52]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[51]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[50]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[49]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[48]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[47]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[46]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[45]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[44]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[43]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[42]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[41]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[40]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[39]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[38]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[37]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[36]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[35]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[34]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[33]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[32]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[31]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[30]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[29]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[28]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[27]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[26]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[25]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[24]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[23]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[22]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[21]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[20]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[19]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[18]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[17]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[16]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.2 [get_ports {map_data_volatile[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[71]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[70]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[69]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[68]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[67]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[66]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[65]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[64]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[63]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[62]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[61]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[60]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[59]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[58]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[57]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[56]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[55]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[54]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[53]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[52]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[51]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[50]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[49]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[48]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[47]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[46]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[45]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[44]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[43]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[42]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[41]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[40]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[39]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[38]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[37]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[36]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[35]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[34]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[33]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[32]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[31]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[30]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[29]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[28]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[27]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[26]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[25]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[24]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[23]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[22]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[21]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[20]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[19]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[18]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[17]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[16]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.5 [get_ports {map_data[0]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports clk]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports reset]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports map_updated]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports vga_done]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {dir_mined[2]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {dir_mined[1]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {dir_mined[0]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[71]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[70]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[69]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[68]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[67]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[66]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[65]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[64]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[63]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[62]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[61]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[60]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[59]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[58]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[57]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[56]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[55]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[54]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[53]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[52]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[51]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[50]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[49]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[48]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[47]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[46]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[45]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[44]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[43]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[42]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[41]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[40]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[39]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[38]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[37]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[36]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[35]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[34]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[33]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[32]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[31]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[30]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[29]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[28]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[27]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[26]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[25]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[24]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[23]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[22]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[21]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[20]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[19]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[18]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[17]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[16]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[15]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[14]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[13]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[12]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[11]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[10]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[9]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[8]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[7]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[6]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[5]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[4]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[3]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[2]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[1]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {map_data_volatile[0]}]
set_wire_load_mode "segmented"
set_wire_load_selection_group "WireAreaForZero" -library "tcb018gbwp7twc"
set_dont_use [get_lib_cells tcb018gbwp7twc/BHDBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAN2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAN2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI21D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI21D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI22D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD8BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP10BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP4BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAPBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDFQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL10BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL4BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILLBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD8BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2ND1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2ND2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND3D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND3D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR3D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR3D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOAI21D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOAI21D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GSDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GTIEHBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GTIELBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXNR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXNR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXOR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXOR2D2BWP7T]
