FROM ruby:3.3.0-bullseye
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
COPY . /app
