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

## Alap parancsok
### Image áthelyezés
```bash
docker compose up -d                        # Környezet létrehozása és futtatása (háttérben)
docker compose down                         # Környezet leállítása és konténerek törlése
docker compose start                        # Környezet futtatása
docker compose stop                         # Környezet leállítása
docker compose restart                      # Környezet újraindítása
```
