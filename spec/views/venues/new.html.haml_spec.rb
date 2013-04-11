require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :description => "MyText",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :yelp => "MyString"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "textarea#venue_description[name=?]", "venue[description]"
      assert_select "input#venue_address[name=?]", "venue[address]"
      assert_select "input#venue_city[name=?]", "venue[city]"
      assert_select "input#venue_state[name=?]", "venue[state]"
      assert_select "input#venue_yelp[name=?]", "venue[yelp]"
    end
  end
end
