#!/usr/bin/env ruby
#encoding: utf-8

require 'pry' # the debugging library.
require 'rack' # server
require 'active_record' # models and migration
require 'autoreload' # reload the server code during the running

libs = `ls lib/*`.to_s.split("\n")
libs.each{|lib| require_relative lib}

autoreload(:interval=>1, :verbose=>true) do
  begin
    require_relative 'api_france/reload'
    require_relative 'api_france/db'
    require_relative 'api_france/config'
    require_relative 'api_france/city'
    require_relative 'api_france/department'
    require_relative 'api_france/region'
    require_relative 'api_france/routes'
    require_relative 'api_france/api'
  rescue => e
    puts e.message, e.backtrace.join("\n")
  end
end

require_relative 'api_france/run'
