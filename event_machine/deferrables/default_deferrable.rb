#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Same as defferables.rb except it uses a default which performs the basic deferrable
# callbacks. They can be called differently (see lines 17-18)

EM.run do
  df = EM::DefaultDeferrable.new
  df.callback do |name|
    puts "Hello #{name}"
    EM.stop
  end
  df.errback { puts "Error" }
  
  EM.add_timer(2) { df.succeed("eric") } # Same as set_deferred_status :succeed
  #EM.add_timer(2) { df.fail("eric") } # Same as set_deferred_status :fail
end