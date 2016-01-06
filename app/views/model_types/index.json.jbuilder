json.array!(@model_types) do |model_type|
  json.extract! model_type, :id, :name, :model_type_slug, :model_type_code, :base_price, :car_model_id
  json.url model_type_url(model_type, format: :json)
end
