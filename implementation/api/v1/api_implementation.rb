# This function expands the routes path so you can auto-require anything you put in /routes
# It's a good way of separating behavior as your app grows.
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
        # @game = Domain::Game.new
        response = {:message => "This will initiate a game"}
        response.to_json
      end
      
      put '/guess' do
        "This is what you will submit a guess to."
      end
      
      get '/game/:id' do
        "This will return stats for an exisiting game."
      end
    end
  end
end