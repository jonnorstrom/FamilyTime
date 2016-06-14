json.array!(@vacation_guests) do |vacation_guest|
  json.extract! vacation_guest, :id, :first_name, :last_name
  json.url vacation_guest_url(vacation_guest, format: :json)
end
