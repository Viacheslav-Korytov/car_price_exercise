require 'rails_helper'

RSpec.describe "car_models/new", type: :view do
  before(:each) do
    assign(:car_model, CarModel.new(
      :name => "MyString",
      :model_slug => "MyString",
      :organization => nil
    ))
  end

  it "renders new car_model form" do
    render

    assert_select "form[action=?][method=?]", car_models_path, "post" do

      assert_select "input#car_model_name[name=?]", "car_model[name]"

      assert_select "input#car_model_model_slug[name=?]", "car_model[model_slug]"

      assert_select "input#car_model_organization_id[name=?]", "car_model[organization_id]"
    end
  end
end
