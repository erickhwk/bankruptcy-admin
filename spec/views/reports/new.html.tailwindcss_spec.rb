require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      title: "MyString",
      content: "MyText",
      published: false
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input[name=?]", "report[title]"

      assert_select "textarea[name=?]", "report[content]"

      assert_select "input[name=?]", "report[published]"
    end
  end
end
