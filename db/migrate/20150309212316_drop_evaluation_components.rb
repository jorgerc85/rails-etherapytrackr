class DropEvaluationComponents < ActiveRecord::Migration
  def change
    drop_table :evaluation_components
  end
end
