class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.text :description
      t.integer :therapist_id
      t.timestamps
    end
  end
end
