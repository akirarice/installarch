#!/bin/sh
#Setup swap
doas systemctl daemon-reload
doas systemctl start /dev/zram0
#set theme
gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark"
#get simple terminal
git clone https://github.com/akirarice/st.git $HOME/repos/github/st
cd $HOME/repos/github/st
doas make clean install
git clone https://github.com/akirarice/dwm.git $HOME/repos/github/dwm
cd $HOME/repos/github/dwm
doas make clean install
git clone https://github.com/akirarice/dmenu.git $HOME/repos/github/dmenu
cd $HOME/repos/github/dmenu
doas make clean install
git clone https://aur.archlinux.org/yay-bin.git $HOME/repos/aur/yay-bin
cd $HOME/repos/aur/yay-bin
makepkg -si
cd $HOME
yay -S libxft-bgra timeshift timeshift-autosnap
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config remote add origin https://github.com/akirarice/dotfiles.git
config pull -ff origin master
