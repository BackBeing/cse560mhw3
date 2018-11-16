from m5 import fatal
import m5.objects
from textwrap import TextWrapper

#add options for number of ROB entries, IQ entries, and number of physical
#floating point registers
def addHW3Opts(parser):
    parser.add_option("--rob_num", type="int", default=192)
    parser.add_option("--iq_num", type="int", default=64)
    parser.add_option("--pf_num", type="int", default=256)


#set parameters taken in from options on command line
def set_config(cpu_list, options):
  for cpu in cpu_list:
    # set parameters for each thing
    cpu.numROBEntries = options.rob_num
    cpu.numIQEntries = options.iq_num
    cpu.numPhysFloatRegs = options.pf_num