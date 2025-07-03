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

#Yay
sudo pacman -S --needed --noconfirm base-devel
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ~
  rm -rf yay-bin
fi

#hyprland base
_install "hyprland" 0
_install "polkit-kde-agent" 0
_install "qt5-wayland" 0
_install "qt6-wayland" 0
_install "uwsm" 0
_install "xdg-desktop-portal-hyprland" 0
sudo cp -a ../themes/catppuccin/hyprland.conf ~/.config/hypr/modules/hyprland-theme.conf
sudo cp -a ../config/hypr ~/.config/

#bluetooth tui
_install "bluez" 0
_install "bluetui" 0

#wifi tui
_install "impala" 0

#explorer tui
_install "nnn" 0

#brightness 
_install "brightnessctl" 0

#sound
_install "wireplumber" 0
_install "playerctl" 0

#power profile
_install "power-profiles-daemon" 1
powerprofilesctl set balanced

#neovim
_install "neovim" 0
_install "fzf" 0
_install "ripgrep" 0
_install "fd" 0
sudo cp -a ../config/nvim ~/.config/

#qutebrowser
_install "qutebrowser" 0
sudo cp -a ../config/qutebrowser ~/.config/

#foot
_install "foot" 0
mkdir -p ~/.config/foot
sudo cp -a ../themes/catppuccin/foot.ini ~/.config/foot/

#starship
_install "starship" 0
sudo cp -a ../config/config-schema.json ~/.config/
sudo cp -a ../config/starship.toml ~/.config/

#wofi
_install "wofi" 0
sudo cp -a ../config/wofi ~/.config/
sudo cp ../themes/catppuccin/wofi.css ~/.config/wofi/style.css

#waybar
_install "ttf-firacode-nerd" 0
_install "waybar" 0
sudo cp -a ../config/waybar ~/.config/
sudo cp ../themes/catppuccin/waybar.css ~/.config/waybar/theme.css

#wallpaper
_install "swaybg" 0
mkdir -p ~/wallpapers
sudo cp ../themes/catppuccin/background.png ~/wallpapers/current-theme.png

#mako
_install "mako" 0
mkdir -p ~/.config/mako
sudo cp ../themes/catppuccin/mako.ini ~/.config/mako/config

#PrintScreen
_install "hyprshot" 0
_install "hyprpicker" 0

#btop
_install "btop" 0
mkdir -p ~/.config/btop/themes
sudo cp -a ../themes/catppuccin/btop.theme ~/.config/btop/themes/current.theme

#default bash 
sudo cp -a ../etc/bash.bashrc /etc/

# Login directly as user
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo cp -a ../etc/override.conf /etc/systemd/system/getty@tty1.service.d/