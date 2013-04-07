class Image < ActiveRecord::Base
  attr_accessible :description, :event_id, :title, :url, :user_id
  belongs_to :user
  belongs_to :event
end
