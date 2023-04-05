json.id @event.id
json.name @event.name
json.start_time @event.start_time
json.end_time @event.end_time
json.description @event.description
json.photo_url "https://res.cloudinary.com/alexbar/image/upload/v1680708153/development/#{@event.photo.key}" if @event.photo.attached?

json.event_type do
  json.name @event.event_type.name
  json.color @event.event_type.color
end
