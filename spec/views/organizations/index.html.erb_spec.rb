require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        :name => "Name",
        :public_name => "Public Name",
        :org_type => "Org Type",
        :pricing_policy => "Pricing Policy"
      ),
      Organization.create!(
        :name => "Name",
        :public_name => "Public Name",
        :org_type => "Org Type",
        :pricing_policy => "Pricing Policy"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Public Name".to_s, :count => 2
    assert_select "tr>td", :text => "Org Type".to_s, :count => 2
    assert_select "tr>td", :text => "Pricing Policy".to_s, :count => 2
  end
end
