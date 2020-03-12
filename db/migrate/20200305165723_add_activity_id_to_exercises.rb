class AddActivityIdToExercises < ActiveRecord::Migration[5.2]
  def change

    add_reference :exercises, :activity, foreign_key: true

  end
end
