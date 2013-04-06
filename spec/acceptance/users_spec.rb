require "spec_helper"


feature %{
  Want to make sure that events and users work well together
} do

  background do
    user = User.new
    user.name = "User1"
    user.password = "12345678"
    user.email = "hahaha@haha.ha"
    user.save!
    event = user.events.new
    event.title = "hahaha"
    event.save!

  end
  scenario "Make sure that event and user related", :js => true do
    user = User.first
    event = Event.first
  end
end