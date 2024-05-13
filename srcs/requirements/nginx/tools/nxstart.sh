#!/bin/bash

if [ ! -f $CERTIFICICATES_OUT ]; then
    openssl req \
    -newkey rsa:2048 \
    -nodes \
    -keyout $CERTIFICICATES_KEYOUT \
    -x509 \
    -days 365 \
    -out $CERTIFICICATES_OUT \
    -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME";
fi

exec "$@"