NAME				=	inception

DOCKER_COMPOSE_PATH	=	$(DIR_SRC)docker-compose.yml

DOCKER_COMPOSE		=	docker compose -f $(DOCKER_COMPOSE_PATH)

DIR_SRC				=	srcs/

VOL_PATH			=	/home/jrenault/data/

VOLUMES				=	$(WP_VOLUME) $(MARIADB_VOLUME)

include $(DIR_SRC).env

.PHONY:	all
all: $(NAME)

$(NAME): $(VOLUMES)
		$(MAKE) up

.PHONY: up
up:
		$(DOCKER_COMPOSE) up --build

.PHONY: down
down:
		$(DOCKER_COMPOSE) down

.PHONY:	clean
clean:
		$(DOCKER_COMPOSE) down --volumes --rmi all

.PHONY:	fclean
fclean: clean
		rm -rf $(VOLUMES)

.PHONY: re
re: clean
		$(MAKE) all

$(VOLUMES):
		mkdir -p $(VOLUMES)
