module Implementation
  module API
    class V1 < Sinatra::Base
      set :public_folder, "./implementation/api/v1/public/"
      
      get '/' do
        "You need to request a specific endpoint."
      end
      
      get '/start' do
        @game = Game.start.extend(GameRepresenter)
        @game.to_json
      end
      
      post '/play' do
        @game = Game.guess(params[:id], params[:guess]).extend(GameRepresenter)
        @game.to_json
      end
      
      get '/game/:id' do
        "This will return stats for an exisiting game."
      end
    end
  end
end