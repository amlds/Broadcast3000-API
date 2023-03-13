json.array! @events do |event|
  json.event event
  json.event_type event.event_type
  json.school event.school
end
