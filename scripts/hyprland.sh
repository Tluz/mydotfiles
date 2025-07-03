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

  if [ ${packageType} == 1 ]; then
    echo "Installing ${package} via Yay"
    yay -S ${package}
    return
  fi

  echo "Installing ${package} via pacman"
  sudo pacman -S "${package}"
}

#neovim
_install "neovim" 0
sudo cp -a ../config/nvim ~/.config/

#qutebrowser
_install "qutebrowser" 0
sudo cp -a ../config/qutebrowser ~/.config/

#starship
_install "starship" 0
sudo cp -a ../config/config-schema.json ~/.config/
sudo cp -a ../config/starship.toml ~/.config/

#wofi
#_install "wofi" 1
#sudo cp -a ../config/wofi ~/.config/

#waybar
_install "waybar" 1
#yay -S waybar hyprpicker otf-codenewroman-nerd
#yay -S blueman bluez
#systemctl enable bluetooth
sudo cp -a ../config/waybar ~/.config/
sudo cp ../themes/catppuccin/waybar.css ~/.config/waybar/theme.css

#swaync
#yay -S swaync gvfs
#wal -i ~/projects/dotfiles/wallpapers/pywallpaper.jpg
#sudo cp -a ~/projects/dotfiles/.config/swaync ~/.config/

#wallpaper
#yay -S swww fd
#sudo cp -a ~/projects/dotfiles/.config/hypr/wallpaper.sh ~/.config/hypr/wallpaper.sh
#sudo cp -a ~/projects/dotfiles/.config/wofi/config ~/.config/wofi/
#sudo cp -a ~/projects/dotfiles/.config/wofi/style.css ~/.config/wofi/

#hyprpaper
#sudo pacman -S hyprpaper
#sudo cp -a ~/projects/dotfiles/.config/hypr/hyprpaper.conf ~/.config/hypr/

#explorer
#sudo pacman -S thunar
#yay -S nwg-look qogir-icon-theme materia-gtk-theme illogical-impulse-bibata-modern-classic-bin adwaita-colors-icon-theme

#hyprland
sudo cp -a ../themes/catppuccin/hyprland.conf ~/.config/hypr/modules/hyprland-theme.conf
sudo cp -a ../config/hypr ~/.config/
