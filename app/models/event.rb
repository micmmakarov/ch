class Event < ActiveRecord::Base
  attr_accessible :description, :start, :title, :user_id
end
