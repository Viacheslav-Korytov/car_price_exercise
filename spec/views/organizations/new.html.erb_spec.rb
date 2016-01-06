require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyString",
      :public_name => "MyString",
      :org_type => "MyString",
      :pricing_policy => "MyString"
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input#organization_name[name=?]", "organization[name]"

      assert_select "input#organization_public_name[name=?]", "organization[public_name]"

      assert_select "input#organization_org_type[name=?]", "organization[org_type]"

      assert_select "input#organization_pricing_policy[name=?]", "organization[pricing_policy]"
    end
  end
end
