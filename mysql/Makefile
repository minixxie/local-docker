.PHONY: check
check:
	docker ps -a | grep mysql_8_0_31

.PHONY: up
up:
	MYSQL_ROOT_PASSWORD=hello123 docker-compose up -d

.PHONY: down
down:
	docker rm -f mysql_8_0_31

.PHONY: logs
logs:
	docker logs -f mysql_8_0_31

.PHONY: stats
stats:
	docker stats mysql_8_0_31
