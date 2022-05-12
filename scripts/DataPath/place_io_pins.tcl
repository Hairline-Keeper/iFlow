#===========================================================
#   set environment variable
#===========================================================
source ../../scripts/common/set_env.tcl

#===========================================================
#   set tool related parameter
#===========================================================
# IO_RANDOM_SEED  Range(0~100)
set IO_RANDOM_SEED           "42" 
# INST_PLACE_DENSITY  Range(0~1)
set INST_PLACE_DENSITY       "0.9"

#===========================================================
#   half-perimeter wirelength statistic
#===========================================================
# Calculate HPWL
proc obtain_bTerm_center {bTerm} {
   set x_min 2147483647
   set y_min  2147483647
   set x_max -2147483648
   set y_max -2147483648		

  foreach bPin [$bTerm getBPins] {
    set box [$bPin getBox]
    if {[$box xMin] < $x_min} { set x_min [$box xMin] }
    if {[$box yMin] < $y_min} { set y_min [$box yMin] }
    if {[$box xMax] > $x_max} { set x_max [$box xMax] }
    if {[$box yMax] > $y_max} { set y_max [$box yMax] }
  }
  
  set x_center [expr ($x_min + $x_max)/2]
  set y_center [expr ($y_min + $y_max)/2]
  set center_list [list $x_center $y_center]
  return $center_list
}

proc obtain_iTerm_center {iTerm} {
  set avg_list [$iTerm getAvgXY]
  set x_center [lindex $avg_list 1]
  set y_center [lindex $avg_list 2]
  set center_list [list $x_center $y_center]
  return $center_list
}

proc report_total_hpwl {} {
   set total_hpwl 0
   set db [::ord::get_db]
   set block [[$db getChip] getBlock]
   foreach net [$block getNets] {
   set x_min 2147483647
   set y_min 2147483647
   set x_max -2147483648
   set y_max -2147483648
   
   foreach i_term [$net getITerms] {
     set center_list [obtain_iTerm_center $i_term]
     set center_x [lindex $center_list 0]
     set center_y [lindex $center_list 1]
     set x_min [expr $center_x < $x_min ? $center_x : $x_min]
     set y_min [expr $center_y < $y_min ? $center_y : $y_min]
     set x_max [expr $center_x > $x_max ? $center_x : $x_max]
     set y_max [expr $center_y > $y_max ? $center_y : $y_max]
     }
   
   foreach b_term [$net getBTerms] {
     set center_list [obtain_bTerm_center $b_term]
     set center_x [lindex $center_list 0]
     set center_y [lindex $center_list 1]
     set x_min [expr $center_x < $x_min ? $center_x : $x_min]
     set y_min [expr $center_y < $y_min ? $center_y : $y_min]
     set x_max [expr $center_x > $x_max ? $center_x : $x_max]
     set y_max [expr $center_y > $y_max ? $center_y : $y_max]
     }
   
   set total_hpwl [expr $total_hpwl + ($x_max - $x_min) + ($y_max -$y_min)]
   }
   return $total_hpwl
}

#===========================================================
#   main running
#===========================================================
# Read lef
foreach lef $LEF_FILES {
    read_lef $lef
}

# Read liberty files
foreach libFile $LIB_FILES {
    read_liberty $libFile
}

# Read verilog
read_verilog $PRE_RESULT_PATH/$DESIGN.v

link_design $DESIGN
read_sdc $SDC_FILE

# Place IO pins
io_placer -hor_layer 5 \
              -ver_layer 4 \
              -random_seed $IO_RANDOM_SEED \
              -random

# write output
write_def       $RESULT_PATH/$DESIGN.def
write_verilog   $RESULT_PATH/$DESIGN.v
#write_sdc      $RESULT_PATH/$DESIGN.sdc

# Run Place to evaluate HPWL
proc find_macros {} {
  set macros ""

  set db [::ord::get_db]
  set block [[$db getChip] getBlock]
  foreach inst [$block getInsts] {
    set inst_master [$inst getMaster]

    # BLOCK means MACRO cells
    if { [string match [$inst_master getType] "BLOCK"] } {
      append macros " " $inst
    }
  }
  return $macros
}

# Maintain plot directory
set PLOT_DIR $env(IFLOW_WORK_PATH)/plot
set dir_list [list arrow bin cell]
if {[file exist $PLOT_DIR]} {
	file delete -force -- {*}[glob -nocomplain -directory $PLOT_DIR *]
} else {
	file mkdir $PLOT_DIR
}
foreach dir $dir_list {
	file mkdir $PLOT_DIR/$dir
}

if {[find_macros] != ""} {
global_placement -incremental -overflow 0.9 -density $PLACE_DENSITY
macro_placement -global_config $IP_GLOBAL_CFG
} else {
  puts "No macros found: Skipping macro_placement"
}
global_placement -incremental -overflow 0.9 -density $PLACE_DENSITY
puts "\n=========================================================================="
puts "After Place IO pins"
puts "Total HPWL : [report_total_hpwl]"
puts "==========================================================================\n"

exit


