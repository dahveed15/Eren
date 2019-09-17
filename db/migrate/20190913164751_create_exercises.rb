class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :reps, null: false
      t.integer :sets
      t.integer :weight_value, null: false
      t.references :machine

      t.timestamps
    end
  end
end
