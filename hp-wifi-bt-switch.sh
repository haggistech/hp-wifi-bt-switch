#! /usr/bin/env bash
if grep -q 'dtoverlay=pi3-disable-wifi' /boot/config.txt; then
    echo
    echo "Option to enable/disable Wifi found in config, Continuing....."
    echo
else
    echo
    echo "Option to enable/disable Wifi not found, adding to file...."
    echo
    echo 'dtoverlay=pi3-disable-wifi' >> /boot/config.txt
fi

if grep -q 'dtoverlay=pi3-disable-bt' /boot/config.txt; then
    echo
    echo "Option to enable/disable bluetooth found in config, Continuing....."
    echo
else
    echo
    echo "Option to enable/disable Bluetooth not found, adding to file...."
    echo
    echo 'dtoverlay=pi3-disable-bt' >> /boot/config.txt
fi


if grep -q '#dtoverlay=pi3-disable-wifi' /boot/config.txt; then
    echo
    echo "Wifi is currently disabled. Enabling now...."
    sed -i 's/#dtoverlay=pi3-disable-wifi/dtoverlay=pi3-disable-wifi/g' /boot/config.txt
    echo
    wifi="Wi-Fi Enabled"
else
    echo
    echo "Wifi is currently Enabled. disabling now...."
    sed -i 's/dtoverlay=pi3-disable-wifi/#dtoverlay=pi3-disable-wifi/g' /boot/config.txt
    echo
    wifi="Wi-Fi Disabled"
fi

if grep -q '#dtoverlay=pi3-disable-bt' /boot/config.txt; then
    echo
    echo "Bluetooth is currently disabled. Enabling now...."
    sed -i 's/#dtoverlay=pi3-disable-bt/dtoverlay=pi3-disable-bt/g' /boot/config.txt
    echo
    bluetooth="Bluetooth Enabled"
else
    echo
    echo "Bluetooth is currently Enabled. disabling now...."
    sed -i 's/dtoverlay=pi3-disable-bt/#dtoverlay=pi3-disable-bt/g' /boot/config.txt
    echo
    bluetooth="Bluetooth Disabled"
fi
clear
    echo
    echo
    echo "     Actions Complete"
    echo
    echo -e "     [\xE2\x9C\x94]  $wifi"
    echo -e "     [\xE2\x9C\x94]  $bluetooth"
    echo
    echo
    echo "Rebooting in 3 seconds!"
    sleep 3
    reboot
