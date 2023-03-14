all:
	sudo docker-compose ./requirements -d build up

clean : 
	sudo docker-compose ./requirements down -v --rmi all --remove-orphans