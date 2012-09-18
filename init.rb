require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'haml'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require 'bundler/setup'
#require 'data_mapper'

# Bundler Setup.
Bundler.require(:default)

# Load all domain files.
Dir["./domain/**/*.rb"].each do |file|
 require file
end

# Load all implementation files.
Dir["./implementation/api/**/*.rb"].each do |file|
 require file
end