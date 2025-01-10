FROM ruby:3.4 AS base

ENV RUBY_GC_HEAP_INIT_SLOTS=1000000 \
    RUBY_HEAP_SLOTS_INCREMENT=1000000 \
    RUBY_HEAP_SLOTS_GROWTH_FACTOR=1 \
    RUBY_GC_MALLOC_LIMIT=1000000000 \
    RUBY_GC_HEAP_FREE_SLOTS=500000 \
    RUBY_CFLAGS="-DUSE_FFI_CLOSURE_ALLOC"

WORKDIR /app
RUN gem update bundler
COPY Gemfile Gemfile.lock ./

##################################################
## DEVELOPMENT
##################################################
FROM base AS development
RUN apt-get update -qq && \
    apt install -y --no-install-recommends \
      curl wget vim less default-mysql-client netcat-traditional && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN bundle install --jobs 20 --retry 5
COPY . .

CMD ["/bin/bash", "scripts/server"]

##################################################
## TEST
##################################################
FROM base AS test

ENV RAILS_ENV="test"
RUN bundle config set with test && bundle install --jobs 20 --retry 5
COPY . .

CMD ["/bin/bash", "scripts/server"]

##################################################
## PRODUCTION
##################################################
FROM base AS production

ENV RAILS_ENV="production"
RUN bundle config set without development test && bundle install --jobs 20 --retry 5
COPY . .
# RUN addgroup --system rails && adduser --system --ingroup rails rails
# USER rails

CMD ["/bin/bash", "scripts/server"]
