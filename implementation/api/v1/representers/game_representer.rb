module Implementation
  module API
    require 'roar/representer/json'
    require 'roar/representer/feature/hypermedia'

    module GameRepresenter
      include Roar::Representer::JSON
      include Roar::Representer::Feature::Hypermedia

      property :message
      property :status
      
      link :self do
        "/api/v1/game/#{self.id}"
      end
      
    end
  end
end