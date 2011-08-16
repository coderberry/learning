#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # Example 1 ================================================================
  
  # Take a block of code and schedule it for the next iteration (tick).
  # This is primarily used to split up a task into smaller tasks to not slow
  # down the reactor.
  #
  # Also, this can be called to push commands back to the main thread. All IO,
  # Network connections, etc should be done on the main thread.
  
  EM.next_tick do
    puts "I will run on the next tick of the reactor"
  end
  
end