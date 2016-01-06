json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :auth_token, :admin, :organization_id
  json.url user_url(user, format: :json)
end
