#encoding: utf-8

require_relative "concerns/searchable"

class Department < ActiveRecord::Base
  extend Searchable
  belongs_to :region
  has_many :cities
end
