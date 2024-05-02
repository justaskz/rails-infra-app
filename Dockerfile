FROM ruby:3.2 AS base
WORKDIR /app

##################################################
## DEVELOPMENT
##################################################
FROM base AS development

RUN apt-get update -qq && apt install -y curl wget vim less default-mysql-client
COPY Gemfile Gemfile.lock ./
RUN gem update bundler && bundle install --jobs 20 --retry 5
COPY . .

# ENTRYPOINT ["/bin/bash", "bin/docker-entrypoint"]
CMD ["/bin/bash", "scripts/server"]
