build: 
	docker compose -f ./srcs/docker-compose.yml build

down: 
	docker compose -f ./srcs/docker-compose.yml down

up: 
	docker compose -f ./srcs/docker-compose.yml up -d

rebuild: down build up