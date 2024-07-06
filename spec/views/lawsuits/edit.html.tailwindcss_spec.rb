require 'rails_helper'

RSpec.describe "lawsuits/edit", type: :view do
  let(:lawsuit) {
    Lawsuit.create!(
      tenancy: nil,
      alias: "MyString"
    )
  }

  before(:each) do
    assign(:lawsuit, lawsuit)
  end

  it "renders the edit lawsuit form" do
    render

    assert_select "form[action=?][method=?]", lawsuit_path(lawsuit), "post" do

      assert_select "input[name=?]", "lawsuit[tenancy_id]"

      assert_select "input[name=?]", "lawsuit[alias]"
    end
  end
end
