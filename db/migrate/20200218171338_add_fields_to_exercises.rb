class AddFieldsToExercises < ActiveRecord::Migration[5.2]
  def change

    add_column :exercises, :duration, :integer
    add_column :exercises, :duration_unit, :string
    add_column :exercises, :distance, :integer
    add_column :exercises, :distance_unit, :string

    change_column_null :exercises, :reps, true
    change_column_default(:exercises, :sets, nil)
    change_column_null :exercises, :sets, true
    change_column_null :exercises, :weight_value, true
  end


end
