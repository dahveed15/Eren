class ChangeMachinesToActivities < ActiveRecord::Migration[5.2]
  def change
    rename_table :machines, :activities
  end
end
