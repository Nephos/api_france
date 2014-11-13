#encoding: utf-8

module ApiFrance
  SERVER = lambda { |env| return api(env) }
  STREAM = Rack::Server.start :app => SERVER, :Port => 8080 if $0 =~ /server.rb\Z/
end
