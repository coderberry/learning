#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'

# In this example:
# 1. On initial connection, callbacks are executed
# 2. On disconnect, the deferrable is reset
# 3. Subsequent requests pile up but don't run
# 4. At the next connection, pending callbacks run
# 5. Lather, rinse, repeat.

class MyDeferrable
  include EM::Deferrable # adds callback and errback handling
  
  def do_work(val)
    callback do
      puts "did work #{val}"
    end
  end
  
  # Connect to server prior to performing any actions for class (assumption)
  def connect
    succeed # Triggers all callbacks for class
  end
  
  # Resets the deferrable. All other callbacks or errbacks will start piling up, but not execute.
  # These will then be re-triggered once the succeed is called again. 
  def reset
    set_deferred_status(nil)
  end
end

EM.run do
  md = MyDeferrable.new
  md.do_work(1)
  md.do_work(2)
  
  EM.add_timer(2) do
    md.connect
    md.do_work(3)
    
    EM.add_timer(1) do
      md.reset # Simulates being disconnected from the remote server
      md.do_work(4)
      
      EM.add_timer(1) do
        md.connect
        EM.stop
      end
    end
  end
end