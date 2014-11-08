require_relative 'api_france'

task :c do
  puts "Open ApiFrance Console..."
  include ApiFrance
  DB.connect!
  require 'irb'
  require 'pry'
  Pry.start
  exit
end

task :s do
end

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

desc 'Migrate the database through scripts in db/migrate. Target specific version with VERSION=x'
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
