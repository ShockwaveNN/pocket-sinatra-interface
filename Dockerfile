FROM ruby:3.1.1-alpine

LABEL maintainer="shockwavenn@gmail.com"

RUN apk add build-base
COPY . /root/pocket-sinatra-interface
WORKDIR /root/pocket-sinatra-interface
RUN gem install bundler
RUN bundle config set --local without 'development test' && \
    bundle install
EXPOSE 80
CMD ruby app/server.rb -p 80 -o 0.0.0.0
