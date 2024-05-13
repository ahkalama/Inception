#!/bin/bash

if [ ! -f $CERTIFICATES_OUT ]; then
    openssl req \
    -newkey rsa:2048 \
    -nodes \
    -keyout $CERTIFICATES_KEYOUT \
    -x509 \
    -days 365 \
    -out $CERTIFICATES_OUT \
    -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME";
fi

exec "$@"