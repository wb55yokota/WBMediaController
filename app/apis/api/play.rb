class API::Play < Grape::API
  resource :play do
    desc 'play file'
    post do
      dir = params[:dir].presence ? params[:dir] : '/'
      system "mkfifo #{PIPE}" unless File.exists?(PIPE)
      send_command 'q'
      system "omxplayer " + "\"" + dir + params[:filename] + "\" < #{PIPE} &"
      send_command 'start'
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
