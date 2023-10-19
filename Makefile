SHELL := /bin/bash
DOCKER ?= nerdctl

.PHONY: install-tools
install-tools:
	brew install --cask docker
	brew install docker-compose
	brew install colima
	colima nerdctl install
#	brew install hyperkit
#	brew install minikube

.PHONY: ncpu
ncpu:
	@if [ "$$(uname -s)" == "Darwin" ]; then \
		sysctl hw.ncpu | sed 's/.*: //'; \
	elif [ "$$(uname -s)" == "Linux" ]; then \
		echo 0; \
	else \
		echo 0; \
	fi

.PHONY: mem
mem:
	@if [ "$$(uname -s)" == "Darwin" ]; then \
		expr $$(sysctl hw.memsize | sed 's/.*: //') / 1024 / 1024 / 1024; \
	elif [ "$$(uname -s)" == "Linux" ]; then \
		echo 0; \
	else \
		echo 0; \
	fi

.PHONY: containerd
containerd:
	colima start --runtime containerd \
		--cpu $$(expr $$(make -s ncpu) / 2) \
		--memory $$(expr $$(make -s mem) / 2)

.PHONY: docker
docker:
	colima start --runtime docker \
		--cpu $$(expr $$(make -s ncpu) / 2) \
		--memory $$(expr $$(make -s mem) / 2)

#.PHONY: minikube
#minikube:
#	minikube delete; minikube start --driver=hyperkit --cpus 2 --memory 2048
#	#minikube delete; minikube start --driver=hyperkit --cpus 4 --memory 8194 --disk-size='40000mb'
#	minikube pause
#	eval $$(minikube docker-env) ; docker rm -f $$(docker ps -qa) ; make docker-networks
#	@echo "Remember to run this for every terminal, or add this into your ~/.bashrc or ~/.zshrc, etc:"
#	@echo "eval \$$(minikube docker-env)"
#	make minikube-mount

#.PHONY: minikube-mount
#minikube-mount:
#	minikube mount /Users:/Users

#.PHONY: docker-networks
#docker-networks:
#	docker network create local_network || true

.PHONY: hosts
hosts:
	@./.hosts.sh 127.0.0.1

.PHONY: stats
stats:
	${DOCKER} stats `${DOCKER} ps -a | sed 1d | awk '{print $$NF}'`

.PHONY: ps
ps:
	${DOCKER} ps -a

.PHONY: test
test:
	make -s down-all
	./scripts/test/test-redis.sh
	./scripts/test/test-postgis-ui.sh
	./scripts/test/test-postgres-ui.sh
	./scripts/test/test-timescaledb-ui.sh
	./scripts/test/test-mysql.sh
	./scripts/test/test-mongo.sh
	./scripts/test/test-clickhouse.sh
	./scripts/test/test-monitoring.sh
	./scripts/test/test-alertmanager.sh
	./scripts/test/test-zipkin.sh
	./scripts/test/test-xxljob.sh
	./scripts/test/test-es.sh

.PHONY: down-all
down-all:
	${DOCKER} rm -f `${DOCKER} ps -qa` || true

.PHONY: up-monitoring
up-monitoring:
	cd node-exporter-1-6-1 && make up wait-healthy && cd -
	cd cadvisor-0-47-2 && make up wait-healthy && cd -
	cd otel-collector-0-86-0 && make up wait-healthy && cd -
	cd jaeger-all-in-one && make up wait-healthy && cd -
	cd prometheus-2-47-0 && make up wait-healthy && cd -
	cd grafana-10-1-4 && make up wait-healthy && cd -
	cd nginx && make down up wait-healthy && cd -

.PHONY: down-monitoring
down-monitoring:
	cd grafana-10-1-4 && make down && cd -
	cd prometheus-2-47-0 && make down && cd -
	cd jaeger-all-in-one && make down && cd -
	cd otel-collector-0-86-0 && make down && cd -
	cd node-exporter-1-6-1 && make down && cd -
	cd cadvisor-0-47-2 && make down && cd -
