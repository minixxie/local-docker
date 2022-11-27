.PHONY: install-tools
install-tools:
	brew install --cask docker
	brew install docker-compose
	brew install hyperkit
	brew install minikube

.PHONY: minikube
minikube:
	#minikube delete; minikube start --driver=hyperkit --cpus 2 --memory 2048
	make docker-networks
	@echo "Remember to run this for every terminal, or add this into your ~/.bashrc or ~/.zshrc, etc:"
	@echo "eval \$$(minikube docker-env)"

.PHONY: docker-networks
docker-networks:
	docker network create local_backend
