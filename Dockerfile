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



