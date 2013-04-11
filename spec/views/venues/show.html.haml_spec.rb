require 'spec_helper'

describe "venues/show" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "Name",
      :description => "MyText",
      :address => "Address",
      :city => "City",
      :state => "State",
      :yelp => "Yelp"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Yelp/)
  end
end
