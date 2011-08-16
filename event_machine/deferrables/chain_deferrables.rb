#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Deferrables can call each other. Once the deferrable is called with no attributes, it calls EM.stop

EM.run do
  df = EM::DefaultDeferrable.new
  df.callback do |name|
    puts "Hello #{name}"
    
    df.succeed(name, "rocks")
  end
  df.callback do |name, type|
    puts "#{name} really #{type}"
    df.set_deferred_status :succeeded # could also be 'df.succeed'
  end
  df.callback { EM.stop } # called by line 18
  
  df.errback { puts "Error" }
  
  EM.add_timer(2) { df.succeed("eric") } # Same as set_deferred_status :succeed
  #EM.add_timer(2) { df.fail("eric") } # Same as set_deferred_status :fail
end