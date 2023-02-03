.PHONY: install-tools
install-tools:
	brew install --cask docker
	brew install docker-compose
	brew install hyperkit
	brew install minikube

.PHONY: minikube
minikube:
	minikube delete; minikube start --driver=hyperkit --cpus 2 --memory 2048
	minikube pause
	eval $$(minikube docker-env) ; docker rm -f $$(docker ps -qa) ; make docker-networks
	@echo "Remember to run this for every terminal, or add this into your ~/.bashrc or ~/.zshrc, etc:"
	@echo "eval \$$(minikube docker-env)"

.PHONY: minikube-mount
minikube-mount:
	minikube mount /Users:/Users

.PHONY: docker-networks
docker-networks:
	docker network create local_backend || true

.PHONY: hosts
hosts:
	@./.hosts.sh 127.0.0.1
