test:
	@ bundle exec spring rspec

setup:
	@ bash scripts/setup

server:
	@ bash scripts/server

sidekiq:
	@ bash scripts/sidekiq

console:
	@ bash scripts/console

build:
	@ docker-compose build

up:
	@ docker-compose up -d

down:
	@ docker-compose down

rebuild: down build up connect

clear:
	@ docker rmi

connect:
	@ docker-compose exec infra_test_app bash
