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

  if [[ $(_isInstalled "${package}") == 0 ]]; then
    echo "${package} is already installed."
    return
  fi

  echo "Installing ${package} via Yay"
  yay -S ${package}
  return
}

#nvim
_install "neovim"
sudo cp -a ../config/nvim ~/.config/

#qutebrowser
_install "qutebrowser"
sudo cp -a ../config/qutebrowser ~/.config/

#wallpaper
#_install "feh" 0 #Already installed with EndeavourOS i3
mkdir -p ~/.local/share/wallpapers
sudo cp -a ../config/background.png ~/.local/share/wallpapers/
feh --bg-scale ~/.local/share/wallpapers/background.png

#starship
_install "starship"
sudo cp -a ../config/config-schema.json ~/.config/
sudo cp -a ../config/starship.toml ~/.config/

#rofi #Already installed with EndeavourOS i3
sudo cp -a ../config/rofi ~/.config/

#i3 #Already installed with EndeavourOS i3
sudo cp -a ../config/i3 ~/.config/

#xfce
_install "fastfetch"
sudo cp -a ../config/xfce4/current-color.theme /usr/share/xfce4/terminal/colorschemes/

#polybar
_install "ttf-firacode-nerd"
_install "polybar"
sudo cp -a ../config/polybar ~/.config/
