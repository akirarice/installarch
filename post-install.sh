#!/bin/sh
gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark"
git clone https://github.com/akirarice/st.git $HOME/repos/github/st
cd $HOME/repos/github/st
doas make clean install
git clone https://aur.archlinux.org/zramd $HOME/repos/aur/zramd
cd $HOME/repos/aur/zramd
makepkg -si
cd $HOME
doas systemctl enable --now zramd
git init --bare $HOME/dotfiles
alias config='/usr/bin/gt --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config remote add origin https://github.com/akirarice/dotfiles.git
config pull -ff origin master
