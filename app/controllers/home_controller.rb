class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @machines = current_user.machines.order(:name)
  end

end
