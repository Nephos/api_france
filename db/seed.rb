#encoding: utf-8
require 'csv'
require_relative '../server'

include ApiFrance
DB.connect!

puts "Seeding Regions..."
Region.create CSV.read('data/regions.csv', headers: true).map{|e|e.to_h.keep_if{|k,v| ['id', 'name'].include? k}} if Region.count.zero?
puts "Seeding Departments..."
Department.create CSV.read('data/departments.csv', headers: true).map{|e|e.to_h.keep_if{|k,v| ['id', 'name', 'region_id'].include? k}} if Department.count.zero?
puts "Seeding Cities..."
City.create CSV.read('data/cities.csv', headers: true).map{|e|e.to_h.keep_if{|k,v| ['id', 'name', 'zipcode', 'department_id', 'region_id', 'longitude', 'latitude'].include? k}} if City.count.zero?
