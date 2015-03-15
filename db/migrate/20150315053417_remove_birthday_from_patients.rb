class RemoveBirthdayFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :birthday
  end
end
