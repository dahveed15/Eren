class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @machines = Machine.all
  end

end
