require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    assign(:report, Report.create!(
      title: "Title",
      content: "MyText",
      published: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
