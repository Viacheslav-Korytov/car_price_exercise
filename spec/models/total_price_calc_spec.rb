require 'rails_helper'

RSpec.describe ModelType, type: :model do
  let(:org_valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  let(:model_valid_attributes) {
    { name: 'serie_1', model_slug: 'serie_1' }
  }
  let(:model_type_valid_attributes) {
    { name: 'bmw_116i', model_type_slug: 'bmw_116i', base_price: '180000' }
  }
  
  before(:each) do
	ModelType.class_eval {class_variable_set :@@margin, nil}
  end
  
  
  it "contains field total_price" do
	create_data_for_pricing_policy('Flexible')
	expect(@model_type.total_price).to be
  end
  
  describe "Total Price calculations" do
	
	it "multiplies base_price by margin equal number of letters 'a' on http://reuters.com divided by 100 for Flexible policy" do
		create_data_for_pricing_policy('Flexible')
		expect(@model_type.total_price).to eq(total_price_calc)
		@model_type
	end
	it "adds to base_price margin equal number of words 'status' found on https://developer.github.com/v3/#http-redirects for Fixed policy" do
		create_data_for_pricing_policy('Fixed')
		expect(@model_type.total_price).to eq(total_price_calc)
	end
	it "adds to base_price margin equal number of pubData elements on page http://www.yourlocalguardian.co.uk/sport/rugby/rss/ for Prestige policy" do
		create_data_for_pricing_policy('Prestige')
		expect(@model_type.total_price).to eq(total_price_calc)
	end
  end
  
  def create_data_for_pricing_policy(p_p)
	@organization = Organization.create org_valid_attributes.merge!({pricing_policy: p_p})
	@car_model = @organization.car_models.create model_valid_attributes
	@model_type = @car_model.model_types.create model_type_valid_attributes
  end
  
  def total_price_calc
	case @car_model.organization.pricing_policy
	when "Flexible"
		@model_type.base_price * flexible_policy_margin
	when "Fixed"
		@model_type.base_price + fixed_policy_margin
	when "Prestige"
		@model_type.base_price + prestige_policy_margin
	end
  end
  
  def flexible_policy_margin
	get_response_body1('http://reuters.com').gsub(/<.*>/, '').scan(/a/i).size / 100
  end
  
  def fixed_policy_margin
	get_response_body1('https://developer.github.com/v3/#http-redirects').gsub(/<.*>/, '').scan(/status/i).size
  end
  
  def prestige_policy_margin
	get_response_body1('http://www.yourlocalguardian.co.uk/sport/rugby/rss/').scan(/<pubDate>/).size
  end
  
  def get_response_body1(url)
	require "net/https"
	require 'uri'
	uri = URI.parse(url)
	http = Net::HTTP.new(uri.host, uri.port)
	while true
		http.use_ssl = (uri.scheme == "https")
		response = http.request(Net::HTTP::Get.new(uri.request_uri))
		if response.code.to_i == 301
			uri = URI.parse(response.header['location'])
			http = Net::HTTP.new(uri.host, uri.port)
		else
			break
		end
	end
	response.body
  end
end
