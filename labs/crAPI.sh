#!/usr/bin/env bash

if ! test -d crAPI
then
        mkdir crAPI && cd crAPI
else
        cd crAPI
fi

curl -o docker-compose.yml https://raw.githubusercontent.com/OWASP/crAPI/main/deploy/docker/docker-compose.yml
docker-compose pull
docker-compose -f docker-compose.yml --compatibility up -d



