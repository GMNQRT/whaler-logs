# Base image with ruby 2.2.0
FROM ruby:2.2.0-onbuild

EXPOSE 3002/udp

ENTRYPOINT ruby /usr/src/app/server.rb
