require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        legal_name: "Legal Name",
        cnpj: "Cnpj",
        lawsuit: nil
      ),
      Company.create!(
        legal_name: "Legal Name",
        cnpj: "Cnpj",
        lawsuit: nil
      )
    ])
  end

  it "renders a list of companies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Legal Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cnpj".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
