require 'socket'
require 'rails'
require 'websocket-rails'
require_relative 'SyslogParser'

host         = "0.0.0.0"
port         = 3002
$stdout.sync = true

WebsocketRails.setup do |config|
  config.synchronize   = true
  config.log_level     = :error
  config.redis_options = {:host => 'redis', :port => '6379'}
  config.log_path      = "/var/log/websocket_rails.log"
end

puts "Started UDP server on #{host}:#{port}..."
Socket.udp_server_loop(host, port) do |msg, msg_src|
  SyslogParser.parse(msg) do |time, log|
    if log
      WebsocketRails["container.#{log['ident']}"].trigger :log, message: log['message'], time: time
    end
  end
end
