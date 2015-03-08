class API::Command < Grape::API
  resource :command do
    post do
      send_command params[:command]
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
