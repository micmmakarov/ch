require 'spec_helper'

describe "venues/edit" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "MyString",
      :description => "MyText",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :yelp => "MyString"
    ))
  end

  it "renders the edit venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "textarea#venue_description[name=?]", "venue[description]"
      assert_select "input#venue_address[name=?]", "venue[address]"
      assert_select "input#venue_city[name=?]", "venue[city]"
      assert_select "input#venue_state[name=?]", "venue[state]"
      assert_select "input#venue_yelp[name=?]", "venue[yelp]"
    end
  end
end
