require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
      :name => "Name",
      :public_name => "Public Name",
      :org_type => "Org Type",
      :pricing_policy => "Pricing Policy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Public Name/)
    expect(rendered).to match(/Org Type/)
    expect(rendered).to match(/Pricing Policy/)
  end
end
