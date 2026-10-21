set clk_port clk
create_clock -name clk -period 20 [get_ports $clk_port]
set_clock_uncertainty 0.25 [get_clocks clk]
set_clock_transition 0.15 [get_clocks clk]

set_input_delay  10 -clock clk [get_ports {sensor_in mode_sel[*] clear_log}]
set_output_delay 10 -clock clk [get_ports {led_progress[*] led_done buzzer alarm_short good_cnt[*] bad_cnt[*]}]
set_false_path -from [get_ports rst_n]