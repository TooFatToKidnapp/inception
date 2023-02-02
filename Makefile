all : run

run :
	@-mkdir -p ~/data/mariadb_volume
	@-mkdir ~/data/wordpress_volume
	@docker-compose  -f  ./srcs/docker-compose.yml up --build


clean:
	@docker-compose -f ./srcs/docker-compose.yml down --remove-orphans

fclean: clean
	@rm -fr ~/data
	@-docker volume rm $$(docker volume ls -q)

re: fclean all

prune:
	@docker system prune -af 2> /dev/null
