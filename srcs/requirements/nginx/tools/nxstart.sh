#!/bin/bash

echo "server { "  >> /etc/nginx/sites-enabled/default
echo "	listen 443 ssl;"  >> /etc/nginx/sites-enabled/default
echo "	listen [::]:443 ssl;"  >> /etc/nginx/sites-enabled/default
echo "	server_name $DOMAIN_NAME;"  >> /etc/nginx/sites-enabled/default

echo "	ssl_certificate $CERTIFICATES_OUT; "  >> /etc/nginx/sites-enabled/default
echo "	ssl_certificate_key $CERTIFICATES_KEYOUT; "  >> /etc/nginx/sites-enabled/default
echo "	ssl_protocols TLSv1.3;"  >> /etc/nginx/sites-enabled/default

echo "	root /var/www/html;"  >> /etc/nginx/sites-enabled/default

echo "	index index.php;"  >> /etc/nginx/sites-enabled/default

echo '        location / {'  >> /etc/nginx/sites-enabled/default
echo '                try_files $uri $uri/ =404;'  >> /etc/nginx/sites-enabled/default
echo '        }'  >> /etc/nginx/sites-enabled/default
 
echo "	location ~ \.php$ { "  >> /etc/nginx/sites-enabled/default
echo "		include snippets/fastcgi-php.conf;"  >> /etc/nginx/sites-enabled/default
echo "		fastcgi_pass $MYSQL_DATABASE_NAME:9000;"  >> /etc/nginx/sites-enabled/default
echo "		proxy_connect_timeout 300s; "  >> /etc/nginx/sites-enabled/default
echo "		proxy_send_timeout 300s; "  >> /etc/nginx/sites-enabled/default
echo "		proxy_read_timeout 300s; "  >> /etc/nginx/sites-enabled/default
echo "		fastcgi_send_timeout 300s; "  >> /etc/nginx/sites-enabled/default
echo "		fastcgi_read_timeout 300s; " >> /etc/nginx/sites-enabled/default
echo "	} "  >> /etc/nginx/sites-enabled/default
echo "}" >> /etc/nginx/sites-enabled/default

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