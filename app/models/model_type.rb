class ModelType < ActiveRecord::Base
  belongs_to :car_model
  validates :name, :model_type_slug, :base_price, presence: true
  validates :car_model, presence: true
  
  def total_price
	policy = car_model.organization.pricing_policy
	@@margin ||= get_margin(policy)
	case policy
	when "Flexible"
		base_price * @@margin
	when "Fixed"
		base_price + @@margin
	when "Prestige"
		base_price + @@margin
	end
  end
  
  def to_param
	model_type_slug
  end
  
  private
  
  def get_margin(policy)
	case car_model.organization.pricing_policy
	when "Flexible"
		flexible_policy
	when "Fixed"
		fixed_policy
	when "Prestige"
		prestige_policy
	end
  end
  
  def flexible_policy
	get_response_body('http://reuters.com').gsub(/<.*>/, '').scan(/a/i).size / 100
  end
  
  def fixed_policy
	get_response_body('https://developer.github.com/v3/#http-redirects').gsub(/<.*>/, '').scan(/status/i).size
  end
  
  def prestige_policy
	get_response_body('http://www.yourlocalguardian.co.uk/sport/rugby/rss/').scan(/<pubDate>/).size
  end
  
  def get_response_body(url)
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
