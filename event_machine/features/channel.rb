#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # EM::Channel allows for parts of your code to be called when other parts
  # receive data. This allows the server to broadcast all incoming content to
  # clients who can sift through the data and process the data that is relevant
  # to their roles.
  
  c = EM::Channel.new
  
  EM.defer do
    c.subscribe { |m| puts "1: #{m}" }
    sleep(3)
    c << "Defer 1"
  end
  
  EM.defer do
    # Sets the subscriber ID so we can unsubscribe later
    sid = c.subscribe { |m| puts "#2: #{m}" }
    sleep(2)
    c.unsubscribe(sid)
  end
  
  EM.add_periodic_timer(1) do
    c << "Hello"
  end
  
end