class ExercisesController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @previous_exercise = @activity.exercises.last
    @exercise = @activity.exercises.new
  end

  def create
    specified_params = exercise_params[:bodyweight].present? ? exercise_params.except(:units) : exercise_params
    @activity = Activity.find(params[:activity_id])
    @exercise = @activity.exercises.new(specified_params)

    if @exercise.save
      redirect_to root_path
    else
      render :new
    end

  end

  def exercise_params
    params.require(:exercise).permit(:reps, :sets, :weight_value, :units, :bodyweight, :hours, :minutes, :seconds)
  end

end
