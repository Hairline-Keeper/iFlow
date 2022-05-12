#===========================================================
#   set environment variable
#===========================================================
source ../../scripts/common/set_env.tcl

#===========================================================
#   set tool related parameter
#===========================================================
set WIRE_RC_LAYER   "met3"
set PLACE_DENSITY   "0.4"

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

# Read def file
read_def $PRE_RESULT_PATH/$DESIGN.def
# Read sdc file
read_sdc $SDC_FILE

set_wire_rc -layer $WIRE_RC_LAYER

# global_placement -density $PLACE_DENSITY

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

global_placement -incremental -overflow 0.1 -density $PLACE_DENSITY

# write output
write_def       $RESULT_PATH/$DESIGN.def
write_verilog   $RESULT_PATH/$DESIGN.v
exit

