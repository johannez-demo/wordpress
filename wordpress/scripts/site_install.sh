#!/bin/bash
DOCROOT=/var/www/html
VENDOR_DIR=$DOCROOT/vendor
SCRIPTS_DIR=$DOCROOT/scripts
WPCLI=$VENDOR_DIR/bin/wp

$WPCLI --allow-root core install \
		--url=${WP_SITE_URL} \
		--title=Demo \
		--admin_user=${WP_ADMIN_USER} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}

$WPCLI rewrite structure ${WP_POST_URL_STRUCTURE}

$WPCLI plugin activate advanced-custom-fields regenerate-thumbnails user-role-editor custom-config

$WPCLI eval-file $SCRIPTS_DIR/acf/acf_import.php