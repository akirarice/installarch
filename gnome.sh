#!/bin/bash
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
passwd akira
pacman -S grub grub-btrfs efibootmgr networkmanager os-prober linux-headers pipewire pipewire-alsa pipewire-pulse pipewire-jack gnome gnome-tweaks materia-gtk-theme rofi ttf-liberation pass pass-otp zsh zsh-syntax-highlighting firefox firefox-ublock-origin openssh rsync neofetch htop opendoas

#pacman -S --noconfirm xf86-video-amdgpu

#efi
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

#mbr
#grub-install
#grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable gdm

pacman -Rns --noconfirm sudo

#set multilib repo & install steam
#sed -i '/\[multilib\]/s/^#//;/^\[multilib]/{n;s/^#//}' /etc/pacman.conf
#pacman -Syy
#pacman -S steam lutris
