# Todo: make install command for composer

up:
	docker-compose -f docker-compose.yml up -d
down:
	docker-compose -f docker-compose.yml down
logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)
ssh:
	docker-compose -f docker-compose.yml exec wordpress /bin/bash