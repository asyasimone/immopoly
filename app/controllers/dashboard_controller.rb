class DashboardController < ApplicationController
  def profile
    @projects = Project.where(user_id: current_user.id)
    @properties = Property.where(user_id: current_user.id)
  end
end
