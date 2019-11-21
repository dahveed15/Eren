class MachinesController < ApplicationController

  def new
    @machine = Machine.new
  end

  def create
    @machine = current_user.machines.new(machine_params)
    if @machine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def machine_params
    params.require(:machine).permit(:name)
  end
end
