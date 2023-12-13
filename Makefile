include .env

startall: 
	@echo ENV = ${ENV}
	@echo ENV = docker-compose.${ENV}.yml
	@docker compose -f docker-compose.${ENV}.yml --env-file .env.${ENV} up -d --build
	
start: 
	@docker-compose --env-file ./.env up 

reset:
	@docker compose  down -v --rmi all
	@docker compose rm -f
	@echo "Reset complete."