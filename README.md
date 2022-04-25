# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
##  For docker setup

file: Dockerfile


FROM ruby:3.0.1

RUN apt-get update -y --force-yes
RUN apt-get install libtag1-dev -y --force-yes
RUN apt-get install -y curl
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs postgresql-client
ADD . /mailer-jquery-ajax
WORKDIR /mailer-jquery-ajax
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install  



file: docker-compose

version: '3.8'
services:
  db:
    image: postgres
    environment:
      POSTGRES_DATABASE: sales_development_b
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    volumes:
      - postgres:/var/lib/postgresql/data
    ports:
      - 5432:5432

  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && rails db:create && rails db:migrate && rails s -p 3000 -b '0.0.0.0'"
    environment:
      RAILS_ENV: development
      REDIS_URL: redis://redis:6379/0
    volumes:
      - .:/mailer-jquery-ajax
    ports:
      - 3000:3000
    depends_on:
      - db
      - redis

  redis:
    image: "redis:alpine"
    command: redis-server --save 60 1 --requirepass MDNcVb924a
    ports:
     - "6379:6379"
    volumes:
     - redis_data:/data

volumes:
  postgres:
  redis_data:
