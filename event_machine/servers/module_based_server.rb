#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

module MyModServer
  def initialize(name, type)
    @name = name
    @type = type
  end
end

EM.run do
  
  # Module with args
  # This is best used for throwaway (prototype) servers. Easily becomes confusing.
  EM.start_server('0.0.0.0', 9001, MyModServer, 'Eric', 'rocks')
  
end