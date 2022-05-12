#===========================================================
#   set environment variable
#===========================================================
source ../../scripts/common/set_env.tcl

#===========================================================
#   set tool related parameter
#===========================================================
set DIE_AREA            "0 0 296 296" 
set CORE_AREA           "5 5 291 291" 
set TRACKS_INFO_FILE    "$PROJ_PATH/foundry/$FOUNDRY/tracks.info" 
set PLACE_SITE          "unit" 
set IP_GLOBAL_CFG       "$PROJ_PATH/scripts/$DESIGN/IP_global.cfg"
set PLACE_DENSITY       "1"

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

puts "\n=========================================================================="
puts "report total insts area"
puts "--------------------------------------------------------------------------"
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
puts "[report_inst_area] (um^2)"
puts "==========================================================================\n"

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

proc placeInst {inst_name ptx pty orient {lib_cell ""}} {
    set db [::ord::get_db]
    set tech [$db getTech]
    set block [[$db getChip] getBlock]
    if {[set inst [$block findInst $inst_name]] == "NULL"} {
        set inst [odb::dbInst_create $block [$db findMaster $lib_cell] $inst_name]
    }

    $inst setOrigin $ptx $pty
    $inst setOrient $orient
    $inst setPlacementStatus "FIRM"
}

proc placePort {port_name bd_box metal} {
    set db [::ord::get_db]
    set tech [$db getTech]
    set block [[$db getChip] getBlock]
    set layer [$tech findLayer $metal]
    set term [$block findBTerm $port_name]
    set pin [odb::dbBPin_create $term]
    odb::dbBox_create $pin $layer [lindex $bd_box 0] \
                                  [lindex $bd_box 1] \
                                  [lindex $bd_box 2] \
                                  [lindex $bd_box 3]
    $pin setPlacementStatus "FIRM"
}

proc placePadcell {port_name metal inst_pad_name ptx pty orient } {
    set db    [::ord::get_db]
    set tech  [$db getTech]
    set block [[$db getChip] getBlock]
    set layer [$tech findLayer $metal]
    set inst_name [regsub {/\w+\s*$} $inst_pad_name ""]
    set pad_name  [regsub {.*/} $inst_pad_name ""]
    if {[set term [$block findBTerm $port_name]] == "NULL"} {
        puts "Error: cannot find port : $port_name!\n"
        return
    }
    if {[set inst [$block findInst $inst_name]] == "NULL"} {
        puts "Error: cannot find inst : $inst_name!\n"
        return
    }
    set net [$term getNet]
    foreach iterm [$net getITerms] {
        $iterm setSpecial
    }
    $term setSpecial
    $net setSpecial

    set pin [odb::dbBPin_create $term]
    $inst setOrigin $ptx $pty
    $inst setOrient $orient
    $inst setPlacementStatus "FIRM"

    set mterm [[$inst getMaster] findMTerm $pad_name]
    set mpin [lindex [$mterm getMPins] 0]
    foreach geometry [$mpin getGeometry] {
        if {[[$geometry getTechLayer] getName] == $metal} {
            set pin_box [pdngen::transform_box [$geometry xMin] [$geometry yMin] [$geometry xMax] [$geometry yMax] [$inst getOrigin] [$inst getOrient]]
            odb::dbBox_create $pin $layer {*}$pin_box
            $pin setPlacementStatus "FIRM"
        }
    } 

}

# Initialize floorplan using ICeWall FOOTPRINT
# ----------------------------------------------------------------------------
if {[info exists strategy_file]} {
    ICeWall load_footprint $strategy_file

    initialize_floorplan \
        -die_area  [ICeWall get_die_area] \
        -core_area [ICeWall get_core_area] \
        -tracks    $TRACKS_INFO_FILE \
        -site      $PLACE_SITE

    ICeWall init_footprint $sigmap_file

# Initialize floorplan using CORE_UTILIZATION
# ----------------------------------------------------------------------------
} elseif {[info exists CORE_UTILIZATION] && $CORE_UTILIZATION != "" } {
  initialize_floorplan -utilization $CORE_UTILIZATION \
                       -aspect_ratio $CORE_ASPECT_RATIO \
                       -core_space $CORE_MARGIN \
                       -tracks $TRACKS_INFO_FILE \
                       -site $PLACE_SITE

# Initialize floorplan using DIE_AREA/CORE_AREA
# ----------------------------------------------------------------------------
} else {
    initialize_floorplan -die_area $DIE_AREA \
                         -core_area $CORE_AREA \
                         -tracks $TRACKS_INFO_FILE \
                         -site $PLACE_SITE

puts "\n=========================================================================="
puts "Begin Place IO pins"
puts "--------------------------------------------------------------------------"
    io_placer -hor_layer 5 \
              -ver_layer 4 \
              -random_seed 100 \
              -random

}

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


if {[find_macros] != ""} {
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
global_placement -incremental -overflow 0.9 -density $PLACE_DENSITY
macro_placement -global_config $IP_GLOBAL_CFG
puts "--------------------------------------------------------------------------"
puts "After Place IO pins"
puts "Total HPWL : [report_total_hpwl]"
puts "==========================================================================\n"


foreach macro [find_macros] {
   $macro setOrigin 15 15
}

puts "--------------------------------------------------------------------------"
puts "After Place Macro"
puts "Total HPWL : [report_total_hpwl]"
puts "==========================================================================\n"

} else {
  puts "No macros found: Skipping macro_placement"
}


# write output
write_def       $RESULT_PATH/$DESIGN.def
write_verilog   $RESULT_PATH/$DESIGN.v
#write_sdc      $RESULT_PATH/$DESIGN.sdc
exit

