#!/bin/bash

# Script to set up some basic gui stuff + install apps
pkgselection="xorg sddm kvantum code pycharm-community-edition intellij-idea-community-edition vivaldi keepassxc alacritty discord nerd-fonts-source-code-pro nerd-fonts-arimo nerd-fonts-hack steam wine-staging winetricks wine-mono wine-gecko giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox dolphin okular ark spectacle krita gimp kcalc kalgebra discover kgpg partitionmanager kdenlive kdevelop kget ktorrent krfb vvave kalendar kmplot kirigami-gallery kdiff3 zanshin neochat calligra-plan maui-pix plasmatube-git isoimagewriter ksystemlog kbruch"

echo "Ya need nvidia drivers? (y/N) : "
read needsnvidia
echo "Ya need extra tools for lighter wayland compositors? (y/N) : "
read needswlwmtools
echo "Ya need cool stuff for standalone xorg wms?"
read needsxorgtools

if [ needsnvidia == "y" ]; then
    pkgselection="${pkgselection} nvidia"
fi
if [ needswlwmtools == "y" ]; then
    pkgselection="${pkgselection} waybar wofi swaybg swaylock swayidle"
fi
if [ needsxorgtools == "y" ]; then
    pkgselection="${pkgselection} rofi i3status-rs"
fi

paru -S --needed $pkgselection

# User stuff
mkdir ~/Theming
mkdir ~/Theming/Wallpaper
mkdir ~/Theming/Configs
