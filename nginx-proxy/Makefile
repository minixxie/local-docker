PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep nginx_proxy

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d

.PHONY: down
down:
	docker rm -f nginx_proxy

.PHONY: logs
logs:
	docker logs -f nginx_proxy

.PHONY: stats
stats:
	docker stats nginx_proxy

.PHONY: show-conf
show-conf:
	docker exec -it nginx_proxy more /etc/nginx/conf.d/default.conf
