module ApiFrance
  SERVER = lambda { |env| return api(env) }
  STREAM = Rack::Server.start :app => SERVER, :Port => 8080
end
