FROM ruby:2.7.8-bullseye
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
COPY . /app
CMD ["bash", "scripts/server"]
