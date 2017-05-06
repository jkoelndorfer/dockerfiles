#!/bin/bash

[[ -d 'serverconf/local' ]] || mkdir 'serverconf/local'
if [[ -f 'serverconf/server-icon.png' ]]; then
    ln -s serverconf/server-icon.png
else
    ln -s server-icon-default.png server-icon.png
fi

if [[ -f 'server.properties.default' && ! -f 'serverconf/server.properties' ]]; then
    cp server.properties.default serverconf/server.properties
fi

exec java -server -jar "${FORGE_JAR:-$(echo *forge*.jar)}" -Xms "${JAVA_XMS:-6G}" -Xmx "${JAVA_XMX:-6G}"
