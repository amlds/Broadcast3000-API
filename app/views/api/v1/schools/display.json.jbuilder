school = @events.first.school
batchs = Batch.current_batch(school)

json.school do
  json.display_path school.display_path
  json.city do
    json.name school.city.name
  end
  json.message_display school.message_display
  json.nbr_carrousel school.nbr_carrousel
  json.batchs batchs
end

json.events @events, partial: "api/v1/events/event", as: :event

# TODO: Send only batches in progress
