require 'rubygems'
#require 'bundler/setup'

RSpec.configure do |config|
  # some (optional) config here
end

def entered_command(string)
  StringIO.new(string)
end

def game_response
   $stdout
end