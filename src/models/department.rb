#encoding: utf-8

class Department < ActiveRecord::Base
  extend Searchable
  belongs_to :region
  has_many :cities
end
