FROM ruby:2.7.6-bullseye
RUN apt update && apt install -y default-mysql-client iproute2
WORKDIR /app
