require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  
  it "has type of Show room" do
	expect {
		Organization.create! valid_attributes.merge!({org_type: 'Show room'})
	}.to change(Organization, :count).by(1)
  end
  it "has type of Service" do
	expect {
		Organization.create! valid_attributes.merge!({org_type: 'Service'})
	}.to change(Organization, :count).by(1)
  end
  it "has type of Dealer" do
	expect {
		Organization.create! valid_attributes.merge!({org_type: 'Dealer'})
	}.to change(Organization, :count).by(1)
  end
  it "can't be created with any other type" do
	organization = Organization.create valid_attributes.merge!({org_type: 'Unknown'})
	expect(organization).to be_invalid
  end
  it "has pricing policy of Flexible" do
	expect {
		Organization.create! valid_attributes.merge!({pricing_policy: 'Flexible'})
	}.to change(Organization, :count).by(1)
  end
  it "has pricing policy of Fixed" do
	expect {
		Organization.create! valid_attributes.merge!({pricing_policy: 'Fixed'})
	}.to change(Organization, :count).by(1)
  end
  it "has pricing policy of Prestige" do
	expect {
		Organization.create! valid_attributes.merge!({pricing_policy: 'Prestige'})
	}.to change(Organization, :count).by(1)
  end
  it "can't be created with any other pricing policy" do
	organization = Organization.create valid_attributes.merge!({pricing_policy: 'Unknown'})
	expect(organization).to be_invalid
  end
  it "should have Name, Public name, Type and Pricing policy to be created" do
	organization = Organization.create( valid_attributes.reject{|k,v| k == :name} )
	expect(organization).to be_invalid
	organization = Organization.create( valid_attributes.reject{|k,v| k == :public_name} )
	expect(organization).to be_invalid
	organization = Organization.create( valid_attributes.reject{|k,v| k == :org_type} )
	expect(organization).to be_invalid
	organization = Organization.create( valid_attributes.reject{|k,v| k == :pricing_policy} )
	expect(organization).to be_invalid
  end
end
