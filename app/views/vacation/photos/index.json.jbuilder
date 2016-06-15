json.array!(@vacation_photos) do |vacation_photo|
  json.extract! vacation_photo, :id, :name, :descrioption, :user_id
  json.url vacation_photo_url(vacation_photo, format: :json)
end
