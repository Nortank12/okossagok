# Debian 12 (KDE)
Scriptek és parancsok a Debian 12 telepítéshez.

## Scriptek
- `$` `apps.sh`
Asztali alkalmazások hozzáadása az APT repóhoz, majd telepítése.
- `#` `nvidia-cuda.sh`
NVIDIA CUDA illesztőprogram telepítése a [hivatalos dokumentáció](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#debian) alapján.

## Parancsok
### Óra szinkronizálása Windows-al való dual boot esetén
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
