FROM java:8-jre

MAINTAINER "John Koelndorfer <jkoelndorfer@gmail.com>"

ARG MODPACK_SERVER_ZIP_URL

WORKDIR /minecraft

RUN curl -L "$MODPACK_SERVER_ZIP_URL" > server.zip && \
    unzip server.zip && \
    rm -f server.zip

RUN mkdir serverconf && \
    # Server icon is symlinked at container start time in entrypoint.sh
    ([ -f server-icon.png ] && mv server-icon.png server-icon-default.png || true) && \
    ln -s serverconf/banned-ips.json && \
    ln -s serverconf/banned-players.json && \
    ln -s serverconf/ops.json && \
    ([ -f server.properties ] && mv server.properties server.properties.default || true) && \
    ln -s serverconf/server.properties && \
    ln -s serverconf/whitelist.json && \
    ln -s serverconf/local local && \
    echo "eula=true" > eula.txt

ADD entrypoint.sh entrypoint.sh

EXPOSE 25565

VOLUME ["/minecraft/backups", "/minecraft/serverconf", "/minecraft/world"]
ENTRYPOINT ["/minecraft/entrypoint.sh"]
