#!/bin/bash

if [ ! $# == "1" ];then
    echo "Invalid Argument! Usage: bash ./bash.sh <efi system partition mount point, usually /boot>"
    exit 1
fi

# This script does a pretty average setup for grub, self explanatory
pacman -S --needed --noconfirm efibootmgr grub os-prober
grub-install --target=x86_64-efi --efi-directory=$1 --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
