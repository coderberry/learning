#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  
  # Spawn the process into a thread and capture the results in a callback
  # 1. Task is run on a thread
  # 2. Thread is notified when it completed with extra data if needed
  
  # Operation to be run which returns data
  op = Proc.new do
    puts "OPERATION"
    [1, 2]
  end

  # Callback that is called when operation is completed
  cb = Proc.new do |first, second|
    puts "CALLBACK #{first} #{second}"
  end
    
  # Runs the operation as deferred (threaded) with callback handling
  EM.defer(op, cb)
  
end