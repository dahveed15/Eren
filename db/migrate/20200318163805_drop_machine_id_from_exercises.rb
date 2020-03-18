class DropMachineIdFromExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :machine_id
  end
end
