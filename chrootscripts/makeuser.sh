#!/bin/bash

read choiceusername
useradd -m -G wheel,audio,video,games -s /usr/bin/fish $choiceusername
passwd $choiceusername
mkdir /home/$choiceusername/Repos
mkdir /home/$choiceusername/Downloads
mkdir /home/$choiceusername/src
