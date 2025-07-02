#!/bin/bash

_isInstalled() {
  package="$1"
  check="$(sudo pacman -Q | grep "${package}")"
  if [ -n "${check}" ]; then
    echo 0
    return
  fi
  echo 1
  return
}

_install() {
  package="$1"
  packageType=$2

  if [[ $(_isInstalled "${package}") == 0 ]]; then
    echo "${package} is already installed."
    return
  fi

  if [[packageType == 1 ]]; then
    echo "Installing ${package} via Yay"
    yay -S ${package}
    return
  fi

  echo "Installing ${package} via pacman"
  sudo pacman -S "${package}"
}

#nvim
_install "neovim" 0
sudo cp -a ../config/nvim ~/.config/

#qutebrowser
_install "qutebrowser" 0
sudo cp -a ../config/qutebrowser ~/.config/

#wallpaper
#_install "feh" 0 #Already installed with EndeavourOS i3
sudo cp -a ../wallpapers/background.png ~/Imagens/
feh --bg-scale ~/Imagens/background.png

#starship
_install "starship" 0
sudo cp -a ../config/config-schema.json ~/.config/
sudo cp -a ../config/starship.toml ~/.config/

#rofi #Already installed with EndeavourOS i3
sudo cp -a ../config/rofi ~/.config/

#i3 #Already installed with EndeavourOS i3
sudo cp -a ../config/i3 ~/.config/

#xfce
_install "fastfetch" 0
sudo cp -a ../config/xfce4/current-color.theme /usr/share/xfce4/terminal/colorschemes/

#polybar
_install "ttf-firacode-nerd" 0
_install "polybar" 0
sudo cp -a ../config/polybar ~/.config/
