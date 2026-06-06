#!/system/bin/sh
# RMX2170 fingerprint post-boot setup
# Equivalent to service.sh from the Magisk module

sleep 10

# Enable the UDFPS SystemUI overlay
cmd overlay enable com.android.systemui.udfps.overlay 2>/dev/null

# Make oppo_display sysfs nodes writable so the fingerprint HAL can use them
chmod 666 /sys/kernel/oppo_display/notify_fppress
chmod 666 /sys/kernel/oppo_display/dimlayer_hbm
chmod 666 /sys/kernel/oppo_display/hbm
chmod 666 /sys/kernel/oppo_display/notify_panel_blank

# Grant SystemUI Bluetooth permission (prevents black screen on fingerprint prompt)
pm grant com.android.systemui android.permission.BLUETOOTH_CONNECT 2>/dev/null

# Restart fingerprint HALs so they pick up the new sysfs permissions and shim
killall android.hardware.biometrics.fingerprint@2.3-service.realme_sm7125 2>/dev/null
killall vendor.oplus.hardware.biometrics.fingerprint@2.1-service 2>/dev/null
