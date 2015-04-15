#!/bin/bash

YELLOW='\033[0;33m'
echo -e "${YELLOW} KEYMAP "
loadkeys ru
echo -e "${YELLOW} FONT "
setfont cyr-sun16
nano /etc/locale.gen
echo -e "${YELLOW} LOCALE.GEN "
locale-gen
export LANG=ru_RU.UTF-8
#wifi-menu
ping -c 4 google.com
echo -e "${YELLOW} LSBLK "
lsblk
mkfs.ext2 -L boot /dev/sda5
mkfs.ext4 -L arch /dev/sda6
mkfs.ext4 -L home /dev/sda8
mkswap -L swap /dev/sda7
swapon /dev/sda7
mount /dev/sda6 /mnt
mkdir -p /mnt/{boot,home}
mount /dev/sda5 /mnt/boot
mount /dev/sda8 /mnt/home
nano /etc/pacman.d/mirrorlist
#mv /etc/pacman.d/mirrorlist mirrorlist.old
#cp mirrorlist > /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel dialog wpa_supplicant networkmanager
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo -e "${YELLOW} DONE! "
