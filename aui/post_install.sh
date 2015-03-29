#!/bin/bash
sudo pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xinput xf86-video-ati xf86-video-intel xf86-input-synaptics xf86-input-keyboard xf86-input-mouse --noconfirm
cp /etc/skel/.xinitrc ~
#sudo pacman -S xfce4 xfce4-goodies --noconfirm
