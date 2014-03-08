require 'spec_helper'

describe "cards/new" do
  before(:each) do
    assign(:card, stub_model(Card).as_new_record)
  end

  it "renders new card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cards_path, "post" do
    end
  end
end
