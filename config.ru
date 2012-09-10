require './init'

map 'api/v1' do
  run Implementation::API::V1
end