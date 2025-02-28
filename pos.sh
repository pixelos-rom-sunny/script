#!/bin/bash

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs
/opt/crave/resync.sh

# Remove existing directories to avoid conflicts
rm -rf device/xiaomi/sunny
rm -rf device/qcom/common
rm -rf device/qcom/qssi
rm -rf device/xiaomi/sunny-kernel
rm -rf vendor/xiaomi/sunny
rm -rf vendor/qcom/common
rm -rf vendor/qcom/opensource/core-utils
rm -rf packages/apps/DisplayFeatures
rm -rf packages/apps/KProfiles
rm -rf hardware/xiaomi
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/bcr
rm -rf vendor/xiaomi/mojito-leicacamera
rm -rf vendor/xiaomi/miuiapps
rm -rf vendor/xiaomi/dynamicSpot
rm -rf vendor/lineage-priv/keys
# must remove
rm -rf hardware/qcom-caf/sm8150/media

# Clone device-specific repositories
git clone https://github.com/PixelOS-Devices/device_xiaomi_sunny.git -b fifteen device/xiaomi/sunny

git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fifteen device/qcom/common
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b vauxite device/qcom/qssi
git clone https://github.com/RisingOS-Revived-devices/device_xiaomi_sunny-kernel.git --depth 1 -b fifteen device/xiaomi/sunny-kernel

# Clone vendor repositories
git clone https://github.com/RisingOS-Revived-devices/vendor_xiaomi_sunny.git --depth 1 -b fifteen vendor/xiaomi/sunny
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fifteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fifteen vendor/qcom/opensource/core-utils

# Clone package repositories
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles

# Clone hardware repositories
git clone https://github.com/yaap/hardware_xiaomi.git --depth 1 -b fifteen hardware/xiaomi
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fifteen hardware/qcom-caf/sm8150/media

# Clone prebuilt GCC toolchains
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi

# source mods
rm -rf vendor/aosp
git clone https://github.com/rising-source-mod/vendor_aosp.git -b fifteen vendor/aosp

. build/envsetup.sh
lunch aosp_sunny-ap4a-user
mka bacon


