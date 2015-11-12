# Whaler-logs

A small UDP server for syslog and [Whaler](https://github.com/GMNQRT/whaler).
This server waits syslog messages and broadcast them by websockets

## Getting Started

### Pre-requisites
* Computer
* Ruby 2.2.0

### Install steps
```
git clone https://github.com/GMNQRT/whaler-logs.git
cd whaler-logs
bundle
ruby server.rb
```

### Work with docker
```
docker build -t whaler-logs .
docker run -it --rm -p 3002:3002/udp -v "$PWD":/usr/src/app whaler-logs
```
