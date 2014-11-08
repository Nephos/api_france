#encoding: utf-8

module ApiFrance
  class Region < ActiveRecord::Base
    has_many :departments
    has_many :cities
  end
end
