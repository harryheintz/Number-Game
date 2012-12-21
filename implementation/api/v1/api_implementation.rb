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
      
      get '/start' do #this should ultimately become a post where you send user name, or id, or whatever to get at User
        @game = Domain::Game.new
        #@game.to_json
        welcome = {:message => @game.message}
        welcome.to_json
      end
      
      put '/play' do
        test_response = {:id => 106, :message => "Welcome to the Number Game. I work!!"}
        test_response.to_json
        # @game = Domain::Game.guess(params[:id], params[:guess]).extend(GameRepresenter)
        # @game.to_json
      end
      
      get '/game/:id' do
        "This will return stats for an exisiting game."
      end
    end
  end
end