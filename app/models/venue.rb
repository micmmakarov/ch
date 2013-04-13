class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :description, :name, :state, :yelp
  has_many :events
  before_save :save_city

  def save_city
    city = self.city
    self.events.each do |e|
      e.city = city
      e.save!
    end
  end

  def display_name
    "#{self.name} (#{self.address})"
  end

end
