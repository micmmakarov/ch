kells = Venue.find_or_create_by_name("Kells") do |v|
  v.name = 'Kells'
  v.description = 'Irish Restaurant & Bar'
  v.address = '530 Jackson'
  v.city = 'San Francisco'
  v.state = 'California'
end
punchline = Venue.find_or_create_by_name("Punchline") do |v|
  v.name = 'Punchline'
  v.description = 'Punchline Comedy Club'
  v.address = '444 Battery Street'
  v.city = 'San Francisco'
  v.state = 'California'
end
br = Venue.find_or_create_by_name("Broadway Comedy Club") do |v|
  v.name = 'Broadway Comedy Club'
  v.description = 'Broadway Comedy Club'
  v.address = '318 West 53rd Street'
  v.city = 'New York'
  v.state = 'New York'
end


5.times do |t|
  v = Venue.all.sample
  event = Event.find_or_create_by_title("Comedy Show in #{v.name} #{t}") do |e|
    e.description = "Awesome show and a lot of cool comedians"
    e.start = Time.now + rand(20).days
    e.venue_id = v.id
    e.user_id = User.first.id
  end
  UsersEvents.create(user_id:User.last.id, event_id:event.id)
end