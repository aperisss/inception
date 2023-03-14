all:
	cd srcs / && sudo docker-compose build up -d

clean : 
	sudo docker-compose ./requirements down -v --rmi all --remove-orphans