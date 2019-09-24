class AddUnitsToExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :units, :string
  end
end
