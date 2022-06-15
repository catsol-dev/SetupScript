#!/bin/bash

# This does most needed stuff in the actual chroot
echo "Timezone? : "
read timezone
ln -sf /usr/share/zoneinfo/$timezone
hwclock --systohc
pacman -S --needed --noconfirm neovim base-devel git fish grub efibootmgr os-prober
nvim /etc/pacman.conf
nvim /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" > /etc/locale.conf
touch /etc/hostname
echo "Hostname? : "
read user_hostname
echo $user_hostname > /etc/hostname
passwd
echo "Username? : "
read username
useradd -m -G wheel,games -s /usr/bin/fish $username
passwd $username
cd /home/$username
git clone https://aur.archlinux.org/paru.git
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
