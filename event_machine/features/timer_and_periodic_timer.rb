#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # Delays the action here by 5 seconds
  EM.add_timer(5) do
    puts "BOOM"
    EM.stop
  end
  
  # This will be called 1 second after the block 
  # finished (so every second after 1 second)
  EM.add_periodic_timer(1) do
    puts "Tick"
  end
  
end