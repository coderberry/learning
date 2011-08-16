#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Create a Domain (TCP) server

class DomainServer < EM::Connection
  def receive_data(data)
    puts "received #{data}"
  end
end

EM.run do
  # Create domain server
  EM.start_server('/tmp/server', nil, DomainServer)
  # or
  EM.start_unix_domain_server('/tmp/server2', nil, DomainServer)
  
  # Create client
  EM.connect_unix_domain('/tmp/server') do |c|
    c.send_data('Hello')
  end
  EM.connect_unix_domain('/tmp/server2') do |c|
    c.send_data('Hello2')
  end
end