class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new
    end
  end

  def index
    @workouts = current_user.workouts
  end

  private
  def workout_params
    params.require(:workout).permit(:name)
  end
end
