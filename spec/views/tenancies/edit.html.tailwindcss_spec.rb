require 'rails_helper'

RSpec.describe "tenancies/edit", type: :view do
  let(:tenancy) {
    Tenancy.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:tenancy, tenancy)
  end

  it "renders the edit tenancy form" do
    render

    assert_select "form[action=?][method=?]", tenancy_path(tenancy), "post" do

      assert_select "input[name=?]", "tenancy[name]"
    end
  end
end
