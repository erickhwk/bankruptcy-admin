require 'rails_helper'

RSpec.describe "tenancies/new", type: :view do
  before(:each) do
    assign(:tenancy, Tenancy.new(
      name: "MyString"
    ))
  end

  it "renders new tenancy form" do
    render

    assert_select "form[action=?][method=?]", tenancies_path, "post" do

      assert_select "input[name=?]", "tenancy[name]"
    end
  end
end
