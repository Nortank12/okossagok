#!/bin/bash

# 0. Telepítéshez szükséges változók
read -p "Root jelszó: " ROOT_PW
read -p "USER név: " USER
read -p "USER jelszó: " USER_PW


# 1. Beallítások frissítése RAM-ban
source /etc/profile

# 2. DNS névkiszolgáló
echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf

# 3. Csomagkezelő frissítése
emerge --sync

# 4. KDE Plasma profil kiválasztása
eselect profile set 27

# 5. Időzóna beállítása
echo "Europe/Budapest" > /etc/timezone
emerge --config sys-libs/timezone-data

# 6. Időszinkronizáció beállítása
emerge net-misc/chrony
rc-update add chronyd default

# 7. Nyelv beállítása
echo -e "hu_HU.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 5
env-update && source /etc/profile

# 8. Billentyűkiosztás átállítása
sed -i 's/^keymap="us"$/keymap="hu"/' /etc/conf.d/keymaps

# 9. Hostname beállítása
echo Gen2 > /etc/hostname

# 10. Hálózat beállítása
emerge net-misc/dhcpcd
rc-update add dhcpcd default

# 11. Root jelszó beállítása
echo "root:$ROOT_PW" | chpasswd

# 12. Felhasználó létrehozása
useradd -mG audio,cdrom,floppy,portage,usb,video,wheel -s /bin/bash $USER
echo "$USER:$USER_PW" | chpasswd

# 13. Szükséges csomagok frissítése
emerge -quDN @world
emerge --depclean

# 14. Kernel frissítése
emerge sys-kernel/gentoo-kernel

# 15. KDE Plasma telepítése
emerge kde-plasma/plasma-meta
