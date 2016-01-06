require 'rails_helper'

describe "Authentication API", :type => :api do
  let(:org_valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  let(:user_valid_attributes) {
    { name: 'user1', password: 'user1' }
  }
  let(:valid_session) { {} }
  
  before(:each) do
	@organization = Organization.create org_valid_attributes
	@user = @organization.users.create user_valid_attributes
  end
  
  it "returns token for valid user" do
    post "/token", {name: 'user1', password: 'user1', format: :json}
	expect(last_response.status).to eq(200)
    parsed = JSON(last_response.body)
    expect(parsed['token']).to eq(@user.auth_token)
  end
  it "returns status 401 for unknown user" do
    post "/token", {name: 'user2', password: 'user1', format: :json}
	expect(last_response.status).to eq(401)
  end
  it "returns status 401 for incorrect password" do
    post "/token", {name: 'user1', password: 'user2', format: :json}
	expect(last_response.status).to eq(401)
  end
end