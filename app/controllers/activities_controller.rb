class ActivitiesController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def archive
    @activity = Activity.find(params[:id])
    @activity.archive!
    redirect_to root_path
  end

  private
  def activity_params
    params.require(:activity).permit(:name)
  end
end
