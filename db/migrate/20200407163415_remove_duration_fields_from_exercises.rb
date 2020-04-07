class RemoveDurationFieldsFromExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :duration
    remove_column :exercises, :duration_unit
  end
end
