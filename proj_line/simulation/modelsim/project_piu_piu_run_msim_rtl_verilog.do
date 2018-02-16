transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {f:/quartus_14/14.0/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/window.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/signal_stm.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/clk_to_ADC.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/FIFO_ADC {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/FIFO_ADC/FIFO_ADC.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/AD_sp_AD_trig_wait.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/data_from_adc.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/reset_after_end_frame_module.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/centroids_selection.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/DEVIDER {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/DEVIDER/divider_bb.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/DIV_CENTR {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/DIV_CENTR/div_centr.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/concatenation.v}
vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/FIFO_STM {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/FIFO_STM/fifo_stm.v}

vlog -vlog01compat -work work +incdir+F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/simulation/modelsim {F:/QUARTUS_14/14.0/variants_project/interrogator(13.07)/interrogator(08.07)/interrogator/proj_line/simulation/modelsim/top_file.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_file_tb

add wave *
view structure
view signals
run -all
