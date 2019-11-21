class ExercisesController < ApplicationController

  def new
    @machine = Machine.find(params[:machine_id])
    @exercise = @machine.exercises.new
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @exercise = @machine.exercises.new(exercise_params)

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
