require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :password => "Password",
      :auth_token => "Auth Token",
      :admin => false,
      :organization => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Auth Token/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end