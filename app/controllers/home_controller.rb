class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @activities = current_user.activities.unarchived.order(:name)
  end

end
