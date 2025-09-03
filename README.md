![de_rats_csgo.gif](https://github.com/Zynthasius39/cscods/blob/main/de_rats_csgo.gif)

# Counter-Strike: Classic Offensive | Dedicated Server

Containerized dedicated server for easy deployments.

### You can get a copy of the game for free by just Googling 'classicoffensive download'

> [!CAUTION]
> Use leaked versions of the game at your own risk!

> [!WARNING]
> Mount a volume on ```/srcds``` to preserve customizations!

Example:
```bash
docker run \
  --env-file .CSCOENV \
  -v /home/steam/cscods:/srcds \
  -p 27015:27015/udp \
  zynthasius/cscods:base
```

```bash
# .CSGOENV
RCONPASSWORD=s3cr3tp4ssw0rd
TICKRATE=128
PORT=27015
CSCO_URL= # OPTIONAL: Provide a URL to download Classic_Offensive.zip (Leaked version)
```
