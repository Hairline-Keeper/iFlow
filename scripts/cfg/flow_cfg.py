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

coosa           = Flow('soc_asic_top','smic110','HD','MAX')
design_b_top    = Flow('DESIGN_B_TOP','smic55','HD','MAX')
design_b_crg    = Flow('design_b_crg','smic55','HD','MAX')
aes             = Flow('aes_cipher_top','sky130','HS','TYP')
Switch_basic    = Flow('Switch_basic','sky130','HS','TYP')
Switch_basic    = Flow('Switch_basic','asap7','HS','TYP')
Switch_xor      = Flow('Switch_xor','sky130','HS','TYP')
ALU             = Flow('ALU','sky130','HS','TYP')
ALU             = Flow('ALU','asap7','HS','TYP')
Switch_routing  = Flow('Switch_routing','sky130','HS','TYP')
Controller      = Flow('Controller','sky130','HS','TYP')
lc3             = Flow('lc3','sky130','HS','TYP')
Memory          = Flow('Memory','sky130','HS','TYP')
DataPath        = Flow('DataPath','sky130','HS','TYP')
Regfile         = Flow('Regfile','sky130','HS','TYP')
