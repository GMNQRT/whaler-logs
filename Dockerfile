# Base image with ruby 2.2.0
FROM ruby:2.2.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN bundle config --global jobs 4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Add and install Gemfile
COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
# RUN bundle install

# Add source code
COPY . /usr/src/app

# Expose server port
EXPOSE 3002/udp

CMD bundle install && ruby /usr/src/app/server.rb
