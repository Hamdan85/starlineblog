json.array!(@comments) do |comment|
  json.extract! comment, :id, :post_id, :name, :email, :comment
  json.url comment_url(comment, format: :json)
end
