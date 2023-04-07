# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Create a User"
user = User.create!(
  first_name: "Toto",
  last_name: "Tototo",
  email: "toto@gmail.com",
  password: "azerty",
)

p "Create cities"
lyon = City.create!(name: "Lyon")
City.create!(name: "Toulouse")

p "Create School"
wagon_lyon = School.create!(city: lyon, display_path: "lyondisplayurl", message_display: "Welcome to Wagon Lyon", nbr_carrousel: 3)

p "Create Manager"
Manager.create!(user: user, school: wagon_lyon)

p "Create event type"
EventType.create!(name: "Private", color: "#156E69")
EventType.create!(name: "Public", color: "#33156E")
EventType.create!(name: "Formation", color: "#960A03")
EventType.create!(name: "Extern", color: "#AB5D0E")

p "Create courses"
Course.create(name: "Web Development")
Course.create(name: "Data Science")
Course.create(name: "Data Analytics")

p "Create Batch"
Batch.new(number: 932, school: School.first, course: Course.first, start_at: (DateTime.now - 1.week).beginning_of_day + 8.hours, end_at: (DateTime.now + 1.week).beginning_of_day + 8.hours).save

p "Create Event"
Event.create!(name: "Welcome to Wagon", start_time: (DateTime.now + 1.week).beginning_of_day + 18.hours, end_time: (DateTime.now + 1.week).beginning_of_day + 20.hours, description: "Welcome to Wagon", event_type: EventType.first, school: School.first)
Event.create!(name: "Welcome to Wagon 2", start_time: (DateTime.now + 2.week).beginning_of_day + 18.hours, end_time: (DateTime.now + 2.week).beginning_of_day + 20.hours, description: "Welcome to Wagon 2", event_type: EventType.last, school: School.first)

p "Create Challenge web"
Challenge.create!(name: "Setup", programming_language: "Software", course: Course.first)
Challenge.create!(name: "Programming Basics", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Flow, Conditionals & Arrays", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Iterators & Blocks", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Hash & Symbols", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Regular Expressions", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Parsing", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Classes & Instances", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Inheritance & Self", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Cookbook (day 1)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Cookbook (day 2)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Food Delivery (day 1)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Food Delivery (day 2)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Schema Desing & SQL", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "CRUD with SQL", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "Active Record Basics", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "Associations & Validations", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "HTML & CSS", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "CSS Components", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "Bootstrap & Layouts", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "JavaScript basics", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "DOM & Events", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "HTTP & AJAX", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "JavaScript Packages", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "Product Design Sprint", programming_language: "Figma", course: Course.first)
Challenge.create!(name: "Routing, Controllers & Views", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Models & CRUD", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Advanced Routing", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Front-End", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Hosting & Image Upload", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Authentication & Devise", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Authorization & Pundit", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Geocoding", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Search", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "AJAX in Rails", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "WebSocket & Action Cable", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Background Jobs & Sidekiq", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "DB Advanced", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Demo Preparation", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 6)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 7)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 8)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Dress Rehearsal", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Models & CRUD", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Demo Day", programming_language: "Ruby on Rails", course: Course.first)

p "Create Challenge data"
Challenge.create!(name: "Setup", programming_language: "Software", course: Course.first)
Challenge.create!(name: "Programming Basics", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Flow, Conditionals & Arrays", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Iterators & Blocks", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Hash & Symbols", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Regular Expressions", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Parsing", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Classes & Instances", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Inheritance & Self", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Cookbook (day 1)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Cookbook (day 2)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Food Delivery (day 1)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Food Delivery (day 2)", programming_language: "ruby", course: Course.first)
Challenge.create!(name: "Schema Desing & SQL", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "CRUD with SQL", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "Active Record Basics", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "Associations & Validations", programming_language: "SQL", course: Course.first)
Challenge.create!(name: "HTML & CSS", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "CSS Components", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "Bootstrap & Layouts", programming_language: "HTML & CSS", course: Course.first)
Challenge.create!(name: "JavaScript basics", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "DOM & Events", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "HTTP & AJAX", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "JavaScript Packages", programming_language: "javascript", course: Course.first)
Challenge.create!(name: "Product Design Sprint", programming_language: "Figma", course: Course.first)
Challenge.create!(name: "Routing, Controllers & Views", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Models & CRUD", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Advanced Routing", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Front-End", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Hosting & Image Upload", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Authentication & Devise", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Authorization & Pundit", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Geocoding", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Search", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "AJAX in Rails", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "WebSocket & Action Cable", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Background Jobs & Sidekiq", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "DB Advanced", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Demo Preparation", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 6)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 7)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Project (Day 8)", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Dress Rehearsal", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Models & CRUD", programming_language: "Ruby on Rails", course: Course.first)
Challenge.create!(name: "Demo Day", programming_language: "Ruby on Rails", course: Course.first)
p "Finish seed !"

# associate a challenge to a day of the week from a start date
start_date = Date.new(2023, 4, 17)
day = 0
saturday = 5

Challenge.where(course: Course.first).each do |challenge|
  if day.zero?
    challenge.update!(day: start_date)
    day += 1
  elsif (day % saturday).zero? # if day is saturday, we skip to monday
    day += 2
    challenge.update!(day: start_date + day.day)
    saturday += 7
    day += 1
  else
    challenge.update!(day: start_date + day.day)
    day += 1
  end
end

start_date = Date.new(2023, 4, 17)
day = 0
saturday = 5

Challenge.where(course: Course.last).each do |challenge|
  if day.zero?
    challenge.update!(day: start_date)
    day += 1
  elsif (day % saturday).zero? # if day is saturday, we skip to monday
    day += 2
    challenge.update!(day: start_date + day.day)
    saturday += 7
    day += 1
  else
    challenge.update!(day: start_date + day.day)
    day += 1
  end
end
