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

composer-install:
	docker exec -u ${USER} -it ${CONTAINER} composer install

install: composer-install
	docker exec -u ${USER} -it ${CONTAINER} ./scripts/site_install.sh
