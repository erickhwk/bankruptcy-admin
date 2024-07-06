require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      legal_name: "MyString",
      cnpj: "MyString",
      lawsuit: nil
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[legal_name]"

      assert_select "input[name=?]", "company[cnpj]"

      assert_select "input[name=?]", "company[lawsuit_id]"
    end
  end
end
