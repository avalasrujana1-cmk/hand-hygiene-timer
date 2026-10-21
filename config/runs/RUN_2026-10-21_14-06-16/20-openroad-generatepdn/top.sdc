###############################################################################
# Created by write_sdc
###############################################################################
current_design top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 20.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {clear_log}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mode_sel[0]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mode_sel[1]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sensor_in}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alarm_short}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[0]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[1]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[2]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[3]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[4]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[5]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[6]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {bad_cnt[7]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {buzzer}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[0]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[1]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[2]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[3]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[4]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[5]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[6]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {good_cnt[7]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led_done}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led_progress[0]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led_progress[1]}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led_progress[2]}]
set_false_path\
    -from [get_ports {rst_n}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
