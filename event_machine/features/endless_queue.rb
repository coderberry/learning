#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # Example 6 ================================================================
  
  # Endless Queue (daemon)
  
  q = EM::Queue.new
  
  # Add data to queue somehow...
  q.push(:task1, :task2, :task3)
  
  work = Proc.new do |item|
    # Do work here...
    puts "Doing something with payload: #{item}"
    sleep(1)
    
    # Keep it going by popping with the 'work' method again
    EM.next_tick { q.pop(&work) }
  end
  
  # Start work on the first item in the queue
  q.pop(&work)
  
end