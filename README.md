# installarch - make sure to always flag boot partition if UEFI is active
## Commands in live environment after creating btrfs filesytem:  
`mount /dev/sdX# /mnt`  
`cd /mnt`  
`btrfs su cr @`  
`btrfs su cr @home`  
`btrfs su cr @var`  
`cd /`  
`umount /mnt`  
`mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@ /dev/sdX# /mnt`  
`mdkir -p /mnt/{home,boot,var}`  
`mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home /dev/sdX# /mnt/home`  
`mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@var /dev/sdX# /mnt/var`  
`mount /dev/sdX# /mnt/boot` (Should be different mount point from root volume)   
`pacstrap /mnt base base-devel linux linux-firmware linux-headers neovim git`  
`genfstab -U /mnt >> /mnt/etc/fstab`  
`arch-chroot /mnt`
## Now clone this repo and configure the gnome script  
