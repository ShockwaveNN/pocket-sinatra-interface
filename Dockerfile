FROM ruby:2.5

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

COPY . /root/pocket-sinatra-interface
WORKDIR /root/pocket-sinatra-interface
RUN bundle install --without development test
EXPOSE 80
CMD ruby app/server.rb -p 80 -o 0.0.0.0
