#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

EM.run do
  # Self-contained
  EM.start_server('0.0.0.0', 9002) do |c|
    def c.receive_data(data)
      send_data("Hi again: #{data}")
    end
  end
  
end