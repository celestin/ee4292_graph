derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}
check_zrt_routability  -error_view CHIP.err
set_ignored_layers  -max_routing_layer M9
source -echo /usr/cadtool/cad/synopsys/SAED32_EDK/tech/milkyway/saed32nm_ant_1p9m.tcl
set_si_options -delta_delay true -static_noise true -timing_window false -min_delta_delay false -static_noise_threshold_above_low 0.30 -static_noise_threshold_below_high 0.30 -route_xtalk_prevention true -route_xtalk_prevention_threshold 0.35 -analysis_effort medium -max_transition_mode normal_slew
route_zrt_group -all_clock_nets
route_zrt_auto
route_opt -stage detail -xtalk_reduction
report_timing
report_timing -delay_type min
report_power
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -create_ports top
save_mw_cel CHIP
save_mw_cel -as 5_route
