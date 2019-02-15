#!/usr/bin/env python



import subprocess
import time
from subprocess import Popen
import sys
import os


def run_zocalo_gautomatch():
    script = "/home/jtq89441/workspace/zocalo_test/motioncor2_launcher/testing/share_local/zoc_gautomatch_submit.py"
    args = sys.argv[1:]

    # TODO: add the part of exit where script exits after creating png of whatever 

    cmd = ('source /etc/profile.d/modules.sh;'
           'module load dials;'
           'dials.python ' + script + " "
           )

    print(cmd + " ".join(args))

    # submit recipie --this will always be true so don't check for exit status 

    p1 = Popen(cmd + " ".join(args), shell=True)
    p1.wait()
    import time
    time.sleep(1)
    # submission to zocalo queue

    out = p1.communicate()[0]
    print(out)

    
    return out

   


if __name__ == '__main__':

    extra_wd = run_zocalo_gautomatch()