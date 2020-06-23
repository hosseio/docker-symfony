SHELL := /bin/bash

APP_ROOT = /var/www
TARGET_CONTAINER = $(shell docker ps -q -a -f 'name=docker-symfony_php-fpm')

BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

all: help

help:
	@echo
	@echo "BRANCH: $(BRANCH)"
	@echo
	@echo "usage: make <command>"
	@echo
	@echo "commands:"
	@echo "    start       - start the application containers"
	@echo "    stop        - stop the application containers"
	@echo "    clean       - stop running containers and remove them"
	@echo "    sh          - execute sh inside the app container"
	@echo "    install     - install php dependencies using composer"
	@echo "    update      - update php dependencies using composer"
	@echo "    test        - run tests"
	@echo

start:
	@docker-compose up -d

stop:
	@docker-compose stop

clean: stop
	@docker-compose rm -v --force

bash:
	@docker exec -it $(TARGET_CONTAINER) bash

test:
	@echo ">>> Running unit tests..."
	@docker exec $(TARGET_CONTAINER) sh -c "$(APP_ROOT)/bin/phpunit"
	@echo
	
install:
	@echo ">>> Installing..."
	@docker exec $(TARGET_CONTAINER) sh -c "composer install"

update:
	@echo ">>> Updating..."
	@docker exec $(TARGET_CONTAINER) sh -c "composer update"
