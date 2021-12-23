#!/bin/sh
gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark"
git clone https://github.com/akirarice/st.git $HOME/repos/github/test/st
cd $HOME/repos/github/test/st
doas make clean install
cd $HOME
