module API
  class Root < Grape::API
    prefix 'api'
    format :json

    mount API::List
    mount API::Play
  end
end
