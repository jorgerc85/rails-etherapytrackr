class AddScoreToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :score, :float
  end
end
