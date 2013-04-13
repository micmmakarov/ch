# Seed US cities to places table
require 'csv'
file = File.join(Rails.root, 'config', 'data', 'us_cities_by_population.csv')
cities = CSV.read(file)
cities.each do |city|
  place = Place.find_or_initialize_by_city_and_state(city[0], city[1])
  place.country = "United States"
  place.display_name = "#{place.city}, #{place.state}"
  place.population = city[2].to_i
  place.save
end

# world cities
file = File.join(Rails.root, 'config', 'data', 'world_cities_with_population.tsv')
cities = CSV.read(file, { :col_sep => "\t" })
cities.reject {|c| c[4].match("United States")}.each do |city|
  place = Place.find_or_initialize_by_city_and_country(city[2], city[4])
  place.display_name = "#{place.city}, #{place.country}"
  place.population = city[3].gsub(/\s/, "").to_i
  place.save
end



# Fake data
kells = Venue.find_or_create_by_name("Kells") do |v|
  v.name = 'Kells'
  v.description = 'Irish Restaurant & Bar'
  v.address = '530 Jackson'
  v.city = Place.find_by_city("San Francisco").city
  v.state = Place.find_by_city("San Francisco").state
end
punchline = Venue.find_or_create_by_name("Punchline") do |v|
  v.name = 'Punchline'
  v.description = 'Punchline Comedy Club'
  v.address = '444 Battery Street'
  v.city = Place.find_by_city("San Francisco").city
  v.state = Place.find_by_city("San Francisco").state
end
br = Venue.find_or_create_by_name("Broadway Comedy Club") do |v|
  v.name = 'Broadway Comedy Club'
  v.description = 'Broadway Comedy Club'
  v.address = '318 West 53rd Street'
  v.city = Place.find_by_city("San Francisco").city
  v.state = Place.find_by_city("San Francisco").state
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