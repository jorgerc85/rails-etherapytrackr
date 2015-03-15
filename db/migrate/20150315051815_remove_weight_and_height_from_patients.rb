class RemoveWeightAndHeightFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :weight
    remove_column :patients, :height
  end
end
