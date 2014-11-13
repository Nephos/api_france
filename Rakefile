require_relative 'server'

task :console do
  puts "Open ApiFrance Console..."
  include ApiFrance
  DB.connect!
  # TODO: use simple irb with right configuration like rails
  require 'irb'
  require 'pry'
  Pry.start
  exit
end
task c: :console

task :server do
  exec(File.expand_path('server.rb'), *ARGV[1..-1])
end
task s: :server

namespace :db do
  task :init do
    puts "ApiFrance : Init ..."
    include ApiFrance
    DB.create!
    DB.connect!
    DB.migrate!
  end

  task :create do
    puts "ApiFrance : Create ..."
    include ApiFrance
    DB.create!
  end

  task :recreate do
    puts "ApiFrance : Recreate ... "
    include ApiFrance
    DB.drop! rescue nil
    DB.create!
  end

  task :drop do
    puts "ApiFrance : Drop ..."
    include ApiFrance
    DB.drop! rescue nil
  end

  task :reset do
    puts "ApiFrance : Reset ..."
    include ApiFrance
    DB.drop! rescue nil
    DB.create!
    DB.connect!
    DB.migrate!
  end

  task :migrate do
    puts "ApiFrance : Migrate ..."
    include ApiFrance
    DB.connect!
    DB.migrate!
  end

  task :seed do
    puts "ApiFrance : Seed ..."
    exec('ruby db/seed.rb')
  end
end
