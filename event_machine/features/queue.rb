#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # EM::QUEUE
  # Delivers the data in order and data is returned in the same order (FIFO)
  # This is used to safely add data to a queue from several threads.
  # Also, this will always fire on the main reactor.
  # Note: AMQP handles this already
  
  q = EM::Queue.new
  q.push(:one, :two, :three)
  3.times { q.pop { |item| puts item } }
  
  # Data can be added from other threads as well
  EM.defer do
    q.push(1)
    sleep(1)
    q.push(2)
    sleep(1)
    q.push(3)
  end
  3.times { q.pop { |item| puts item } }
  
end