# Todo: make install command for composer
USER=www-data
CONTAINER=wordpress

build:
	docker compose -f build
up:
	docker compose -f docker-compose.yml up -d
down:
	docker compose -f docker-compose.yml down
logs:
	docker compose -f docker-compose.yml logs --tail=100 -f $(c)
ssh:
	docker exec -u ${USER} -it ${CONTAINER} /bin/bash

install:
	docker exec -u ${USER} -it ${CONTAINER} composer install \
	--prefer-dist --no-progress --no-suggest

update:
	docker exec -u ${USER} -it ${CONTAINER} composer update

site-install: install
	docker exec -u ${USER} -it ${CONTAINER} ./scripts/site_install.sh

lint:
	echo "Running php lint..."
	docker exec -u ${USER} -it ${CONTAINER} ./vendor/bin/parallel-lint \
	./src ./tests ./wp-content/plugins

test:
	echo "Running php unit tests..."
	docker exec -u ${USER} -it ${CONTAINER} ./vendor/bin/phpunit -c phpunit.xml

