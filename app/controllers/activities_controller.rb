class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private
  def activity_params
    params.require(:activity).permit(:name)
  end
end
