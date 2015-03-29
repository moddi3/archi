#!/bin/bash
arch-chroot /mnt /bin/bash
nano /etc/locale.gen
locale-gen
echo LANG=ru_RU.UTF-8 > /etc/locale.conf
export LANG=ru_RU.UTF-8
ln -s /usr/share/zoneinfo/Europe/Kiev /etc/localtime
echo moddi3 > /etc/hostname
nano /etc/hosts
#sudo NetworkManager
#nmcli dev wifi connect osnova3 password 36376971
ping -c 3 google.com
mkinitcpio -p linux
passwd
pacman -S grub os-prober
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo -e "${YELLOW} Done! "
