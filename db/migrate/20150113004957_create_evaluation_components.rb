class CreateEvaluationComponents < ActiveRecord::Migration
  def change
    create_table :evaluation_components do |t|
      t.integer :value
      t.integer :evaluation_id
      t.integer :component_id
      t.timestamps
    end
  end
end
