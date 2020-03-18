class DropMachineIdIndexFromExercises < ActiveRecord::Migration[5.2]
  def change
    remove_index "exercises", name: "index_exercises_on_machine_id"
  end
end
