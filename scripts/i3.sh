#!/bin/bash

_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; 
        return;
    fi;
    echo 1;
    return;
}

_install() {
    package="$1";
    packageType=$2;

    if [[ $(_isInstalled "${package}") == 0 ]]; then
        echo "${package} is already installed.";
        return;
    fi;

    if [packageType == 1 ]]; then
        sudo pacman -S "${package}";
        return;
    fi;

    yay -S ${package};
}

#nvim
#sudo pacman -S neovim
_install "neovim", 0;
sudo cp -a ../config/nvim ~/.config/;

#qutebrowser
#sudo pacman -S qutebrowser
_install "qutebrowser", 0;
sudo cp -a ../config/qutebrowser ~/.config/;

#wallpaper
#yay -S feh #Already installed with EndeavourOS i3
#_install = "feh"
sudo cp -a ../wallpapers/background.png ~/Imagens/;
feh --bg-scale ~/Imagens/background.png;

#starship
#yay -S starship
_install "starship", 1
sudo cp -a ../config/config-schema.json ~/.config/;
sudo cp -a ../config/starship.toml ~/.config/;

#rofi #Already installed with EndeavourOS i3
sudo cp -a ../config/rofi ~/.config/;

#i3 #Already installed with EndeavourOS i3
sudo cp -a ../config/i3 ~/.config/;

#xfce
#sudo pacman -S fastfetch
_install "fastfetch", 0;
sudo cp -a ../config/xfce4/current-color.theme /usr/share/xfce4/terminal/colorschemes/;

#polybar
#sudo -S pacman tff-firacode-nerd
_install "tff-firacode-nerd", 0;
_install "polybar", 0;
sudo cp -a ../config/polybar ~/.config/;
