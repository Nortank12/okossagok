# yt-dlp

## Telepítés

### Arch
```bash
sudo pacman -S yt-dlp
```

### Debian
```bash
sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo apt update
sudo apt install yt-dlp
```

### Bármilyen más rendszer (csomagkezelő)
- https://github.com/yt-dlp/yt-dlp/wiki/Installation#third-party-package-managers

### Bármilyen más rendszer (pip)
- stabil:
  ```bash
  pip install -U "yt-dlp[default]"
  ```
- naponta megjelenő legújabb verzió (nightly):
  ```bash
  pip install -U --pre "yt-dlp[default]"
  ```
- legeslegújabb verzió (master branch):
  ```bash
  pip install -U pip hatchling wheel
  pip install --force-reinstall "yt-dlp[default] @ https://github.com/yt-dlp/yt-dlp/archive/master.tar.gz"
  ```

> [!IMPORTANT]
> Lehetséges, hogy a te rendszereden nincsen a `pip` a `PATH`-ben vagy egyáltalán letöltve. Ebben az esetben ajánlott [letölteni](https://pip.pypa.io/en/stable/installation/), vagy ha ez nem sikerül, akkor még mindig ott van a csomagkezelős opció.

> [!CAUTION]
> Ha a pip nem a `PATH`-re telepíti a programot, lehet, hogy `python -m yt-dlp`-t kell használj a `yt-dlp` helyett. Erről a pip [figyelmeztet](https://github.com/pypa/pip/blob/b6e7748e33989b17b36040c9fc000ec65f77928d/src/pip/_internal/operations/install/wheel.py#L169) is, ilyenkor javasolt az írt mappát hozzáadni a `PATH`-hez.

> [!IMPORTANT]
> A legtöbb előre elkészített parancshoz kelleni fog FFmpeg. Ezt [így](FFmpeg.md) tudod letölteni.

---

## Videók letöltése
> [!TIP]
> A `yt-dlp` rengeteg oldalt támogat, nem csak `YouTube`-ot. Ezeknek a listáját [itt](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) találod.

### Legmagasabb minőség
- hosszú:
  ```bash
  yt-dlp --format "bestaudio+bestvideo" --merge-output-format mp4 <link>
  ```
- rövid:
  ```bash
  yt-dlp -f "ba+bv" -t mp4 <link>
  ```

> [!TIP]
> Ha nem MP4 formátumban szeretnéd letölteni a videót, csak írd át, pl. `mkv`-ra.

> [!CAUTION]
> Lehetséges, hogy bizonyos mennyiségű letöltött videó után a `YouTube` (és akár más platformok is) korlátozzák az IP-címedet, és nem engedik, hogy fiók nélkül hozzáférj a tartalomhoz. Ha dinamikus IP-címed van (elég valószínű), akkor csak ki kell kapcsolni a modemet egy ideig, de ha ezt nem teheted meg, akkor a letöltést is fiókkal kell végezned.

---

## Élő-adás letöltése

### Elejétől kezdve
> [!CAUTION]
> A `--live-from-start` paraméter egyenlőre csak `YouTube`-on támogatott és tesztelés alatt áll.

> [!WARNING]
> Ha a feltöltő beállítja, hogy ne lehessen visszatekerni az adást, ez nem fog működni.

```bash
yt-dlp --live-from-start --downloader ffmpeg --hls-use-mpegts --format "bestaudio+bestvideo" --merge-output-format mp4 <link>
```

### Jelenlegi időponttól kezdve
```bash
yt-dlp --no-live-from-start --downloader ffmpeg --hls-use-mpegts --format "bestaudio+bestvideo" --merge-output-format mp4 <link>
```

## Fiókkal belépés

### Böngészőből kimásolt sütik
> [!NOTE]
> Linuxon valószínűleg szükséged lesz a [SecretStorage](https://pypi.org/project/SecretStorage) PyPI csomagra, ha Chromium-alapú böngészőből szeretnél sütiket használni.
```bash
--cookies-from-browser <brave/chrome/chromium/edge/firefox/opera/safari/vivaldi/whale>[+KEYRING][:PROFILE][::CONTAINER]
```

### Felhasználónév + Jelszó
```
--username FELHASZNÁLÓNÉV/EMAIL-CÍM
--password JELSZÓ
```
