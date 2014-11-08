#encoding: utf-8

module ApiFrance
  class Department < ActiveRecord::Base
    belongs_to :region
    has_many :cities
  end
end
