FROM wordpress:latest as development

RUN echo "Updating base image..."
RUN apt update && \
    apt upgrade -y && \
    apt autoremove

RUN echo "Installing WP CLI..."
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp