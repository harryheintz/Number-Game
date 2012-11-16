module Implementation
  class Web < Sinatra::Base
    register Mustache::Sinatra
    require './implementation/web/views/web_view'

    set :mustache, {
      :views => 'implementation/web/views/',
      :templates => 'implementation/web/templates/'
    }
    
    set :public_folder, "implementation/web/public/"
    
    get "/" do
      mustache :home
    end
    
    get "/about/?" do
      mustache :about
    end
    
    get "/account/?" do
      mustache :account
    end
    
    get "/graphics/?" do
      mustache :graphics
    end
    
    get "/anything/?" do
      @test = Persistence::GameData.get(1)
      mustache :anything
    end
    
  end
end