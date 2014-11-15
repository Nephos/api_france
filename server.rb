#!/usr/bin/env ruby
#encoding: utf-8

require 'pry' # the debugging library.
require 'rack' # server
require 'active_record' # models and migration
require 'autoreload' # reload the server code during the running

# include the libraries in libs/
libs = `ls lib/*`.to_s.split("\n")
libs.each{|lib| require_relative lib}

autoreload(:interval=>1, :verbose=>true) do
  begin
    require_relative 'api_france/console' # rake console
    require_relative 'api_france/db' # database actions
    require_relative 'api_france/config' # configuration reader
    require_relative 'api_france/searchable' # advanced search
    Dir.entries('api_france/models/')
    .select{|f| f[-3..-1] == '.rb'}
    .each{|f| require_relative "api_france/models/#{f}"} # include models
    require_relative 'api_france/routes' # choose action from the user (parse)
    require_relative 'api_france/api' # act in function of the routes (action)
  rescue => e
    puts e.message, e.backtrace.join("\n")
  end
end

require_relative 'api_france/run'
