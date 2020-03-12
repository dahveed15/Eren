class ExercisesController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @previous_exercise = @activity.exercises.last
    @exercise = @activity.exercises.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @exercise = @activity.exercises.new(exercise_params)

    if @exercise.save
      redirect_to root_path
    else
      render :new
    end

  end

  def exercise_params
    params.require(:exercise).permit(:reps, :sets, :weight_value, :units)
  end

end
