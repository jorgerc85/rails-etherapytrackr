class CreateTestComponents < ActiveRecord::Migration
  def change
    create_table :test_components do |t|
      t.integer :test_id
      t.integer :component_id
      t.timestamps
    end
  end
end
