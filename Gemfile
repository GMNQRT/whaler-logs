# To update Gemfile.lock
# docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.2.0 bundle install
#
# To run the image
# docker run -it --rm -p 2345:2345 -v "$PWD":/usr/src/app -v "/var/run/docker.sock:/var/run/docker.sock" my-ruby-app

# To log watcher
# docker run --name="logspout" \
#     --volume=/var/run/docker.sock:/tmp/docker.sock \
#     gliderlabs/logspout \
#     tcp://192.168.59.103:2345

source 'https://rubygems.org'

ruby '2.2.0'

gem 'websocket-rails'
gem 'docker-api'
