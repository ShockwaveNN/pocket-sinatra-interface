FROM ubuntu
MAINTAINER Eric Mill "eric@konklone.com"

# turn on universe packages
RUN apt-get update

# basics
RUN apt-get install -y nginx openssh-server git-core openssh-client curl
RUN apt-get install -y nano
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

# install RVM, Ruby, and Bundler
RUN /bin/bash -l -c "command curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2.0"

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN git clone https://github.com/ShockwaveNN/pocket-sinatra-interface /root/pocket-sinatra
RUN /bin/bash -l -c "cd /root/pocket-sinatra; bundle install"

EXPOSE 4567
CMD ['source', '/usr/local/rvm/scripts/rvm']
CMD ["ruby","/root/pocker-sinatra/server.rb","-o","0.0.0.0"]
