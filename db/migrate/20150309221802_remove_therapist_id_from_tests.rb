class RemoveTherapistIdFromTests < ActiveRecord::Migration
  def change
    remove_column :tests, :therapist_id
  end
end
