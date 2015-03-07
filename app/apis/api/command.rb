class API::Command < Grape::API
  resource :command do
    post do
      PIPE = '/tmp/omxpipe'
      system "echo -n #{params[:command]} > #{PIPE}"
      { :status=>1, :error=>nil, :result=>{} }
    end
  end
end
