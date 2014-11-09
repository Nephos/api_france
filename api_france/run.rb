#encoding: utf-8

module ApiFrance
  SERVER = lambda { |env| return api(env) }
  STREAM = Rack::Server.start :app => SERVER, :Port => 8080 if $0 =~ /api_france.rb\Z/
end
