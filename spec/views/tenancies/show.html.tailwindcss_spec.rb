require 'rails_helper'

RSpec.describe "tenancies/show", type: :view do
  before(:each) do
    assign(:tenancy, Tenancy.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
