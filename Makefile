.PHONY: build shell

build :	## Build or re-build the container.
	@DOCKER_BUILDKIT=1 docker build -t pynamic:latest .


shell: ## Enter bash shell in the container
	@docker compose run --rm bash
