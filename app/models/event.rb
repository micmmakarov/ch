class Event < ActiveRecord::Base
  attr_accessible :description, :start, :title, :user_id
  has_many :users_events
  has_and_belongs_to_many :users, :join_table => :users_events

end
