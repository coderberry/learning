#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Chaining callbacks on deferrables can happen after :succeed

EM.run do
  df = EM::DefaultDeferrable.new
  df.callback { puts "Succeeded" }
  
  EM.add_timer(2) do
    df.succeed
    
    # Add an additional callback after the DF has already succeeded.
    EM.add_timer(1) do
      df.callback do
        puts "Done"
        EM.stop
      end
    end
  end
end