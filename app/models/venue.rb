class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :description, :name, :state, :yelp, :place_id
  has_many :events
  before_save :save_city
  belongs_to :place

  def save_city
    city = self.city
    self.state = self.place.state
    self.city = self.place.city
    self.events.each do |e|
      e.city = city
      e.save!
    end
  end

  def display_name
    "#{self.name} (#{self.address})"
  end

end
