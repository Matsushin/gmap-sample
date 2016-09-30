require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :title => "Title",
        :description => "Description",
        :address => "Address",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      User.create!(
        :title => "Title",
        :description => "Description",
        :address => "Address",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
