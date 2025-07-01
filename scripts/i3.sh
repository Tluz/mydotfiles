#nvim
#sudo pacman -S neovim
sudo cp -a ../config/nvim ~/.config/

#qutebrowser
#sudo pacman -S qutebrowser
sudo cp -a ../config/qutebrowser ~/.config/

#wallpaper
#yay -S feh
sudo cp -a ../wallpapers/background.png ~/Imagens/
feh --bg-scale ~/Imagens/background.png

#starship
#yay -S starship
sudo cp -a ../config/starship.toml ~/.config/

#rofi
sudo cp -a ../config/rofi ~/.config/

#i3
sudo cp -a ../config/i3 ~/.config/

#xfce
#sudo pacman -S fastfetch
sudo cp -a ../config/xfce4/current-color.theme /usr/share/xfce4/terminal/colorschemes/

#polybar
sudo cp -a ../config/polybar ~/.config/
