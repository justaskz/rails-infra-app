test:
	@ bash scripts/test

build:
	@ docker compose build

up:
	@ docker compose up -d

down:
	@ docker compose down --volumes

connect:
	@ docker compose exec rails bash

logs:
	@ docker compose logs

# release:
# 	@ docker build -t infra-app:latest -f Dockerfile .
# 	@ docker tag infra-app:latest registry.infra.net/infra-app
# 	@ docker push registry.infra.net/infra-app

# build_test:
# 	@ docker build -t infra-app:test -f Dockerfile --target test .

# foo:
# 	@ docker run -it --rm infra-app:test

# setup:
# 	@ bash scripts/setup

server:
	@ bash scripts/server

# sidekiq:
# 	@ bash scripts/sidekiq

console:
	@ bash scripts/console

sidekiq:
	@ bash scripts/sidekiq
