all: 
	mkdir -m 777 -p ~/data/db_data ~/data/wp_data
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop :
	docker compose -f ./srcs/docker-compose.yml stop

clean:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f
fclean : stop clean
		sudo rm -rf ~/data/*/

phony : all stop clean fclean