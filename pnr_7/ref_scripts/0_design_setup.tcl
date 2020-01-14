source ../../ref_scripts/setup.tcl
create_mw_lib  -technology /usr/cadtool/cad/synopsys/SAED32_EDK/tech/milkyway/saed32nm_1p9m_mw.tf -mw_reference_library {/usr/cadtool/cad/synopsys/SAED32_EDK/lib/stdcell_hvt/milkyway/saed32nm_hvt_1p9m} -bus_naming_style {[%d]}  -open  worker
import_designs -format verilog -top worker -cel worker {../pre_layout/design_data/worker_syn.v}
read_sdc  -version 1.9 "../pre_layout/design_data/worker_syn.sdc"
set_tlu_plus_files -max_tluplus /usr/cadtool/cad/synopsys/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus -min_tluplus /usr/cadtool/cad/synopsys/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus -tech2itf_map  /usr/cadtool/cad/synopsys/SAED32_EDK/tech/star_rcxt/saed32nm_tf_itf_tluplus.map
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -create_ports top
save_mw_cel worker
save_mw_cel -as 0_design_setup
