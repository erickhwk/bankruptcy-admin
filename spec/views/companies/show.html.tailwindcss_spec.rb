require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    assign(:company, Company.create!(
      legal_name: "Legal Name",
      cnpj: "Cnpj",
      lawsuit: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Legal Name/)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(//)
  end
end
