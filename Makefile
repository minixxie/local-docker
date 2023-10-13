SHELL := /bin/bash
DOCKER := nerdctl

.PHONY: install-tools
install-tools:
	brew install --cask docker
	brew install docker-compose
	brew install hyperkit
	brew install minikube

.PHONY: minikube
minikube:
	minikube delete; minikube start --driver=hyperkit --cpus 2 --memory 2048
	#minikube delete; minikube start --driver=hyperkit --cpus 4 --memory 8194 --disk-size='40000mb'
	minikube pause
	eval $$(minikube docker-env) ; docker rm -f $$(docker ps -qa) ; make docker-networks
	@echo "Remember to run this for every terminal, or add this into your ~/.bashrc or ~/.zshrc, etc:"
	@echo "eval \$$(minikube docker-env)"
	make minikube-mount

.PHONY: minikube-mount
minikube-mount:
	minikube mount /Users:/Users

#.PHONY: docker-networks
#docker-networks:
#	docker network create local_network || true

.PHONY: hosts
hosts:
	@./.hosts.sh 127.0.0.1

.PHONY: stats
stats:
	${DOCKER} stats `${DOCKER} ps -a | sed 1d | awk '{print $$NF}'`

.PHONY: up-monitoring
up-monitoring:
	#cd node-exporter-1-6-1 && make up && cd -
	#cd cadvisor-v0.47.2 && make up && cd -
	cd otel-collector-0-86-0 && make up wait-healthy && cd -
	cd jaeger-all-in-one && make up wait-healthy && cd -
	cd prometheus-2-47-0 && make up wait-healthy && cd -
	cd grafana-10-1-4 && make up wait-healthy && cd -

.PHONY: down-monitoring
down-monitoring:
	cd grafana-10-1-4 && make down && cd -
	cd prometheus-2-47-0 && make down && cd -
	cd jaeger-all-in-one && make down && cd -
	cd otel-collector-0-86-0 && make down && cd -
