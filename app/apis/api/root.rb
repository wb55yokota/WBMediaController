module API
  class Root < Grape::API
    helpers do
      def pipe
        '/tmp/omxpipe'
      end
      def send_command command
        system "echo -n #{command} > #{pipe}"
      end
      def kill_proc
        `pgrep omxplayer`.split("¥n").each do |proc|
          `kill #{proc}`
        end
      end
    end

    prefix 'api'
    format :json

    mount API::List
    mount API::Play
    mount API::Command
  end
end
