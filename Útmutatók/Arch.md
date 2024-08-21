# Arch Linux manuális telepítés

### Hivatalos útmutató
Hogyha először telepítesz Arch Linuxot, érdemes átolvasni az [ArchWiki](https://wiki.archlinux.org/title/Installation_guide)
útmutatóját.

### Telepítő
Töltsd le a telepítő ISO fájlt [innen](https://archlinux.org/download/), majd bootold be róla a számítógépet.

## 1. Előkészület
### Billentyűkiosztás átállítása
```bash
loadkeys hu
```

### Csatlakozás Wi-Fi hálózatra (opcionális)
```bash
iwctl -P [JELSZÓ] station [ESZKÖZ] connect [SSID]
```
[**iwctl** dokumentáció](https://man.archlinux.org/man/extra/iwd/iwctl.1.en)

## 2. Partícionálás
Ez háttértártól függő, jelenlegi példában az eszköz neve `/dev/sda`.

<table>
    <tr>
        <th>Partíció</th>
        <th>Címke</th>
        <th>Útvonal</th>
        <th>Fájlrendszer</th>
        <th>Méret</th>
    </tr>
    <tr>
        <td>/dev/sda1</td>
        <td>EFI BOOT</td>
        <td>/boot</td>
        <td>FAT32</td>
        <td>300MB</td>
    </tr>
    <tr>
        <td>/dev/sda2</td>
        <td>SWAP</td>
        <td>-</td>
        <td>LINUXSWAP</td>
        <td>16GB</td>
    </tr>
    <tr>
        <td>/dev/sda3</td>
        <td>ROOT</td>
        <td>/</td>
        <td>EXT4</td>
        <td>240GB</td>
    </tr>
</table>

Amennyiben már létrehoztad és leformáztad a partíciókat, a következő lépések kihagyhatóak.

### Partíciók létrehozása
```bash
fdisk /dev/sda
```
[**fdisk** dokumentáció](https://man.archlinux.org/man/fdisk.8)

### Partíciók formázása
```bash
mkfs.fat -F 32 /dev/sda1
```
```bash
mkswap /dev/sda2
```
```bash
mkfs.ext4 /dev/sda3
```

## 3. Partíciók felcsatolása
A meglévő partíciókat ellenőrizheted az `lsblk` paranccsal.

### Arch root
```bash
mount /dev/sda3 /mnt
```
### EFI boot
```bash
mount --mkdir /dev/sda1 /mnt/boot
```
### Swap
```bash
swapon /dev/sda2
```
*A swap felcsatolása `genfstab`-bal való beállításhoz szükséges.*

## 4. Alaprendszer telepítése
### Keyring frissítése
```bash
pacman -Syy archlinux-keyring --needed
```
### Alaprendszer telepítése
```bash
pacstrap -K /mnt base
```

## 5. Szükséges csomagok telepítése / beállítások elvégzése
### Csatlakozás a telepített rendszerre
```bash
arch-chroot /mnt
```

### Telepítőszkript futtatása
A beállítás folyamatát egy `bash script`-tel automatizáltuk, amit hamarosan feltöltünk ide is.

...

### Lecsatlakozás a rendszerről
```bash
exit
```

## 6. Rendszerindítás beállítása
### Boot entry megadása
```bash
efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l \vmlinuz-linux -u "root=/dev/sda3 rw initrd=/intel-ucode.img initrd=/initramfs-linux.img"
```
*AMD processzor esetén: `amd-ucode.img`*

### Automatikusan felcsatolt meghajtók beállítása | `fstab`
#### Generálással
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```
-vagy-

#### Manuálisan
```bash
nano /mnt/etc/fstab
```
Fájl tartalma:
```
/dev/sda1               /boot           vfat            defaults        0 0
/dev/sda2               none            swap            sw              0 0
/dev/sda3               /               ext4            defaults        0 1
```

## 7. Újraindítás
A sikeres telepítés után indítsd újra a rendszert és válaszd le a telepítőt tartalmazó meghajtót.
```bash
reboot
```
