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

server:
	@ bash scripts/server

console:
	@ bash scripts/console

sidekiq:
	@ bash scripts/sidekiq
