# Version: 0.0.2
FROM ubuntu
MAINTAINER Maria Patterson "maria.t.patterson@gmail.com"
ENV REFRESHED_AT 2019-12-26

RUN apt-get update -y
RUN apt-get install -y ruby ruby-dev
RUN apt-get install -y make gcc libgmp-dev
RUN apt-get install -y nodejs
RUN apt-get install -y zlib1g-dev liblzma-dev
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y build-essential


RUN gem install rubygems-update
RUN update_rubygems

RUN gem install sassc





RUN gem install listen
RUN gem install bundler #-v '2.1.2' #'1.17.3'
RUN gem install json # -v '1.8.3'
RUN gem update --system


EXPOSE 4000

COPY Gemfile* /srv/jekyll/
WORKDIR /srv/jekyll/
RUN bundle install
RUN bundle update --bundler
RUN bundle update activesupport
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
CMD bundle exec jekyll serve --host=0.0.0.0 --force_polling --watch
