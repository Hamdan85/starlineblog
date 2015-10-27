json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :post, :scheduled_to
  json.url post_url(post, format: :json)
end
