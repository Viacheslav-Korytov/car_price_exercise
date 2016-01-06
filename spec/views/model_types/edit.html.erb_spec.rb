require 'rails_helper'

RSpec.describe "model_types/edit", type: :view do
  before(:each) do
    @model_type = assign(:model_type, ModelType.create!(
      :name => "MyString",
      :model_type_slug => "MyString",
      :model_type_code => "MyString",
      :base_price => 1,
      :car_model => nil
    ))
  end

  it "renders the edit model_type form" do
    render

    assert_select "form[action=?][method=?]", model_type_path(@model_type), "post" do

      assert_select "input#model_type_name[name=?]", "model_type[name]"

      assert_select "input#model_type_model_type_slug[name=?]", "model_type[model_type_slug]"

      assert_select "input#model_type_model_type_code[name=?]", "model_type[model_type_code]"

      assert_select "input#model_type_base_price[name=?]", "model_type[base_price]"

      assert_select "input#model_type_car_model_id[name=?]", "model_type[car_model_id]"
    end
  end
end
