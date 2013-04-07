class Video < ActiveRecord::Base
  attr_accessible :description, :event_id, :title, :url, :user_id
end
