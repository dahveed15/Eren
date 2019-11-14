class BackfillSets < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    Exercise.where(sets: nil).in_batches do |set|
      set.update_all sets: 1
      sleep(0.1)
    end
  end
end
