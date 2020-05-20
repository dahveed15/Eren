class AddArchivedAtToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :archived_at, :datetime
  end
end
