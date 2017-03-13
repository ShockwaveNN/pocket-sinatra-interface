FROM ruby:2.4

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

COPY . /root/pocket-sinatra-interface
WORKDIR /root/pocket-sinatra-interface
RUN bundle install
EXPOSE 80
CMD ruby app/server.rb -p 80 -o 0.0.0.0 > server.log