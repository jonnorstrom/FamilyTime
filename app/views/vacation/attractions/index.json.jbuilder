json.array!(@vacation_attractions) do |vacation_attraction|
  json.extract! vacation_attraction, :id, :name, :weblink, :location
  json.url vacation_attraction_url(vacation_attraction, format: :json)
end
