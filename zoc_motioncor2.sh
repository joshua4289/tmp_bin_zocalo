echo "++++++ MotionCor2 through zocalo Starting"
module load dials

# ../../extra/GridSquare_401K_Data_FoilHole_5419591_Data_5417717_5417718_20180306_2108-140231_aligned_mic.mrc"

#-InMrc "GridSquare_401K_Data_FoilHole_5419591_Data_5417717_5417718_20180306_2108-140231.mrc"
# -OutMrc "../../extra/GridSquare_401K_Data_FoilHole_5419591_Data_5417717_5417718_20180306_2108-140231_aligned_mic.mrc"
# -kV 300.0 -Trunc 0 -FmDose 0.5 -OutStack 0 -InitDose 0.0 -PixSize 1.06 -Tol 0.5 -Group 1 -Patch 5 5 -Throw 0
# -LogFile ../../extra/micrograph_000002_ -FtBin 1.0 -MaskCent 0 0 -MaskSize 1 1 -Gpu 1




cmd=`dials.python /home/jtq89441/workspace/zocalo_test/motioncor2_launcher/testing/share_local/zoc_mc2_submit.py $@`
echo "cmd is $cmd"
cd $cmd
echo "changed dir to `pwd`"

end=$((SECONDS+600))

while true
do
if [[ -n $(find $4) ]]
then
    echo "found file"
    exit 0
else
    echo "waiting for o/p"
    sleep 2
fi
echo "seconds is $SECONDS and end is $end"
if [ $SECONDS -gt $end ]
then
    echo "timing out "
    exit 1
fi

done

echo "End of MotionCor2"


