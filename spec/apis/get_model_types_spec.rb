require 'rails_helper'

describe "Get Model Types API", :type => :api do
  include RequestsHelper
  let(:org_valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  let(:model_valid_attributes) {
    { name: 'serie_1', model_slug: 'serie_1' }
  }
  let(:model_type_valid_attributes) {
    { name: 'bmw_116i', model_type_slug: 'bmw_116i', base_price: '180000' }
  }
  let(:model_types_api) {
	"models/:model_slug/model_types"
  }
  let(:user_valid_attributes) {
    { name: 'user1', password: 'user1' }
  }
  
  before(:each) do
	@organization = Organization.create org_valid_attributes
	@user = @organization.users.create user_valid_attributes
	@car_model = @organization.car_models.create model_valid_attributes
	@model_type = @car_model.model_types.create model_type_valid_attributes
  end
  
  describe "on valid call" do
	before(:each) do
		get_with_token model_types_api.gsub(':model_slug', @car_model.model_slug)
		expect(last_response.status).to eq(200)
		@h = JSON.parse(last_response.body)
	end
	
	it "has models array" do
		expect(@h['models'].class.name).to eq('Array')
	end
	it "has model name" do
		ar = @h['models'][0]
		expect(ar['name']).to eq(model_valid_attributes[:name])
	end
	it "has model types array" do
		ar = @h['models'][0]
		expect(ar['model_types'].class.name).to eq('Array')
	end
	describe "for model types" do
		before(:each) do
			@ar = @h['models'][0]['model_types'][0]
		end
		
		it "has model type name" do
			expect(@ar['name']).to eq(model_type_valid_attributes[:name])
		end
		it "has total price" do
			expect(@ar['total_price']).to be
		end
	end
  end
end