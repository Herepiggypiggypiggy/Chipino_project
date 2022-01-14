#*********************************************************
# synthesize script for cell: module_test
# company: ontwerp_practicum
# designer: trjschram
#*********************************************************
set_db lib_search_path /data/designkit/tsmc-180nm/lib/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/
set_db init_hdl_search_path ../../../VHDL/
set_db library {tcb018gbwp7twc.lib}
set_db use_scan_seqs_for_non_dft false

#include backend/syn/tcl/read_hdl.tcl
read_hdl -vhdl {color_ctrl.vhd}
read_hdl -vhdl {display_ctrl.vhd}
read_hdl -vhdl {module_test.vhd}
read_hdl -vhdl {player_fsm.vhd}
read_hdl -vhdl {spi_v3.vhd}
read_hdl -vhdl {stable_map.vhd}
read_hdl -vhdl {texture_ctrl.vhd}
read_hdl -vhdl {tile_ctrl.vhd}
read_hdl -vhdl {vga.vhd}
read_hdl -vhdl {color_ctrl-behaviour.vhd}
read_hdl -vhdl {display_ctrl-behaviour.vhd}
read_hdl -vhdl {module_test-behaviour.vhd}
read_hdl -vhdl {player_fsm-behaviour.vhd}
read_hdl -vhdl {spi_v3-behaviour.vhd}
read_hdl -vhdl {stable_map-behaviour.vhd}
read_hdl -vhdl {texture_ctrl-behaviour.vhd}
read_hdl -vhdl {tile_ctrl-behaviour.vhd}
read_hdl -vhdl {vga-behaviour.vhd}
read_hdl -vhdl {display_ctrl_behavioural_cfg.vhd}
read_hdl -vhdl {color_ctrl_behavioural_cfg.vhd}
read_hdl -vhdl {tile_ctrl_behavioural_cfg.vhd}
read_hdl -vhdl {texture_ctrl_behaviour_cfg.vhd}
read_hdl -vhdl {stable_map_behaviour_cfg.vhd}
read_hdl -vhdl {spi_v3_behaviour_cfg.vhd}
read_hdl -vhdl {vga_behaviour_cfg.vhd}
read_hdl -vhdl {player_fsm_behaviour_cfg.vhd}
read_hdl -vhdl {module_test_behaviour_cfg.vhd}
#endincl

elaborate module_test_behaviour_cfg

#include backend/syn/in/module_test.sdc
# We will use a 25 MHz clock, 
# but use 33 MHz as constraint to be more sure it works.
dc::create_clock -name clk -period 30 -waveform {0 15} [dc::get_ports clk]
dc::set_driving_cell -cell INVD0BWP7T [dc::all_inputs]
dc::set_input_delay  .2 -clock clk [dc::all_inputs]
dc::set_output_delay .5 -clock clk [dc::all_outputs]
dc::set_load 1 [dc::all_outputs]
#endincl

synthesize -to_mapped
#set_db syn_generic_effort medium
#syn_generic
#syn_map

ungroup -all -flat
insert_tiehilo_cells
write_hdl -mapped > ../out/module_test.v
write_sdf > ../out/module_test.sdf
write_sdc > ../out/module_test.sdc

report timing
report gates

gui_show


