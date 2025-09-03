FROM debian:trixie-slim

LABEL maintainer=super.alekberov@proton.me

ENV RCONPASSWORD=""
ENV PORT=27015
ENV TICKRATE=128
ENV SRCDS_ARGS=""

ARG UID=1000
ARG HOMEDIR=/srcds

WORKDIR $HOMEDIR

COPY run.sh /
RUN /bin/bash -c \
	set -x && \
	apt update && \
	apt install \
		wget \
		libarchive-tools \
		lib32stdc++6 \
		libcurl4t64 \
	-y && \
	useradd \
		-u ${UID} \
		-d ${HOMEDIR} \
		-s /bin/bash gordon \
	&& \
	chown gordon:gordon -R -- ${HOMEDIR} /run.sh

USER $UID
VOLUME $HOMEDIR

ENTRYPOINT ["/run.sh"]
