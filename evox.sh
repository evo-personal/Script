#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf .repo/local_manifests
rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common
rm -rf kernel/xiaomi/mojito
rm -rf hardware/xiaomi
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/xiaomi/mojito-leicacamera

# Local TimeZone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/India /etc/localtime

# Rom source repo
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone repository
git clone https://github.com/evo-personal/rn10.git device/xiaomi/mojito
git clone https://github.com/evo-personal/rn10_common.git device/xiaomi/sm6150-common
git clone https://github.com/evo-personal/rn10_vendor.git vendor/xiaomi/mojito
git clone https://github.com/evo-personal/rn10_vendor_common.git vendor/xiaomi/sm6150-common
git clone https://github.com/evo-personal/kernel.git kernel/xiaomi/mojito
git clone https://github.com/evo-personal/hardware.git hardware/xiaomi
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX
git clone https://gitlab.com/sachinbarange86/android_vendor_xiaomi_mojito-leicacamera.git -b main vendor/xiaomi/mojito-leicacamera
echo "============================"
echo "Clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Sachin
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_mojito-bp1a-user
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
m evolution
