#===========================================================
#   set environment variable
#===========================================================
source ../../scripts/common/set_env.tcl

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

#===========================================================
#   instance area statistic
#===========================================================
proc report_inst_area {} {
  set total_area 0.0
  set db [::ord::get_db] 
  set block [[$db getChip] getBlock]
  set units [$block getDefUnits]
  foreach inst [$block getInsts] {
    set inst_master [$inst getMaster]
    # add total area.
    set inst_width [expr double([$inst_master getWidth]) / $units]
    set inst_height [expr double([$inst_master getHeight]) / $units]
    set total_area [expr $total_area + [expr $inst_width * $inst_height]]

  }
  return $total_area
}

puts "\n=========================================================================="
puts "report"
puts "--------------------------------------------------------------------------"
puts "[report_inst_area] (um^2)"
puts "==========================================================================\n"
