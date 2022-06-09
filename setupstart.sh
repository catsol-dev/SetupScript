#!/bin/bash

# Section 1 | Pre-Setup
timedatectl set-ntp true


# Section 2 | Disk Stuff
# List block devices and prompt for which one the user wants to use
fdisk -l
echo "What device would you like to install to? (Absolute, e.g. /dev/sdX) : "
read installdisk

# Set the strings for partitions, is this way because I prefer this scheme
bootpartition="${installdisk}1"
swappartition="${installdisk}2"
rootpartition="${installdisk}3"

# Partition the disk with cfdisk, do so to above scheme ^
cfdisk $installdisk

# Create Filesystems and Swap
mkfs.fat -F 32 $bootpartition
mkswap $swappartition
mkfs.ext4 $rootpartition

# Mount Partitions + Activate Swap
mount $rootpartition /mnt
mount --mkdir $bootpartition /mnt/boot
swapon $swappartition


# Section 3 | Everything Before Chroot
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
mv ./chrootscripts /mnt

# Section 4 | Chroot
arch-chroot /mnt
# From this point on, choose what setup scripts you feel like using
