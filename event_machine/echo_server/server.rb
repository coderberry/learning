#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

class EchoServer < EM::Connection
  # Triggered when connection is established from EM
  def post_init
    puts "client connecting"
  end
  
  # Triggered when connection is closed or lost for any reason
  def unbind
    puts "client disconnecting"
  end
  
  def receive_data(data)
    # @data << data # Example of buffering. Used for handling large data
    puts "received #{data} from client"
    send_data ">> #{data}"
  end
end

EM.run do
  EM.start_server('0.0.0.0', 9000, EchoServer)
  puts "Server running on port 9000"
end