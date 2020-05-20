#!/bin/bash

echo "*****************************************************************************"
echo "*****************************************************************************"
echo "*****************************************************************************"
echo "M2 Sources. Sync LineageOS 16.0"


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
cd ~/src_M2_LOS160
if [[ $src_init -eq 1 ]]; then
repo init -u https://github.com/LineageOS/android -b lineage-16.0
fi
repo sync --no-clone-bundle --no-tags --force-sync -j 25

# fork with build fix for msm8226
echo "*** gps fix..."
cd ~/src_M2_LOS160
rm -rf hardware/qcom/gps
git clone https://github.com/f2065/android_hardware_qcom_gps -b lineage-16.0 hardware/qcom/gps

echo "*** boringssl-compat..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_external_sony_boringssl-compat -b lineage-16.0 external/sony/boringssl-compat
else
cd ~/src_M2_LOS160/external/sony/boringssl-compat
git pull
fi

echo "*** sony_timekeep..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_hardware_sony_timekeep -b lineage-16.0 hardware/sony/timekeep
else
cd ~/src_M2_LOS160/hardware/sony/timekeep
git pull
fi

echo "*** qcom_common..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_device_qcom_common -b lineage-15.1 device/qcom/common
else
cd ~/src_M2_LOS160/device/qcom/common
git pull
fi

echo "*** sony_common..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_device_sony_common -b lineage-16.0 device/sony/common
else
cd ~/src_M2_LOS160/device/sony/common
git pull
fi

echo "*** sony_macaddrsetup..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_hardware_sony_macaddrsetup -b lineage-16.0 hardware/sony/macaddrsetup
else
cd ~/src_M2_LOS160/hardware/sony/macaddrsetup
git pull
fi

# echo "*** sony_thermanager..."
# if [[ $src_init -eq 1 ]]; then
# cd ~/src_M2_LOS160
# git clone https://github.com/LineageOS/android_hardware_sony_thermanager -b lineage-16.0 hardware/sony/thermanager
# else
# cd ~/src_M2_LOS160/hardware/sony/thermanager
# git pull
# fi

echo "*** devicesettings..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-16.0 packages/resources/devicesettings
else
cd ~/src_M2_LOS160/packages/resources/devicesettings
git pull
fi

echo "*** ExtendedSettings..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/sonyxperiadev/packages_apps_ExtendedSettings -b p-mr1 packages/apps/ExtendedSettings
else
cd ~/src_M2_LOS160/packages/apps/ExtendedSettings
git pull
fi


if [[ $src_dev -ne 1 ]]; then

echo "*** device-sony-eagle..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/f2065/device-sony-eagle -b lineage-16.0 device/sony/eagle
else
cd ~/src_M2_LOS160/device/sony/eagle
git pull
fi

echo "*** device-sony-yukon..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/f2065/device-sony-yukon -b lineage-16.0 device/sony/yukon
else
cd ~/src_M2_LOS160/device/sony/yukon
git pull
fi

echo "*** vendor-sony-yukon..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/f2065/vendor-yukon -b lineage-15.1 vendor/sony
else
cd ~/src_M2_LOS160/vendor/sony
git pull
fi

echo "*** kernel..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_LOS160
git clone https://github.com/f2065/android_kernel_sony_msm8226 -b lineage-all kernel/sony/msm8226
else
cd ~/src_M2_LOS160/kernel/sony/msm8226
git pull
fi

fi

cd ~/src_M2_LOS160

echo "*****************************************************************************"
exit
