#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# Deferrables are used to perform actions on classes based upon their results. It's like an
# explosive with a remote detonator which allows the bomb to explode or disable. In that example,
# the remote is the class itself and the bomb is defined in the reactor ( I think )

# 1. Deferrables can attach callbacks and errbacks anytime after the class has been created. These
# callbacks can be chained. This decouples the custom code from the class itself.

# 2. Deferrables also can trigger themselves when they are ready.

class MyDeferrable
  include EM::Deferrable # adds callback and errback handling
  
  def my_function(succeed)
    if succeed
      set_deferred_status :succeeded
    else
      set_deferred_status :failed
    end    
  end
end


# Here we establish what we will do on both the callback and errback. These blocks are called
# when the set_deferred_status is set in the class that it us running
EM.run do
  md1 = MyDeferrable.new
  md1.callback { puts "MD1 succeeded" }
  md1.errback { puts "MD1 failed" }
  
  md2 = MyDeferrable.new
  md2.callback { puts "MD2 succeeded" }
  md2.errback { puts "MD2 failed" }
  
  EM.add_timer(2) do
    md1.my_function(true)
    md2.my_function(false)
  end
end