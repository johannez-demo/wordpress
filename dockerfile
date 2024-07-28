FROM wordpress:latest as development

RUN echo "Updating base image..."
RUN apt update && \
    apt upgrade -y && \
    apt autoremove


RUN echo "Installing composer..."
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"    
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer


COPY ./wordpress/plugins /var/www/html/wp-content/plugins
COPY ./wordpress/themes /var/www/html/wp-content/themes
COPY ./wordpress/uploads /var/www/html/wp-content/uploads
COPY ./wordpress/wp-config.php /var/www/html/wp-config.php
COPY ./wordpress/composer.json /var/www/html/composer.json
COPY ./wordpress/composer.lock /var/www/html/composer.lock
COPY ./wordpress/scripts /var/www/html/scripts
