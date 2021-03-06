#!/bin/bash
# Step 1: Set grub option and insert drive name
# Step 2: If needed, uncomment bottom lines for multlib/steam

ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo "127.0.1.1	arch.localdomain arch" >> /etc/hosts
echo "permit nopass akira" >> /etc/doas.conf
passwd
useradd -m akira
usermod -aG wheel akira
passwd akira
pacman -S xdotool wmctrl sxhkd zram-generator grub efibootmgr networkmanager os-prober linux-headers pipewire pipewire-alsa pipewire-pulse pipewire-jack gnome gnome-tweaks materia-gtk-theme rofi ttf-liberation pass pass-otp zsh zsh-syntax-highlighting firefox firefox-ublock-origin openssh rsync neofetch htop opendoas

#pacman -S --noconfirm xf86-video-amdgpu

#efi
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

#mbr
#grub-install

generate grub config
#grub-mkconfig -o /boot/grub/grub.cfg

echo "[zram0]" >> /etc/systemd/zram-generator.conf
systemctl enable NetworkManager
systemctl enable gdm
chsh -s /usr/bin/zsh akira
EDITOR=nvim visudo
#set multilib repo & install steam
#sed -i '/\[multilib\]/s/^#//;/^\[multilib]/{n;s/^#//}' /etc/pacman.conf
#pacman -Syy
#pacman -S steam lutris
