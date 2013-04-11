5.times do |t|
  event = Event.create(title: "Hello, World! #{t}")
  UsersEvents.create(user_id:User.first.id, event_id:event.id)
end