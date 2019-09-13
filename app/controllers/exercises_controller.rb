class ExercisesController < ApplicationController

  def new
    @machine = Machine.find(params[:id])
  end

  def create
  end

end
