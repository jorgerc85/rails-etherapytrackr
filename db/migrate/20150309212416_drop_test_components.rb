class DropTestComponents < ActiveRecord::Migration
  def change
    drop_table :test_components
  end
end
