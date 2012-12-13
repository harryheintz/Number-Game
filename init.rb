require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'haml'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'
require 'bundler/setup'
require 'data_mapper'
require 'pry' #look and see if we need to exclude this in production later

# Bundler Setup.
Bundler.require(:default)

# Load all domain files.
Dir["./domain/**/*.rb"].each do |file|
 require file
end

# Load all implementation files.
Dir["./implementation/**/*.rb"].each do |file|
 require file
end

# Load all implementation files.
Dir["./persistence/**/*.rb"].each do |file|
 require file
end

DataMapper.setup(:default, 'postgres://harryheintz:@localhost/number_game') #your postges database credentials
DataMapper.finalize
#DataMapper.auto_upgrade!