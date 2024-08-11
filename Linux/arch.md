# A nagy magyar Arch Linux telepítő tutorial
Ebben a leírásban az Arch Linux <mark>korlátozott</mark> telepítését mutatom be.
A korlátozott ebben az esetben azt jelenti, hogy az eredeti angol telepítőhöz képest, itt nincs bootloader telepítés és ellenőrzőösszeg checking sem. Nincs kizárva, hogy a jövőben bővítve lesz az oldal, de főképpen azok a dolgok vannak itt megfogalmazva amiket mi is használunk (vagy valamikor használtunk) a telepítés alatt.
## Image fájl letöltése
Kezdetnek (mint minden másik rendszernél) itt is ki kell írni pendrive-ra a telepítőt. A telepítőt az Arch Linux [oldaláról](https://archlinux.org) lehet [letölteni](https://archlinux.org/download).
### Kiigazodás az oldalon
Ha lejjebb görgetsz, találsz egy listát az országokról és az azokban található mirror szerverekről.
Kiválasztod valamelyiket majd a `archlinux-YYYY.MM.DD-x86_64.iso` vagy a `archlinux-x86_64.iso` fájlt letöltöd.
A két fájl igazából ugyanaz. Különbség, hogy az egyik tartalmazza a kiadási dátumot a másik pedig nem.
### Flashelés pendrive-ra
Miután ezt felraktad egy pendrive-ra például [Rufus](https://rufus.ie/hu)-szal vagy [Etcher](https://etcher.balena.io)-el, csatlakoztasd a géphez és a boot menüben válaszd ki a pendrive-ot.
## Internetkapcsolat ellenőrzés
Ahhoz, hogy a rendszert telepíteni tudd, szükség lesz internetkapcsolatra.
A legegyszerűbb megoldás, ha csatlakoztatod az internet kábelt a géphez. Ekkor mindenféle egyéb trükközés nélkül, automatikusan lesz internetkapcsolat a gépen (legalábbis ha jó az alap driver a telepítő fájlban).
