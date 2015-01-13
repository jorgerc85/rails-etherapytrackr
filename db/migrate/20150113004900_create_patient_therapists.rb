class CreatePatientTherapists < ActiveRecord::Migration
  def change
    create_table :patient_therapists do |t|
      t.integer :patient_id
      t.integer :therapist_id
      t.timestamps
    end
  end
end
