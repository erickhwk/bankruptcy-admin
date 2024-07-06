require 'rails_helper'

RSpec.describe "lawsuits/new", type: :view do
  before(:each) do
    assign(:lawsuit, Lawsuit.new(
      tenancy: nil,
      alias: "MyString"
    ))
  end

  it "renders new lawsuit form" do
    render

    assert_select "form[action=?][method=?]", lawsuits_path, "post" do

      assert_select "input[name=?]", "lawsuit[tenancy_id]"

      assert_select "input[name=?]", "lawsuit[alias]"
    end
  end
end
