#!/system/bin/sh

# wait for full boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
  sleep 2
done
sleep 10

# disable Wi-Fi multicast
dumpsys wifi disable-multicast

# disable using a more permanent option
ip link set wlan0 multicast off

# disable Nearby Share
settings put global nearby_sharing_enabled 0
settings put secure nearby_sharing_slice_enabled 0

