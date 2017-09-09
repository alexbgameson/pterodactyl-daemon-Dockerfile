FROM node:7.10.0-alpine

MAINTAINER Michael Parker, <docker@parkervcp.com>

ENV DAEMON_VERSION=v0.4.5

WORKDIR /srv/daemon

RUN apk update \
 && apk add openssl make gcc g++ python linux-headers paxctl gnupg tar zip unzip coreutils \
 && wget hhttps://github.com/Pterodactyl/Daemon/releases/download/DAEMON_VERSION/daemon.tar.gz \
 && tar --strip-components=1 -xzvf daemon.tar.gz \
 && rm ${DAEMON_VERSION}.tar.gz \
 && npm install --production \
 && apk del curl make gcc g++ python linux-headers paxctl gnupg tar ${DEL_PKGS}

EXPOSE 8080

CMD ["npm", "start"]
