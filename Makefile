test:
	@ bundle exec spring rspec

#################################################
## DOCKER
#################################################
docker_build:
	@ docker build -t infra-app:latest -f Dockerfile.prod .

docker_run:
	@ docker run -it --rm --name infra-app__rails -p 3000:3000 infra-app

#################################################
## DOCKER COMPOSE
#################################################
dc_build:
	@ docker-compose build

dc_up:
	@ docker-compose up -d

dc_down:
	@ docker-compose down

dc_rebuild: dc_down dc_build dc_up


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
