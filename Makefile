RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
BLUE := $(shell tput -Txterm setaf 6)
RESET := $(shell tput -Txterm sgr0)

yml = ./src/docker-compose.yml

all : run

run : 
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p /Users/hisop/in_vol/data/mariadb
	@mkdir -p /Users/hisop/in_vol/data/wordpress
	@echo "$(GREEN) container Build ... $(RESET)"
	@docker-compose -f $(yml) up --build

up :
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p /Users/hisop/in_vol/data/mariadb
	@mkdir -p /Users/hisop/in_vol/data/wordpress
	@echo "$(GREEN) container Build ... $(RESET)"
	@docker-compose -f $(yml) up -d --build

list :
	@echo "$(BLUE) Listing containers... $(RESET)"
	docker ps -a

list_vol :
	@echo "$(BLUE) Listing volumes ... $(RESET)"
	docker volume ls

fclean :
	@docker-compose -f $(yml) down --volumes --rmi all
	#@echo "$(RED) Clean volumes ... $(RESET)"
	#@docker volume rm -f $$(docker volume ls -q)
	@rm -rf /Users/hisop/in_vol/data/*
	#@echo "$(RED) Clean images ...$(RESET)"
	#@docker rmi -f $$(docker images -q)
	@docker system prune -f
	#@docker run --rm -it -v src_mariadb_data:/docker debian:buster rm -rf docker/*


.PHONY : all run up list list_volumes clean
