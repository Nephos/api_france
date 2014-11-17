#encoding: utf-8

class City < ActiveRecord::Base
  extend Searchable
  belongs_to :region
  belongs_to :department
end
