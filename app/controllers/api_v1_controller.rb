class ApiV1Controller < ApplicationController
  before_filter :authenticate_user_from_token, except: [:token]
  before_action :set_organization
  
  
  def model_types
	@car_models = @organization.car_models.all
	render formats: :json
  end
  
  def model_type_price
	@car_model = @organization.car_models.where(model_slug: params[:model_slug]).first
	if @car_model.nil?
		render json: "Model not found", status: :unprocessable_entity
		return
	end
	@model_type = @car_model.model_types.where(model_type_slug: params[:model_type_slug]).first
	if @model_type.nil?
		render json: "Model type not found", status: :unprocessable_entity
	else
		if @model_type.update(base_price: params[:base_price])
			render formats: :json
		else
			render json: @model_type.errors, status: :unprocessable_entity
		end
	end
  end
  
  def token
	user = User.where(name: params[:name]).first
	if user && user.password == params[:password]
		render json: { token: user.auth_token }
	else
		render json: { error: 'Incorrect credentials' }.to_json, status: 401
	end
  end
  
  private
  
  def authenticate_user_from_token
	token = request.headers['HTTP_ACCESS_TOKEN']
	@user = User.where(auth_token: token).first unless token.nil?
	unless token || @user
		render json: { error: 'Bad Token'}, status: 401
	end
  end
end
