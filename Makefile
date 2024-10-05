DC=docker compose -pwdfr-commerce--traefik

help:  ## Display help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: create-network build

build:
	$(DC) up --build -d

create-network:
	docker network create wdfr-global-network > /dev/null 2>&1 || true

delete-network:
	docker network rm wdfr-global-network > /dev/null 2>&1 || true

do: delete-network down

down: ## Stopping the Docker hub
	$(DC) down

ssl:
	/bin/bash ./traefik/scripts/ssl.bash