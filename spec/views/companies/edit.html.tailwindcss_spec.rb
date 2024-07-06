require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  let(:company) {
    Company.create!(
      legal_name: "MyString",
      cnpj: "MyString",
      lawsuit: nil
    )
  }

  before(:each) do
    assign(:company, company)
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(company), "post" do

      assert_select "input[name=?]", "company[legal_name]"

      assert_select "input[name=?]", "company[cnpj]"

      assert_select "input[name=?]", "company[lawsuit_id]"
    end
  end
end
