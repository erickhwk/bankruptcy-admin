require 'rails_helper'

RSpec.describe "lawsuits/show", type: :view do
  before(:each) do
    assign(:lawsuit, Lawsuit.create!(
      tenancy: nil,
      alias: "Alias"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Alias/)
  end
end
