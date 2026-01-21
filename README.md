![de_rats_csgo.gif](https://github.com/Zynthasius39/cscods/blob/main/de_rats_csgo.gif)

# Counter-Strike: Classic Offensive | Dedicated Server

Containerized dedicated server for easy deployments.

> [!CAUTION]
> You need to get **archived** game files by your own

> [!IMPORTANT]
> Verify your game files with SHA256
> 
> ```a4479cac1f12d75672b40460806e20a49836cc92c03533bafb62f33cd72bc48f  Classic Offensive.zip```


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
> [!WARNING]
> Mount a volume on ```/srcds``` to preserve customizations!
