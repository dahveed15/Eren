class AddBodyWeightToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :bodyweight, :boolean
  end
end
