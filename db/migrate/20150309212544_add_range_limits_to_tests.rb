class AddRangeLimitsToTests < ActiveRecord::Migration
  def change
    add_column :tests, :bottom_limit, :float
    add_column :tests, :top_limit, :float
  end
end
