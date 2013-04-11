require 'spec_helper'

describe "venues/index" do
  before(:each) do
    assign(:venues, [
      stub_model(Venue,
        :name => "Name",
        :description => "MyText",
        :address => "Address",
        :city => "City",
        :state => "State",
        :yelp => "Yelp"
      ),
      stub_model(Venue,
        :name => "Name",
        :description => "MyText",
        :address => "Address",
        :city => "City",
        :state => "State",
        :yelp => "Yelp"
      )
    ])
  end

  it "renders a list of venues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Yelp".to_s, :count => 2
  end
end
