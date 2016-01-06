require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :password => "MyString",
      :auth_token => "MyString",
      :admin => false,
      :organization => nil
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_auth_token[name=?]", "user[auth_token]"

      assert_select "input#user_admin[name=?]", "user[admin]"

      assert_select "input#user_organization_id[name=?]", "user[organization_id]"
    end
  end
end
