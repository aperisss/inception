all:
	cd srcs / && sudo docker-compose build up

clean : 
	cd srcs / && sudo docker-compose down -v --rmi all --remove-orphans