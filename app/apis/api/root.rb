module API
  class Root < Grape::API
    helpers do
      def send_command command
        system "echo -n #{command} > #{PIPE}"
      end
    end

    prefix 'api'
    format :json

    mount API::List
    mount API::Play
    mount API::Command
  end
end
