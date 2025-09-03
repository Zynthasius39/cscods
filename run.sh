#!/bin/bash
#
# Counter Strike: Classic Offensive
# Docker entrypoint
#
# Zynthasius39 (super.alekberov@proton.me)
#

if [ -z $(ls -A) ]; then
	echo --------------------------------------------
	echo No server files were found. Downloading...
	echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo      WARNING: MOUNT /srcds as a VOLUME
	echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	if [ -z $CSCO_URL ]; then
		echo CSCO_URL is empty. Please specify an URL...
		echo --------------------------------------------
		exit 1
	fi
	wget $CSCO_URL -qO - | bsdtar -xvf- --strip-components=1 --exclude='*.exe' --exclude='*.dll' -C .
	if [ $? -eq 0 ]; then
		echo Download completed ! Starting server...
		echo --------------------------------------------
	else
		EC=$?
		echo    An error occured while downloading :\(
		echo --------------------------------------------
		exit $EC
	fi
fi

if [ -f "start.sh" ]; then
	echo --------------------------------------------
	echo Custom startup script detected. Executing...
	grep -- '-usercon' start.sh || echo      Missing \'-usercon\'; echo RCON is disabled!
	grep -- '-insecure' start.sh || echo      Missing \'-insecure\'; echo Some players may not be able to join
	grep -- '+sv_pure 0' start.sh || echo      Missing \'+sv_pure 0\'; echo VPKs will be hashed every startup!
	grep -- '<<< "sv_lan 1"' start.sh || echo      Missing \'<<< "sv_lan 1"\'; echo Some players may not be able to join
	echo --------------------------------------------
	./start.sh
else
	/bin/bash srcds_run \
		-game csco/csgo \
		-insecure \
		-usercon \
		-tickrate $TICKRATE \
		-port $PORT \
		-ip $(hostname -I) \
		+sv_pure 0 \
		+rcon_password $RCONPASSWORD \
		$SRCDS_ARGS \
		<<< "sv_lan 1"
	# /\ Can be used as an example to create a customized *start.sh*
fi
