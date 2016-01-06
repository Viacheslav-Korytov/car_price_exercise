require 'rails_helper'

RSpec.describe "model_types/show", type: :view do
  before(:each) do
    @model_type = assign(:model_type, ModelType.create!(
      :name => "Name",
      :model_type_slug => "Model Type Slug",
      :model_type_code => "Model Type Code",
      :base_price => 1,
      :car_model => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Model Type Slug/)
    expect(rendered).to match(/Model Type Code/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
