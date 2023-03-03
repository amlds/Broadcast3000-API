# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Destroy pre seed'
Manager.destroy_all
School.destroy_all
City.destroy_all
User.destroy_all
Event.destroy_all
EventType.destroy_all

p 'Create a User'
user = User.create!(
  first_name: 'Toto',
  last_name: 'Tototo',
  email: 'toto@gmail.com',
  password: 'azerty'
)

p 'Create cities'
lyon = City.create!(name: 'Lyon')
City.create!(name: 'Toulouse')

p 'Create School'
wagon_lyon = School.create!(city: lyon, display_path: 'lyondisplayurl')

p 'Create Manager'
Manager.create!(user: user, school: wagon_lyon)

p 'Create event type'
EventType.create!(name: 'Private', color: '#156E69')
EventType.create!(name: 'Public', color: '#33156E')
EventType.create!(name: 'Formation', color: '#960A03')
EventType.create!(name: 'Extern', color: '#AB5D0E')

p'Create course web'
Course.create(name: "Programming Basics", programming_language: 'ruby')
Course.create(name: "Flow, Conditionals & Arrays", programming_language: 'ruby')
Course.create(name: "Iterators & Blocks", programming_language: 'ruby')
Course.create(name: "Hash & Symbols", programming_language: 'ruby')
Course.create(name: "Regular Expressions", programming_language: 'ruby')
Course.create(name: "Parsing", programming_language: 'ruby')
Course.create(name: "Classes & Instances", programming_language: 'ruby')
Course.create(name: "Inheritance & Self", programming_language: 'ruby')
Course.create(name: "HTML & CSS", programming_language: 'HTML & CSS')
Course.create(name: "CSS Components", programming_language: 'HTML & CSS')
Course.create(name: "Bootstrap & Layouts", programming_language: 'HTML & CSS')
Course.create(name: "JavaScript basics", programming_language: 'javascript')
Course.create(name: "DOM & Events", programming_language: 'javascript')
Course.create(name: "HTTP & AJAX", programming_language: 'javascript')
Course.create(name: "JavaScript Packages", programming_language: 'javascript')
Course.create(name: "Routing, Controllers & Views", programming_language: 'ruby')
Course.create(name: "Models & CRUD", programming_language: 'ruby')
Course.create(name: "Associations & Validations", programming_language: 'ruby')
Course.create(name: "Authentication & Devise", programming_language: 'ruby')
Course.create(name: "Authorization & Pundit", programming_language: 'ruby')
Course.create(name: "Geocoding", programming_language: 'ruby')
Course.create(name: "Search", programming_language: 'ruby')
Course.create(name: "AJAX in Rails", programming_language: 'ruby')
Course.create(name: "WebSocket & Action Cable", programming_language: 'ruby')
Course.create(name: "Background Jobs & Sidekiq", programming_language: 'ruby')


p 'Finish seed !'
