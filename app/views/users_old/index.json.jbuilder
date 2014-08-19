json.array!(@users) do |user|
  json.extract! user, :id, :name, :userid, :email, :country, :password
  json.url user_url(user, format: :json)
end
