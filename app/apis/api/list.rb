class API::List < Grape::API
  resource :list do
    desc 'file list'
    get do
      dir = params[:dir].presence ? params[:dir] : '/'
      files = Dir.entries(dir).sort_by{|f| File.mtime(dir + f)}.reverse.map {|fname|
        next if fname == '.' || fname == '..'
        stat = File.stat(dir + fname)
        {
            name: fname,
            is_dir: stat.directory?,
            atime: stat.atime,
            mtime: stat.mtime,
            ctime: stat.ctime,
            size: stat.size
        }
      }.compact
      if dir != '/'
         files.unshift name: '..', is_dir: true, atime: nil, mtime: nil, ctime: nil, size: 0
      end
      { :status=>1, :error=>nil, :result=>{:pwd=>dir, :files=>files} }
    end
  end
end
