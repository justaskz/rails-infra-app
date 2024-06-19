FROM ruby:3.2 AS base
WORKDIR /app

##################################################
## DEVELOPMENT
##################################################
FROM base AS development

RUN apt-get update -qq && apt install -y curl wget vim less default-mysql-client netcat-traditional
COPY Gemfile Gemfile.lock .
RUN gem update bundler && bundle install --jobs 20 --retry 5
COPY . .

# ENTRYPOINT ["/bin/bash", "bin/docker-entrypoint"]
CMD ["/bin/bash", "scripts/server"]

##################################################
## TEST
##################################################
# FROM ruby:3.2-slim AS test
FROM base AS test

ENV RAILS_ENV="test"
COPY Gemfile Gemfile.lock .
RUN gem update bundler && bundle config set with test && bundle install --jobs 20 --retry 5
COPY . .

CMD ["bundle exec rspec"]

##################################################
## PRODUCTION
##################################################
