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
mkdir dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME clone https://github.com/akirarice/dotfiles.git
