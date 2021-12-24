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
git clone https://aur.archlinux.org/yay-bin.git $HOME/repos/aur/yay-bin
cd $HOME/repos/aur/yay
makepkg -si
cd $HOME
yay -S libxft-bgra timeshift timeshift-autosnap
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config remote add origin https://github.com/akirarice/dotfiles.git
config pull -ff origin master
