class MachinesController < ApplicationController

  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to root_path
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name)
  end
end
