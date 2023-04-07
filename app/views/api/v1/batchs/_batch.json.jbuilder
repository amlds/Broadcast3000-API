json.id batch.id
json.number batch.number
json.start_at batch.start_at
json.end_at batch.end_at
json.course do
  json.id batch.course.id
  json.name batch.course.name
end
json.challenge batch.challenge_of_the_day
