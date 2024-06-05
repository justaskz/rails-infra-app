test:
	@ bundle exec spring rspec

##################################################
## DOCKER
##################################################
# docker_build:
# 	@ docker build -t infra-app:latest -f Dockerfile.prod .

# docker_run:
# 	@ docker run -it --rm --name infra-app__rails -p 3000:3000 --env-file=.env.docker infra-app

##################################################
## DOCKER COMPOSE
##################################################
build:
	@ docker-compose build

up:
	@ docker-compose up -d

down:
	@ docker-compose down

connect:
	@ docker-compose exec rails bash

logs:
	@ docker-compose logs

rebuild: dc_down dc_build dc_up



release:
	@ docker build -t infra-app:latest -f Dockerfile .
	@ docker tag infra-app:latest registry.infra.net/infra-app
	@ docker push registry.infra.net/infra-app

# setup:
# 	@ bash scripts/setup

# server:
# 	@ bash scripts/server

# sidekiq:
# 	@ bash scripts/sidekiq

# console:
# 	@ bash scripts/console

# build:
# 	@ docker-compose build

# up:
# 	@ docker-compose --env-file .docker.env up -d

# down:
# 	@ docker-compose --env-file .docker.env down

# rebuild: down build up connect

# clear:
# 	@ docker rmi

# connect:
# 	@ docker-compose exec infra_test_app bash
