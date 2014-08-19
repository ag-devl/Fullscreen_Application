json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :country, :password
  json.url user_url(user, format: :json)
end
