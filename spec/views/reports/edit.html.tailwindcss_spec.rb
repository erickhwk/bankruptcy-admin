require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  let(:report) {
    Report.create!(
      title: "MyString",
      content: "MyText",
      published: false
    )
  }

  before(:each) do
    assign(:report, report)
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(report), "post" do

      assert_select "input[name=?]", "report[title]"

      assert_select "textarea[name=?]", "report[content]"

      assert_select "input[name=?]", "report[published]"
    end
  end
end
