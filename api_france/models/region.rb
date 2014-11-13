#encoding: utf-8

class Region < ActiveRecord::Base
  extend Searchable
  has_many :departments
  has_many :cities
end
