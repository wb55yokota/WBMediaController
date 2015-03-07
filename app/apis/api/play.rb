class API::Play < Grape::API
  resource :play do
    desc 'play file'
    post do
      dir = params[:dir].presence ? params[:dir] : '/'
      exec("omxplayer " + dir + params[:filename])
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
