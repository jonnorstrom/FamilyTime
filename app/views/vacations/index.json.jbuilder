json.array!(@vacations) do |vacation|
  json.extract! vacation, :id
  json.url vacation_url(vacation, format: :json)
end
