json.array!(@vacation_topics) do |vacation_topic|
  json.extract! vacation_topic, :id, :description, :name
  json.url vacation_topic_url(vacation_topic, format: :json)
end
