# README

Before launching, make sure that `.env` is present and defines these variables:
```bash
RAILS_ENV=development
RAILS_PORT=3000

MYSQL_HOST=mysql
MYSQL_DATABASE=infra_app
MYSQL_USERNAME=app
MYSQL_PASSWORD=app
MYSQL_PORT=3306

REDIS_HOST=redis
KAFKA_BOOTSTRAP_NODES="redpanda:9092"
CASSANDRA_HOSTS="cassandra"
```
