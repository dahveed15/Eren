class AddNotNullToExerciseSets < ActiveRecord::Migration[5.2]
  def change
    change_column_null :exercises, :sets, false
  end
end
