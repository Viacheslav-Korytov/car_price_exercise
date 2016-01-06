require 'rails_helper'

RSpec.describe User, type: :model do
  let(:org_valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  let(:user_valid_attributes) {
    { name: 'user', password: 'user' }
  }

  it "is linked with Organization" do
	organization = Organization.create org_valid_attributes
	expect {
		organization.users.create! user_valid_attributes
	}.to change(User, :count).by(1)
  end
  it "can't be created without an Organization" do
	user = User.create user_valid_attributes
	expect(user).to be_invalid
  end
  it "can't be created without name or password" do
	organization = Organization.create org_valid_attributes
	user = organization.users.create( user_valid_attributes.reject{|k,v| k == :name} )
	expect(user).to be_invalid
	user = organization.users.create( user_valid_attributes.reject{|k,v| k == :password} )
	expect(user).to be_invalid
  end
  it "has unique name" do
	organization = Organization.create org_valid_attributes
	user1 = organization.users.create user_valid_attributes
	user2 = organization.users.create user_valid_attributes
	expect(user2).to be_invalid
  end
end
