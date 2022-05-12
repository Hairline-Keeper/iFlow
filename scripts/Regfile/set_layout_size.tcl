#===========================================================
#   set environment variable
#===========================================================
source ../../scripts/common/set_env.tcl

#===========================================================
#   set tool related parameter
#===========================================================
set DIE_AREA            "0 0 600 600" 
set CORE_AREA           "10 10 490 490" 
set TRACKS_INFO_FILE    "$PROJ_PATH/foundry/$FOUNDRY/tracks.info" 
set PLACE_SITE          "unit" 

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

# Set layout size
initialize_floorplan -die_area $DIE_AREA \
                         -core_area $CORE_AREA \
                         -tracks $TRACKS_INFO_FILE \
                         -site $PLACE_SITE
                         
# write output
write_def       $RESULT_PATH/$DESIGN.def
write_verilog   $RESULT_PATH/$DESIGN.v
#write_sdc      $RESULT_PATH/$DESIGN.sdc
exit

