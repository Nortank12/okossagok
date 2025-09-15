# **Korlátlan** mobilinternet belföldön és [Roaming](https://www.yettel.hu/roaming)ban mindössze évi 3000 forintért!

> [!CAUTION]
> **Semmiféle jogi felelősséget nem vállalunk az ebben a dokumentumban leírtak kipróbálásáért! Csak is saját felelősségre!**

## Fontos információk. Figyelmesen olvasd el, **többször is!**

### Tudnivalók
- Ezt a netet **nem** fogod tudni egyszerűen megosztani.
- Persze nem feltétel, de nem is hátrány ha van **Linux** használattal tapasztalatod.
- 2\. Roaming díjzónában **még nem** volt tesztelve, de ez **nem jelenti azt, hogy nem is fog működni!** (Ez nagyrészt az **EU-n kívüli országokat** érinti.) Ha van rá lehetőséged, próbáld meg és nyiss egy issue-t a tapasztalatokról.

### Technikai információk
- Ha volt/van **Yettel** SIM kártyád, akkor esetleg észrevehetted, hogy pár weboldalt akkor is meg tudsz nyitni amikor **elfogyott**/**nem is volt** mobilinterneted.
    - Ezek az úgynevezett "zero rated" oldalak a következőek: `www.speedtest.net`, `www.yettel.hu`
    - Ha találsz még, nyugodtan nyiss egy PR-t.
- Ez úgy tud működni biztonságos kapcsolat ([HTTPS](https://en.wikipedia.org/wiki/HTTPS)) mellett is, hogy [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) handshake részeként a böngésző **elküldi az oldal hosztnevét teljesen titkosítatlanul, egyszerű szövegben**. (plaintext [SNI](https://en.wikipedia.org/wiki/Server_Name_Indication))
- Ennek tudatában egy dolgunk van: futtatni egy saját weboldalt, amin keresztül vezetünk mindent és amikor csatlakozunk erre a weboldalra a telefonunkról, az SNI-t beállítjuk egy tetszőleges értékre.
- Szerencsére [ezt már helyettünk megírták](https://github.com/v2fly/v2ray-core), úgyhogy programozni nem fogunk.

### Előfeltételek
- (Jóesetben **Linux** alapú) szervergép amin **24/7** tudsz futtatni **[Docker](https://github.com/Nortank12/okossagok/blob/main/%C3%9Atmutat%C3%B3k/Docker/Docker.md)** containereket és portot is tudsz forwardolni.
    - Homelab
        - Saját **domain** ami mindig rámutat a [publikus IP címedre](https://api.ipify.org) vagy **DynDNS**. Utóbbit a legtöbb otthoni router támogatja, ezért ajánlott.
    - VPS
        - Saját **domain** ami rámutat a VPS IP címére.
    - Az említett domainre/DynDNS címre egy **SSL tanúsítvány**. Ezt a legegyszerűbb módon [certbottal](https://certbot.eff.org) tudod megszerezni. Hamarosan érkezik egy útmutató arra is.
- **Yettel** szolgáltatótól (MCC 216, MNC 01) egy SIM kártya
    - Ha jelenleg más szolgáltatónál vagy, akkor győződj meg róla, hogy a telefonod támogatja a [Dual SIM](https://en.wikipedia.org/wiki/Dual_SIM) technológiát.
    - Ajánlott (és tesztelt): [**Feltöltőkártya**](https://www.yettel.hu/feltoltokartyas)
        - Költségek:
            - Első **180** nap **500** forintba fog kerülni.
            - Utána évente fel kell töltened legalább **3000** forintot. Ezt legegyszerűbben a [Yettel alkalmazásban](https://www.yettel.hu/app) tudod megtenni. Nem kell félned attól, hogy megfeletkezel erről, ugyanis SMS-ben tájékoztatva leszel, amikor közeleg a határidő.
        - Maximum **10 darab** kártyás telefonszám lehet a neveden
        - A kártyát saját nevedre aktiválni csak **14. életéved** betöltése után, **magánszemélyként** tudod
        - Szükséged van **magyar hatóság** által kiállított okmányokra (**személyi igazolvány** / **jogosítvány** / **útlevél + lakcímkártya**)

> Ha a fentieknek megfelelsz, a nehezén már túl is vagy.

## V2Ray VMess szerver futtatása Dockerben
1. Hozz létre neki egy mappát.
   ```bash
   mkdir v2ray && cd v2ray
   ```
2. Hozd létre a `compose.yaml` fájlt.
   ```yaml
   services:
     v2ray:
     image: teddysun/v2ray:latest
     container_name: v2ray-server
     restart: always
     ports:
     # A "PORT" szót cseréld ki egy tetszőleges portra, de maradhat 8080 is, mint a containeren belül. UDP-re nekünk nem lesz szükségünk, ugyanis azt a Yettel úgy sem engedi meg használni.
       - "PORT:8080/tcp"
     volumes:
       - ./config:/etc/v2ray
       - /etc/letsencrypt/live:/etc/letsencrypt/live:ro # SSL Tanusítványok helye, ha certbottal generáltad
   ```
3. Hozd létre a `config` mappát.
   ```bash
   mkdir config
   ```
4. Generálj magadnak egy `UUID`-t.
   ```bash
   uuidgen
   ```
   - Ha épp olyan kedved van, akkor választhatsz is egyet [erről a weboldalról](https://everyuuid.com). (nem ajánlott)
5. Hozd létre a `config/config.json` fájlt.
   ```json
   {
     "log": {
       "loglevel": "warning"
     },
     "inbounds": [
       {
         "port": 8080,
         "protocol": "vmess",
         "settings": {
           "clients": [
             {
               "id": "UUID AMIT GENERÁLTÁL/TALÁLTÁL",
               "alterId": 0
             }
           ]
         },
         "streamSettings": {
           "network": "tcp",
           "security": "tls",
           "tlsSettings": {
             "alpn": ["h2"],
             "certificates": [
               {
                 "certificateFile": "/etc/letsencrypt/live/DOMAIN NÉV/cert.pem",
                 "keyFile": "/etc/letsencrypt/live/DOMAIN NÉV/privkey.pem"
               }
             ]
           }
         }
       }
     ],
     "outbounds": [
       {
         "protocol": "freedom",
         "settings": {}
       }
     ]
   }
   ```
6. Indítsd el.
   ```bash
   docker compose up -d
   ```

## V2Ray VMess szerverre csatlakozás telefonon
- Ez több alkalmazással is lehetséges, ezekkel biztosan működni fog:
    - v2rayNG: [Github (Android)](https://github.com/2dust/v2rayNG/releases/latest) (korábban fent volt a Play Store-on, viszont [nemrég eltávolították](https://github.com/2dust/v2rayNG/discussions/4586))
    - V2Box: [Play Store](https://play.google.com/store/apps/details?id=dev.hexasoftware.v2box), [App Store](https://apps.apple.com/us/app/v2box-v2ray-client/id6446814690)
- Az utasítások innentől apponként változnak, viszont nagyvonalakban ennyi:
    1. Hozz létre egy új VMess tunnelt.
    2. A `remarks` mezőbe egy nevet kell megadni. (bármi lehet)
    3. Az `address` mezőbe a domaint/DynDNS címet kell megadni.
    4. A `port` mezőbe a fent választott és kiforwardolt portot kell megadni.
    5. Az `id` mezőbe a fent generált/talált UUID-t kell megadni.
    6. A `security`-nél a `chacha20-poly1305` a javasolt, de lehet AES is.
    7. A `network`-nél tcp.
    8. A `head type`-nál none.
    9. A `TLS`-nél tls.
    10. Az `SNI`-nél egy tetszőleges zero rated oldal.
    11. Az `Alpn`-nél h2.
    12. Az `allowInsecure`-nél true.
    13. Mentsd el és csatlakozz.
    - ![v2rayNG config 1](/Útmutatók/mobilnet/v2rayng_config_1.jpeg)
    - ![v2rayNG config 2](/Útmutatók/mobilnet/v2rayng_config_2.jpeg)
- Androidon ajánlott még azt beállítani, hogy csak a VPN-en keresztül tudjon menni minden, de ez nem kötelező.
    1. ![Android VPN 1](/Útmutatók/mobilnet/android_vpn_1.jpeg)
    2. ![Android VPN 2](/Útmutatók/mobilnet/android_vpn_2.jpeg)
    3. ![Android VPN 3](/Útmutatók/mobilnet/android_vpn_3.jpeg)
    4. ![Android VPN 4](/Útmutatók/mobilnet/android_vpn_4.jpeg)