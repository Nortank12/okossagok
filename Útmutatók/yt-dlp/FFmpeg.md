# Telepítés

## FFmpeg Telepítési Útmutató

> [!NOTE]
> Ez az útmutató segít neked az FFmpeg telepítésében különböző operációs rendszereken. Fontos: mindig úgy telepítsd, hogy az FFmpeg binárisai elérhetőek legyenek a `PATH`-en!

---

## Arch

FFmpeg telepítése hivatalos tárolóból:

```bash
sudo pacman -S ffmpeg
```

Ha a legfrissebb verziót szeretnéd, egy AUR-segéddel le tudod tölteni:

- paru:
  ```bash
  paru -S ffmpeg-git
  ```

- yay:
  ```bash
  yay -S ffmpeg-git
  ```

Ellenőrizd a telepítést:

```bash
ffmpeg -version
```

---

## Debian

1. Frissítsd a csomaglistát:
   ```bash
   sudo apt update
   ```
2. Telepítsd az FFmpeg-et:
   ```bash
   sudo apt install ffmpeg
   ```
3. Ellenőrizd a telepítést:
   ```bash
   ffmpeg -version
   ```

---

## Egyéb Linux disztribúciók

### Fedora

```bash
sudo dnf update
sudo dnf install ffmpeg
```

### CentOS 7

1. Engedélyezd az EPEL és RPM Fusion tárolókat:
   ```bash
   sudo yum install epel-release
   sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
   ```
2. Telepítsd az FFmpeg-et:
   ```bash
   sudo yum install ffmpeg ffmpeg-devel
   ```
3. Ellenőrizd a telepítést:
   ```bash
   ffmpeg -version
   ```

---

## Windows

### Csomagkezelőkkel (ajánlott)

Ha van Chocolatey, Scoop vagy winget csomagkezelőd letöltve:

```powershell
# Chocolatey
choco install ffmpeg

# Scoop
scoop install ffmpeg

# winget
winget install ffmpeg
```

### Manuális telepítés
> [!WARNING]
> Ez nem ajánlott, de te tudod, hogy mit szeretnél.

1. Töltsd le a [gyan.dev/ffmpeg/builds](https://www.gyan.dev/ffmpeg/builds) oldalról az [`ffmpeg-git-full.7z`](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z) fájlt. ([.ver](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z.ver) [.sha256](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z.sha256))
2. Csomagold ki és tartalmát helyezd a `C:\ffmpeg` mappába.
3. Add hozzá a PATH környezeti változóhoz:
   
   a. Nyisd meg a `Vezérlőpult`-ot > `Rendszer` > `Speciális rendszerbeállítások`
   
   b. Kattints a `Környezeti változók` gombra
   
   c. A `Rendszerváltozók` részben keresd meg a `Path` változót, jelöld ki és kattints a `Szerkesztés` gombra
   
   d. Kattints az `Új` gombra és add hozzá az elérési utat, ahol az FFmpeg binárisok találhatók (`C:\ffmpeg\bin`)
   
   e. Kattints az `OK` gombra mindhárom ablakban
4. Ellenőrizd a telepítést:
   ```
   ffmpeg -version
   ```
---

## macOS

### Homebrew

1. Ha még nincs, telepítsd a Homebrew-t:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Telepítsd az FFmpeg-et:
   ```bash
   brew update
   brew install ffmpeg
   ```
3. Ellenőrizd a telepítést:
   ```bash
   ffmpeg -version
   ```

---

Ha az ellenőrzésnél látod a verziószámot, az FFmpeg sikeresen települt és elérhető a `PATH`-en!
