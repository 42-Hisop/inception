RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
BLUE := $(shell tput -Txterm setaf 6)
RESET := $(shell tput -Txterm sgr0)

yml = ./srcs/docker-compose.yml

all : run

run : 
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p /home/khee-seo/data/mariadb
	@mkdir -p /home/khee-seo/data/wordpress
	@echo "$(GREEN) container Build ... $(RESET)"
	@docker-compose -f $(yml) up --build

up :
	@echo "$(GREEN) Volumes Build ... $(RESET)"
	@mkdir -p /home/khee-seo/data/mariadb
	@mkdir -p /home/khee-seo/data/wordpress
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
	@echo "$(RED) Clean volumes ... $(RESET)"
	@docker volume rm -f $$(docker volume ls -q)
	@rm -rf /home/khee-seo/data/mariadb
	@rm -rf /home/khee-seo/data/wordpress
	@echo "$(RED) Clean images ...$(RESET)"
	@docker rmi -f $$(docker images -q)
	@docker system prune -f


.PHONY : all run up list list_volumes clean
