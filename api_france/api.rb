#encoding: utf-8

module ApiFrance
  SERVER = lambda do |env|
    return [200, {}, env.map{|k,v| "#{k}:\t#{v}\n"}]
  end
end

if __FILE__ == $0
  Rack::Server.start :app => ApiFrance::SERVER, :Port => 8080
  # see http://localhost:8080/page?param_name=param_value
end
