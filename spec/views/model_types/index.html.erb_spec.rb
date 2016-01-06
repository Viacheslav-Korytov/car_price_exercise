require 'rails_helper'

RSpec.describe "model_types/index", type: :view do
  before(:each) do
    assign(:model_types, [
      ModelType.create!(
        :name => "Name",
        :model_type_slug => "Model Type Slug",
        :model_type_code => "Model Type Code",
        :base_price => 1,
        :car_model => nil
      ),
      ModelType.create!(
        :name => "Name",
        :model_type_slug => "Model Type Slug",
        :model_type_code => "Model Type Code",
        :base_price => 1,
        :car_model => nil
      )
    ])
  end

  it "renders a list of model_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Model Type Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Model Type Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
