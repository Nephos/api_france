#!/usr/bin/env ruby
#encoding: utf-8

require 'rack'
require 'active_record'

require_relative 'api_france/db'
require_relative 'api_france/city'
require_relative 'api_france/department'
require_relative 'api_france/region'
require_relative 'api_france/routes'
require_relative 'api_france/api'

include ApiFrance

if __FILE__ == $0
  Rack::Server.start :app => ApiFrance::SERVER, :Port => 8080
  # see http://localhost:8080/page?param_name=param_value
end
