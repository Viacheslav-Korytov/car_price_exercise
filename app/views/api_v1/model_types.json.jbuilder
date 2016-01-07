json.models do
	json.array! @car_models do |car_model|
		json.name car_model.name
		json.model_types do
			json.array! car_model.model_types do |model_type|
				json.name model_type.name
				json.total_price model_type.total_price
			end
		end
	end
end
