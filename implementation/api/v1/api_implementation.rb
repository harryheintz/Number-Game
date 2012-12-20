# This function expands the routes path so you can auto-require anything you put in /routes
# It's a good way of separating behavior as your app grows.
require 'rubygems'
require './domain/entities/game'
require 'Haml'
Dir.glob(File.expand_path("./implementation/api/v1/routes") + "/*_routes.rb").each do |file|
  require file
end

module Implementation
  module API
    class V1 < Sinatra::Base
      set :public_folder, "./implementation/api/v1/public/"
      
      get '/' do
        "You need to request a specific endpoint."
      end
      
      get '/start' do
        @game = Domain::Game.new
        welcome = {:message => "Hello there! I'm glad you stopped by. Let's Play a number game!"}
        welcome.to_json
      end
      
      post '/guess' do
        @game.recieve
        @guess = "guess"
        #@game = Domain::Game.find(:id) # 1 is for the current user that is hardcoded
      end
      
      get '/game/:id' do
        "This will return stats for an exisiting game."
      end
    end
  end
end