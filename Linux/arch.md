# A nagy magyar Arch Linux telepítő tutorial
Ebben a leírásban az Arch Linux <mark>korlátozott</mark> telepítését mutatom be.
A korlátozott ebben az esetben azt jelenti, hogy az eredeti angol telepítőhöz képest, itt nincs bootloader telepítés, ellenőrzőösszeg checking és még sok minden más sem amit az eredeti guide tartalmaz. Nincs kizárva, hogy a jövőben bővítve lesz az oldal, de főképpen azok a dolgok vannak itt megfogalmazva amiket mi is használunk (vagy valamikor használtunk) a telepítés alatt.
## Image fájl letöltése
Kezdetnek (mint minden másik rendszernél) itt is ki kell írni pendrive-ra a telepítőt. A telepítőt az Arch Linux [oldaláról](https://archlinux.org) lehet [letölteni](https://archlinux.org/download).
### Kiigazodás az oldalon
Ha lejjebb görgetsz, találsz egy listát az országokról és az azokban található mirror szerverekről.
Kiválasztod valamelyiket majd a `archlinux-YYYY.MM.DD-x86_64.iso` vagy a `archlinux-x86_64.iso` fájlt letöltöd.
A két fájl igazából ugyanaz. Különbség, hogy az egyik tartalmazza a kiadási dátumot a másik pedig nem.
> [!TIP]
> A mirror szerverek lényege, hogy a tartalom többszörösen - a világ több pontjáról - elérhető legyen ezért mindegyike ugyanazt a fájlt tartalmazza.
> Nem szükséges a magyar szervereket használni, de a földrajzi helyzete miatt elérhetőségben ez lesz a legközvetlenebb és leggyorsabb.
### [Flashelés pendrive-ra](https://wiki.archlinux.org/title/Installation_guide#Prepare_an_installation_medium)
Miután ezt felraktad egy pendrive-ra például [Rufus](https://rufus.ie/hu)-szal vagy [Etcher](https://etcher.balena.io)-el, csatlakoztasd a géphez és a boot menüben válaszd ki a pendrive-ot.
## [Internetkapcsolat ellenőrzés](https://wiki.archlinux.org/title/Installation_guide#Connect_to_the_internet)
Ahhoz, hogy a rendszert telepíteni tudd, szükség lesz internetkapcsolatra.
A legegyszerűbb megoldás, ha csatlakoztatod az internet kábelt a géphez. Ekkor mindenféle egyéb trükközés nélkül, automatikusan lesz internetkapcsolat a gépen (legalábbis ha jó az alap driver a telepítő rendszerben).
## [Wi-Fi csatlakozás](https://wiki.archlinux.org/title/Iwd#Connect_to_a_network)
WLAN hálózatra az `iwctl` programmal tudsz csatlakozni
```bash
iwctl --passphrase <jelszó> station wlan0 connect <Wi-Fi név>
```
Ha a te állomásodat (station) nem `wlan0`-nak hívják, akkor az
```bash
iwctl device list
```
parancssal tudod lekérni a WLAN eszközök listáját.
## [Partícionálás](https://wiki.archlinux.org/title/Installation_guide#Partition_the_disks)
