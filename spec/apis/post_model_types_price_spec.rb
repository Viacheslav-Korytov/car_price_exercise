require 'rails_helper'

describe "POST Model Types Price API", :type => :api do
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
	"models/:model_slug/model_types_price/:model_type_slug"
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
		post_with_token model_types_api.gsub(':model_slug', @car_model.model_slug).gsub(':model_type_slug', @model_type.model_type_slug), base_price: 200000
		expect(last_response.status).to eq(200)
		@h = JSON.parse(last_response.body)
	end
	
	it "should include model_type" do
		expect(@h['model_type']).to be
	end
	
	describe "Model Type" do
		before(:each) do
			@m_d = @h['model_type']
		end
		
		it "has name" do
			expect(@m_d['name']).to be
		end
		it "has base_price" do
			expect(@m_d['base_price']).to be
		end
		it "has total_price" do
			expect(@m_d['total_price']).to be
		end
	end
  end
end