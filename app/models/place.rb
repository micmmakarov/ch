class Place < ActiveRecord::Base
  attr_accessible :city, :country, :display_name, :population, :postal_code, :state
  has_many :venues
end
