# Docker Compose

## Telepítés
### Telepítés `$user`:
```bash
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-linux-`uname -m` -o ~/.docker/cli-plugins/docker-compose --create-dirs

chmod +x ~/.docker/cli-plugins/docker-compose
```

### Telepítés `#root`:
```bash
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-linux-`uname -m` -o /usr/local/lib/docker/cli-plugins/docker-compose --create-dirs

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
```

## Parancsok
### Környezet kezelés
```bash
docker compose up                           # Környezet létrehozása és futtatása (jelenlegi mappában)
docker compose -p [project_név] up          # Környezet létrehozása és futtatása (project nevének megadásával)
# Paraméterek
    -d                          # Indítás a háttérben
    --pull always               # Image-ek frissítése indítás előtt
docker compose down                         # Környezet leállítása és konténerek törlése
docker compose start                        # Környezet futtatása
docker compose stop                         # Környezet leállítása
docker compose restart                      # Környezet újraindítása
```

```bash
docker compose <parancs> [service_név]
```
Bármilyen compose parancs esetén, a szolgáltatás (service) nevének megadásával csak arra containerre fogja alkalmazni.

### Környezet elemzése
```bash
docker compose logs -f                      # Környezet log előzmény (-f követi az új STDOUT és STDERR üzeneteket)
docker compose top                          # Környezet futó folyamatainak megjelenítése
docker compose ls                           # Futó Docker Compose környezetek listázása
docker compose ls -a                        # Összes Docker Compose környezet listázása
```
