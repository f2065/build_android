#!/bin/bash

# Script to compile LineageOS-firmware for Sony Xperia M2

# you must create a folder ~/temp15/ for results

# set build options:

allow_fast_rebuild=0

allow_LOS141=0
allow_LOS151=0
allow_LOS151go=0
allow_LOS160=0
allow_LOS160go=0
allow_LOS171=0
allow_LOS171go=0

allow_TWRP=0

allow_AICP131=0
allow_AICP131go=0

# todo:
# - fix filename in md5sum-files
# - md5sum-files for TWRP-image

################################################################################
################################################################################

function build_FW {
echo "*** build FW ***"
if [[ "$allow_fast_rebuild" -ne 1 ]]; then
make clean
rm -rf out/
fi
export LC_ALL=C
. build/envsetup.sh
time brunch eagle
}

function build_TWRP {
echo "*** build TWRP ***"
make clean
rm -rf out/
export LC_ALL=C
. build/envsetup.sh
lunch lineage_eagle-userdebug
time mka recoveryimage
}

function set_go_mode {
#Android Go
echo "*** set_go_mode ***"
cd device/sony/yukon
git cherry-pick 427429047090cbe70de8b8fd2f6d743b3b0bc0ef
cd ../../..
}

function restore_normal_mode {
#Android Normal
echo "*** restore_normal_mode ***"
cd device/sony/yukon
git reset --hard HEAD~1
cd ../../..
}

################################################################################
################################################################################

if [[ "$allow_TWRP" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build TWRP"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_TWRP_LOS
build_TWRP

cd ~/src_M2_TWRP_LOS
#output: out/target/product/eagle/recovery.img
current_time=$(date +"%Y%m%d_%H%M%S_%Z")
cp -f out/target/product/eagle/recovery.img ~/temp15/recovery_$current_time.img
md5sum out/target/product/eagle/recovery.img > ~/temp15/recovery_$current_time.img.md5sum

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

if [[ "$allow_LOS141" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 14.1"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS141
build_FW

cd ~/src_M2_LOS141
#output: out/target/product/eagle/lineage-14.1-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-14.1-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

if [[ "$allow_LOS151" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 15.1"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS151
build_FW

cd ~/src_M2_LOS151
#output: out/target/product/eagle/lineage-15.1-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-15.1-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

if [[ "$allow_LOS151go" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 15.1 Go Edition"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS151
set_go_mode

cd ~/src_M2_LOS151
build_FW

cd ~/src_M2_LOS151
restore_normal_mode

cd ~/src_M2_LOS151
#output: out/target/product/eagle/lineage-15.1-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-15.1-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}-Go_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}-Go_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

if [[ "$allow_LOS160" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 16.0"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS160
build_FW

cd ~/src_M2_LOS160
#output: out/target/product/eagle/lineage-16.0-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-16.0-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

if [[ "$allow_LOS160go" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 16.0 Go Edition"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS160
set_go_mode

cd ~/src_M2_LOS160
build_FW

cd ~/src_M2_LOS160
restore_normal_mode

cd ~/src_M2_LOS160
#output: out/target/product/eagle/lineage-16.0-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-16.0-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}-Go_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}-Go_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

if [[ "$allow_LOS171" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 17.1"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS171
build_FW

cd ~/src_M2_LOS171
#output: out/target/product/eagle/lineage-17.1-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-17.1-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

if [[ "$allow_LOS171go" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build LineageOS 17.1 Go Edition"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_LOS171
set_go_mode

cd ~/src_M2_LOS171
build_FW

cd ~/src_M2_LOS171
restore_normal_mode

cd ~/src_M2_LOS171
#output: out/target/product/eagle/lineage-17.1-*-UNOFFICIAL-eagle.zip
find out/target/product/eagle/ -name "lineage-17.1-*-UNOFFICIAL-eagle.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}-Go_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}-Go_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

if [[ "$allow_AICP131" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build AICP 13.1"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_AICP131
build_FW

cd ~/src_M2_AICP131
#output: out/target/product/eagle/aicp_eagle_o-13.1-UNOFFICIAL-*.zip
find out/target/product/eagle/ -name "aicp_eagle_o-13.1-UNOFFICIAL-*.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

if [[ "$allow_AICP131go" -eq 1 ]]; then
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo ""
echo "Build AICP 13.1 Go Edition"
echo ""
echo "**********************************************************************************************"

cd ~/src_M2_AICP131
set_go_mode

cd ~/src_M2_AICP131
build_FW

cd ~/src_M2_AICP131
restore_normal_mode

cd ~/src_M2_AICP131
#output: out/target/product/eagle/aicp_eagle_o-13.1-UNOFFICIAL-*.zip
find out/target/product/eagle/ -name "aicp_eagle_o-13.1-UNOFFICIAL-*.zip" -exec sh -c 'current_time=$(date +"%Y%m%d_%H%M%S_%Z"); fullfilenameext="{}"; filenameext=${fullfilenameext##*/}; filename=${filenameext%.zip}; cp -f "${fullfilenameext}" ~/temp15/"${filename}-Go_${current_time}.zip"; cp -f "${fullfilenameext}.md5sum" ~/temp15/"${filename}-Go_${current_time}.zip.md5sum"' \;

echo "**********************************************************************************************"
fi

################################################################################
################################################################################

echo "*** Build All Done ***"

exit
