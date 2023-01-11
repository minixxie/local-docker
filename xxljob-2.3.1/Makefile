PULL_THRU_CACHE :=

.PHONY: check
check:
	docker ps -a | grep xxljob-2-3-1

.PHONY: up
up:
	PULL_THRU_CACHE=${PULL_THRU_CACHE} docker-compose up -d
	@echo "1. Remember to run ./init-db.sh if you haven't!"
	@echo "2. Add entry '$$(minikube ip)  xxljob.local' into /etc/hosts"
	@echo "3. And then you can visit: http://xxljob.local/xxl-job-admin (user: admin, pass: 123456)"

.PHONY: down
down:
	docker rm -f xxljob-2-3-1

.PHONY: logs
logs:
	docker logs -f xxljob-2-3-1

.PHONY: stats
stats:
	docker stats xxljob-2-3-1
