COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/aperis/data/wordpress
	mkdir -p /home/aperis/data/mariadb
	@docker-compose -f $(COMPOSE_FILE) up -d --build
down:
	@docker-compose -f $(COMPOSE_FILE) down

clean:
	@docker-compose -f $(COMPOSE_FILE) down --rmi all
	docker system prune     --all --force --volumes
	docker volume prune     --force
	docker network prune    --force
	sudo rm -rf /home/aperis/data

re: clean all

.PHONY: up down fdown clean
