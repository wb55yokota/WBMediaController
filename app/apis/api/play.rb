class API::Play < Grape::API
  resource :play do
    desc 'play file'
    post do
      PIPE = '/tmp/omxpipe'
      dir = params[:dir].presence ? params[:dir] : '/'
      system "mkfifo #{PIPE}" unless File.exists?(PIPE)
      system "omxplayer " + "\"" + dir + params[:filename] + "\" < #{PIPE} &"
      system "echo -n start > #{PIPE}"
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
