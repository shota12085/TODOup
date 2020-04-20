json.array! @success do |event|
  json.name event.user.name
  json.content event.content
end