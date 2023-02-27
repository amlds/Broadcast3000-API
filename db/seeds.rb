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
private_event = EventType.create!(name: 'Private', color: '#dcdcdc')

p 'Create Event'
Event.create!(
  name: 'Test 1',
  description: 'Lorem Ipsum',
  event_type: private_event,
  school: wagon_lyon,
  start_time: Time.now,
  end_time: Time.now
)

p 'Finish seed !'
