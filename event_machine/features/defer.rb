#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do

  # Spawn the block to a thread
  EM.defer do
    puts "I'm on a thread"
    sleep(2)
    puts "First thread"
  end
  
  # Spawn the block to a 2nd thread
  EM.defer do
    puts "a cool thread"
    sleep (1)
    puts "Second thread"
  end
  
end