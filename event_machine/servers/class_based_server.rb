#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

class MyServer < EM::Connection
  attr_accessor :name
end

EM.run do
  
  # Class with ivar set
  # Best method for organization and code flow. Arguments are available for the full
  # life of the class. Code in EM.run is minimal. Server class can be shipped in a 
  # sepearate file or as a RubyGem.
  EM.start_server('0.0.0.0', 9000, MyServer) do |c|
    c.name = 'Eric'
  end
  
end