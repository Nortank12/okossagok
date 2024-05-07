# Docker

## Telepítés (Debian)
```bash
sudo apt install docker.io
sudo usermod -aG docker $USER
```

## Image kezelés
```bash
docker images                               # Image-ek listázása
docker pull [image_név]                     # Image letöltése vagy frissítése Docker Hubról
docker build -t [image_név] [mappanév]      # Buildelés Dockerfileból
docker rmi [image_név]                      # Image törlése
docker image prune                          # Nem használt image-ek törlése
docker commit [container_név] [image_név]   # Image létrehozása containerből
```

## Image áthelyezés
```bash
docker save -o [fájlnév] [image_név]        # Image mentése tarball-ba
docker load -i [fájlnév]                    # Image kibontása tarball-ból
```

## Volume kezelés
```bash
docker volume create [volume_név]           # Volume létrehozása (/var/lib/docker/volumes/.../_data)
docker volume ls                            # Volume-ok listázása
docker volume inspect [volume_név]          # Volume részleteinek megtekintése
docker volume rm [volume_név]               # Volume törlése
docker volume prune                         # Használatlan volume-ok törlése
```

## Container létrehozás
```bash
docker create <paraméterek> [image_név]     # Container létrehozás
docker run <paraméterek> [image_név]        # Container létrehozás és futtatás
# Paraméterek
    -it                         # Interaktív TTy Shell
    -p 80:80                    # Host_port:Node_port
    --name [container_név]      # Container neve
    -v /helyi/mappa:/mappa      # Helyi mappa felcsatolása a containerbe
    -v [volume_név]:/mappa      # Előre létrehozott volume felcsatolása a containerbe
```

## Container kezelés
```bash
docker ps                                   # Futó containerek listázása
docker ps -a                                # Összes container listázása
docker start [container_név]                # Container indítása
docker stop [container_név]                 # Container leállítása
docker attach [container_név]               # Terminál megnyitása
docker logs -f [container_név]              # Container log előzmény (-f követi az új STDOUT és STDERR üzeneteket)
docker exec -it [container_név] /bin/sh     # Terminál megnyitása futó containeren
Ctrl + P + Q                                # Kilépés a terminálból
Ctrl + A + D                                # Kilépés és container leállítása
docker rm [container_név]                   # Container törlése (rm -f kényszeríti)
```
