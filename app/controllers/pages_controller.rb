class PagesController < ApplicationController
  def index
  end

  def team
    @team = User.where(tenancy_id: current_user.tenancy_id)
  end
end
