json.array!(@topic_comments) do |topic_comment|
  json.extract! topic_comment, :id, :content, :user_id
  json.url topic_comment_url(topic_comment, format: :json)
end
