DOCKER_COMPOSE = srcs/docker-compose.yaml

all:
	mkdir -p /home/salma/data/wp
	mkdir -p /home/salma/data/DB
	docker-compose -f $(DOCKER_COMPOSE) up -d --build

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

logs:
	docker-compose -f $(DOCKER_COMPOSE) logs

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean:
	docker-compose -f $(DOCKER_COMPOSE) down -v

fclean:
	docker-compose -f $(DOCKER_COMPOSE) down --volumes
	docker container prune -f
	docker volume prune -f
	docker image prune -f
	docker system prune -f
	sudo rm -rf /home/salma/data/*/* 
	docker network prune -f

re: fclean all