COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/aperis/data/wordpress
	mkdir -p /home/aperis/data/mariadb
	@docker-compose -f $(COMPOSE_FILE) up -d --build
	ifeq ("$(wildcard .setup)","")
		@ printf "[\033[0;32m+\033[m]] Applying DNS redirection\n]"
		sudo chmod 777 /etc/hosts
		@sudo sed -i "1i\127.0.0.1\tmabid.42.fr" /etc/hosts
		touch .setup
	endif
down:
	@docker-compose -f $(COMPOSE_FILE) down

clean:
	@docker-compose -f $(COMPOSE_FILE) down --rmi all
	docker system prune     --all --force --volumes
	docker volume prune     --force
	docker network prune    --force
	@sudo sed -i "/127.0.0.1\tmabid.42.fr/d" /etc/hosts
	sudo rm -rf /home/aperis/data

re: clean all

.PHONY: up down fdown clean
