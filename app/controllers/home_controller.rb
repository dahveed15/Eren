class HomeController < ApplicationController
  def show
    @machines = Machine.all
  end

end
