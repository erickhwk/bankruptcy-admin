class PagesController < ApplicationController
  def index
    unless current_user.role == 'super_admin'
      redirect_to new_tenancy_path if current_user.tenancy_id.nil?
    end

    unless current_user.role == 'super_admin'
      @reports = Report.joins(:lawsuit).where(lawsuits: { tenancy_id: current_user.tenancy_id }).published.latest
      @lawsuits = Lawsuit.where(tenancy_id: current_user.tenancy_id).latest
      @companies = Company.joins(:lawsuits).where(lawsuits: { tenancy_id: current_user.tenancy_id }).latest
    else
      @reports = Report.all.published.latest
      @lawsuits = Lawsuit.all.latest
      @companies = Company.all.latest
    end
  end

  def team

    return @team = User.where(tenancy_id: current_user.tenancy_id) unless current_user.role == 'super_admin'
    @team = User.all
  end
end
