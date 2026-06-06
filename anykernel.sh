# AnyKernel3 Ramdisk Mod Script
# Mello Kernel + KernelSU-Next for Realme 7 Pro (RMX2170)
# by osm0sis @ xda-developers (base), modified for RMX2170

## AK setup
properties() { '
kernel.string=Mello Kernel + KernelSU-Next
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=RMX2170
device.name2=RMX2170L1
device.name3=RMX2170EX
supported.versions=11-14
'; }

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AK methods
. tools/ak3-core.sh;

## AK3 Patching
split_boot;
flash_boot;
## end boot
