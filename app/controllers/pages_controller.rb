class PagesController < ApplicationController
  def index
    @reports = Report.last(10).reverse
    @lawsuits = Lawsuit.where(tenancy_id: current_user.tenancy_id).last(10).reverse
    @companies = Company.last(10).reverse
  end

  def team
    @team = User.where(tenancy_id: current_user.tenancy_id)
  end
end
