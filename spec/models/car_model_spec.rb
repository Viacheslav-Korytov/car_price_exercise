require 'rails_helper'

RSpec.describe CarModel, type: :model do
  let(:org_valid_attributes) {
    { name: 'Organization', public_name: 'Public name', org_type: 'Show room', pricing_policy: 'Flexible' }
  }
  let(:model_valid_attributes) {
    { name: 'serie_1', model_slug: 'serie_1' }
  }

  it "is linked with Organization" do
	organization = Organization.create org_valid_attributes
	expect {
		organization.car_models.create! model_valid_attributes
	}.to change(CarModel, :count).by(1)
  end
  it "can't be created without an Organization" do
	car_model = CarModel.create model_valid_attributes
	expect(car_model).to be_invalid
  end
  it "can't be created without name or model_slug" do
	organization = Organization.create org_valid_attributes
	car_model = organization.car_models.create( model_valid_attributes.reject{|k,v| k == :name} )
	expect(car_model).to be_invalid
	car_model = organization.car_models.create( model_valid_attributes.reject{|k,v| k == :model_slug} )
	expect(car_model).to be_invalid
  end
end
