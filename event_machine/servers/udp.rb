#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Create a UDP server
# This is used for sending data to monitoring system and when the TCP reliability isn't necessary. 

class UDPHandler < EM::Connection
  def receive_data(data)
    puts "received #{data}"
  end
end

EM.run do
  # Create the UDP server
  EM.open_datagram_socket('0.0.0.0', 9000, UDPHandler)
  
  # Connect and publish to the UDP server
  s = EM.open_datagram_socket('', nil)
  s.send_datagram('Hi', '0.0.0.0', 9000)
end