RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
BLUE := $(shell tput -Txterm setaf 6)
RESET := $(shell tput -Txterm sgr0)

yml = ./src/docker-compose.yml

all : run

run : 
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p ~/inception_vol/data/mariadb
	@mkdir -p ~/inception_vol/data/wordpress
	@echo "$(GREEN) container Build ... $(RESET)"
	@docker-compose -f $(yml) up --build

up :
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p ~/inception_vol/data/mariadb
	@mkdir -p ~/inception_vol/data/wordpress
	@echo "$(GREEN) container Build ... $(RESET)"
	@docker-compose -f $(yml) up -d --build

list :
	@echo "$(BLUE) Listing containers... $(RESET)"
	docker ps -a

list_vol :
	@echo "$(BLUE) Listing volumes ... $(RESET)"
	docker volume ls

fclean :
	@docker system prune -f
	@echo "$(RED) Clean volumes ... $(RESET)"
	@docker volume rm -f $$(docker volume ls -q)
	@rm -rf ~/inception_vol/data/mariadb
	@rm -rf ~/inception_vol/data/wordpress
	@docker-compose -f $(yml) down
	@echo "$(RED) Clean images ...$(RESET)"
	@docker rmi -f $$(docker images -q)


.PHONY : all run up list list_volumes clean
