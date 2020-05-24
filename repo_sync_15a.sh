#!/bin/bash

echo "*****************************************************************************"
echo "*****************************************************************************"
echo "*****************************************************************************"
echo "M2 Sources. Sync AICP 13.1 Oreo 8.1"


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


printf "\033]2;%s Sync AICP 13.1 - main sources...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** main sources..."
cd ~/src_M2_AICP131
if [[ $src_init -eq 1 ]]; then
repo init -u https://github.com/AICP/platform_manifest -b o8.1
fi
repo sync --no-clone-bundle --no-tags --force-sync -j 25

# fork with build fix for msm8226
printf "\033]2;%s Sync AICP 13.1 - gps fix...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** gps fix..."
cd ~/src_M2_AICP131
rm -rf hardware/qcom/gps
git clone https://github.com/f2065/android_hardware_qcom_gps -b lineage-15.1 hardware/qcom/gps

printf "\033]2;%s Sync AICP 13.1 - boringssl-compat...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** boringssl-compat..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_external_sony_boringssl-compat -b lineage-15.1 external/sony/boringssl-compat
else
cd ~/src_M2_AICP131/external/sony/boringssl-compat
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - sony_timekeep...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** sony_timekeep..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_hardware_sony_timekeep -b lineage-15.1 hardware/sony/timekeep
else
cd ~/src_M2_AICP131/hardware/sony/timekeep
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - qcom_common...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** qcom_common..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_device_qcom_common -b lineage-15.1 device/qcom/common
else
cd ~/src_M2_AICP131/device/qcom/common
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - sony_common...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** sony_common..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_device_sony_common -b lineage-15.1 device/sony/common
else
cd ~/src_M2_AICP131/device/sony/common
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - sony_macaddrsetup...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** sony_macaddrsetup..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_hardware_sony_macaddrsetup -b lineage-15.1 hardware/sony/macaddrsetup
else
cd ~/src_M2_AICP131/hardware/sony/macaddrsetup
git pull
fi

# printf "\033]2;%s Sync AICP 13.1 - sony_thermanager...\007" $(date +"%Y-%m-%d_%H:%M:%S")
# echo "*** sony_thermanager..."
# if [[ $src_init -eq 1 ]]; then
# cd ~/src_M2_AICP131
# git clone https://github.com/LineageOS/android_hardware_sony_thermanager -b lineage-15.1 hardware/sony/thermanager
# else
# cd ~/src_M2_AICP131/hardware/sony/thermanager
# git pull
# fi

printf "\033]2;%s Sync AICP 13.1 - devicesettings...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** devicesettings..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-15.1 packages/resources/devicesettings
else
cd ~/src_M2_AICP131/packages/resources/devicesettings
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - ExtendedSettings...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** ExtendedSettings..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/sonyxperiadev/packages_apps_ExtendedSettings -b o-mr1 packages/apps/ExtendedSettings
else
cd ~/src_M2_AICP131/packages/apps/ExtendedSettings
git pull
fi


if [[ $src_dev -ne 1 ]]; then

printf "\033]2;%s Sync AICP 13.1 - device-sony-eagle...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** device-sony-eagle..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/f2065/device-sony-eagle -b aicp-13.1 device/sony/eagle
else
cd ~/src_M2_AICP131/device/sony/eagle
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - device-sony-yukon...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** device-sony-yukon..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/f2065/device-sony-yukon -b lineage-15.1 device/sony/yukon
else
cd ~/src_M2_AICP131/device/sony/yukon
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - vendor-sony-yukon...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** vendor-sony-yukon..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/f2065/vendor-yukon -b lineage-15.1 vendor/sony
else
cd ~/src_M2_AICP131/vendor/sony
git pull
fi

printf "\033]2;%s Sync AICP 13.1 - kernel...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "*** kernel..."
if [[ $src_init -eq 1 ]]; then
cd ~/src_M2_AICP131
git clone https://github.com/f2065/android_kernel_sony_msm8226 -b lineage-all kernel/sony/msm8226
else
cd ~/src_M2_AICP131/kernel/sony/msm8226
git pull
fi

fi

printf "\033]2;%s Sync AICP 13.1 - end\007" $(date +"%Y-%m-%d_%H:%M:%S")
cd ~/src_M2_AICP131

echo "*****************************************************************************"
exit
