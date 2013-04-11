class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :description, :name, :state, :yelp
end
