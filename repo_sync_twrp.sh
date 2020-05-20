#!/bin/bash

echo "*****************************************************************************"
echo "*****************************************************************************"
echo "*****************************************************************************"
echo "M2 Sources. Sync TWRP"


case $1 in
init)
src_init=1
src_dev=0
;;
pvt)
src_init=0
src_dev=1
;;
all)
src_init=0
src_dev=0
;;
*)
echo "*** Exit. Unknown command. Allowed command: init, pvt, all.***"
exit
;;
esac


echo "*** main sources..."
cd ~/src_M2_TWRP_LOS
if [[ $src_init -eq 1 ]]; then
repo init -u https://github.com/f2065/platform_manifest_twrp_lineageos -b twrp-14.1
fi
repo sync --no-clone-bundle --no-tags --force-sync -j 25

echo "*** qcom_common..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_TWRP_LOS
git clone https://github.com/LineageOS/android_device_qcom_common -b cm-14.1 device/qcom/common
else
cd ~/src_M2_TWRP_LOS/device/qcom/common
git pull
fi


if [[ $src_dev -ne 1 ]]; then

echo "*** kernel..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_TWRP_LOS
git clone https://github.com/f2065/android_kernel_sony_msm8226 -b lineage-all kernel/sony/msm8226
else
cd ~/src_M2_TWRP_LOS/kernel/sony/msm8226
git pull
fi

fi

cd ~/src_M2_TWRP_LOS

echo "*****************************************************************************"
exit
