class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.text :notes
      t.integer :test_id
      t.integer :patient_id
      t.integer :therapist_id
      t.timestamps
    end
  end
end
