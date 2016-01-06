require 'rails_helper'

RSpec.describe "car_models/show", type: :view do
  before(:each) do
    @car_model = assign(:car_model, CarModel.create!(
      :name => "Name",
      :model_slug => "Model Slug",
      :organization => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Model Slug/)
    expect(rendered).to match(//)
  end
end
