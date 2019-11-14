class AddSetsDefaultToExercises < ActiveRecord::Migration[5.2]
  def up
    change_column_default :exercises, :sets, 1
  end

  def down
    change_column_default :exercises, :sets, nil
  end
end
