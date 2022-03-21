#!/usr/bin/python3
#--------------------------------------------------------------------------- 
#             Copyright 2021 PENG CHENG LABORATORY
#--------------------------------------------------------------------------- 
# Author      : liubojun
# Email       : liubj@pcl.ac.cn
# Date        : 2021-04-06
# Project     : 
# Language    : Python
# Description : 
#--------------------------------------------------------------------------- 
import sys
import os
import subprocess
import re
from   data_def import *

tool1  = Tools(
        ('synth',),
        'yosys_0.9',
        '../../../iFlow/tools/yosys4be891e8/bin/yosys')
tool2  = Tools(
        ('floorplan','tapcell','pdn','gplace','resize','dplace','filler','groute'),   
        'openroad_1.1.0',
        '../../../iFlow/tools/OpenROAD9295a533/build/src/openroad')
tool3  = Tools(
        ('cts'),   
        'openroad_0.9.0',
        '../../../iFlow/tools/OpenROAD_fixcts/openroad')
tool4  = Tools(
        ('groute',),   
        'iGR',
        '../../../iFlow/tools/iGR/run_gr')
tool5  = Tools(
        ('droute',),   
        'openroad_1.2.0',
        '../../../iFlow/tools/OpenROAD_fixdr/openroad')
tool6  = Tools(
        ('droute',),   
        'iDR',
        '../../../iFlow/tools/iDR/run_dr')
tool7  = Tools(
        ('layout',),   
        'klayout_0.26.2',
        '/usr/bin/klayout')
