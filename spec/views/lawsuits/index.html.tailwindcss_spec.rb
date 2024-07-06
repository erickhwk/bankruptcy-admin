require 'rails_helper'

RSpec.describe "lawsuits/index", type: :view do
  before(:each) do
    assign(:lawsuits, [
      Lawsuit.create!(
        tenancy: nil,
        alias: "Alias"
      ),
      Lawsuit.create!(
        tenancy: nil,
        alias: "Alias"
      )
    ])
  end

  it "renders a list of lawsuits" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Alias".to_s), count: 2
  end
end
