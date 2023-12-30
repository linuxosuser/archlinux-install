#!/bin/bash

echo -n 'LANG=hu_HU.UTF-8
LC_ADDRESS=hu_HU.UTF-8
LC_COLLATE=hu_HU.UTF-8
LC_CTYPE=hu_HU.UTF-8
LC_IDENTIFICATION=hu_HU.UTF-8
LC_MEASUREMENT=hu_HU.UTF-8
LC_MESSAGES=hu_HU.UTF-8
LC_MONETARY=hu_HU.UTF-8
LC_NAME=hu_HU.UTF-8
LC_NUMERIC=hu_HU.UTF-8
LC_PAPER=hu_HU.UTF-8
LC_TELEPHONE=hu_HU.UTF-8
LC_TIME=hu_HU.UTF-8' > /etc/locale.conf

echo -n 'KEYMAP=hu
FONT=lat2-16
FONT_MAP=8859-2' > /etc/vconsole.conf

echo -n 'homedevice' > /etc/hostname

echo -n '127.0.0.1	localhost
::1		localhost
127.0.1.1	homedevice.localdomain	homedevice' >> /etc/hosts

pacman -S networkmanager wireless_tools wpa_supplicant dialog --noconfirm
systemctl enable NetworkManager

fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo -n '/swapfile		none		swap		defaults 0 0' >> /etc/fstab

echo -n 'vm.swappiness=20' > /etc/sysctl.d/99-sysctl.conf
