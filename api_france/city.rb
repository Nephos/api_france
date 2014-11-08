#encoding: utf-8

module ApiFrance
  class City < ActiveRecord::Base
    belongs_to :region
    belongs_to :department
  end
end
