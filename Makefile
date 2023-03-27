all: 
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop :
	docker compose -f ./srcs/docker-compose.yml stop

clean:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f