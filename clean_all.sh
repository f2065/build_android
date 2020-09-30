#!/bin/bash
if [ $EUID != 0 ]; then
    echo "Superuser access is required"
    exit 1
fi

printf "\033]2;%s Clean temp15...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean temp15..."
e4defrag /home/f2065/temp15
vmware-toolbox-cmd disk wipe /home/f2065/temp15

printf "\033]2;%s Clean TWRP...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean TWRP..."
rm -rf /home/f2065/src_M2_TWRP_LOS/out/
e4defrag /home/f2065/src_M2_TWRP_LOS
vmware-toolbox-cmd disk wipe /home/f2065/src_M2_TWRP_LOS

printf "\033]2;%s Clean LineageOS 14.1...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean LineageOS 14.1..."
rm -rf /home/f2065/src_M2_LOS141/out/
e4defrag /home/f2065/src_M2_LOS141
vmware-toolbox-cmd disk wipe /home/f2065/src_M2_LOS141

printf "\033]2;%s Clean LineageOS 15.1...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean LineageOS 15.1..."
rm -rf /home/f2065/src_M2_LOS151/out/
e4defrag /home/f2065/src_M2_LOS151
vmware-toolbox-cmd disk wipe /home/f2065/src_M2_LOS151

printf "\033]2;%s Clean LineageOS 16.0...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean LineageOS 16.0..."
rm -rf /home/f2065/src_M2_LOS160/out/
e4defrag /home/f2065/src_M2_LOS160
vmware-toolbox-cmd disk wipe /home/f2065/src_M2_LOS160

printf "\033]2;%s Clean LineageOS 17.1...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean LineageOS 17.1..."
rm -rf /home/f2065/src_M2_LOS171/out/
e4defrag /home/f2065/src_M2_LOS171
vmware-toolbox-cmd disk wipe /home/f2065/src_M2_LOS171

#printf "\033]2;%s Clean AICP 13.1...\007" $(date +"%Y-%m-%d_%H:%M:%S")
#echo "Clean AICP 13.1..."
#rm -rf /home/f2065/src_M2_AICP131/out/
#e4defrag /home/f2065/src_M2_AICP131
#vmware-toolbox-cmd disk wipe /home/f2065/src_M2_AICP131

exit
