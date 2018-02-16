onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /firsttry_tb/DUT/request_count
add wave -noupdate -expand /firsttry_tb/DUT/count
add wave -noupdate /firsttry_tb/DUT/signal_to_diods_temp
add wave -noupdate /firsttry_tb/DUT/clk_200MHz_i
add wave -noupdate /firsttry_tb/DUT/clk_5MHz_i
add wave -noupdate /firsttry_tb/stm_signal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 105
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {3150 ns}
