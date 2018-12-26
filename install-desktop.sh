#!/bin/sh
set -ex

# https://askubuntu.com/questions/1067929/on-18-04-package-virtualbox-guest-utils-does-not-exist
sudo apt-add-repository multiverse
sudo apt-get update

# Install xfce and virtualbox additions.
# (Not sure if these packages could be helpful as well: virtualbox-guest-utils-hwe virtualbox-guest-x11-hwe)
sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
# Permit anyone to start the GUI
# TODO - needed?
#sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config

# Optional: Use LightDM login screen (-> not required to run "startx")
sudo apt-get install -y lightdm lightdm-gtk-greeter
# Optional: Install a more feature-rich applications menu
sudo apt-get install -y xfce4-whiskermenu-plugin
