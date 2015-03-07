module API
  class Root < Grape::API
    prefix 'api'
    format :json

    mount API::List
    mount API::Play
    mount API::Command
  end
end
