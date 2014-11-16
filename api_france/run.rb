#encoding: utf-8

module ApiFrance

  def self.parse_arg(name, argc=1)
    i = ARGV.index name
    return nil if i.nil?
    return ARGV[i+1] if argc == 1
    return ARGV[i+1..i+i]
  end

  SERVER = lambda { |env| return api(env) }
  if $0 =~ /server.rb\Z/
    port = (parse_arg('port') || 8080).to_i
    # http://www.rubydoc.info/gems/rack/Rack/Server#initialize-instance_method
    STREAM = Rack::Server.start :app => SERVER, :Port => port
  end
end
