class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.integer :weight
      t.integer :height
      t.string :gender
      t.string :email
      t.timestamps
    end
  end
end
