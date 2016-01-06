require 'rails_helper'

RSpec.describe "car_models/index", type: :view do
  before(:each) do
    assign(:car_models, [
      CarModel.create!(
        :name => "Name",
        :model_slug => "Model Slug",
        :organization => nil
      ),
      CarModel.create!(
        :name => "Name",
        :model_slug => "Model Slug",
        :organization => nil
      )
    ])
  end

  it "renders a list of car_models" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Model Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
