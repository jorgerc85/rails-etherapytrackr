class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :profession
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
