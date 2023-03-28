json.school do
  json.display_path @school.display_path
  json.city do
    json.name @school.city.name
  end
  json.message_display @school.message_display
  json.nbr_carrousel @school.nbr_carrousel
  json.batches @batches, partial: "api/v1/batches/batch", as: :batch
end

json.events @events, partial: "api/v1/events/event", as: :event
