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
	@organization = Organization.create org_valid_attributes
  end

  it "is linked with CarModel" do
	car_model = @organization.car_models.create model_valid_attributes
	expect {
		car_model.model_types.create! model_type_valid_attributes
	}.to change(ModelType, :count).by(1)
  end
  it "can't be created without CarModel" do
	model_type = ModelType.create model_type_valid_attributes
	expect(model_type).to be_invalid
  end
  it "can't be created without name or model_type_slug or base_price" do
	car_model = @organization.car_models.create model_valid_attributes
	model_type = car_model.model_types.create( model_type_valid_attributes.reject{|k,v| k == :name} )
	expect(model_type).to be_invalid
	model_type = car_model.model_types.create( model_type_valid_attributes.reject{|k,v| k == :model_type_slug} )
	expect(model_type).to be_invalid
	model_type = car_model.model_types.create( model_type_valid_attributes.reject{|k,v| k == :base_price} )
	expect(model_type).to be_invalid
  end
end
