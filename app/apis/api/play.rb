class API::Play < Grape::API
  resource :play do
    desc 'play file'
    post do
      dir = params[:dir].presence ? params[:dir] : '/'
      system "mkfifo #{pipe}" unless File.exists?(pipe)
      kill_proc
      system "omxplayer " + "\"" + dir + params[:filename] + "\" < #{pipe} &"
      send_command 'start'
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
