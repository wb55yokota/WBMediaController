class API::Play < Grape::API
  resource :play do
    desc 'play file'
    post do
      dir = params[:dir].presence ? params[:dir] : '/'
      threads = []
      threads << Thread.new do
        Omx
        exec("omxplayer " + dir + Shellwords.escape(params[:filename]))
      end
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
