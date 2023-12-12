test:
	@ bundle exec spring rspec

##################################################
## DOCKER
##################################################
docker_build:
	@ docker build -t infra-app:latest -f Dockerfile.prod .

docker_run:
	@ docker run -it --rm --name infra-app__rails -p 3000:3000 --env-file=.env.docker infra-app

##################################################
## DOCKER COMPOSE
##################################################
dc_build:
	@ docker-compose --env-file=.env.docker build

dc_up:
	@ docker-compose --env-file=.env.docker up -d

dc_down:
	@ docker-compose --env-file=.env.docker down

dc_connect:
	@ docker-compose --env-file=.env.docker exec infra-app__rails bash

dc_rebuild: dc_down dc_build dc_up



release:
	@ docker build -t infra-app:latest -f Dockerfile .
	@ docker tag infra-app:latest 0.0.0.0:8888/infra-app
	@ docker push 0.0.0.0:8888/infra-app

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
