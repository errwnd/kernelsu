# AnyKernel3 Ramdisk Mod Script
# Mello Kernel + KernelSU-Next for Realme 7 Pro (RMX2170)
# by osm0sis @ xda-developers (base), modified for RMX2170

## AK setup
properties() { '
kernel.string=Mello Kernel + KernelSU-Next by errwnd
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=RMX2170
device.name2=RMX2061
device.name3=RMX2170L1
supported.versions=11-14
'; }

# boot patching attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
}

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

. tools/ak3-core.sh && attributes;

# Unpack boot, inject ramdisk files, repack — same as original omega 14
dump_boot;

write_boot;
## end boot
