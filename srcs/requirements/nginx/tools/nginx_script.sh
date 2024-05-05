#!/bin/bash

openssl req -newkey rsa:2048 -nodes -keyout $CRT_KEYOUT -x509 -days 365 -out \
$CRT_OUT -subj "/C=TR/ST=Kocaeli/L=Gebze/O=42 School/OU=$CRT_NAME/CN=$DOMAIN_NAME"

exec "$@"
