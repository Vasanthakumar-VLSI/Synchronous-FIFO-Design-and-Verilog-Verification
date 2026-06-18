onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /top/w_data
add wave -noupdate -radix unsigned /top/wt_pt
add wave -noupdate -radix unsigned /top/rd_pt
add wave -noupdate -radix unsigned /top/clk
add wave -noupdate -radix unsigned /top/rst
add wave -noupdate -radix unsigned /top/wt_en
add wave -noupdate -radix unsigned /top/rd_en
add wave -noupdate -radix unsigned /top/full
add wave -noupdate -radix unsigned /top/empty
add wave -noupdate -radix unsigned /top/overflow
add wave -noupdate -radix unsigned /top/underflow
add wave -noupdate -radix unsigned /top/rdata
add wave -noupdate -radix unsigned /top/i
add wave -noupdate -radix unsigned /top/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {303 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {407 ps}
