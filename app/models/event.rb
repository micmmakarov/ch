class Event < ActiveRecord::Base
  attr_accessible :description, :start, :title, :user_id
  has_many :users_events
  has_and_belongs_to_many :users, :join_table => :users_events
  belongs_to :venue
  before_save :save_city
  def save_city
    venue = self.venue
    if venue.present?
      self.city = self.venue.city
    end
  end
  def display_name
    "#{title} <br /><small>#{start.strftime('%a %B %d, %I:%M %p')}</small>".html_safe
  end


end
