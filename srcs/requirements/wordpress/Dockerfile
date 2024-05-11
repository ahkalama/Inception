FROM debian:buster

RUN apt-get update && apt-get install -y \
   php php-mysql php-fpm curl wget && \
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
   chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
   mkdir -p var/www/html && mkdir /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp_script.sh /var/www/html/  

EXPOSE 9000

WORKDIR /var/www/html

RUN chmod +x ./wp_script.sh

ENTRYPOINT [ "./wp_script.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]
